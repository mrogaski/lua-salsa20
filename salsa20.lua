module("salsa20", package.seeall)

require("bit32")

function quarterround(y0, y1, y2, y3)
    local z1 = bit32.bxor(y1, bit32.lrotate(y0 + y3, 7))
    local z2 = bit32.bxor(y2, bit32.lrotate(z1 + y0, 9))
    local z3 = bit32.bxor(y3, bit32.lrotate(z2 + z1, 13))
    local z0 = bit32.bxor(y0, bit32.lrotate(z3 + z2, 18))
    return z0, z1, z2, z3
end

