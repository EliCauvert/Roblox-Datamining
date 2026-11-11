local SongDetailRodux = script:FindFirstAncestor("SongDetailRodux")
local AddSongExperiencesModule = require(SongDetailRodux.Actions.AddSongExperiences)
local CryoModule = require(SongDetailRodux.Parent.Cryo)

return {
	key = "SongExperiencesKey",
	reducer = function(p1, p2)
		-- upvalues: AddSongExperiencesModule (copy), CryoModule (copy)
		local P0 = p1 or {}
		assert(P0, "")
		
		if p2 and p2.type == AddSongExperiencesModule.name then
			P0 = CryoModule.Dictionary.join(P0, p2.songExperiences)
		end
		return P0
	end
}