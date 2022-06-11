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
local k;
local l = {}
local m;
local n;
local o;
local p;
local q;
local r = false;
local s;
local t = {}
local u;
local v;
local w;
local x;
local y;
local z;
local A;
local B;
local C = false;
local D = false;
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
    flowOne = 0xB0B2E94,
    sWings = 0xB7F7DA0
}
gg.clearResults()
j = gg.getRangesList('libBootloader.so')
gg.setValues({{
    address = j[1].start + 0x11104c4,
    flags = 16,
    value = 999999
}})
function u()
    local E = {}
    local F = {}
    gg.setRanges(gg.REGION_C_ALLOC)
    nn = gg.getRangesList('[anon:libc_malloc]')
    for G, H in pairs(nn) do
        E[G] = H.start;
        F[G] = H['end']
    end
    return E, F
end
function v(I, J, K, L)
    function sub(M, N)
        local nn = {}
        for G, H in ipairs(I) do
            nn[G] = H + N
        end
        return nn
    end
    local nn = {}
    for G = 1, K do
        nn[G] = sub(I, J + (G - 1) * L)
    end
    local O = {}
    for P = 1, #nn do
        for G, H in pairs(nn[P]) do
            O[#O + 1] = {}
            O[#O] = H
        end
    end
    return O
end
f, h = u()
g = v(f, d, b, c)
function w(Q, R)
    local nn = {}
    for S, H in pairs(Q) do
        local E = 0;
        local T = false;
        for G = 1, 19 do
            nn[G] = {
                address = H + G - 1,
                flags = gg.TYPE_BYTE
            }
        end
        local U = gg.getValues(nn)
        for G = 1, #U do
            if U[G].value ~= 100 then
                break
            else
                for P, H in pairs(U) do
                    i = H.address;
                    E = E + H.value
                end
                if E ~= R then
                    gg.toast('waiting... ')
                else
                    gg.toast('done')
                    return i - 0x12
                end
            end
        end
    end
end
local i = w(g, a)
function x(V, W, X)
    for G = 1, #V do
        if V[G] < X and W[G] > X then
            return V[G]
        end
    end
end
local Y = i;
local Z = x(f, h, i)
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
k = {{"[Home] CandleSpace", 'CandleSpace'}, {"[Isle] Dawn", 'Dawn'}, {"[Isle] DawnCave", 'DawnCave'},
     {"[Trial] Dawn_TrialsWater", 'Dawn_TrialsWater'}, {"[Trial] Dawn_TrialsEarth", 'Dawn_TrialsEarth'},
     {"[Trial] Dawn_TrialsAir", 'Dawn_TrialsAir'}, {"[Trial] Dawn_TrialsFire", 'Dawn_TrialsFire'},
     {"[Prairie] Prairie_ButterflyFields", 'Prairie_ButterflyFields'},
     {"[Prairie] Prairie_NestAndKeeper", 'Prairie_NestAndKeeper'}, {"[Prairie] Prairie_Island", 'Prairie_Island'},
     {"[Prairie] Prairie_Cave", 'Prairie_Cave'}, {"[Prairie] Prairie_Village", 'Prairie_Village'},
     {"[Prairie] DayHubCave", 'DayHubCave'}, {"[Prairie] DayEnd", 'DayEnd'}, {"[Forest] Rain", 'Rain'},
     {"[Forest] RainForest", 'RainForest'}, {"[Forest] RainShelter", 'RainShelter'},
     {"[Forest] Rain_Cave", 'Rain_Cave'}, {"[Forest] RainMid", 'RainMid'}, {"[Forest] RainEnd", 'RainEnd'},
     {"[Forest] Rain_BaseCamp", 'Rain_BaseCamp'}, {"[Forest] Skyway", 'Skyway'}, {"[Valley] Sunset", 'Sunset'},
     {"[Valley] Sunset_Citadel", 'Sunset_Citadel'}, {"[Valley] Sunset_FlyRace", 'Sunset_FlyRace'},
     {"[Valley] SunsetRace", 'SunsetRace'}, {"[Valley] SunsetEnd", 'SunsetEnd'},
     {"[Valley] Sunset_YetiPark", 'Sunset_YetiPark'}, {"[Valley] SunsetVillage", 'SunsetVillage'},
     {"[Valley] SunsetColosseum", 'SunsetColosseum'}, {"[Valley] SunsetEnd2", 'SunsetEnd2'},
     {"[Valley] Sunset_Theater", 'Sunset_Theater'}, {"[Valley] SunsetVillage_MusicShop", 'SunsetVillage_MusicShop'},
     {"[Desert] DuskStart", 'DuskStart'}, {"[Desert] Dusk", 'Dusk'}, {"[Desert] Dusk_Triangle", 'Dusk_Triangle'},
     {"[Desert] Dusk_TriangleEnd", 'Dusk_TriangleEnd'}, {"[Desert] DuskGraveyard", 'DuskGraveyard'},
     {"[Desert] DuskOasis", 'DuskOasis'}, {"[Desert] Dusk_CrabField", 'Dusk_CrabField'},
     {"[Desert] DuskMid", 'DuskMid'}, {"[Desert] DuskEnd", 'DuskEnd'},
     {"[Desert] Nintendo_CandleSpace", 'Nintendo_CandleSpace'}, {"[Library] Night", 'Night'},
     {"[Library] Night2", 'Night2'}, {"[Library] NightArchive", 'NightArchive'}, {"[Library] Office", 'TGCOffice'},
     {"[Library] Halloween", 'Event_DaysOfMischief'}, {"[Library] NightEnd", 'NightEnd'},
     {"[Library] NightDesert", 'NightDesert'}, {"[Library] Night Beach", 'NightDesert_Beach'},
     {"[Library] Jar cave", 'Night_JarCave'}, {"[Library] Infinite desert", 'Night_InfiniteDesert'},
     {"[Library] Planet", 'NightDesert_Planets'}, {"Eden1", 'StormStart'}, {"Eden2", 'Storm'},
     {"Before eden", 'NightEnd'}, {"⚠️Eden sacrifice⚠️", 'StormEnd'}, {"⚠️Eden rebirth1⚠️", 'OrbitMid'},
     {"⚠️Eden rebirth2⚠️", 'OrbitEnd'}, {"⚠️Heaven⚠️", 'CandleSpaceEnd'},
     {"⚠️Credit⚠️", 'Credits'}}
gg.clearResults()
local nn = {}
local E = {}
gg.searchNumber(1487508559, gg.TYPE_DWORD, false, nil, 0, i)
nn = gg.getResults(gg.getResultCount())
for G, H in ipairs(nn) do
    E[G] = {
        address = H.address + 4,
        flags = 4
    }
end
E = gg.getValues(E)
for G, H in ipairs(E) do
    if H.value == 11 then
        o = H.address + 8;
        break
    end
end
for P, H in ipairs(k) do
    table.insert(l, H[1])
end
function p(_, a0, a1)
    local nn = gg.bytes(a1)
    local a2 = {}
    local E;
    if #nn < a0 then
        E = a0 - #nn;
        for G = 1, E do
            table.insert(nn, 0)
        end
    end
    for G = 1, a0 do
        table.insert(a2, {
            address = _ + G - 1,
            flags = gg.TYPE_BYTE,
            value = nn[G]
        })
    end
    gg.setValues(a2)
end
function q()
    r = false;
    m = gg.choice(l)
    if m == nil then
        m = 1
    end
    n = k[m][2]
    p(o, 24, n)
    gg.setVisible(false)
    gg.setValues({{
        address = i - e.lvlWing,
        flags = 4,
        value = 0
    }})
    gg.sleep(100)
    gg.setValues({{
        address = i - e.lvlWing,
        flags = 4,
        value = -1
    }})
    gg.setSpeed(100)
    gg.sleep(5000)
    gg.setSpeed(1)
    p(o, 24, 'CandleSpace')
    A()
end
function y()
    r = false;
    local a3 = i - e.candle;
    local a4 = {}
    gg.setVisible(false)
    for G = 1, 709 do
        a4[G] = {
            address = a3 - (G - 1) * 0x1c0,
            flags = 16,
            value = 1,
            freeze = true
        }
    end
    if D == false then
        gg.addListItems(a4)
        D = true;
        gg.toast('burn the candles ON')
        return
    else
        gg.removeListItems(a4)
        D = false;
        gg.toast('burn the candles OFF')
    end
    gg.setValues(a4)
end
function z()
    r = false;
    local a5 = i - e.aFlowers;
    local a6 = {}
    gg.setVisible(false)
    for G = 1, 397 do
        a6[G] = {
            address = a5 - (G - 1) * 8,
            flags = 16,
            value = 0,
            freeze = true
        }
    end
    if C == false then
        gg.addListItems(a6)
        C = true;
        gg.toast('burn the flowers ON')
        return
    else
        gg.removeListItems(a6)
        C = false;
        gg.toast('burn the flowers OFF')
    end
end
function A()
    r = false;
    local a7 = {}
    for G = 1, 12 do
        a7[G] = {
            address = i - e.sWings + 0x120 * (G - 1),
            flags = 4,
            value = 4
        }
    end
    gg.setValues(a7)
    gg.sleep(200)
    for G = 1, 12 do
        a7[G] = {
            address = i - e.sWings + 0x120 * (G - 1),
            flags = 4,
            value = 8
        }
    end
    gg.setValues(a7)
end
gg.showUiButton()
gg.clearResults()
function B()
    if gg.isVisible(true) and r == false or gg.isClickedUiButton() then
        local a8 = gg.choice({'set fire', 'absorb wings', 'Teleport'})
        r = true;
        if a8 == 1 then
            z()
            y()
        end
        if a8 == 2 then
            A()
        end
        if a8 == 3 then
            q()
        end
    end
end
while true do
    B()
    gg.sleep(200)
end
