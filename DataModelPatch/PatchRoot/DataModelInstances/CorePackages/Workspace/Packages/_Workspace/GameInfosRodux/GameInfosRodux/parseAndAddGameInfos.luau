local GameInfosRodux = script:FindFirstAncestor("GameInfosRodux")
local GameInfosReducerModule = require(GameInfosRodux.GameInfosReducer)
local AddGamesModule = require(GameInfosRodux.AddGames)
local Parent = GameInfosRodux.Parent
local TutilsModule = require(Parent.tutils)
local ApiFetchGameIconsFunction = require(Parent.GameIconRodux).GameIcons.ApiFetchGameIcons
local _ = require(Parent.DiscoveryTypes)
local FFlagLuaAppReduceGameIconFetches = require(Parent.SharedFlags).FFlagLuaAppReduceGameIconFetches

return function(p1, p2, List, Callback, Callback2, Callback1)
	-- upvalues: GameInfosReducerModule (copy), TutilsModule (copy), FFlagLuaAppReduceGameIconFetches (copy), AddGamesModule (copy), ApiFetchGameIconsFunction (copy)
	local PersonalizationEntry = p2:getState().Personalization[GameInfosReducerModule.key]
	local t = {}
	local List1 = {}
	
	for _, value in List do
		Callback(value):match(function(p3)
			-- upvalues: TutilsModule (upval), PersonalizationEntry (copy), t (copy), FFlagLuaAppReduceGameIconFetches (upval), Callback1 (copy), List1 (copy), Callback2 (copy), value (copy)
			local UniverseId = p3.universeId
			
			if not TutilsModule.shallowEqual(p3, PersonalizationEntry[UniverseId]) then
				t[UniverseId] = p3
				
				if not FFlagLuaAppReduceGameIconFetches or not Callback1 or Callback1(UniverseId) then
					table.insert(List1, UniverseId)
				end
			end
			if Callback2 then
				Callback2(value, p3)
			end
		end):matchError(function(p3)
			warn(`parseAndAddGameInfos could not parse gameInfo: {p3}`)
		end)
	end
	if next(t) then
		p2:dispatch(AddGamesModule(t))
	end
	if #List1 > 0 then
		p2:dispatch(ApiFetchGameIconsFunction(p1, List1))
	end
end