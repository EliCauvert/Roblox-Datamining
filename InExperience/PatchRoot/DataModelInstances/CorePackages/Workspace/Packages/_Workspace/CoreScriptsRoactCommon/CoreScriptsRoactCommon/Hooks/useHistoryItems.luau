local coreScriptsRoactCommon = script:FindFirstAncestor("CoreScriptsRoactCommon")
local parent = coreScriptsRoactCommon.Parent
local dataHydrationModule = require(parent.DataHydration)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local reactModule = require(parent.React)
local default = require(coreScriptsRoactCommon.Traversal.LocalTraversalHistory).default
local getGameInfoStore = dataHydrationModule.Game.getGameInfoStore
local getVotesStore = dataHydrationModule.Game.getVotesStore

local function getNMostRecentUniqueUniverseIds(p0, _) --[[ line: 24 ]]
	local t = {}
	local t_1 = {}
	
	for i, v in p0 do
		if not t_1[v] then
			t_1[v] = true
			table.insert(t, v)
		end
	end
	return t
end

local function _(p1, p2) --[[ line: 37 | named "getHistoryInfo" ]]
	return {
		name = p1.name,
		placeId = tonumber(p1.rootPlaceId),
		universeId = tonumber(p1.universeId),
		rating = p2.rating
	}
end

return function(p3) --[[ line: 47 | named "useHistoryItems" ]]
	-- upvalues: reactModule (ref), signalsModule (ref), default (ref), getNMostRecentUniqueUniverseIds (ref), getGameInfoStore (ref), getVotesStore (ref), signalsReactModule (ref)
	p3 = p3 or 2
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 49 ]]
		-- upvalues: signalsModule (copy), default (copy), p3 (ref), getNMostRecentUniqueUniverseIds (copy), getGameInfoStore (copy), getVotesStore (copy)
		return signalsModule.createComputed(function(p4) --[[ line: 50 ]]
			-- upvalues: default (copy), p3 (copy), getNMostRecentUniqueUniverseIds (copy), getGameInfoStore (copy), getVotesStore (copy)
			local t = {}
			local var10 = getNMostRecentUniqueUniverseIds(default:getUniverseHistorySignal(p3)(p4), p3)
			local andFetchGameInfos = getGameInfoStore(p4).getAndFetchGameInfos(var10)
			local andFetchVotes = getVotesStore(p4).getAndFetchVotes(var10)
			
			for i, v in var10 do
				local var13 = if andFetchGameInfos[v] and andFetchGameInfos[v].data then andFetchGameInfos[v].data(p4) else nil
				local var14 = if andFetchVotes[v] and andFetchVotes[v].data then andFetchVotes[v].data(p4) else nil
				
				if var13 and var14 then
					table.insert(t, {
						name = var13.name,
						placeId = tonumber(var13.rootPlaceId),
						universeId = tonumber(var13.universeId),
						rating = var14.rating
					})
				end
			end
			return t
		end)
	end, { p3, getGameInfoStore, getVotesStore }))
end