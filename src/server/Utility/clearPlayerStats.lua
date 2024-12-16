local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Utility = script.Parent
local getPlayerStats = require(Utility.getPlayerStats)
local PlayerStats = ReplicatedStorage.PlayerStats

function clearPlayerStats(player: Player)
    local playerStats = getPlayerStats(player)
    playerStats.Power.Value = PlayerStats.Power.Value 
end

return clearPlayerStats