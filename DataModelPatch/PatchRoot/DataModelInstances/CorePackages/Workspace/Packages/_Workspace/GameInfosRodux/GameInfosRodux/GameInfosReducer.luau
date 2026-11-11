local Parent = script:FindFirstAncestor("GameInfosRodux").Parent
local AddGamesModule = require(script.Parent.AddGames)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.DiscoveryTypes)

local function getMergedState(p1, Games)
	-- upvalues: CryoModule (copy)
	local JoinResults = {}
	
	for i, _ in pairs(Games) do
		if p1[i] then
			JoinResults[i] = CryoModule.Dictionary.join(p1[i], Games[i])
		else
			JoinResults[i] = Games[i]
		end
	end
	return (CryoModule.Dictionary.join(p1, JoinResults))
end

return {
	key = "GameInfosKey",
	reducer = function(p2, p3)
		-- upvalues: AddGamesModule (copy), getMergedState (copy)
		local P2 = p2 or {}
		assert(P2, "")
		
		if p3.type == AddGamesModule.name then
			P2 = getMergedState(P2, p3.games)
		end
		return P2
	end
}