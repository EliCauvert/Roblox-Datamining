local Parent = script:FindFirstAncestor("BuildExperience").Parent
local SignalsReactModule = require(Parent.SignalsReact)
local DataHydrationModule = require(Parent.DataHydration)
local GetGameInfoStoreFunction = DataHydrationModule.Game.getGameInfoStore
local GetVotesStoreFunction = DataHydrationModule.Game.getVotesStore
local DataStatus = DataHydrationModule.DataStatus

return function(p1)
	-- upvalues: GetGameInfoStoreFunction (copy), GetVotesStoreFunction (copy), SignalsReactModule (copy), DataStatus (copy)
	local Text = tostring(p1)
	local AndFetchGameInfo = GetGameInfoStoreFunction(false).getAndFetchGameInfo(Text)
	local AndFetchVote = GetVotesStoreFunction(false).getAndFetchVote(Text)
	local UseSignalStateResult = SignalsReactModule.useSignalState(AndFetchGameInfo.data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(AndFetchVote.data)
	local IsUseSignalStateResultMatch = SignalsReactModule.useSignalState(AndFetchGameInfo.status) == DataStatus.NotReady
	
	return {
		visits = if UseSignalStateResult == nil then nil else UseSignalStateResult.totalVisits,
		players = if UseSignalStateResult == nil then nil else UseSignalStateResult.playerCount,
		likes = if UseSignalStateResult1 == nil then nil else UseSignalStateResult1.upVotes,
		visitsLoading = IsUseSignalStateResultMatch,
		playersLoading = IsUseSignalStateResultMatch,
		likesLoading = SignalsReactModule.useSignalState(AndFetchVote.status) == DataStatus.NotReady
	}
end