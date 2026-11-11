local Parent = script:FindFirstAncestor("SongInfosRodux").Parent
local AddSongsModule = require(script.Parent.AddSongs)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.DiscoveryTypes)

return {
	key = "SongInfosKey",
	reducer = function(p1, p2)
		-- upvalues: AddSongsModule (copy), CryoModule (copy)
		local P0 = p1 or {}
		assert(P0, "")
		
		if p2 and p2.type == AddSongsModule.name then
			local JoinResults = {}
			
			for i, _ in pairs(p2.songs) do
				if P0[i] then
					JoinResults[i] = CryoModule.Dictionary.join(P0[i], p2.songs[i])
				else
					JoinResults[i] = p2.songs[i]
				end
			end
			P0 = CryoModule.Dictionary.join(P0, JoinResults)
		end
		return P0
	end
}