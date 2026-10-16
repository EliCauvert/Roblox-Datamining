local GameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local Immutable = require(GameDetailRodux.Parent.AppCommonLib).Immutable
local AddGameDetailsModule = require(GameDetailRodux.GameDetails.AddGameDetails)
local SetGameDetailErrorModule = require(GameDetailRodux.GameDetails.SetGameDetailError)

return function(p1, p2) --[[ Line: 8 ]]
	-- upvalues: SetGameDetailErrorModule (copy), Immutable (copy), AddGameDetailsModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetGameDetailErrorModule.name then
		P0 = Immutable.Set(P0, p2.universeId, { errorType = p2.errorType })
		
		return P0
	end
	if p2.type == AddGameDetailsModule.name then
		if not next(P0) then
			return P0
		end
		for i, _ in pairs(p2.gameDetails) do
			if P0[i] then
				P0 = Immutable.RemoveFromDictionary(P0, i)
			end
		end
	end
	return P0
end