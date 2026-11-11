local CoreScriptsRoactCommon = script:FindFirstAncestor("CoreScriptsRoactCommon")
local Parent = CoreScriptsRoactCommon.Parent
local DataHydrationModule = require(Parent.DataHydration)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local ReactModule = require(Parent.React)
local Default = require(CoreScriptsRoactCommon.Traversal.LocalTraversalHistory).default
local GetGameInfoStoreFunction = DataHydrationModule.Game.getGameInfoStore
local GetVotesStoreFunction = DataHydrationModule.Game.getVotesStore

local function getNMostRecentUniqueUniverseIds(List, _)
	local List1 = {}
	local t = {}
	
	for _, value in List do
		if not t[value] then
			t[value] = true
			table.insert(List1, value)
		end
	end
	return List1
end

local function _(HistoryInfo, p1)
	return {
		name = HistoryInfo.name,
		placeId = tonumber(HistoryInfo.rootPlaceId),
		universeId = tonumber(HistoryInfo.universeId),
		rating = p1.rating
	}
end

return function(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), Default (copy), getNMostRecentUniqueUniverseIds (copy), GetGameInfoStoreFunction (copy), GetVotesStoreFunction (copy), SignalsReactModule (copy)
	local P4 = p1 or 2
	
	return (SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Default (upval), P4 (copy), getNMostRecentUniqueUniverseIds (upval), GetGameInfoStoreFunction (upval), GetVotesStoreFunction (upval)
		return (SignalsModule.createComputed(function(p2)
			-- upvalues: Default (upval), P4 (upval), getNMostRecentUniqueUniverseIds (upval), GetGameInfoStoreFunction (upval), GetVotesStoreFunction (upval)
			local List = {}
			local NMostRecentUniqueUniverseIds = getNMostRecentUniqueUniverseIds(Default:getUniverseHistorySignal(P4)(p2), P4)
			local AndFetchGameInfos = GetGameInfoStoreFunction(p2).getAndFetchGameInfos(NMostRecentUniqueUniverseIds)
			local AndFetchVotes = GetVotesStoreFunction(p2).getAndFetchVotes(NMostRecentUniqueUniverseIds)
			
			for _, nMostRecentUniqueUniverseId in NMostRecentUniqueUniverseIds do
				local DataResult = if AndFetchGameInfos[nMostRecentUniqueUniverseId] and AndFetchGameInfos[nMostRecentUniqueUniverseId].data then AndFetchGameInfos[nMostRecentUniqueUniverseId].data(p2) else nil
				local DataResult1 = if AndFetchVotes[nMostRecentUniqueUniverseId] and AndFetchVotes[nMostRecentUniqueUniverseId].data then AndFetchVotes[nMostRecentUniqueUniverseId].data(p2) else nil
				
				if DataResult and DataResult1 then
					table.insert(List, {
						name = DataResult.name,
						placeId = tonumber(DataResult.rootPlaceId),
						universeId = tonumber(DataResult.universeId),
						rating = DataResult1.rating
					})
				end
			end
			return List
		end))
	end, { P4, GetGameInfoStoreFunction, GetVotesStoreFunction }))))
end