local moprhTemplate: Model

function morphPlayer(player: Player)
    local character = player.Character
    if character then
        local morph = moprhTemplate:Clone()
        player.Character = morph
        morph.Parent = workspace
    end
end

return morphPlayer