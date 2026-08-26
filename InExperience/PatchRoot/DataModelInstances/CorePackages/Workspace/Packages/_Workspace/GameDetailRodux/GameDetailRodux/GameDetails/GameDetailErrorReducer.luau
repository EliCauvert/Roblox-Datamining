local gameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local immutable = require(gameDetailRodux.Parent.AppCommonLib).Immutable
local addGameDetailsModule = require(gameDetailRodux.GameDetails.AddGameDetails)
local setGameDetailErrorModule = require(gameDetailRodux.GameDetails.SetGameDetailError)

return function(p1, p2)
	-- upvalues: setGameDetailErrorModule (ref), immutable (ref), addGameDetailsModule (ref)
	p1 = p1 or {}
	
	if p2.type == setGameDetailErrorModule.name then
		p1 = immutable.Set(p1, p2.universeId, { errorType = p2.errorType })
		
		return p1
	elseif p2.type == addGameDetailsModule.name then
		if not next(p1) then
			return p1
		end
		for i, v in pairs(p2.gameDetails) do
			if p1[i] then
				p1 = immutable.RemoveFromDictionary(p1, i)
			end
		end
	end
	return p1
end