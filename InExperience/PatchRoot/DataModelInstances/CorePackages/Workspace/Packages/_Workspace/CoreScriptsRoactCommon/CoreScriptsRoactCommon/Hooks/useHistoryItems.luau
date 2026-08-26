local coreScriptsRoactCommon = script:FindFirstAncestor("CoreScriptsRoactCommon")
local parent = coreScriptsRoactCommon.Parent
local dataHydrationModule = require(parent.DataHydration)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local reactModule = require(parent.React)
local default = require(coreScriptsRoactCommon.Traversal.LocalTraversalHistory).default
local getGameInfoStore = dataHydrationModule.Game.getGameInfoStore
local getVotesStore = dataHydrationModule.Game.getVotesStore

local function getNMostRecentUniqueUniverseIds(p1, _)
	local t = {}
	local t_1 = {}
	
	for i, v in p1 do
		if not t_1[v] then
			t_1[v] = true
			table.insert(t, v)
		end
	end
	return t
end

local function _(p2, p3)
	return {
		name = p2.name,
		placeId = tonumber(p2.rootPlaceId),
		universeId = tonumber(p2.universeId),
		rating = p3.rating
	}
end

return function(p2)
	-- upvalues: reactModule (ref), signalsModule (ref), default (ref), getNMostRecentUniqueUniverseIds (ref), getGameInfoStore (ref), getVotesStore (ref), signalsReactModule (ref)
	p2 = p2 or 2
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), default (copy), p2 (ref), getNMostRecentUniqueUniverseIds (copy), getGameInfoStore (copy), getVotesStore (copy)
		return signalsModule.createComputed(function(p3)
			-- upvalues: default (copy), p2 (copy), getNMostRecentUniqueUniverseIds (copy), getGameInfoStore (copy), getVotesStore (copy)
			local t = {}
			local var1 = getNMostRecentUniqueUniverseIds(default:getUniverseHistorySignal(p2)(p3), p2)
			local andFetchGameInfos = getGameInfoStore(p3).getAndFetchGameInfos(var1)
			local andFetchVotes = getVotesStore(p3).getAndFetchVotes(var1)
			
			for i, v in var1 do
				local var2 = if andFetchGameInfos[v] and andFetchGameInfos[v].data then andFetchGameInfos[v].data(p3) else nil
				local var3 = if andFetchVotes[v] and andFetchVotes[v].data then andFetchVotes[v].data(p3) else nil
				
				if var2 and var3 then
					table.insert(t, {
						name = var2.name,
						placeId = tonumber(var2.rootPlaceId),
						universeId = tonumber(var2.universeId),
						rating = var3.rating
					})
				end
			end
			return t
		end)
	end, { p2, getGameInfoStore, getVotesStore }))
end