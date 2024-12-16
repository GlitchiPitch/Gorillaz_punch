local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

local Events = ReplicatedStorage.Events
local punchRemote = Events.PunchRemote
-- move to assets in repl storage
local animation = Instance.new("Animation")
local attacking = false

local hitboxConnect: RBXScriptConnection
local inputConnect: RBXScriptConnection

function onInputBegan(input: InputObject, _)
    if input.KeyCode == Enum.KeyCode.MouseLeftButton then
        if player.Character and not attacking then
            -- animation
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            local animator = humanoid:FindFirstChildOfClass("Animator")
            local animTrack = animator:LoadAnimation(animation)
            attacking = true
            animTrack:Play()
            task.wait(animTrack.Length)
            attacking = false
        end
    end
end

function setup()
    local hitbox = player.Character:FindFirstChild("Hitbox") :: Part

    inputConnect = UserInputService.InputBegan:Connect(onInputBegan)
    hitboxConnect = hitbox.Touched:Connect(function(hit: BasePart)
        if not attacking then return end
        local hitPlayer = Players:GetPlayerFromCharacter(hit.Parent)
        if hitPlayer and hitPlayer ~= player then
            punchRemote:FireServer(hitPlayer)
        end
    end)
end

function disconnect()
    if inputConnect and inputConnect.Connected then
        inputConnect:Disconnect()
    end
    if hitboxConnect and hitboxConnect.Connected then 
        hitboxConnect:Disconnect() 
    end
end

return {
    setup = setup,
    disconnect = disconnect,
}