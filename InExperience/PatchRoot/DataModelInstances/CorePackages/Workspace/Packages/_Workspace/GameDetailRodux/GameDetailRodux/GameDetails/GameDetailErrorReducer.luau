local gameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local immutable = require(gameDetailRodux.Parent.AppCommonLib).Immutable
local addGameDetailsModule = require(gameDetailRodux.GameDetails.AddGameDetails)
local setGameDetailErrorModule = require(gameDetailRodux.GameDetails.SetGameDetailError)

return function(p0, p1)
	-- upvalues: setGameDetailErrorModule (ref), immutable (ref), addGameDetailsModule (ref)
	p0 = p0 or {}
	
	if p1.type == setGameDetailErrorModule.name then
		p0 = immutable.Set(p0, p1.universeId, { errorType = p1.errorType })
		
		return p0
	elseif p1.type == addGameDetailsModule.name then
		if not next(p0) then
			return p0
		end
		for i, v in pairs(p1.gameDetails) do
			if p0[i] then
				p0 = immutable.RemoveFromDictionary(p0, i)
			end
		end
	end
	return p0
end