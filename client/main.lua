local QBCore = exports['qb-core']:GetCoreObject()
local Stage = Config.Stage

local function LoadAnimDict(lib)
    while (not HasAnimDictLoaded(lib)) do
        RequestAnimDict(lib)
        Wait(5)
    end
end

CreateThread(function()
    while true do
        Wait(1)
        local plyCoords = GetEntityCoords(PlayerPedId(), 0)
        local distance = #(vector3(Stage.x, Stage.y, Stage.z) - plyCoords)
        if distance < 10 then
            if not IsPedInAnyVehicle(PlayerPedId(), true) then
                if distance < 3 then
                    --DrawText3D(vector3(Stage.x, Stage.y, Stage.z + 0.5), '[E] Make it rain', 0.4)
                    exports['qb-core']:DrawText('[E Make It rain]', 'left')
					if IsControlJustReleased(0, 54) then 
                            exports['qb-core']:HideText()
                            RequestNamedPtfxAsset("core")
                            cash = CreateObject(GetHashKey("prop_cash_pile_01"), 0, 0, 0, true, true, true) 
                            local lib, anim = 'anim@mp_player_intcelebrationfemale@raining_cash', 'raining_cash' do
                                Citizen.Wait(900)
                                LoadAnimDict(lib)
                                --RequestAnimDict(lib, function()
                                AttachEntityToEntity(cash, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.12, 0.028, 0.001, 300.00, 180.0, 20.0, true, true, false, true, 1, true)
                                TaskPlayAnim(PlayerPedId(), lib, anim, 8.0 , -1 , -1 , 0 , 0 , false , false , false);
                                Citizen.Wait(1000)
                                UseParticleFxAssetNextCall("core")
                                local fx = StartParticleFxNonLoopedOnEntity("ent_brk_banknotes", PlayerPedId(), 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0, false, false, false)  --(effectName, entity, offsetX, offsetY, offsetZ, rotX, rotY, rotZ, scale, axisX, axisY, axisZ);
                            end
                            Wait(500)
                            DeleteEntity(cash)
                            TriggerServerEvent('QB-MakeItRain:Server:Payment')
                    end
                else
                    exports['qb-core']:HideText()
                end
            end
        end
    end
end)