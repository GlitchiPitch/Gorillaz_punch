local Players = game:GetService("Players")
local player = Players.LocalPlayer

local Punch = require(script.Punch)
local Bananas = require(script.Bananas)
function setup()
    player.CharacterAdded:Connect(function(character: Model)
        Punch.setup()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        humanoid.Died:Connect(function()
            Punch.disconnect()
        end)
    end)
end

function init()
    Bananas.init()
    setup()
end

init()