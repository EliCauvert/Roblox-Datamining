local gameInfosRodux = script:FindFirstAncestor("GameInfosRodux")
local gameInfosReducerModule = require(gameInfosRodux.GameInfosReducer)
local addGamesModule = require(gameInfosRodux.AddGames)
local syncGameInfosToStoreModule = require(gameInfosRodux.syncGameInfosToStore)
local parent = gameInfosRodux.Parent
local tutilsModule = require(parent.tutils)
local dataHydrationModule = require(parent.DataHydration)
local _ = require(parent.DiscoveryTypes)
local fFlagMigrateGameInfoToStore = require(parent.SharedFlags).FFlagMigrateGameInfoToStore

return function(_, p1, p2, p3, p4, p5)
	-- upvalues: gameInfosReducerModule (ref), fFlagMigrateGameInfoToStore (ref), tutilsModule (ref), addGamesModule (ref), syncGameInfosToStoreModule (ref), dataHydrationModule (ref)
	local key = p1:getState().Personalization[gameInfosReducerModule.key]
	local t = {}
	local t_1 = {}
	local var1 = if fFlagMigrateGameInfoToStore then {} else nil
	
	for i, v in p2 do
		p3(v):match(function(p6)
			-- upvalues: fFlagMigrateGameInfoToStore (copy), var1 (ref), tutilsModule (copy), key (ref), t (ref), p5 (ref), t_1 (ref), p4 (ref), v (ref)
			local universeId = p6.universeId
			
			if fFlagMigrateGameInfoToStore then
				var1[universeId] = p6
			end
			if not tutilsModule.shallowEqual(p6, key[universeId]) then
				t[universeId] = p6
				
				if not p5 or p5(universeId) then
					table.insert(t_1, universeId)
				end
			end
			if p4 then
				p4(v, p6)
			end
		end):matchError(function(p6)
			warn(`parseAndAddGameInfos could not parse gameInfo: {p6}`)
		end)
	end
	if next(t) then
		p1:dispatch(addGamesModule(t))
	end
	if fFlagMigrateGameInfoToStore and next(var1) then
		syncGameInfosToStoreModule(var1)
	end
	if #t_1 > 0 then
		dataHydrationModule.Game.getGameIconStore(false).getAndFetchGameIcons(t_1)
	end
end