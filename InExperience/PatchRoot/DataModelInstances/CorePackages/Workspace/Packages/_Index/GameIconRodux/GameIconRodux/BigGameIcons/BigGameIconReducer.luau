local gameIconRodux = script:FindFirstAncestor("GameIconRodux")
local cryoModule = require(gameIconRodux.Parent.Cryo)
local setBigGameIconsModule = require(gameIconRodux.BigGameIcons.SetBigGameIcons)

return {
	key = "BigGameIconsKey",
	reducer = function(p1, p2)
		-- upvalues: setBigGameIconsModule (ref), cryoModule (ref)
		p1 = p1 or {}
		
		if p2.type == setBigGameIconsModule.name then
			p1 = cryoModule.Dictionary.join(p1, p2.gameIcons)
		end
		return p1
	end
}