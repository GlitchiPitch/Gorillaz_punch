local Modules = script
local Player = require(Modules.Player)
local Bananas = require(Modules.Bananas)

function setup()
    
end

function init()
    Player.init()
    Bananas.init()
    setup()
end

return {
    init = init,
}