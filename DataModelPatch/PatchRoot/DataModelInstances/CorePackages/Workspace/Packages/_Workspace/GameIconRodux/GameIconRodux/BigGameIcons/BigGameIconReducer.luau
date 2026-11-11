local GameIconRodux = script:FindFirstAncestor("GameIconRodux")
local CryoModule = require(GameIconRodux.Parent.Cryo)
local SetBigGameIconsModule = require(GameIconRodux.BigGameIcons.SetBigGameIcons)

return {
	key = "BigGameIconsKey",
	reducer = function(p1, p2)
		-- upvalues: SetBigGameIconsModule (copy), CryoModule (copy)
		local P0 = p1 or {}
		
		if p2.type == SetBigGameIconsModule.name then
			P0 = CryoModule.Dictionary.join(P0, p2.gameIcons)
		end
		return P0
	end
}