local gameIconRodux = script:FindFirstAncestor("GameIconRodux")
local cryoModule = require(gameIconRodux.Parent.Cryo)
local setBigGameIconsModule = require(gameIconRodux.BigGameIcons.SetBigGameIcons)

return {
	key = "BigGameIconsKey",
	reducer = function(p0, p1) --[[ line: 7 ]]
		-- upvalues: setBigGameIconsModule (ref), cryoModule (ref)
		p0 = p0 or {}
		
		if p1.type == setBigGameIconsModule.name then
			p0 = cryoModule.Dictionary.join(p0, p1.gameIcons)
		end
		return p0
	end
}