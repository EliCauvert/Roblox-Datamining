local GameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local Immutable = require(GameDetailRodux.Parent.AppCommonLib).Immutable
local AddGameDetailsV2Module = require(GameDetailRodux.GameDetails.AddGameDetailsV2)

return function(p1, p2) --[[ Line: 9 ]]
	-- upvalues: AddGameDetailsV2Module (copy), Immutable (copy)
	local P0 = p1 or {}
	
	if p2.type == AddGameDetailsV2Module.name then
		P0 = Immutable.JoinDictionaries(P0, p2.gameDetails)
	end
	return P0
end