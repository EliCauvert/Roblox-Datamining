local GameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local Immutable = require(GameDetailRodux.Parent.AppCommonLib).Immutable
local AddGameDetailsModule = require(GameDetailRodux.GameDetails.AddGameDetails)

return function(p1, p2)
	-- upvalues: AddGameDetailsModule (copy), Immutable (copy)
	local P0 = p1 or {}
	
	if p2.type == AddGameDetailsModule.name then
		P0 = Immutable.JoinDictionaries(P0, p2.gameDetails)
	end
	return P0
end