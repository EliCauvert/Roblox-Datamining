local GameIconRodux = script:FindFirstAncestor("GameIconRodux")
local CryoModule = require(GameIconRodux.Parent.Cryo)
local SetGameIconsModule = require(GameIconRodux.GameIcons.SetGameIcons)

return {
	key = "GameIconsKey",
	reducer = function(p1, p2)
		-- upvalues: SetGameIconsModule (copy), CryoModule (copy)
		local P0 = p1 or {}
		
		if p2.type == SetGameIconsModule.name then
			P0 = CryoModule.Dictionary.join(P0, p2.gameIcons)
		end
		return P0
	end
}