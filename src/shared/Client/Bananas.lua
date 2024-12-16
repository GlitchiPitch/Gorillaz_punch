local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Events = ReplicatedStorage.Events

local Constants = require(ReplicatedStorage.Constants)

local player = Players.LocalPlayer
local pickupRemote = Events.PickupRemote

function onBananaAdded(banana: Model)
    local primary = banana.PrimaryPart
    primary.Touched:Connect(function(hit: BasePart)
        local hitPlayer = Players:GetPlayerFromCharacter(hit.Parent)
        if hitPlayer and hitPlayer == player then
            pickupRemote:FireServer(banana)
        end
    end)
end

function setup()
    for _, banana in CollectionService:GetTagged(Constants.BANANA_TAG) do
        onBananaAdded(banana)
    end
    CollectionService:GetInstanceAddedSignal(Constants.BANANA_TAG):Connect(function(banana: Model)
        onBananaAdded(banana)
    end)
end

function init()
    setup()
end

return {
    init = init,
}