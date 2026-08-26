local gameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local immutable = require(gameDetailRodux.Parent.AppCommonLib).Immutable
local addGameDetailsModule = require(gameDetailRodux.GameDetails.AddGameDetails)

return function(p1, p2)
	-- upvalues: addGameDetailsModule (ref), immutable (ref)
	p1 = p1 or {}
	
	if p2.type == addGameDetailsModule.name then
		p1 = immutable.JoinDictionaries(p1, p2.gameDetails)
	end
	return p1
end