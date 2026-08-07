local gameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local immutable = require(gameDetailRodux.Parent.AppCommonLib).Immutable
local addGameDetailsV2Module = require(gameDetailRodux.GameDetails.AddGameDetailsV2)

return function(p0, p1) --[[ line: 9 ]]
	-- upvalues: addGameDetailsV2Module (ref), immutable (ref)
	p0 = p0 or {}
	
	if p1.type == addGameDetailsV2Module.name then
		p0 = immutable.JoinDictionaries(p0, p1.gameDetails)
	end
	return p0
end