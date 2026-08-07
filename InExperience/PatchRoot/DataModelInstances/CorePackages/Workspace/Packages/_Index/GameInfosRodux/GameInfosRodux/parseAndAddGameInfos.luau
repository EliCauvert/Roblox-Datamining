local gameInfosRodux = script:FindFirstAncestor("GameInfosRodux")
local gameInfosReducerModule = require(gameInfosRodux.GameInfosReducer)
local addGamesModule = require(gameInfosRodux.AddGames)
local parent = gameInfosRodux.Parent
local tutilsModule = require(parent.tutils)
local apiFetchGameIcons = require(parent.GameIconRodux).GameIcons.ApiFetchGameIcons
local _ = require(parent.DiscoveryTypes)
local fFlagLuaAppReduceGameIconFetches = require(parent.SharedFlags).FFlagLuaAppReduceGameIconFetches

return function(p0, p1, p2, p3, p4, p5) --[[ line: 11 | named "parseAndAddGameInfos" ]]
	-- upvalues: gameInfosReducerModule (ref), tutilsModule (ref), fFlagLuaAppReduceGameIconFetches (ref), addGamesModule (ref), apiFetchGameIcons (ref)
	local key = p1:getState().Personalization[gameInfosReducerModule.key]
	local t = {}
	local t_1 = {}
	
	for i, v in p2 do
		p3(v):match(function(p7) --[[ line: 27 ]]
			-- upvalues: tutilsModule (copy), key (ref), t (ref), fFlagLuaAppReduceGameIconFetches (copy), p5 (ref), t_1 (ref), p4 (ref), v (ref)
			local universeId = p7.universeId
			
			if not tutilsModule.shallowEqual(p7, key[universeId]) then
				t[universeId] = p7
				
				if not fFlagLuaAppReduceGameIconFetches or not p5 or p5(universeId) then
					table.insert(t_1, universeId)
				end
			end
			if p4 then
				p4(v, p7)
			end
		end):matchError(function(p6) --[[ line: 46 ]]
			warn(`parseAndAddGameInfos could not parse gameInfo: {p6}`)
		end)
	end
	if next(t) then
		p1:dispatch(addGamesModule(t))
	end
	if #t_1 > 0 then
		p1:dispatch(apiFetchGameIcons(p0, t_1))
	end
end