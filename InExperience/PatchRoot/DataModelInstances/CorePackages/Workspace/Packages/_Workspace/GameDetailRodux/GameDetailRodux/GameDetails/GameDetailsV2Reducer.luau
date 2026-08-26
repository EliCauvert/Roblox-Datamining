local gameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local immutable = require(gameDetailRodux.Parent.AppCommonLib).Immutable
local addGameDetailsV2Module = require(gameDetailRodux.GameDetails.AddGameDetailsV2)

return function(p1, p2)
	-- upvalues: addGameDetailsV2Module (ref), immutable (ref)
	p1 = p1 or {}
	
	if p2.type == addGameDetailsV2Module.name then
		p1 = immutable.JoinDictionaries(p1, p2.gameDetails)
	end
	return p1
end