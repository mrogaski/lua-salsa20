
require "salsa20"

function test_tuple(desc, f, n, data)
    local c = 0
    local pass = 0
    for i, v in ipairs(data) do
        local arg = v[1]
        local out = v[2]
        c = c + 1
        local res = f(arg)
        local err = false
        for i = 1, n do
            if res[i] ~= out[i] then
                err = true
                break
            end
        end
        if not err then
            pass = pass + 1
        end
    end
    if pass == c then
        print(string.format("% 32s => PASS: %d/%d", desc, pass, c))
    else
        print(string.format("% 32s => FAIL: %d/%d", desc, pass, c))
    end
end


local data = {
    {
        { 0x00000000, 0x00000000, 0x00000000, 0x00000000 },
        { 0x00000000, 0x00000000, 0x00000000, 0x00000000 }
    },
    {
        { 0x00000001, 0x00000000, 0x00000000, 0x00000000 }, 
        { 0x08008145, 0x00000080, 0x00010200, 0x20500000 }
    },
    {
        { 0x00000000, 0x00000001, 0x00000000, 0x00000000 },
        { 0x88000100, 0x00000001, 0x00000200, 0x00402000 }
    },
    {
        { 0x00000000, 0x00000000, 0x00000001, 0x00000000 },
        { 0x80040000, 0x00000000, 0x00000001, 0x00002000 }
    },
    {
        { 0x00000000, 0x00000000, 0x00000000, 0x00000001 },
        { 0x00048044, 0x00000080, 0x00010000, 0x20100001 }
    },
    {
        { 0xe7e8c006, 0xc4f9417d, 0x6479b4b2, 0x68c67137 },
        { 0xe876d72b, 0x9361dfd5, 0xf1460244, 0x948541a3 }
    },
    {
        { 0xd3917c5b, 0x55f1c407, 0x52a58a7a, 0x8f887a3b },
        { 0x3e2f308c, 0xd90a8f36, 0x6ab2a923, 0x2883524c }
    },
}
test_tuple("quarterround()", salsa20.quarterround, 4, data)

data = {
    {
        { 0x00000001, 0x00000000, 0x00000000, 0x00000000,
          0x00000001, 0x00000000, 0x00000000, 0x00000000,
          0x00000001, 0x00000000, 0x00000000, 0x00000000,
          0x00000001, 0x00000000, 0x00000000, 0x00000000 },
        { 0x08008145, 0x00000080, 0x00010200, 0x20500000,
          0x20100001, 0x00048044, 0x00000080, 0x00010000,
          0x00000001, 0x00002000, 0x80040000, 0x00000000,
          0x00000001, 0x00000200, 0x00402000, 0x88000100 }
    },
    {
        { 0x08521bd6, 0x1fe88837, 0xbb2aa576, 0x3aa26365,
          0xc54c6a5b, 0x2fc74c2f, 0x6dd39cc3, 0xda0a64f6,
          0x90a2f23d, 0x067f95a6, 0x06b35f61, 0x41e4732e,
          0xe859c100, 0xea4d84b7, 0x0f619bff, 0xbc6e965a },
        { 0xa890d39d, 0x65d71596, 0xe9487daa, 0xc8ca6a86,
          0x949d2192, 0x764b7754, 0xe408d9b9, 0x7a41b4d1,
          0x3402e183, 0x3c3af432, 0x50669f96, 0xd89ef0a8,
          0x0040ede5, 0xb545fbce, 0xd257ed4f, 0x1818882d }
    },
}
test_tuple("rowround()", salsa20.rowround, 16, data)

