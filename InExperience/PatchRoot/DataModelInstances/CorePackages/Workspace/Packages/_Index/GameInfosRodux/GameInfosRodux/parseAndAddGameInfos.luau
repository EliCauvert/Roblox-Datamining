local GameInfosRodux = script:FindFirstAncestor("GameInfosRodux")
local GameInfosReducerModule = require(GameInfosRodux.GameInfosReducer)
local AddGamesModule = require(GameInfosRodux.AddGames)
local SyncGameInfosToStoreModule = require(GameInfosRodux.syncGameInfosToStore)
local Parent = GameInfosRodux.Parent
local TutilsModule = require(Parent.tutils)
local DataHydrationModule = require(Parent.DataHydration)
local _ = require(Parent.DiscoveryTypes)

return function(_, p1, List, Callback, Callback2, Callback1)
	-- upvalues: GameInfosReducerModule (copy), TutilsModule (copy), AddGamesModule (copy), SyncGameInfosToStoreModule (copy), DataHydrationModule (copy)
	local PersonalizationEntry = p1:getState().Personalization[GameInfosReducerModule.key]
	local t = {}
	local List1 = {}
	local t1 = {}
	
	for _, value in List do
		Callback(value):match(function(p2)
			-- upvalues: t1 (copy), TutilsModule (upval), PersonalizationEntry (copy), t (copy), Callback1 (copy), List1 (copy), Callback2 (copy), value (copy)
			local UniverseId = p2.universeId
			t1[UniverseId] = p2
			
			if not TutilsModule.shallowEqual(p2, PersonalizationEntry[UniverseId]) then
				t[UniverseId] = p2
				
				if not Callback1 or Callback1(UniverseId) then
					table.insert(List1, UniverseId)
				end
			end
			if Callback2 then
				Callback2(value, p2)
			end
		end):matchError(function(p2)
			warn(`parseAndAddGameInfos could not parse gameInfo: {p2}`)
		end)
	end
	if next(t) then
		p1:dispatch(AddGamesModule(t))
	end
	if next(t1) then
		SyncGameInfosToStoreModule(t1)
	end
	if #List1 > 0 then
		DataHydrationModule.Game.getGameIconStore(false).getAndFetchGameIcons(List1)
	end
end