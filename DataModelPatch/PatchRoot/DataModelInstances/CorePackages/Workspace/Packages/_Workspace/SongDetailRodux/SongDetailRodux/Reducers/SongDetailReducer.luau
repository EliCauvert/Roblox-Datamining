local SongDetailRodux = script:FindFirstAncestor("SongDetailRodux")
local Parent = SongDetailRodux.Parent
local AddSongDetailModule = require(SongDetailRodux.Actions.AddSongDetail)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.DiscoveryTypes)

return {
	key = "SongDetailKey",
	reducer = function(p1, p2)
		-- upvalues: AddSongDetailModule (copy), CryoModule (copy)
		local P0 = p1 or {}
		assert(P0, "")
		
		if p2 and p2.type == AddSongDetailModule.name then
			local JoinResults = {}
			
			for i, _ in pairs(p2.songDetail) do
				if P0[i] then
					JoinResults[i] = CryoModule.Dictionary.join(P0[i], p2.songDetail[i])
				else
					JoinResults[i] = p2.songDetail[i]
				end
			end
			P0 = CryoModule.Dictionary.join(P0, JoinResults)
		end
		return P0
	end
}