local gameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local immutable = require(gameDetailRodux.Parent.AppCommonLib).Immutable
local addGameDetailsModule = require(gameDetailRodux.GameDetails.AddGameDetails)

return function(p0, p1) --[[ line: 8 ]]
	-- upvalues: addGameDetailsModule (ref), immutable (ref)
	p0 = p0 or {}
	
	if p1.type == addGameDetailsModule.name then
		p0 = immutable.JoinDictionaries(p0, p1.gameDetails)
	end
	return p0
end