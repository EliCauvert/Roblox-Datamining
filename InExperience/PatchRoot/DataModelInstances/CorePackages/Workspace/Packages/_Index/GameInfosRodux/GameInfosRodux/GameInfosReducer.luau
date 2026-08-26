local parent = script:FindFirstAncestor("GameInfosRodux").Parent
local addGamesModule = require(script.Parent.AddGames)
local cryoModule = require(parent.Cryo)
local _ = require(parent.DiscoveryTypes)

local function getMergedState(p1, p2)
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i, v in pairs(p2) do
		if p1[i] then
			t[i] = cryoModule.Dictionary.join(p1[i], p2[i])
		else
			t[i] = p2[i]
		end
	end
	return cryoModule.Dictionary.join(p1, t)
end

return {
	key = "GameInfosKey",
	reducer = function(p3, p4)
		-- upvalues: addGamesModule (ref), getMergedState (ref)
		p3 = p3 or {}
		assert(p3, "")
		
		if p4.type == addGamesModule.name then
			p3 = getMergedState(p3, p4.games)
		end
		return p3
	end
}