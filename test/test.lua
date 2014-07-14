
require "salsa20"

function roundtest(desc, f, data)
    local n = 0
    local pass = 0
    for i, v in ipairs(data) do
        local arg = v[1]
        local out = v[2]
        n = n + 1
        local r1, r2, r3, r4 = f(arg[1], arg[2], arg[3], arg[4])
        if r1 == out[1] and r2 == out[2] and r3 == out[3] and r4 == out[4] then
            pass = pass + 1
        end
    end
    if pass == n then
        print(string.format("% 32s => PASS: %d/%d", desc, pass, n))
    else
        print(string.format("% 32s => FAIL: %d/%d", desc, pass, n))
    end
end


local data = {
    {
        {0x00000000, 0x00000000, 0x00000000, 0x00000000},
        {0x00000000, 0x00000000, 0x00000000, 0x00000000}
    },
    {
        {0x00000001, 0x00000000, 0x00000000, 0x00000000}, 
        {0x08008145, 0x00000080, 0x00010200, 0x20500000}
    },
    {
        {0x00000000, 0x00000001, 0x00000000, 0x00000000},
        {0x88000100, 0x00000001, 0x00000200, 0x00402000}
    },
    {
        {0x00000000, 0x00000000, 0x00000001, 0x00000000},
        {0x80040000, 0x00000000, 0x00000001, 0x00002000}
    },
    {
        {0x00000000, 0x00000000, 0x00000000, 0x00000001},
        {0x00048044, 0x00000080, 0x00010000, 0x20100001}
    },
    {
        {0xe7e8c006, 0xc4f9417d, 0x6479b4b2, 0x68c67137},
        {0xe876d72b, 0x9361dfd5, 0xf1460244, 0x948541a3}
    },
    {
        {0xd3917c5b, 0x55f1c407, 0x52a58a7a, 0x8f887a3b},
        {0x3e2f308c, 0xd90a8f36, 0x6ab2a923, 0x2883524c}
    },
}
roundtest("quarterround()", salsa20.quarterround, data)



