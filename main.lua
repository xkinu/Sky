gg.setVisible(false)
local a = 1977;
local b = 20;
local c = 0x200000;
local d = 0xD0F41A8;
local e;
local f;
local g;
local h;
local i;
local j;
e = {
    lvlWing = 0x68,
    gSpeed = 0xD39A508,
    unEnerg = 0x20F4C,
    unOxygen = 0x20F70,
    positX = 0x1B3C8,
    positY = 0x1B3C8 + 0x4,
    positZ = 0x1B3C8 + 0x8,
    candle = 0xBCDAC88,
    aFlowers = 0xB0B2E94,
    flowOne = 0xB0B2E94
}
gg.clearResults()
j = gg.getRangesList('libBootloader.so')
gg.setValues({{
    address = j[1].start + 0x11104c4,
    flags = 16,
    value = 999999
}})
function rng()
    local k = {}
    local l = {}
    gg.setRanges(gg.REGION_C_ALLOC)
    nn = gg.getRangesList('[anon:libc_malloc]')
    for m, n in pairs(nn) do
        k[m] = n.start;
        l[m] = n['end']
    end
    return k, l
end
function sub_v(o, p, q, r)
    function sub(s, t)
        local nn = {}
        for m, n in ipairs(o) do
            nn[m] = n + t
        end
        return nn
    end
    local nn = {}
    for m = 1, q do
        nn[m] = sub(o, p + (m - 1) * r)
    end
    local u = {}
    for v = 1, #nn do
        for m, n in pairs(nn[v]) do
            u[#u + 1] = {}
            u[#u] = n
        end
    end
    return u
end
f, h = rng()
g = sub_v(f, d, b, c)
function bty(w, x)
    local nn = {}
    for y, n in pairs(w) do
        local k = 0;
        local z = false;
        for m = 1, 19 do
            nn[m] = {
                address = n + m - 1,
                flags = gg.TYPE_BYTE
            }
        end
        local A = gg.getValues(nn)
        for m = 1, #A do
            if A[m].value ~= 100 then
                break
            else
                for v, n in pairs(A) do
                    i = n.address;
                    k = k + n.value
                end
                if k ~= x then
                    gg.toast('waiting... ')
                else
                    gg.toast('done')
                    return i - 0x12
                end
            end
        end
    end
end
local i = bty(g, a)
function rang(B, C, D)
    for m = 1, #B do
        if B[m] < D and C[m] > D then
            return B[m]
        end
    end
end
local E = i;
local F = rang(f, h, i)
gg.addListItems({{
    address = i - e.lvlWing,
    flags = 4,
    name = 'level wing'
}, {
    address = i + e.unEnerg,
    flags = 16,
    name = 'energy',
    value = '14',
    freeze = true
}, {
    address = i + e.unOxygen,
    flags = 16,
    name = 'oxygen',
    value = '1',
    freeze = true
}, {
    address = i + e.positX,
    flags = 16,
    name = 'pos X'
}, {
    address = i + e.positY,
    flags = 16,
    name = 'pos Y'
}, {
    address = i + e.positZ,
    flags = 16,
    name = 'pos Z'
}, {
    address = i - e.gSpeed,
    flags = 16,
    name = 'game speed'
}})
gg.clearResults()
function all_loc()
    print(cworld)
    os.exit()
end
function cndl()
    local G = i - e.candle;
    nn = {}
    for m = 1, 709 do
        nn[m] = {
            address = G - (m - 1) * 0x1c0,
            flags = 16,
            value = 1,
            freeze = true
        }
    end
    gg.setValues(nn)
    gg.addListItems(nn)
end
function flores()
    flower = i - e.aFlowers;
    tblFlo = {}
    for m = 1, 397 do
        tblFlo[m] = {
            address = flower - (m - 1) * 8,
            flags = 16,
            value = 0,
            freeze = true
        }
    end
    gg.addListItems(tblFlo)
end
gg.showUiButton()
function menu()
    local H = gg.choice({'set fire'})
    if H == 1 then
        gg.setVisible(false)
        flores()
        cndl()
    end
    hhh = true
end
while true do
    if gg.isClickedUiButton() then
        menu()
    end
    if gg.isVisible(true) then
        if hhh then
            menu()
            hhh = false
        end
        gg.sleep(100)
    end
end
