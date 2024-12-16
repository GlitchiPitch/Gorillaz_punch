local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerStats = ReplicatedStorage.PlayerStats

function getPlayerStats(player: Player)
    local playerStats = player:FindFirstChild("PlayerStats") :: typeof(PlayerStats)
    return playerStats
end

return getPlayerStats