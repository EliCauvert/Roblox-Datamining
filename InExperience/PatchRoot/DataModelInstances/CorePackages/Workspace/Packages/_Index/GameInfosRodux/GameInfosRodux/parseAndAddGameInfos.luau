local gameInfosRodux = script:FindFirstAncestor("GameInfosRodux")
local gameInfosReducerModule = require(gameInfosRodux.GameInfosReducer)
local addGamesModule = require(gameInfosRodux.AddGames)
local syncGameInfosToStoreModule = require(gameInfosRodux.syncGameInfosToStore)
local parent = gameInfosRodux.Parent
local tutilsModule = require(parent.tutils)
local apiFetchGameIcons = require(parent.GameIconRodux).GameIcons.ApiFetchGameIcons
local dataHydrationModule = require(parent.DataHydration)
local _ = require(parent.DiscoveryTypes)
local fFlagLuaAppReduceGameIconFetches = require(parent.SharedFlags).FFlagLuaAppReduceGameIconFetches
local fFlagMigrateGameIconsToStore = require(parent.SharedFlags).FFlagMigrateGameIconsToStore
local fFlagMigrateGameInfoToStore = require(parent.SharedFlags).FFlagMigrateGameInfoToStore

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: gameInfosReducerModule (ref), fFlagMigrateGameInfoToStore (ref), tutilsModule (ref), fFlagLuaAppReduceGameIconFetches (ref), addGamesModule (ref), syncGameInfosToStoreModule (ref), fFlagMigrateGameIconsToStore (ref), dataHydrationModule (ref), apiFetchGameIcons (ref)
	local key = p2:getState().Personalization[gameInfosReducerModule.key]
	local t = {}
	local t_1 = {}
	local var1 = if fFlagMigrateGameInfoToStore then {} else nil
	
	for i, v in p3 do
		p4(v):match(function(p7)
			-- upvalues: fFlagMigrateGameInfoToStore (copy), var1 (ref), tutilsModule (copy), key (ref), t (ref), fFlagLuaAppReduceGameIconFetches (copy), p6 (ref), t_1 (ref), p5 (ref), v (ref)
			local universeId = p7.universeId
			
			if fFlagMigrateGameInfoToStore then
				var1[universeId] = p7
			end
			if not tutilsModule.shallowEqual(p7, key[universeId]) then
				t[universeId] = p7
				
				if not fFlagLuaAppReduceGameIconFetches or not p6 or p6(universeId) then
					table.insert(t_1, universeId)
				end
			end
			if p5 then
				p5(v, p7)
			end
		end):matchError(function(p7)
			warn(`parseAndAddGameInfos could not parse gameInfo: {p7}`)
		end)
	end
	if next(t) then
		p2:dispatch(addGamesModule(t))
	end
	if fFlagMigrateGameInfoToStore and next(var1) then
		syncGameInfosToStoreModule(var1)
	end
	if #t_1 > 0 then
		if fFlagMigrateGameIconsToStore then
			dataHydrationModule.Game.getGameIconStore(false).getAndFetchGameIcons(t_1)
			
			return
		end
		p2:dispatch(apiFetchGameIcons(p1, t_1))
	end
end