-- This system is integrated for almaz-motels --
-- This system is integrated for almaz-motels --
-- This system is integrated for almaz-motels --

ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

DrawText3D = function (x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function OpenWardrobe()
    TriggerEvent("qb-clothing:client:openOutfitMenu")
end

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local playerCoords = GetEntityCoords(PlayerPedId())
        for i = 1, #OPH3Z, 1 do
            for j = 1, #OPH3Z[i].wardrobes, 1 do
                local dst = GetDistanceBetweenCoords(playerCoords, OPH3Z[i].wardrobes[j].wardrobe, true)
                if dst < OPH3Z.Distance then
                    sleep = 4
                    DrawText3D(OPH3Z[i].wardrobes[j].wardrobe[1], OPH3Z[i].wardrobes[j].wardrobe[2], OPH3Z[i].wardrobes[j].wardrobe[3], OPH3Z.DrawText)
                    if IsControlJustReleased(0, 38) then
                        OpenWardrobe()
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

-- This system is integrated for almaz-motels --
-- This system is integrated for almaz-motels --
-- This system is integrated for almaz-motels --
-- This system is integrated for almaz-motels --