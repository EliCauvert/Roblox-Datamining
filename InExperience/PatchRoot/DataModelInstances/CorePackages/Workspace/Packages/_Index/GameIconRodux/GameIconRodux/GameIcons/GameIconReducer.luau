local gameIconRodux = script:FindFirstAncestor("GameIconRodux")
local cryoModule = require(gameIconRodux.Parent.Cryo)
local setGameIconsModule = require(gameIconRodux.GameIcons.SetGameIcons)

return {
	key = "GameIconsKey",
	reducer = function(p0, p1)
		-- upvalues: setGameIconsModule (ref), cryoModule (ref)
		p0 = p0 or {}
		
		if p1.type == setGameIconsModule.name then
			p0 = cryoModule.Dictionary.join(p0, p1.gameIcons)
		end
		return p0
	end
}