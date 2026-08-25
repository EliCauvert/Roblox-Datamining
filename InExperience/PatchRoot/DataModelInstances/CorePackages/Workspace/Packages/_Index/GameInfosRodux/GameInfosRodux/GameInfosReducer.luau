local parent = script:FindFirstAncestor("GameInfosRodux").Parent
local addGamesModule = require(script.Parent.AddGames)
local cryoModule = require(parent.Cryo)
local _ = require(parent.DiscoveryTypes)

local function getMergedState(p0, p1)
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i, v in pairs(p1) do
		if p0[i] then
			t[i] = cryoModule.Dictionary.join(p0[i], p1[i])
		else
			t[i] = p1[i]
		end
	end
	return cryoModule.Dictionary.join(p0, t)
end

return {
	key = "GameInfosKey",
	reducer = function(p2, p3)
		-- upvalues: addGamesModule (ref), getMergedState (ref)
		p2 = p2 or {}
		assert(p2, "")
		
		if p3.type == addGamesModule.name then
			p2 = getMergedState(p2, p3.games)
		end
		return p2
	end
}