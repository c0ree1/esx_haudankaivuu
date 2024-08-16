ESX = exports["es_extended"]:getSharedObject()
local table = {}

local haudat = {
[1] = {coords=vector3(-1700.7033691406, -229.9792175293, 55.171701049805), heading=356.59869384766},
[2] = {coords=vector3(-1703.9849853516, -229.55870056152, 55.305196380615), heading=356.63824462891},
[3] = {coords=vector3(-1706.0054931641, -229.29997253418, 55.323289489746), heading=356.15518188477},
[4] = {coords=vector3(-1704.2709960938, -234.33534240723, 54.225980377197), heading=6.777087688446},
[5] = {coords=vector3(-1706.6723632813, -234.00384521484, 54.4088722229), heading=0.30771639943123},
[6] = {coords=vector3(-1708.0378417969, -234.00321960449, 54.430375671387), heading=356.87893676758},
[7] = {coords=vector3(-1731.3449707031, -225.123046875, 55.277532196045), heading=357.86260986328},
[8] = {coords=vector3(-1742.0494384766, -225.34284973145, 54.593721008301), heading=357.25329589844},
[9] = {coords=vector3(-1745.9366455078, -224.51022338867, 54.249261474609), heading=346.70175170898},
[10] = {coords=vector3(-1749.2991943359, -223.22352600098, 54.145566558838), heading=341.6374206543},
[11] = {coords=vector3(-1753.2542724609, -233.21545410156, 52.702828979492), heading=338.38763427734},
[12] = {coords=vector3(-1751.4467773438, -233.85572814941, 52.726194000244), heading=338.83715820313},
[13] = {coords=vector3(-1738.0440673828, -269.31164550781, 50.085256195068), heading=287.29925537109},
[14] = {coords=vector3(-1736.6497802734, -271.70401000977, 50.003228759766), heading=285.71295166016},
[15] = {coords=vector3(-1736.1964111328, -273.57568359375, 49.901128387451), heading=286.92028808594},
[16] = {coords=vector3(-1733.4134521484, -275.53616333008, 49.856767272949), heading=284.66445922852},
[17] = {coords=vector3(-1733.1477050781, -277.07592773438, 49.723664855957), heading=290.56753540039},
[18] = {coords=vector3(-1733.0059814453, -278.36053466797, 49.643491363525), heading=284.57797241211},
[19] = {coords=vector3(-1732.3444824219, -280.56469726563, 49.436513519287), heading=286.29968261719},
[20] = {coords=vector3(-1731.5872802734, -282.72265625, 49.227773284912), heading=283.74099731445},
[21] = {coords=vector3(-1731.3977050781, -284.75219726563, 49.069387054443), heading=282.3662109375},
[22] = {coords=vector3(-1730.9656982422, -286.75170898438, 48.939962005615), heading=278.00332641602},
[23] = {coords=vector3(-1741.8890380859, -271.01895141602, 49.181134796143), heading=284.39462280273},
[24] = {coords=vector3(-1740.927734375, -273.0153503418, 49.007039642334), heading=280.84997558594},
[25] = {coords=vector3(-1740.9239501953, -274.92138671875, 48.905114746094), heading=178.87973022461},
[26] = {coords=vector3(-1740.4654541016, -277.49267578125, 48.773336029053), heading=282.79864501953},
[27] = {coords=vector3(-1739.419921875, -280.2048034668, 48.638192749023), heading=283.25903320313},
[28] = {coords=vector3(-1739.0177001953, -281.66897583008, 48.571256256104), heading=280.97427368164},
[29] = {coords=vector3(-1738.6345214844, -282.91137695313, 48.5140625), heading=285.10284423828},
[30] = {coords=vector3(-1737.2569580078, -287.36880493164, 48.230298614502), heading=280.61126708984},
[31] = {coords=vector3(-1736.9151611328, -288.58459472656, 48.151078796387), heading=275.23693847656},
[32] = {coords=vector3(-1736.6850585938, -290.39761352539, 48.034692382813), heading=279.09741210938},
[33] = {coords=vector3(-1736.5119628906, -292.09811401367, 47.922677612305), heading=268.02990722656},
[34] = {coords=vector3(-1736.2028808594, -294.35437011719, 47.767850494385), heading=271.37680053711},
[35] = {coords=vector3(-1736.173828125, -296.25088500977, 47.644227600098), heading=267.25775146484},
[35] = {coords=vector3(-1737.8726806641, -285.82797241211, 48.330937957764), heading=280.61029052734},

}



CreateThread(function()
        Wait(10)
    while true do
        local wait = 2500 -- loopataan vaan 2,5SEC koska ei renderöidä mitään
        for i=1, #haudat do
            local coords = GetEntityCoords(PlayerPedId())
            local hauta = #(haudat[i].coords - coords) --MATIKKANERO OMFG SOO GOOD ONKS TÄÄ SE UUS TAPA
            if hauta < 15.0 then --pitää legit olla semi pieni ettei mee liian raskaaks
                wait = 5 -- pitää piirtää nuo markkerit...
                DrawMarker(25, haudat[i].coords.x, haudat[i].coords.y, haudat[i].coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 77, 0, 0, 150, false, true, 5, nil, nil, false)
                    if hauta < 1.2 then
                        if Config.teksti then
                            ESX.ShowNotification('Paina ~INPUT_PICKUP~ kaivaaksesi!')
                        end
                        if IsControlJustReleased(0, 38) then
                            ESX.TriggerServerCallback('core_haudankaivuu:server', function(inv,cdtable)
                                table = cdtable
                                if Config.tarviitkolapion then
                                    if inv.lapio > 0 then
                                    aloitakaivausvitunpaska(i)
                                else
                                    -- ESX.Shownotification("Tarvitset Lapion!")
                                    exports['mythic_notify']:DoHudText('inform', 'Tarvitset lapion')
                                end
                            else
                                aloitakaivausvitunpaska[i]
                            end
                        end)
                    end
                end
            end
        end
        Wait(wait)
    end
end)

function aloitakaivausvitunpaska(hauta)
    ESX.TriggerServerCallback('core_haudankaivuu:boliseja', function(bolis)
        if bolis >= Config.boliiseja then
            anim(hauta)
        else
            -- ESX.Shownotification('Ei tarpeeksi poliiseja!')
            exports[mythic_notify]:DoHudText('error', 'Ei tarpeeksi poliiseja')
        end
    end)
end

function anim(hauta)
    SetEntityHeading(PlayerPedId(), haudat[hauta].heading)
    TriggerEvent("mythic_progbar:client:progress", {
        name = "hauta"
        duration = 20000,
        label = 'Avataan hautaa...',
        useWhileDead = false,
        canCancel = true
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "amb@world_human_janitor@male@idle_a",
            anim = "idle_a",
        },
        prop = {
            model = "prop_ld_shovel",
            bone = 28422,
        }
    }, function(canceled)
        if not canceled then
            ClearPedTasks(PlayerPedId())
            if table[hauta].cd <= 0 then
                TriggerServerEvent('core_haudankaivuu:poliisi', haudat[hauta].coords)
                TriggerServerEvent('core_haudankaivuu:kaivettupaskaks', hauta)
                if Config.lapiopois then
                    local olenmatikkanero = math.random(1, 100)
                    if olenmatikkanero <= 3 then
                        TriggerServerEvent('core_haudankaivuu:poistaitemi', 'lapio')
                    end
                end
            else
                --ESX.ShowNotification("Tyhjää täynnä...")
                exports['mythic_notify']:DoHudText('inform', 'Tyhjää täynnä...' )
            end
            npcagro()
        else
            ClearPedTasks(PlayerPedId())
        end
    end)
end


function npcagro()
    local matikkapaanerohomoperse = math.random(1, 100)
    if matikkapaanerohomoperse <= Config.kirkkoherrachance then
        RequestModel(GetHashKey("cs_priest"))
        while not HasModelLoaded(GetHashKey("cs_priest")) do
            Wait(1)
        end
        pedi = CreatePed(4, GetHashKey("cs_priest"), -1707.8052978516, -278.82373046875, 51.853023529053, 89.036315917969, true, true)
        GiveWeaponToPed(pedi, GetHashKey(Config.kirkkoherranASE), 0, false, true) -- pesis
        TaskCombatPed(pedi,PlayerPedId(), 0, 16)
        SetAiWeaponDamageModifier(0.0)
        Wait(120000) -- Kahen minuutin pääst poistetaan pedi
        DeleteEntity(pedi)
    end
end


RegisterNetEvent('core_haudankaivuu:blipclient')
AddEventHandler('core_haudankaivuu:blipclient', function(pos)
    ESX.ShowAdvancedNotification('Hautausmaa', 'Hämärää toimintaa!', "", "CHAR_CALL911", 1)
end)
