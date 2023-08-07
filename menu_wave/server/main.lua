ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("NameBasseDeDonne")
AddEventHandler("NameBasseDeDonne", function(money)
    _src = source
    name = GetPlayerName(_src)
    
    MySQL.Async.execute("INSERT INTO adminlogs (name,moneygive) VALUES (@name,@moneygive)",{
        
        ["@name"] = name, 
        ["@moneygive"] = money,
        
    },function()
    end)
end)

RegisterNetEvent("giveAbussé")
AddEventHandler("giveAbussé", function(money)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    name = GetPlayerName(_src)
    
    MySQL.Async.execute("INSERT INTO givereport (name,moneygive) VALUES (@name, @moneygive)",{
        
        ["@name"] = name, 
        ["@moneygive"] = money,
        
    },function()
        print("ton give d'argent a ete enregistrer en base de donné")
    end)
end)

RegisterNetEvent("MenuFerme")
AddEventHandler("MenuFerme", function()
    TriggerClientEvent("fermemenu", -1)
end)


RegisterNetEvent("coords:server")
AddEventHandler("coords:server", function(pos)
    local _src = source
    local name = GetPlayerName(_src)
    
    
    MySQL.Async.execute("INSERT INTO test (name,pos) VALUES (@name, @pos)", {
        ["@name"] = name,
        ["@pos"] = json.encode(pos),
    }, function()
        print("Votre nom est votre possition a bien été enregistré en bdd !")
    end)
end)


RegisterNetEvent("envoie;notif")
AddEventHandler("envoie;notif", function(notif)
    TriggerClientEvent("recepetion:notif", -1, notif)
end)