local parent = script:FindFirstAncestor("BuildExperience").Parent
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)
local getGameInfoStore = dataHydrationModule.Game.getGameInfoStore
local getVotesStore = dataHydrationModule.Game.getVotesStore
local dataStatus = dataHydrationModule.DataStatus

return function(p1)
	-- upvalues: getGameInfoStore (ref), getVotesStore (ref), signalsReactModule (ref), dataStatus (ref)
	local var1 = tostring(p1)
	local andFetchGameInfo = getGameInfoStore(false).getAndFetchGameInfo(var1)
	local andFetchVote = getVotesStore(false).getAndFetchVote(var1)
	local var2 = signalsReactModule.useSignalState(andFetchGameInfo.data)
	local var3 = signalsReactModule.useSignalState(andFetchVote.data)
	local var4 = signalsReactModule.useSignalState(andFetchGameInfo.status) == dataStatus.NotReady
	
	return {
		visits = if var2 ~= nil then nil else var2.totalVisits,
		players = if var2 ~= nil then nil else var2.playerCount,
		likes = if var3 ~= nil then nil else var3.upVotes,
		visitsLoading = var4,
		playersLoading = var4,
		likesLoading = signalsReactModule.useSignalState(andFetchVote.status) == dataStatus.NotReady
	}
end