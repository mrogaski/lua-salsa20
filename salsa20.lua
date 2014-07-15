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
    assert(#y == 4)
    local z = {}
    z[2] = bit32.bxor(y[2], bit32.lrotate(y[1] + y[4], 7))
    z[3] = bit32.bxor(y[3], bit32.lrotate(z[2] + y[1], 9))
    z[4] = bit32.bxor(y[4], bit32.lrotate(z[3] + z[2], 13))
    z[1] = bit32.bxor(y[1], bit32.lrotate(z[4] + z[3], 18))
    return z
end

function rowround(y)
    assert(#y == 16)
    local z = {}
    apply(salsa20.quarterround, y, z, {1, 2, 3, 4})
    apply(salsa20.quarterround, y, z, {6, 7, 8, 5})
    apply(salsa20.quarterround, y, z, {11, 12, 9, 10})
    apply(salsa20.quarterround, y, z, {16, 13, 14, 15})
    return z
end

function columnround(y)
    assert(#y == 16)
    local z = {}
    apply(salsa20.quarterround, y, z, {1, 5, 9, 13})
    apply(salsa20.quarterround, y, z, {6, 10, 14, 2})
    apply(salsa20.quarterround, y, z, {11, 15, 3, 7})
    apply(salsa20.quarterround, y, z, {16, 4, 8, 12})
    return z
end

function doubleround(y)
    assert(#y == 16)
    return salsa20.rowround(salsa20.columnround(y))
end

function littleendian(b)
    assert(#b == 4)
    return b[1] + 2^8 * b[2] + 2^16 * b[3] + 2^24 * b[4]
end

function littleendian_inv(x)
    local b = {}
    for i = 1, 4 do
        b[i] = bit32.band(bit32.rshift(x, (i - 1) * 8), 0xFF)
    end
    return b
end

function hash(b)
    assert(#b == 64)
    local x = {}
    for i = 1, 16 do
        local quad = {}
        for j = 1, 4 do
            quad[j] = b[((i - 1) * 4) + j]
        end
        x[i] = salsa20.littleendian(quad)
    end
    local z = salsa20.doubleround(x)
    for i = 1, 9 do
        z = salsa20.doubleround(z)
    end
    local h = {}
    for i = 1, 16 do
        local y = salsa20.littleendian_inv(z[i] + x[i])
        for j = 1, 4 do
            h[((i - 1) * 4) + j] = y[j]
        end 
    end
    return h
end

function expand(k, n)
    assert(#k == 16 or #k == 32)
    assert(#n == 16)
    local c = { string.byte(string.format("expand %2d-byte k", #k), 1, 16) } 
    local x = {}
    for i =  1,  4 do table.insert(x, c[i]) end
    for i =  1, 16 do table.insert(x, k[i]) end
    for i =  5,  8 do table.insert(x, c[i]) end
    for i =  1, 16 do table.insert(x, n[i]) end
    for i =  9, 12 do table.insert(x, c[i]) end
    if #k == 16 then
        for i =  1, 16 do table.insert(x, k[i]) end
    else
        for i = 17, 32 do table.insert(x, k[i]) end
    end
    for i = 13, 16 do table.insert(x, c[i]) end
    return x
end


