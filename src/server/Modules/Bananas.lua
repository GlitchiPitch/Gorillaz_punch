local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage.Events
local Utility = ReplicatedStorage.Utility

local Constants = require(ReplicatedStorage.Constants)
local getPlayerStats = require(Utility.getPlayerStats)

local pickupRemote = Events.PickupRemote :: RemoteEvent

function pickupRemoteConnect(player: Player, banana: Model)
    banana:Destroy()
    local playerStats = getPlayerStats(player)
    local playerSize = player.Character:GetScale()
    playerStats.Bananas.Value += 1
    playerStats.Power.Value += Constants.BASIC_DAMAGE
    playerSize += Constants.BASIC_INCREASE_SIZE
    player.Character:ScaleTo(playerSize)
end

function setup()
    pickupRemote.OnServerEvent:Connect(pickupRemoteConnect)
end

function init()
    setup()
end

return {
    init = init,
}