local gameIconRodux = script:FindFirstAncestor("GameIconRodux")
local cryoModule = require(gameIconRodux.Parent.Cryo)
local setGameIconsModule = require(gameIconRodux.GameIcons.SetGameIcons)

return {
	key = "GameIconsKey",
	reducer = function(p1, p2)
		-- upvalues: setGameIconsModule (ref), cryoModule (ref)
		p1 = p1 or {}
		
		if p2.type == setGameIconsModule.name then
			p1 = cryoModule.Dictionary.join(p1, p2.gameIcons)
		end
		return p1
	end
}