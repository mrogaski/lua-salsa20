--[[--------------------------------------------------------------------------

The MIT License (MIT)

Copyright (c) 2014-2015,  Mark Rogaski.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

--]]--------------------------------------------------------------------------

local hsalsa20 = {}

--- Generate the a 64-byte intermediate key from a 32-byte key and a 16-byte nonce.
-- @param k 32-byte sequence representing the secret key.
-- @param v An 16-byte sequence representing the nonce.
-- @param rounds Optional number of rounds. May be 20 (default), 12, or 8.
-- @return A 64-byte output block.
function hsalsa20.generate(k, v, rounds)
    assert(#k == 32)
    assert(#v == 16)
end

return hsalsa20
