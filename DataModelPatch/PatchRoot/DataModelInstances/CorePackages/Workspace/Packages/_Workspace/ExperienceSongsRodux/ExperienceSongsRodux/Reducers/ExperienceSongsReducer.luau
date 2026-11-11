local ExperienceSongsRodux = script:FindFirstAncestor("ExperienceSongsRodux")
local CryoModule = require(ExperienceSongsRodux.Parent.Cryo)
local AddExperienceSongsModule = require(ExperienceSongsRodux.Actions.AddExperienceSongs)

return {
	key = "ExperienceSongsKey",
	reducer = function(p1, p2)
		-- upvalues: AddExperienceSongsModule (copy), CryoModule (copy)
		local P0 = p1 or {}
		assert(P0, "")
		
		if p2 and p2.type == AddExperienceSongsModule.name then
			P0 = CryoModule.Dictionary.join(P0, p2.experienceSongs)
		end
		return P0
	end
}