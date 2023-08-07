ESX = exports["es_extended"]:getSharedObject()

Menu_admin = RageUI.CreateMenu("Admin Menu", "Menu Admin")-- -0,-0, 'bannerwave', 'interaction_bgd2', 0, 0, 0, 0) 
Menu_Give = RageUI.CreateSubMenu(Menu_admin, "Option Perso", "Que Voulez Vous ?") 
Menu_Joueur = RageUI.CreateSubMenu(Menu_admin, "Option Joueurs", "Gerer Les Joueurs")
Menu_reports = RageUI.CreateSubMenu(Menu_admin, "Menu Reports", "Gerer les reports")
Menu_animation = RageUI.CreateSubMenu(Menu_Give, "Menu Animation", "Jouer Animation")
Menu_vehicule = RageUI.CreateSubMenu(Menu_Give, "List Véhicule", "Spawn Vehicule")
Menu_option_vehicule = RageUI.CreateSubMenu(Menu_Give, "Menu Option", "Menu des option de vehicule")
Menu_custom = RageUI.CreateSubMenu(Menu_option_vehicule, "Custom Véhicule", "Menu custom vehicule")
Menu_Place = RageUI.CreateSubMenu(Menu_option_vehicule, "Place Véhicule", "changer de place")
Menu_gestion = RageUI.CreateSubMenu(Menu_option_vehicule, "Gestion Véhicule", "Menu gestion VÉHICULE")
Menu_Time = RageUI.CreateSubMenu(Menu_Give, "Menu Temps", "Changer Le Temps")
Menu_Ped = RageUI.CreateSubMenu(Menu_Give, "Menu Peds", "Option Peds")
Menu_arme = RageUI.CreateSubMenu(Menu_Give, "Menu Armes", "Give Armes")
Menu_parametre = RageUI.CreateSubMenu(Menu_admin, "Paramétre Menu", "MODIFIE LES PARAMÉTRE")
Menu_autreOption = RageUI.CreateSubMenu(Menu_admin, "Autres Options", "Que voulez vous faire ?")
Item = RageUI.CreateSubMenu(Menu_autreOption, 'Menu Item', 'Give item')
Menu_tp = RageUI.CreateSubMenu(Menu_autreOption, "Tp Lieux", "se tp dans un lieux")
Menu_dev = RageUI.CreateSubMenu(Menu_admin, 'Menu Dev', 'Menu developpeurs')
Menu_cutscene = RageUI.CreateSubMenu(Menu_dev, 'Cut Scene', 'Menu cut scene')
Menu_money = RageUI.CreateSubMenu(Menu_Give, 'Give Money', 'Menu give money')
Menu_props = RageUI.CreateSubMenu(Menu_Give, "Menu Props", "Menu Props")

Menu_admin:DisplayGlare(true)
Menu_Give:DisplayGlare(true)
Menu_Joueur:DisplayGlare(true)
Menu_reports:DisplayGlare(true)
Menu_animation:DisplayGlare(true)
Menu_vehicule:DisplayGlare(true)
Menu_option_vehicule:DisplayGlare(true)
Menu_custom:DisplayGlare(true)
Menu_Place:DisplayGlare(true)
Menu_gestion:DisplayGlare(true)
Menu_Time:DisplayGlare(true)
Menu_Ped:DisplayGlare(true)
Menu_arme:DisplayGlare(true)
Menu_parametre:DisplayGlare(true)
Menu_autreOption:DisplayGlare(true)
Item:DisplayGlare(true)
Menu_tp:DisplayGlare(true)
Menu_dev:DisplayGlare(true)
Menu_cutscene:DisplayGlare(true)
Menu_money:DisplayGlare(true)

Menu_admin.Closed = function()
    menu_Isopen = false
end

local ServersIdSession = {}
local IdSelected = nil
local playerResult = {}

local checkbox = false
local checkbox2 = false
local checkbox3 = false
local checkbox4 = false
local checkbox5 = false
local checkbox6 = false
local checkbox7 = false
local checkbox8 = false
local checkbox9 = false
local checkbox10 = false
local checkbox11 = false
local checkbox12 = true
local checkbox13 = false 
local checkbox14 = false 
local propsfreeze = false 

local onlisted = {
    yesorno = 1
}

local marqueur = {
    gps = 1
}

local principal = {
    color1 = 1
}

local second = {
    color2 = 1
}

local neon = {
    color = 1
}

local porte = {
    vehicule = 1
}

local fenetre = {
    window = 1
} 

local heure = {
    time = 1
}

local meteo = {
    weather = 1
}

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        if IsControlJustPressed(0, 73) then 
            local player = PlayerPedId()
            ClearPedTasksImmediately(player)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(500)
        for k,v in pairs(GetActivePlayers()) do
            local found = false
            for _,j in pairs(ServersIdSession) do
                if GetPlayerServerId(v) == j then
                    found = true
                end
            end
            if not found then
                table.insert(ServersIdSession, GetPlayerServerId(v))
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        DisableControlAction(0, 200, true)
        Wait(0)
    end
end)

Keys.Register(touche, touche, "Ouvrir le menu",function()
    if ESX.GetPlayerData().group ~= "user" then
        openMenu()
    end
end)

function openMenu() 
    if menu_Isopen then 
        return 
    else 
        menu_Isopen = true 
        RageUI.Visible(Menu_admin, true)
        
        CreateThread(function()
            while menu_Isopen do 
                Wait(0)

                RageUI.IsVisible(Menu_admin, function()

                    if not checkbox then 
                        RageUI.Separator("Prendre Son ~r~Role Staff~s~ !")
                    else 
                        RageUI.Separator("Role Staff : ~g~Activé !")
                    end


                    RageUI.line()

                    RageUI.Checkbox("→→ Mode Staff", nil, checkbox, {}, { 
                    
                        onChecked = function()
                            checkbox = true
                            if notification then
                                ESX.ShowAdvancedNotification("Notification","Menu Admin", "Tu vient d'activer le mode ~r~Staff !", "CHAR_MP_FM_CONTACT", 1)
                            else 
                                return
                            end 
                        end,

                        onUnChecked = function() 
                            checkbox = false

                            if notification then
                                ESX.ShowAdvancedNotification("Notification","Menu Admin", "Tu vient de d'esactiver le mode ~r~Staff !", "CHAR_MP_FM_CONTACT", 1)
                            else 
                                return 
                            end 
                        end,

                        onSelected = function(index) 
                            checkbox = index 
                        end
                    })
                      
                    if checkbox then 

                        RageUI.Button("Gestion des joueurs", "Menu gestion joueurs", {RightLabel = "→→"}, true, {},Menu_Joueur)
                        RageUI.Button("Gestion des reports", "Menu gestion reports", {RightLabel = "→→"}, true, {},Menu_reports)
                        RageUI.Button("Vos options", "Menu option perso", {RightLabel = "→→"}, true, {},Menu_Give)
                        RageUI.Button("Autres options", "Afficher le menu des autre option", {RightLabel = "→→"}, true, {},Menu_autreOption)
                        RageUI.Button("Menu dev", nil, {RightLabel = "→→"}, true, {},Menu_dev)
                        RageUI.Button("Paramétre du menu", "Parametre menu", {RightLabel = "→→"}, true, {},Menu_parametre)
                        
                        RageUI.Button("Notif", nil, {}, true, {
                            onSelected = function()

                                AddTextEntry('FMMC_MPM_NA', "Rentrer le nom de la notif :")
                                DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 200)
                                local blockInput = true
                                while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                                  Citizen.Wait(0)
                                end
    
                                if UpdateOnscreenKeyboard() ~= 2 then
                                    local notif = GetOnscreenKeyboardResult()
                                    Wait(500)
                                    blockInput = false

                                    TriggerServerEvent("envoie;notif",notif)

                                    return result
                                else
                                    Wait(500)
                                    blockInput = false
                                    return nil
                                end
                            end
                        })
                    else 
                        return
                    end
                end)

                RageUI.IsVisible(Menu_Give, function()

                    RageUI.Checkbox("→→ No-Clip", nil, checkbox2, {}, { 
                    
                        onChecked = function()
                            checkbox2 = true 
                            ToggleNoClipMode()
                            SetEntityVisible(PlayerPedId(), false)
                        end,

                        onUnChecked = function() 
                            checkbox2 = false
                            ToggleNoClipMode()
                            SetEntityVisible(PlayerPedId(), true)
                        end,

                        onSelected = function(index) 
                            checkbox2 = index 
                        end
                    })

                    RageUI.Separator("Menu Est ~r~Option Perso")
                    RageUI.line()

                    RageUI.Button("Liste des animations", "Menu animation", {RightLabel = "→→"}, true, {},Menu_animation)
                    RageUI.Button("Liste des véhicules", "List véhicule", {RightLabel = "→→"}, true, {},Menu_vehicule)
                    RageUI.Button("Option des véhicules", "Menu option véhicule", {RightLabel = "→→"}, true, {},Menu_option_vehicule)
                    RageUI.Button("Option du temps", "Modifié le temps", {RightLabel = "→→"}, true, {},Menu_Time)
                    RageUI.Button("Liste des peds", "Menu ped", {RightLabel = "→→"}, true, {},Menu_Ped)
                    RageUI.Button("Liste des armes", "Menu armes", {RightLabel = "→→"}, true, {},Menu_arme)
                    RageUI.Button("Give Money", "Menu give money", {RightLabel = "→→"}, true, {},Menu_money)
                    RageUI.Button("Menu props", "Menu props", {RightLabel = "→→"}, true, {},Menu_props)
                
                end)

                RageUI.IsVisible(Menu_Joueur, function()

                    players = {}

                    for _, player in pairs(GetActivePlayers()) do
                        local ped = GetPlayerPed(player)
                        table.insert(players, player)
                    end

                    RageUI.Separator('Joueurs en ligne : ~g~'..#players..'~s~/64')

                    RageUI.line()
                    for k,v in ipairs(ServersIdSession) do
                        if GetPlayerName(GetPlayerFromServerId(v)) == "**Invalid**" then 
                            table.remove(ServersIdSession, k) 
                        end
                        RageUI.Button(v.." : " ..GetPlayerName(GetPlayerFromServerId(v)), nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                IdSelected = v
                            end
                        })
                    end
                end)

                RageUI.IsVisible(Menu_animation, function()
                    for k,v in pairs (WORLD_HUMAN) do

                        RageUI.Button(""..v[1].."", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
    
                                local player = PlayerPedId()
                                local animation = v[3]
                                RequestAnimDict(v[2])
                                ClearPedTasks(player)
                                TaskStartScenarioInPlace(player, animation, 0, false)
                                TaskPlayAnim(player, animation, 8.0, true, 1.0, false, 0, false)

                                if notification then 
                                    ESX.ShowAdvancedNotification("Notification","Menu Admin", "Vous venez de jouer l'animation : ".."~r~"..v[1], "CHAR_MP_FM_CONTACT", 1)
                                else 
                                    return 
                                end
                            end
                        })
                    end

                    RageUI.Button("→→ Arreter l'animation", nil, {}, true, {
                        onSelected = function()
                            local player = PlayerPedId()
                            ClearPedTasksImmediately(player)
                        end
                    })
                end)

                RageUI.IsVisible(Menu_vehicule, function()

                    local playerPed = PlayerPedId()
                    local Player_Vehicle_Name = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(playerPed, false)))
                    RageUI.Separator("Vous êtes dans une : ~r~"..string.lower(Player_Vehicle_Name))

                    RageUI.line()

                    RageUI.Checkbox("Etre tp dans le vehicule", nil, checkbox12, {}, { 
                    
                        onChecked = function()
                            checkbox12 = true 
                        end,
                        onUnChecked = function() 
                            checkbox12 = false
                        end,
                        onSelected = function(index) 
                            checkbox12 = index 
                        end
                    })

                    for k,v in pairs (vehicule) do 

                        RageUI.Button(""..v[1].."",nil, {RightBadge = RageUI.BadgeStyle.Car}, true, {
                            onSelected = function()

                                if IsPedInAnyVehicle(PlayerPedId()) then 

                                    local player = PlayerPedId()
                                    local vehicle = GetVehiclePedIsIn(player, false)
                                    SetEntityAsMissionEntity(vehicle, true, true)
                                    DeleteEntity(vehicle)

                                    local model = GetHashKey(v[2])
                                    RequestModel(model)
                                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                                    local pos = GetEntityCoords(PlayerPedId())
                                    local angle = GetEntityHeading(PlayerPedId()) 
                                    local vehicle = CreateVehicle(model, pos.x, pos.y, pos.z, angle, true, true)
                                    SetVehicleNumberPlateText(vehicle, "Wave")

                                    if checkbox12 then 
                                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                    else 
                                        return
                                    end 
                                    
                                else 

                                    local model = GetHashKey(v[2])
                                    RequestModel(model)
                                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                                    local pos = GetEntityCoords(PlayerPedId())
                                    local angle = GetEntityHeading(PlayerPedId()) 
                                    local vehicle = CreateVehicle(model, pos.x, pos.y, pos.z, angle, true, true)
                                    SetVehicleNumberPlateText(vehicle, "Wave")

                                    if checkbox12 then 

                                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                    else 
                                        return
                                    end 
                                end 

                                if notification then 
                                    ESX.ShowAdvancedNotification("Notification","Menu Admin", "Vous venez de faire spawn la:  ".."~r~"..v[2], "CHAR_MP_FM_CONTACT", 1)
                                else 
                                    return   
                                end 
                            end
                        })
                    end 

                    RageUI.line()

                    RageUI.Button("Choisir un véhicule", nil, {}, true, {
                        onSelected = function()

                            AddTextEntry('FMMC_MPM_NA', "Quel véhicule voulez-vous ?")
                            DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)
                            while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                                Citizen.Wait(0)
                            end

                            local model = GetOnscreenKeyboardResult()
                            if IsModelValid(model) then

                                if IsPedInAnyVehicle(PlayerPedId()) then 
                                
                                    local player = PlayerPedId()
                                    local vehicle = GetVehiclePedIsIn(player, false)
                                    SetEntityAsMissionEntity(vehicle, true, true)
                                    DeleteEntity(vehicle)
        
                                    local car = GetHashKey(model)
                                    RequestModel(car)
        
                                    while not HasModelLoaded(car) do
                                      Citizen.Wait(0)
                                    end

                                    local coords = GetEntityCoords(PlayerPedId())
                                    local angle = GetEntityHeading(PlayerPedId())
                                    local vehicle = CreateVehicle(car, coords.x, coords.y, coords.z, angle, true, true)
                                    SetEntityAsMissionEntity(vehicle, true, true)
                                    SetVehicleNumberPlateText(vehicle, "Wave")
        
                                    if checkbox12 then 
                                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                    else 
                                        return
                                    end 

                                else

                                    local car = GetHashKey(model)
                                    RequestModel(car)
        
                                    while not HasModelLoaded(car) do
                                      Citizen.Wait(0)
                                    end
                                    local coords = GetEntityCoords(PlayerPedId())
                                    local angle = GetEntityHeading(PlayerPedId())
                                    local vehicle = CreateVehicle(car, coords.x, coords.y, coords.z, angle, true, true)
                                    SetEntityAsMissionEntity(vehicle, true, true)
                                    SetVehicleNumberPlateText(vehicle, "Wave")
                                    
                                    if checkbox12 then 
                                        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                    else 
                                        return
                                    end 
                                end 
                            else 
                                if notification then
                                    ESX.ShowAdvancedNotification("Notification","Menu Admin", "Le véhicule n'est pas valide", "CHAR_MP_FM_CONTACT", 1)
                                end
                            end 
                        end 
                    })
                end)

                RageUI.IsVisible(Menu_option_vehicule, function()

                    RageUI.Separator("Option ~r~Véhicule~s~ !")
                    RageUI.line()

                    RageUI.Button("Custom Véhicule", nil, {RightLabel = "→→"}, true, {},Menu_custom)
                    RageUI.Button("Changer de place", nil, {RightLabel = "→→"}, true, {},Menu_Place)
                    RageUI.Button("Gestion du véhicule", nil, {RightLabel ="→→"}, true, {},Menu_gestion)

                    RageUI.Button("→→ Réparer véhicule", nil, {}, true, {
                        onSelected = function()

                            Wait(100)
                            local playerPed = PlayerPedId()
                            local vehicle = GetVehiclePedIsIn(playerPed, false)
                            SetVehicleFixed(vehicle)
                            SetVehicleDeformationFixed(vehicle)
                            SetVehicleUndriveable(vehicle, false)

                        end
                    })

                    RageUI.Button("→→ Cloner le véhicule", nil, {}, true, {
                        onSelected = function()

                            local playerPed = PlayerPedId()
                            local playerCoords = GetEntityCoords(playerPed)
                            local playerHeading = GetEntityHeading(playerPed)

                            local newVehicle = CreateVehicle(GetEntityModel(GetVehiclePedIsIn(playerPed, false)), playerCoords.x + 4.0, playerCoords.y + 4.0, playerCoords.z, playerHeading, true, true)

                            for i = 0, 24 do
                                SetVehicleModKit(newVehicle, 0)
                                SetVehicleMod(newVehicle, i, GetVehicleMod(GetVehiclePedIsIn(playerPed, false), i), false)
                            end
                            SetVehicleMod(newVehicle, 24, GetVehicleMod(GetVehiclePedIsIn(playerPed, false), 24), true)

                            SetVehicleNumberPlateText(newVehicle, GetVehicleNumberPlateText(GetVehiclePedIsIn(playerPed, false)))
                            SetVehicleColours(newVehicle, GetVehicleColours(GetVehiclePedIsIn(playerPed, false)))
                            SetVehicleLivery(newVehicle, GetVehicleLivery(GetVehiclePedIsIn(playerPed, false)))
                            SetVehicleExtraColours(newVehicle, GetVehicleExtraColours(GetVehiclePedIsIn(playerPed, false)))
                            SetVehicleWindowTint(newVehicle, GetVehicleWindowTint(GetVehiclePedIsIn(playerPed, false)))
                            SetVehicleTyreSmokeColor(newVehicle, GetVehicleTyreSmokeColor(GetVehiclePedIsIn(playerPed, false)))
                            SetVehicleCustomPrimaryColour(newVehicle, GetVehicleCustomPrimaryColour(GetVehiclePedIsIn(playerPed, false)))
                            SetVehicleCustomSecondaryColour(newVehicle, GetVehicleCustomSecondaryColour(GetVehiclePedIsIn(playerPed, false)))
                        end
                    })

                    local passageCoords = { x = -631.59, y = -230.84, z = 38.05 }

                    RageUI.Button("→→ Supprimer véhicule", nil, {}, true, {
                        onSelected = function()
                            local player = PlayerPedId()
                            local vehicle = GetVehiclePedIsIn(player, false)
                            SetEntityAsMissionEntity(vehicle, true, true)
                            DeleteEntity(vehicle)

                        end
                    })

                    RageUI.Button("→→ Modifié la plaque", nil, {}, true, {
                        onSelected = function()

                            AddTextEntry('FMMC_MPM_NA', "Rentrer le nom de la plaque :")
                            DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 8)
                            local blockInput = true
                            while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                              Citizen.Wait(0)
                            end

                            if UpdateOnscreenKeyboard() ~= 2 then
                                local plaque = GetOnscreenKeyboardResult()
                                Wait(500)
                                blockInput = false
                                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                SetVehicleNumberPlateText(vehicle, plaque)
                                return result
                            else
                                Wait(500)
                                blockInput = false
                                return nil
                            end 

                        end
                    })

                    RageUI.List("Supprimer Véhicule (Radius)", {"5m", "10m", "30m", "50m", "200m", "500m"}, onlisted.yesorno, nil, {}, true, {
                        onListChange = function(list) onlisted.yesorno = list end,
                        onSelected = function(list)

                            if list == 1 then 
                                ExecuteCommand('dv '..'10')
                            end
                            if list == 2 then 
                                ExecuteCommand('dv '..'30')
                            end
                            if list == 3 then 
                                ExecuteCommand('dv '..'70')
                            end 
                            if list == 4 then 
                                ExecuteCommand('dv '..'300')
                            end
                            if list == 5 then 
                                ExecuteCommand('dv '..'450')
                            end
                            if list == 6 then 
                                ExecuteCommand('dv '..'1500')
                            end
                        end
                    })

                end)

                RageUI.IsVisible(Menu_custom, function()                     

                    RageUI.List("Couleur Principal", {"Rouge", "Orange", "Vert", "Jaune", "Bleu", "Rose", "Violet", "Noir", "Blanc"}, principal.color1, nil, {}, true, {
                        onListChange = function(list) principal.color1 = list end,
                        onSelected = function(list)

                            if list == 1 then 

                                local vehicle = GetVehiclePedIsUsing(PlayerPedId())
                                SetVehicleCustomPrimaryColour(vehicle, 180, 0, 0)

                            end
                            if list == 2 then 

                                local vehicle = GetVehiclePedIsUsing(PlayerPedId())
                                SetVehicleCustomPrimaryColour(vehicle, 255, 100, 0)

                            end 
                            if list == 3 then 

                                local vehicle = GetVehiclePedIsUsing(PlayerPedId())
                                SetVehicleCustomPrimaryColour(vehicle, 0, 230, 30)
                            end

                            if list == 4 then 
                                local vehicle = GetVehiclePedIsUsing(PlayerPedId())
                                SetVehicleCustomPrimaryColour(vehicle, 255, 180, 0)
                            end

                            if list == 5 then 

                                local vehicle = GetVehiclePedIsUsing(PlayerPedId())
                                SetVehicleCustomPrimaryColour(vehicle, 0, 85, 200)

                            end 

                            if list == 6 then 

                                local vehicle = GetVehiclePedIsUsing(PlayerPedId())
                                SetVehicleCustomPrimaryColour(vehicle, 155, 0, 90)
                                
                            end 

                            if list == 7 then

                                local vehicle = GetVehiclePedIsUsing(PlayerPedId())
                                SetVehicleCustomPrimaryColour(vehicle, 130, 0, 255)

                            end

                            if list == 8 then 
                                local vehicle = GetVehiclePedIsUsing(PlayerPedId())
                                SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
                            end 

                            if list == 9 then 
                                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                SetVehicleCustomPrimaryColour(vehicle, 255, 255, 255)
                            end

                        end
                    })

                    RageUI.List("Couleur Secondaire", {"Rouge", "Orange", "Vert", "Jaune", "Bleu", "Rose", "Violet", "Noir", "Blanc"}, second.color2, nil, {}, true, {
                        onListChange = function(list) second.color2 = list end,
                        onSelected = function(list)
      
                            if list == 1 then 

                                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                SetVehicleCustomSecondaryColour(vehicle, 180, 0, 0)

                            end
                            if list == 2 then 

                                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                SetVehicleCustomSecondaryColour(vehicle, 255, 100, 0)

                            end 
                            if list == 3 then 

                                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                SetVehicleCustomSecondaryColour(vehicle, 0, 230, 30)
                                
                            end
                            if list == 4 then 

                                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                SetVehicleCustomSecondaryColour(vehicle,  255, 180, 0)

                            end
                            if list == 5 then 

                                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                SetVehicleCustomSecondaryColour(vehicle, 0, 85, 200)

                            end 
                            if list == 6 then 

                                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                SetVehicleCustomSecondaryColour(vehicle, 155, 0, 90)
                                
                            end 
                            if list == 7 then

                                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                SetVehicleCustomSecondaryColour(vehicle, 130, 0, 255)

                            end
                            if list == 8 then 

                                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                SetVehicleCustomSecondaryColour(vehicle, 0, 0, 0)

                            end 
                            if list == 9 then 

                                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                SetVehicleCustomSecondaryColour(vehicle, 255, 255, 255)

                            end
                        end
                    })

                    RageUI.List("Neon véhicule", {"Aucun", "Rouge", "Vert", "Jaune", "Bleu", "Rose", "Violet", "Orange"}, neon.color, nil, {}, true, {
                        onListChange = function(list) neon.color = list end,
                        onSelected = function(list)

                            if list == 1 then 

                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 0, false) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 1, false) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 2, false) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 3, false) 
                                
                            end
                            if list == 2 then 

                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 0, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 1, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 2, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 3, true) 
                                SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId()), 255, 0, 0) 
                               
                            end
                            if list == 3 then 

                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 0, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 1, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 2, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 3, true) 
                                SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId()), 0, 255, 0) 
                                
                            end 
                            if list == 4 then 

                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 0, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 1, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 2, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 3, true) 
                                SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId()), 125, 125, 0) 
                                
                            end

                            if list == 5 then 

                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 0, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 1, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 2, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 3, true) 
                                SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId()), 0, 0, 255) 
                             
                            end

                            if list == 6 then 

                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 0, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 1, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 2, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 3, true) 
                                SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId()), 100, 0, 155) 

                            end 

                            if list == 7 then

                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 0, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 1, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 2, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 3, true) 
                                SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId()), 55, 0, 200) 

                            end 

                            if list == 8 then 

                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 0, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 1, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 2, true) 
                                SetVehicleNeonLightEnabled(GetVehiclePedIsUsing(PlayerPedId()), 3, true) 
                                SetVehicleNeonLightsColour(GetVehiclePedIsUsing(PlayerPedId()), 255, 50, 0) 

                            end
                        end
                    })
                end)

                RageUI.IsVisible(Menu_Place, function()

                    RageUI.Button("Place conducteur", nil, {}, true, {
                        onSelected = function()
                            local player = PlayerId()
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                            SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
                        end
                    })

                    RageUI.Button("Place passager", nil, {}, true, {
                        onSelected = function()
                            local player = PlayerId()
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                            SetPedIntoVehicle(PlayerPedId(), vehicle, 0)
                        end
                    })

                    RageUI.Button("Place arrière (coté conducteur)", nil, {}, true, {
                        onSelected = function()
                            local player = PlayerId()
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                            SetPedIntoVehicle(PlayerPedId(), vehicle, 1)
                        end

                    })

                    RageUI.Button("Place arrière (coté passagé)", nil, {}, true, {
                        onSelected = function()
                            local player = PlayerId()
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                            SetPedIntoVehicle(PlayerPedId(), vehicle, 2)
                        end

                    })

                end)

                RageUI.IsVisible(Menu_gestion, function()

                    RageUI.Checkbox("→→ Eteindre/Allumer", nil, checkbox8, {}, { 
                    
                        onChecked = function()
                            checkbox8 = true 
                            SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId()), false, false, true)
                            SetVehicleUndriveable(GetVehiclePedIsIn(PlayerPedId()), true)
                        end,

                        onUnChecked = function() 
                            checkbox8 = false
                            SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId()), true, false, true)
                        end,

                        onSelected = function(index) 
                            checkbox8 = index 
                        end
                    })

                    RageUI.Checkbox("→→ Ouvrir/Fermé Le capot", nil, checkbox9, {}, { 
                    
                        onChecked = function()
                            checkbox9 = true 
                            SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 4, false, false)
                        end,
                        onUnChecked = function() 
                            checkbox9 = false
                            SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 4, false, false)
                        end,
                        onSelected = function(index) 
                            checkbox9 = index 
                        end
                    })

                    RageUI.Checkbox("→→ Ouvrir /Fermé le coffre", nil, checkbox10, {}, { 
                    
                        onChecked = function()
                            checkbox10 = true 

                            SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 5, false, false)

                            --if notification then 
                               -- ESX.ShowAdvancedNotification("Notification","Menu Admin !", "Vous venez d'ouvrir le coffre", "CHAR_MP_FM_CONTACT", 1)
                          --  else 
                                --return 
                           -- end
                        end,
                        onUnChecked = function() 
                            checkbox10 = false
                            SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 5, false, false)
                        end,
                        onSelected = function(index) 
                            checkbox10 = index 
                        end
                    })

                    RageUI.line()

                    RageUI.List("Gestion portes :", {"Porte 1", "Porte 2", "Porte 3", "Porte 4" --[[,"Férmé les portes"]]}, porte.vehicule, nil, {}, true, {
                        onListChange = function(list) porte.vehicule = list end,
                        onSelected = function(list)

                            if list == 1 then 
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 0, false, false) 
                            end

                            if list == 2 then 
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 1, false, false)
                            end
                            if list == 3 then 
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 2, false, false)
                            end 
                            if list == 4 then 
                                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId()), 3, false, false)
                            end
                           --[[if list == 5 then 
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 0, false, false)
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 1, false, false)
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 2, false, false)
                                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 3, false, false)

                            end]]
                        end
                    })

                    RageUI.Checkbox("Férmé les fenêtre", nil, checkbox11, {}, { 
                    
                        onChecked = function()
                            checkbox11 = true 
                            SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 0, false, false)
                            SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 1, false, false)
                            SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 2, false, false)
                            SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId()), 3, false, false)
                        end,
                        onUnChecked = function() 
                            checkbox11 = false
                        end,
                        onSelected = function(index) 
                            checkbox11 = index 
                        end
                    })
                end)
                
                RageUI.IsVisible(Menu_Time, function()

                    RageUI.List("Heure :", {"00H00", "1H00", "2H00", "3H00","4H00","5H00","6H00","7H00","8H00","9H00","10H00","11H00","12H00","13H00","14H00","15H00","16H00","17H00","18H00","19H00","20H00","21H00","22H00","23H00"}, heure.time, nil, {}, true, {
                        onListChange = function(list) heure.time = list end,
                        onSelected = function(list)

                            if list == 1 then 
                                ExecuteCommand("time "..'0 '..'00')
                            end

                            if list == 2 then 
                                ExecuteCommand("time "..'1 '..'00')  
                            end

                            if list == 3 then 
                                ExecuteCommand("time "..'2 '..'00') 
                            end 

                            if list == 4 then 
                                ExecuteCommand("time "..'3 '..'00')
                            end

                            if list == 5 then 
                                ExecuteCommand("time "..'4 '..'00')          
                            end 

                            if list == 6 then 
                                ExecuteCommand("time "..'5 '..'00') 
                            end 

                            if list == 7 then 
                                ExecuteCommand("time "..'6 '..'00')
                            end 

                            if list == 8 then
                                ExecuteCommand("time "..'7 '..'00')
                            end 

                            if list == 9 then 
                                ExecuteCommand("time "..'8 '..'00')
                            end 

                            if list == 10 then 
                                ExecuteCommand("time "..'9 '..'00')
                            end 

                            if list == 11 then 
                                ExecuteCommand("time "..'10 '..'00') 
                            end 

                            if list == 12 then 
                                ExecuteCommand("time "..'11 '..'00') 
                            end 

                            if list == 13 then 
                                ExecuteCommand("time "..'12 '..'00') 
                            end 

                            if list == 14 then 
                                ExecuteCommand("time "..'13 '..'00')
                            end 

                            if list == 15 then 
                                ExecuteCommand("time "..'14 '..'00')  
                            end 

                            if list == 16 then 
                                ExecuteCommand("time "..'15 '..'00')
                            end 

                            if list == 17 then 
                                ExecuteCommand("time "..'16 '..'00')
                            end 

                            if list == 18 then 
                                ExecuteCommand("time "..'17 '..'00')      
                            end 

                            if list == 19 then 
                                ExecuteCommand("time "..'18 '..'00')
                            end 

                            if list == 20 then 
                                ExecuteCommand("time "..'19 '..'00')
                            end 

                            if list == 21 then 
                                ExecuteCommand("time "..'20 '..'00')
                            end 

                            if list == 22 then 
                                ExecuteCommand("time "..'21 '..'00')
                            end 

                            if list == 23 then 
                                ExecuteCommand("time "..'22 '..'00')   
                            end 

                            if list == 24 then 
                                ExecuteCommand("time "..'23 '..'00') 
                            end 

                        end
                    })

                    RageUI.List("Météo :", {"Ensoleillé", "Dégager", "Neutre","Brouillard","Brume","Couvert","Nuageux","Pluie + Nuageux","Pluie","Tonnerre","Flocon","Tempête De Neige","Neige Pour Noël","Halloween"}, meteo.weather, nil, {}, true, {
                        onListChange = function(list) meteo.weather = list end,
                        onSelected = function(list)

                            if list == 1 then 
                                ExecuteCommand("weather "..'EXTRASUNNY')
                            end

                            if list == 2 then 
                                ExecuteCommand("weather "..'clear')  
                            end

                            if list == 3 then 
                                ExecuteCommand("weather "..'NEUTRAL') 
                            end 

                            if list == 4 then 
                                ExecuteCommand("weather "..'SMOG')
                            end

                            if list == 5 then 
                                ExecuteCommand("weather "..'FOGGY')          
                            end 

                            if list == 6 then 
                                ExecuteCommand("weather "..'OVERCAST')
                            end 

                            if list == 7 then 
                                ExecuteCommand("weather "..'CLOUDS')
                            end 

                            if list == 8 then
                                ExecuteCommand("weather "..'CLEARING')
                            end 

                            if list == 9 then 
                                ExecuteCommand("weather "..'RAIN')
                            end 

                            if list == 10 then 
                                ExecuteCommand("weather "..'THUNDER')
                            end 

                            if list == 11 then 
                                ExecuteCommand("weather "..'SNOW')
                            end 

                            if list == 12 then 
                                ExecuteCommand("weather "..'BLIZZARD')
                            end 

                            if list == 13 then 
                                ExecuteCommand("weather "..'XMAS')
                            end 

                            if list == 14 then 
                                ExecuteCommand("weather "..'HALLOWEEN')
                            end 
                        end
                    })

                    RageUI.Button('Activer/Desactiver blackout', nil, {RightLabel = "~s~→→"}, true, {
                        onSelected = function()
                            ExecuteCommand('blackout')
                        end
                    })

                    RageUI.Button("enregistrer la pos", nil, {}, true, {
                        onSelected = function()
                            local pos = GetEntityCoords(PlayerPedId())
                            TriggerServerEvent("position", pos)
                        end
                    })
 
                    RageUI.line()

                    RageUI.Button('Choisir une heure', nil, {}, true, {
                        onSelected = function()

                            AddTextEntry('FMMC_MPM_NA', "Choissiser une heure (exemple 17 15) : ")
                            DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)
                            while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                              Citizen.Wait(0)
                            end
                            local heure = GetOnscreenKeyboardResult()
                            local minute = GetOnscreenKeyboardResult()

                            ExecuteCommand("time".." "..heure.." "..minute)
                        end
                    })

                    RageUI.Button('Choisir la météo', nil, {}, true, {
                        onSelected = function()

                            AddTextEntry('FMMC_MPM_NA', "Choissiser la météo (exemple extrasunny) : ")
                            DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)
                            while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                              Citizen.Wait(0)
                            end
                            local meteo = GetOnscreenKeyboardResult()

                            ExecuteCommand("weather ".. meteo)
                        end
                    })

                end)

                RageUI.IsVisible(Menu_Ped, function()
                    
                    for k,v in pairs(skin_female.ped_female) do

                        RageUI.Button(""..v[1].."", nil, {RightLabel = "~s~→→"}, true, {
                            onSelected = function()

                                local model = GetHashKey(v[2])
                                RequestModel(model)
                                while not HasModelLoaded(model) do Wait(1) end
                                SetPlayerModel(PlayerId(), model)
                                SetModelAsNoLongerNeeded(model)
                            end
                        })
                    end

                    for k,v in pairs(skin_male.ped_male) do

                        RageUI.Button(""..v[1].."", nil, {RightLabel = "~s~→→"}, true, {
                            onSelected = function()

                                local model = GetHashKey(v[2])
                                RequestModel(model)
                                while not HasModelLoaded(model) do Wait(1) end
                                SetPlayerModel(PlayerId(), model)
                                SetModelAsNoLongerNeeded(model)
                            end
                        })
                    end

                    for k,v in pairs(skin_Animals.ped_Animals) do

                        RageUI.Button(""..v[1].."", nil, {RightLabel = "~s~→→"}, true, {
                            onSelected = function()

                                local model = GetHashKey(v[2])
                                RequestModel(model)
                                while not HasModelLoaded(model) do Wait(1) end
                                SetPlayerModel(PlayerId(), model)
                                SetModelAsNoLongerNeeded(model)
                            end
                        })
                    end

                    for k,v in pairs(ped_custom) do

                        RageUI.Button(""..v[1].."", nil, {RightLabel = "~s~→→"}, true, {
                            onSelected = function()

                                local model = GetHashKey(v[2])
                                RequestModel(model)
                                while not HasModelLoaded(model) do Wait(1) end
                                SetPlayerModel(PlayerId(), model)
                                SetModelAsNoLongerNeeded(model)
                            end
                        })
                    end

                    RageUI.line()

                    RageUI.Button("Récuper mon apparance ", nil, {RightLabel = "→"}, true, {
                        onSelected = function()
                            getBaseSkin()
                        end
                    }) 
                end)

                RageUI.IsVisible(Menu_reports, function()

                    if report then 
                        RageUI.line()
                        RageUI.Separator('Liste des report')
                        RageUI.Button("Prendre Le Report", nil, {RightLabel = "~s~→→"}, true, {})

                    else 
                        RageUI.Separator('Aucun Report pour le moment !')
                    end 
                end)

                RageUI.IsVisible(Menu_arme, function()

                    for k,v in pairs(name.weapon) do

                        RageUI.Button(""..v[1].."", nil, {RightBadge = RageUI.BadgeStyle.Gun}, true, {
                            onSelected = function()

                                if ox_inventory then 
                                    ExecuteCommand('giveitem'.." ".."me".." ".. v[2].." "..'1')
                                else 
                                    local ped = PlayerPedId()
                                    local weaponhash = GetHashKey(v[2])
                                    GiveWeaponToPed(ped, weaponhash, 134, false, true)
                                end

                                if notification then
                                    Citizen.Wait(100)
                                    ESX.ShowAdvancedNotification("Notification","Menu Admin", "Tu vient de te give le : " .."~r~"..v[1], "CHAR_MP_FM_CONTACT", 1)
                                else 
                                    return 
                                end 
                            end
                        })
                    end

                    RageUI.Separator('Give ~r~Recharge')
                    RageUI.line()

                    for k,v in pairs(ammo.Weapon) do

                        RageUI.Button(""..v[1].."", nil, {RightBadge = RageUI.BadgeStyle.Ammo}, true, {
                            onSelected = function()

                                AddTextEntry('FMMC_KEY_TIP1', "Quelle somme voulez vous retirer ?")
                                DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", "", "", "", "", 30)
    
                                local blockage = true
    
                                while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                                    Citizen.Wait(0)
                                end
    
                                if UpdateOnscreenKeyboard() ~= 2 then
                                    local balle = GetOnscreenKeyboardResult()
                                    Wait(100)
                                    blockage = false

                                    if ox_inventory then 
                                        ExecuteCommand('giveitem'.." ".."me".." "..v[2].." "..balle)
                                    else 
                                        return 
                                    end 
    
                                    if notification then
                                        ESX.ShowAdvancedNotification("Notification","Menu Admin", "Tu vient de te give ".."~g~"..balle.." ~s~Balles !".." ~s~", "CHAR_MP_FM_CONTACT", 1)
                                    else 
                                        return
                                    end 
    
                                    return result
                                else
                                    Wait(500)
                                    blockage = false
                                    return nil
                                end 
                            end
                        })
                    end
                end)

                RageUI.IsVisible(Menu_parametre, function()

                    RageUI.Separator('Modifié les paramétre')
                    RageUI.line()

                    RageUI.Checkbox("→→ Désactivé notif", nil, checkbox3, {}, { 
                    
                        onChecked = function()
                            checkbox3 = true 
                        end,
                        onUnChecked = function() 
                            checkbox3 = false
                        end,
                        onSelected = function(index) 
                            checkbox3 = index 
                        end
                    })

                    if checkbox3 then 
                        notification = false
                    else 
                        notification = true
                    end

                    RageUI.Checkbox("→→ Désactivé le glare", nil, checkbox4, {}, { 
                    
                        onChecked = function()
                            checkbox4 = true 
                        end,
                        onUnChecked = function() 
                            checkbox4 = false
                        end,
                        onSelected = function(index) 
                            checkbox4 = index 
                        end
                    })

                    if checkbox4 then 
                        Menu_admin:DisplayGlare(false)
                        Menu_Give:DisplayGlare(false)
                        Menu_Joueur:DisplayGlare(false)
                        Menu_reports:DisplayGlare(false)
                        Menu_animation:DisplayGlare(false)
                        Menu_vehicule:DisplayGlare(false)
                        Menu_option_vehicule :DisplayGlare(false)
                        Menu_custom:DisplayGlare(false)
                        Menu_Place:DisplayGlare(false)
                        Menu_gestion:DisplayGlare(false)
                        Menu_Time:DisplayGlare(false)
                        Menu_Ped:DisplayGlare(false)
                        Menu_arme:DisplayGlare(false)
                        Menu_parametre:DisplayGlare(false)
                        Menu_autreOption:DisplayGlare(false) 
                        Menu_tp:DisplayGlare(false)
                        Item:DisplayGlare(false)
                        Menu_dev:DisplayGlare(false)
                        Menu_cutscene:DisplayGlare(false)
                        Menu_money:DisplayGlare(false)              
                    else 
                        Menu_admin:DisplayGlare(true)
                        Menu_Give:DisplayGlare(true)
                        Menu_Joueur:DisplayGlare(true)
                        Menu_reports:DisplayGlare(true)
                        Menu_animation:DisplayGlare(true)
                        Menu_vehicule:DisplayGlare(true)
                        Menu_option_vehicule:DisplayGlare(true)
                        Menu_custom:DisplayGlare(true)
                        Menu_Place:DisplayGlare(true)
                        Menu_gestion:DisplayGlare(true)
                        Menu_Time:DisplayGlare(true)
                        Menu_Ped:DisplayGlare(true)
                        Menu_arme:DisplayGlare(true)
                        Menu_parametre:DisplayGlare(true)
                        Menu_autreOption:DisplayGlare(true)
                        Menu_tp:DisplayGlare(true)
                        Item:DisplayGlare(true)
                        Menu_dev:DisplayGlare(true)
                        Menu_cutscene:DisplayGlare(true)
                        Menu_money:DisplayGlare(true)
                    end                      
                end)

                RageUI.IsVisible(Menu_autreOption, function()

                    RageUI.Separator('Autre ~r~Option')
                    RageUI.line()

                    RageUI.Checkbox("→→ God mode", "Se mettre en god mode", checkbox5, {}, { 

                        onChecked = function()
                            checkbox5 = true 
                        end,
                        onUnChecked = function() 
                            checkbox5 = false
                        end,
                        onSelected = function(index) 
                            checkbox5 = index 
                        end
                    })

                    if checkbox5 then 
                        SetEntityInvincible(PlayerPedId(), true)
                    else 
                        SetEntityInvincible(PlayerPedId(), false)
                    end 

                    RageUI.Checkbox("→→ Invisible", "Etre invisible", checkbox6, {}, { 
                    
                        onChecked = function()
                            checkbox6 = true 
                        end,
                        onUnChecked = function() 
                            checkbox6 = false
                        end,
                        onSelected = function(index) 
                            checkbox6 = index 
                        end
                    })

                    if checkbox6 then 
                        SetEntityVisible(PlayerPedId(), false)
                    else 
                        SetEntityVisible(PlayerPedId(), true)
                    end 

                    RageUI.Checkbox("→→ Se freeze", "Se freeze", checkbox7, {}, { 
                    
                        onChecked = function()
                            checkbox7 = true 
                        end,
                        onUnChecked = function() 
                            checkbox7 = false
                        end,
                        onSelected = function(index) 
                            checkbox7 = index 
                        end
                    })

                    if checkbox7 then 
                        local player = PlayerPedId()
                        FreezeEntityPosition(player, true)
                    else 
                        local player = PlayerPedId()
                        FreezeEntityPosition(player, false)
                    end 

                    RageUI.Button("→→ Afficher ma position", "Afficher ma pos dans la console", {}, true, {

                        onSelected = function()
                            local player = PlayerPedId()
                            local pos = GetEntityCoords(player)
                            local x, y, z = table.unpack(pos)
                            print(string.format("Position : X = %.2f, Y = %.2f, Z = %.2f", x, y, z))

                            if notification then 
                                ESX.ShowAdvancedNotification("Notification","Menu Admin", "Vous venez d'afficher votre position dans la console (~r~F8 pour ouvrir la console~s~)", "CHAR_MP_FM_CONTACT", 1)
                            end 

                        end
                    })

                    RageUI.Button("→→ Tp-marker", nil, {}, true, {
                        onSelected = function()
                            ExecuteCommand('TPM')
                        end
                    })

                    RageUI.Button("Poser blips", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()

                            AddTextEntry('FMMC_MPM_NA', "Rentrer l'id du blips :")
                            DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 8)
                            local blockInput = true
                            while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                              Citizen.Wait(0)
                            end
                    
                            if UpdateOnscreenKeyboard() ~= 2 then
                                local numero_blips = GetOnscreenKeyboardResult()
                                Wait(500)
                                blockInput = false

                                local coords_joueur = GetEntityCoords(PlayerPedId())
                    
                                local blip = AddBlipForCoord(coords_joueur)
                                SetBlipSprite(blip, tonumber(numero_blips)) -- changer le sprite du blip (l'icône affichée)
                                SetBlipDisplay(blip, 4) -- définit comment le blip est affiché (taille, etc.)
                                SetBlipScale(blip, 0.8) -- définit la taille du blip
                                SetBlipColour(blip, 0) -- définit la couleur du blip
                                SetBlipAsShortRange(blip, true) -- définit si le blip doit être affiché à courte ou longue portée

                
                                AddTextEntry('FMMC_MPM_NA', "Rentrer le nom du blips !")
                                DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)
                                local blockInput = true
                                while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                                  Citizen.Wait(0)
                                end
                        
                                if UpdateOnscreenKeyboard() ~= 2 then
                                    local text_blips = GetOnscreenKeyboardResult()
                                    Wait(500)
                                    blockInput = false
                        
                                    BeginTextCommandSetBlipName("STRING") -- définit le nom du blip
                                    AddTextComponentString(text_blips) -- ajoute le texte pour le nom du blip
                                    EndTextCommandSetBlipName(blip) -- enregistre le nom du blip


                                    TriggerServerEvent("envoieblips",numero_blips, coords_joueur, text_blips)
                                    return result
                                else
                                    Wait(500)
                                    blockInput = false
                                    return nil
                                end
                    
                                return result
                            else
                                Wait(500)
                                blockInput = false
                                return nil
                            end
                        end
                    })
                        
                    RageUI.Button("Tp-menu", "Ouvrir le menu tp", {RightLabel = "→→"}, true, {},Menu_tp)
                    RageUI.Button("Item menu", "Ouvrir le menu des item", {RightLabel = "→→"}, true, {},Item)
                    
                    RageUI.List("Gps :", {"Aéroport", "Ballas", "F4l", "Vagos"}, marqueur.gps, nil, {}, true, {
                        onListChange = function(list) marqueur.gps = list end,
                        onSelected = function(list)

                            if list == 1 then 
                                local X, Y, Z = -1035.6, -2735.7, 13.75
                                SetNewWaypoint(X,Y)
                            end
                            if list == 2 then 
                                local X, Y, Z = 100.40, -1938.61, 20.56
                                SetNewWaypoint(X,Y)
                            end
                            if list == 3 then 
                                local X, Y, Z = -180.40, -1674.37, 33.08
                                SetNewWaypoint(X,Y)
                            end 
                            if list == 4 then 
                                local X, Y, Z = 319.93, -2023.30, 20.71
                                SetNewWaypoint(X,Y)
                            end
                        end
                    })

                end)          

                RageUI.IsVisible(Menu_tp, function()

                    for k,v in pairs (lemenu_tp) do 

                        RageUI.Button(""..v[1].."", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()

                              local tpCoords = {x = v[2], y = v[3], z = v[4]}
                              RequestCollisionAtCoord(tpCoords.x, tpCoords.y, tpCoords.z)

                                while not HasCollisionLoadedAroundEntity(PlayerPedId()) do
                                    RequestCollisionAtCoord(tpCoords.x, tpCoords.y, tpCoords.z)
                                    Citizen.Wait(0)
                                end

                              local playerPed = PlayerPedId()
                              local vehicle = GetVehiclePedIsIn(playerPed, false)

                              if vehicle ~= 0 then
                                SetEntityCoords(vehicle, tpCoords.x, tpCoords.y, tpCoords.z)
                                SetEntityHeading(vehicle, 90.0)
                                
                              else
                                SetEntityCoords(playerPed, tpCoords.x, tpCoords.y, tpCoords.z)
                                SetEntityHeading(playerPed, 90.0)
                              end
                            end
                        })
                    end
                end)
                
                RageUI.IsVisible(Item, function()

                    for k,v in pairs (item.name) do 
                        RageUI.Button(''..v[1]..'', nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                AddTextEntry('FMMC_MPM_NA', "Combien d'item "..v[1].." voulez vous ?")
                                DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)
                                while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                                  Citizen.Wait(0)
                                end
                                local number = GetOnscreenKeyboardResult()
                                ExecuteCommand("giveitem".." ".. "me".." "..v[2].." ".. number)
                            end
                        })
                    end
                end)

                RageUI.IsVisible(Menu_dev, function()

                    RageUI.Button('Menu cut-scene', nil, {RightLabel = "→→"}, true, {},Menu_cutscene)

                    RageUI.Button("Fermer le menu", "Si vous appuyer sur ce bouton le menu se fermera pour tout les joueur !", {}, true, {
                        onSelected = function()

                            AddTextEntry('FMMC_KEY_TIP1', "Entrez 'oui' pour fermer le menu : ")
                            DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", "", "", "", "", 30)

                            local blockI = true

                            while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                                Citizen.Wait(0)
                            end

                            if UpdateOnscreenKeyboard() ~= 2 then
                                local fermemenu = GetOnscreenKeyboardResult()
                                Wait(100)
                                blockI = false

                                if fermemenu == "oui" or fermemenu == "OUI" or fermemenu == "Oui"  then 
                                    TriggerServerEvent("MenuFerme")
                                else 
                                    return
                                end 
                                
                                return result
                            else
                                Wait(500)
                                blockIn = false
                                return nil
                            end 
                        end
                    })
                end)

                RageUI.IsVisible(Menu_cutscene,function()

                    for k,v in pairs (cutscene) do 
                        RageUI.Button(''..v[1]..'', nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
    
                                local player = PlayerPedId()
                                RequestCutscene(v[2], 8)
                                RequestStreamedTextureDict(v[2], true)
                                while not HasCutsceneLoaded() do Wait(30) end
                                --GetEntityIndexOfCutsceneEntity('MP_Female_Character', GetHashKey(GetEntityModel('MP_Female_Character')))
                                NewLoadSceneStartSphere(-1212.79, -1673.52, 7, 1000, 0)
                                cut = StartCutscene(v[2])
                                
                            end
                        })
                    end

                    RageUI.line()

                    RageUI.Button("Stoper une cut scene", nil, {RightLabel = "→→"}, true, {
                        StopCutscene(cut)
                    })
                end)

                RageUI.IsVisible(Menu_money, function()

                    RageUI.Separator("Ne Pas Utiliser Dans ~r~L'abus Merci ~s~!")
                    RageUI.line()

                    RageUI.Checkbox("→→ Je déclare de ne pas abussé", nil, checkbox13, {}, { 
                    
                        onChecked = function()
                            checkbox13 = true 
                            check = true
                            
                        end,
                        onUnChecked = function() 
                            checkbox13 = false
                            check = false
                            
                        end,
                        onSelected = function(index) 
                            checkbox13 = index 
                        end
                    })
                    
                    RageUI.Button('Give money', "Tous abus sera sanctionner (Tous les give son vue dans la BDD)", {RightLabel = "→→"}, check, {
                        onSelected = function()
                            AddTextEntry('FMMC_KEY_TIP1', "Quelle somme voulez vous ?")
                            DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", "", "", "", "", 30)

                            local blockIn = true

                            while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                                Citizen.Wait(0)
                            end

                            if UpdateOnscreenKeyboard() ~= 2 then

                                local money = GetOnscreenKeyboardResult()
                                Wait(100)
                                blockIn = false
                                ExecuteCommand('giveitem'..' '..'me'..' '..'money'..' '..money)

                                if notification then
                                    ESX.ShowAdvancedNotification("Notification","Menu Admin", "Tu vient de te give : ".. "~g~"..money.." $", "CHAR_MP_FM_CONTACT", 1)
                                else 
                                    return
                                end 
                                TriggerServerEvent("NameBasseDeDonne", money)

                                if tonumber(money) > 1000000 then
                                    ESX.ShowAdvancedNotification("Notification","Menu Admin", "Tu vient de te give trop d'argent nous avons averti votre give d'argent de : ~r~"..money.." $ ~s~ qui sera reporté au fondateur est enregistré en base de donné (nous vous bloquons l'acès au menu admin)!!", "CHAR_MP_FM_CONTACT", 1)
                                    RageUI.CloseAll()
                                    TriggerServerEvent("giveAbussé",money)
                                end

                                return result
                            else
                                Wait(500)
                                blockIn = false
                                return nil
                            end 
                        end
                    })

                    RageUI.Button('Give argent sale', "Tous abus sera sanctionner (Tous les give son vue dans la BDD)", {RightLabel = "→→"}, check, {
                        onSelected = function()

                            AddTextEntry('FMMC_KEY_TIP1', "Quelle somme voulez vous ?")
                            DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", "", "", "", "", 30)

                            local blockI = true

                            while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                                Citizen.Wait(0)
                            end

                            if UpdateOnscreenKeyboard() ~= 2 then
                                local blackMoney = GetOnscreenKeyboardResult()
                                Wait(100)
                                blockI = false
                                ExecuteCommand('giveitem'..' '..'me'..' '..'black_money'..' '..blackMoney)

                                if notification then
                                    ESX.ShowAdvancedNotification("Notification","Menu Admin", "Tu vient de te give : ".. "~g~"..blackMoney.." $".." ~s~".."En argent sale", "CHAR_MP_FM_CONTACT", 1)
                                else 
                                    return
                                end 

                                TriggerServerEvent("MoneyBlack", blackMoney)

                                return result
                            else
                                Wait(500)
                                blockIn = false
                                return nil
                            end 
                        end
                    })

                    RageUI.Button("Se retirer de l'argent", "Tous abus sera sanctionner (Tous les give son vue dans la BDD)", {RightLabel = "→→"}, check, {
                        onSelected = function()

                            AddTextEntry('FMMC_KEY_TIP1', "Quelle somme voulez vous retirer ?")
                            DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", "", "", "", "", 30)

                            local blockl = true

                            while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                                Citizen.Wait(0)
                            end

                            if UpdateOnscreenKeyboard() ~= 2 then
                                local money = GetOnscreenKeyboardResult()
                                Wait(100)
                                blockl = false
                                ExecuteCommand('removeitem'..' '..'me'..' '..'money'..' '..money)

                                if notification then
                                    ESX.ShowAdvancedNotification("Notification","Menu Admin", "Tu vient de te retirer : ".."~r~"..money.." $".." ~s~", "CHAR_MP_FM_CONTACT", 1)
                                else 
                                    return
                                end 

                                return result
                            else
                                Wait(500)
                                blockIn = false
                                return nil
                            end 
                        end
                    })

                    RageUI.Button("Se retirer de l'argent sale", "Tous abus sera sanctionner (Tous les give son vue dans la BDD)", {RightLabel = "→→"}, check, {
                        onSelected = function()

                            AddTextEntry('FMMC_KEY_TIP1', "Quelle somme voulez vous retirer ?")
                            DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", "", "", "", "", 30)

                            local blockle = true

                            while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                                Citizen.Wait(0)
                            end

                            if UpdateOnscreenKeyboard() ~= 2 then
                                local money = GetOnscreenKeyboardResult()
                                Wait(100)
                                blockle = false
                                ExecuteCommand('removeitem'..' '..'me'..' '..'black_money'..' '..money)

                                if notification then
                                    ESX.ShowAdvancedNotification("Notification","Menu Admin", "Tu vient de te retirer : ".."~r~"..money.." $".." ~s~".."d'argent sale", "CHAR_MP_FM_CONTACT", 1)
                                else 
                                    return
                                end 

                                return result
                            else
                                Wait(500)
                                blockIn = false
                                return nil
                            end 
                        end
                    })
                end)

                RageUI.IsVisible(Menu_props, function()

                    RageUI.Checkbox("→→ Bloquer le props", nil, propsfreeze, {}, { 
                    
                        onChecked = function()
                            propsfreeze = true 
                        end,
                        onUnChecked = function() 
                            propsfreeze = false
                        end,
                        onSelected = function(index) 
                            propsfreeze = index 
                        end
                    })

                    for k,v in pairs (props_menu) do
                        RageUI.Button(v.name, v.description, {RightLabel = v.style}, true, {
                            onSelected = function()

                                player = PlayerPedId()
                                model = GetHashKey(v.props)
                                RequestModel(model)
                                while not HasModelLoaded(model) do 
                                    Wait(0)
                                end
                                local coords = GetEntityCoords(player) 
                                angle = GetEntityHeading(player)
                                entity = CreateObject(model, coords.x, coords.y, coords.z,angle, true, true, true)
                                SetEntityRotation(entity, angle, false)
                                SetModelAsNoLongerNeeded(model)
                                SetEntityHeading(entity,angle)
                                PlaceObjectOnGroundProperly(entity)

                                if propsfreeze then 
                                    FreezeEntityPosition(entity, true)
                                else 
                                    return 
                                end

                                if notification then 
                                    ESX.ShowAdvancedNotification("Notification","Menu Admin","Vous venez de mettre le props : "..v.notif, "CHAR_MP_FM_CONTACT", 1)
                                end
                            end
                        })
                    end
                end)
            end 
        end)
    end 
end 

function getBaseSkin()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        isMale = skin.sex == 0
        TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
                TriggerEvent('esx:restoreLoadout')
            end)
        end)
    end)
end

RegisterNetEvent("fermemenu")
AddEventHandler("fermemenu", function()
    RageUI.CloseAll()
end) 


RegisterNetEvent("recu")
AddEventHandler("recu", function(player)
    Citizen.CreateThread(function()
        while true do 
            Wait(100)
            local coords = GetEntityCoords(PlayerPedId())
            CreateFakeMpGamerTag(PlayerPedId(), coords, true, true, true, true)        
        end
    end)
end)

RegisterNetEvent("recepetion:notif")
AddEventHandler("recepetion:notif", function(notif)
    ESX.ShowAdvancedNotification("Notification","Menu Admin",notif, "CHAR_MP_FM_CONTACT", 1)
end)

RegisterCommand("animfixe",function()
    Config = {}
    Config.DrinkName = "prop_energy_drink"
    local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
    local prop = CreateObject(GetHashKey(Config.DrinkName), x, y, z + 0.2, true, true, true)
    local boneIndex = GetPedBoneIndex(PlayerPedId(), 28422)
    AttachEntityToEntity(prop, PlayerPedId(), boneIndex, 0.12, 0.028, 0.001, 10.0, 15.0, 0.0, true, true, false, true, 1, true)
end)

