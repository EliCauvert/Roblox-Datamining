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

return function(p0, p1, p2, p3, p4, p5) --[[ line: 15 | named "parseAndAddGameInfos" ]]
	-- upvalues: gameInfosReducerModule (ref), fFlagMigrateGameInfoToStore (ref), tutilsModule (ref), fFlagLuaAppReduceGameIconFetches (ref), addGamesModule (ref), syncGameInfosToStoreModule (ref), fFlagMigrateGameIconsToStore (ref), dataHydrationModule (ref), apiFetchGameIcons (ref)
	local key = p1:getState().Personalization[gameInfosReducerModule.key]
	local t = {}
	local t_1 = {}
	local var8 = if fFlagMigrateGameInfoToStore then {} else nil
	
	for i, v in p2 do
		p3(v):match(function(p7) --[[ line: 36 ]]
			-- upvalues: fFlagMigrateGameInfoToStore (copy), var8 (ref), tutilsModule (copy), key (ref), t (ref), fFlagLuaAppReduceGameIconFetches (copy), p5 (ref), t_1 (ref), p4 (ref), v (ref)
			local universeId = p7.universeId
			
			if fFlagMigrateGameInfoToStore then
				var8[universeId] = p7
			end
			if not tutilsModule.shallowEqual(p7, key[universeId]) then
				t[universeId] = p7
				
				if not fFlagLuaAppReduceGameIconFetches or not p5 or p5(universeId) then
					table.insert(t_1, universeId)
				end
			end
			if p4 then
				p4(v, p7)
			end
		end):matchError(function(p6) --[[ line: 59 ]]
			warn(`parseAndAddGameInfos could not parse gameInfo: {p6}`)
		end)
	end
	if next(t) then
		p1:dispatch(addGamesModule(t))
	end
	if fFlagMigrateGameInfoToStore and next(var8) then
		syncGameInfosToStoreModule(var8)
	end
	if #t_1 > 0 then
		if fFlagMigrateGameIconsToStore then
			dataHydrationModule.Game.getGameIconStore(false).getAndFetchGameIcons(t_1)
			
			return
		end
		p1:dispatch(apiFetchGameIcons(p0, t_1))
	end
end