module("salsa20", package.seeall)

require("bit32")

local function apply(f, y, z, slice)
    local iv = {}
    for i, j in ipairs(slice) do
        iv[i] = y[j]
    end
    local ov = f(iv)
    for i, j in ipairs(slice) do
        z[j] = ov[i]
    end
end

function quarterround(y)
    local z = {}
    z[2] = bit32.bxor(y[2], bit32.lrotate(y[1] + y[4], 7))
    z[3] = bit32.bxor(y[3], bit32.lrotate(z[2] + y[1], 9))
    z[4] = bit32.bxor(y[4], bit32.lrotate(z[3] + z[2], 13))
    z[1] = bit32.bxor(y[1], bit32.lrotate(z[4] + z[3], 18))
    return z
end

function rowround(y)
    local z = {}
    apply(salsa20.quarterround, y, z, {1, 2, 3, 4})
    apply(salsa20.quarterround, y, z, {6, 7, 8, 5})
    apply(salsa20.quarterround, y, z, {11, 12, 9, 10})
    apply(salsa20.quarterround, y, z, {16, 13, 14, 15})
    return z
end

function columnround(y)
    local z = {}
    apply(salsa20.quarterround, y, z, {1, 5, 9, 13})
    apply(salsa20.quarterround, y, z, {6, 10, 14, 2})
    apply(salsa20.quarterround, y, z, {11, 15, 3, 7})
    apply(salsa20.quarterround, y, z, {16, 4, 8, 12})
    return z
end

function doubleround(x)
    return salsa20.rowround(salsa20.columnround(x))
end

function littleendian(b)
    return b[1] + 2^8 * b[2] + 2^16 * b[3] + 2^24 * b[4]
end

