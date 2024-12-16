local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local Utility = ServerScriptService.Utility
local morph = require(Utility.morph)
local getPlayerStats = require(Utility.getPlayerStats)
local clearPlayerStats = require(Utility.clearPlayerStats)

local PlayerStatsTemplate = ReplicatedStorage.PlayerStats

function initStats(player: Player)
    local playerStats = PlayerStatsTemplate:Clone()
    playerStats.Parent = player
end

function onPlayerAdded(player: Player)
    initStats(player)
    player.CharacterAdded:Connect(function(character: Model)
        clearPlayerStats(player)
        morph(player)
    end)
end

function onPlayerRemoving(player: Player)

end

function setup()
    Players.PlayerAdded:Connect(onPlayerAdded)
    Players.PlayerRemoving:Connect(onPlayerRemoving)
end

function init()
    setup()
end

return {
    init = init,
}