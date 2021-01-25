JWORK = nil

Citizen.CreateThread(function()
    while JWORK == nil do
        TriggerEvent('jwork:getSharedObject', function(obj) JWORK = obj end)
        Citizen.Wait(5000)
    end
end)

local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)

local Ammu = {
    Base = { Title = "Ammu", Header = {"commonmenu", "interaction_bgd"}, Color = {color_black} },
    Data = { currentMenu = "Articles disponibles" },
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
            if btn.name == "Batte de baseball" then
                TriggerServerEvent("jammu:buy", btn.name, btn.weapon, btn.quantite, btn.price)
            elseif btn.name == "Lampe torche" then
                TriggerServerEvent("jammu:buy", btn.name, btn.weapon, btn.quantite, btn.price)
            elseif btn.name == "Couteau" then
                TriggerServerEvent("jammu:buy", btn.name, btn.weapon, btn.quantite, btn.price)
            elseif btn.name == "Queue de billard" then
                TriggerServerEvent("jammu:buy", btn.name, btn.weapon, btn.quantite, btn.price)
            elseif btn.name == "Poing américain" then
                TriggerServerEvent("jammu:buy", btn.name, btn.weapon, btn.quantite, btn.price)
            end
        end,
    },

    Menu = {
        ["Articles disponibles"] = {
            b = {
                {name = "Batte de baseball", weapon = "weapon_bat", quantite = 1, price = 0},
                {name = "Lampe torche", weapon = "weapon_flashlight", quantite = 1, price = 0},
                {name = "Couteau", weapon = "weapon_knife", quantite = 1, price = 0},
                {name = "Queue de billard", weapon = "weapon_poolcue", quantite = 1, price = 0},
                {name = "Poing américain", weapon = "weapon_knuckle", quantite = 1, price = 0},
            }
        },
    }
}

local ammupos = {
    {x = 21.64, y = -1106.85, z = 29.8}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k, v in pairs(ammupos) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, ammupos[k].x, ammupos[k].y, ammupos[k].z)

            if dist <= 2.0 then
                JWORK.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour ~b~interagir avec l'ammu~w~.")
                if IsControlJustPressed(1, 51) then
                    CreateMenu(Ammu)
                end
            end
        end
    end
end)
