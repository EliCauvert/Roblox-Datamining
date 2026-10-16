local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local signalsReactModule = require(parent.SignalsReact)
local roactUtilsModule = require(parent.RoactUtils)
local game = require(parent.DataHydration).Game
local votesUtils = game.VotesUtils
local sduiSharedContentModule = require(parent.SduiSharedContent)
local toastRoduxModule = require(parent.ToastRodux)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local sharedFlagsModule = require(parent.SharedFlags)
local iconVariant = foundationModule.Enums.IconVariant
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local sduiDualActionChip = sduiSharedContentModule.SduiDualActionChip
local toastType = toastRoduxModule.Enums.ToastType
local setCurrentToastMessage = toastRoduxModule.Actions.SetCurrentToastMessage
local useAppPolicy = universalAppPolicyModule.useAppPolicy
local gameVote = discoveryAnalyticsModule.Events.gameVote
local useOptimisticUpdateStatusModule = require(script.Parent.Hooks.useOptimisticUpdateStatus)
local getFFlagEdpPlayerFeedbackEnabled = sharedFlagsModule.GetFFlagEdpPlayerFeedbackEnabled

local function _(p1)
	return if p1 == true then "UpVoted" elseif p1 == false then "DownVoted" else "NotVoted"
end

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), signalsReactModule (ref), game (ref), reactModule (ref), setCurrentToastMessage (ref), toastType (ref), getFFlagEdpPlayerFeedbackEnabled (ref), useOptimisticUpdateStatusModule (ref), playersService (ref), gameVote (ref), votesUtils (ref), iconVariant (ref), useAppPolicy (ref), sduiDualActionChip (ref), foundationModule (ref)
	local layoutOrder = p1.layoutOrder
	local universeId = p1.universeId
	local var1 = useDispatch()
	local var2 = signalsReactModule.useSignalState(game.getVotesStore(false).getAndFetchVote(universeId).data)
	local var3 = signalsReactModule.useSignalState(game.getVotesStore(false).getAndFetchUserVote(universeId).data)
	local var4 = signalsReactModule.useSignalState(game.getGameInfoStore(false).getAndFetchGameInfo(universeId).data)
	local rootPlaceId = var4 and var4.rootPlaceId
	local var5 = useOptimisticUpdateStatusModule(reactModule.useCallback(function(p2)
		-- upvalues: game (copy), universeId (ref)
		return game.getVotesStore(false).updateUserVote(universeId, p2)
	end, { universeId }), reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), setCurrentToastMessage (copy), toastType (copy), getFFlagEdpPlayerFeedbackEnabled (copy), rootPlaceId (ref), game (copy)
		if p2 == nil then return end
		if p2.type == "error" then
			local var6 = "Feature.Toast.VoteError.Default"
			local reasonForNotVoteable = p2.reasonForNotVoteable
			
			if reasonForNotVoteable == "PlayGame" then
				var6 = "Feature.Toast.VoteError.PlayGame"
			elseif reasonForNotVoteable == "FloodCheckThresholdMet" then
				var6 = "Feature.Toast.VoteError.FloodCheckThresholdMet"
			elseif reasonForNotVoteable == "AssetNotVoteable" then
				var6 = "Feature.Toast.VoteError.AssetNotVoteable"
			end
			var1(setCurrentToastMessage({
				toastType = toastType.NetworkingError,
				toastMessage = var6
			}))
			
			return
		elseif p2.type == "success" then
			if getFFlagEdpPlayerFeedbackEnabled() and p2.userVote ~= nil and rootPlaceId then
				game.getUserVoteFeedbackMetadataStore(false).getAndFetchUserVoteFeedbackMetadata(rootPlaceId)
			end
		end
	end, { rootPlaceId, var1 }))
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), rootPlaceId (ref), playersService (copy), gameVote (copy), getFFlagEdpPlayerFeedbackEnabled (copy), game (copy), var5 (ref)
		local userVote = var3 and var3.userVote
		local var7 = if userVote == p2 then nil else p2
		
		if rootPlaceId then
			local var8 = gameVote
			local t = {
				uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
				placeId = rootPlaceId
			}
			local var9 = var7
			t.vote = if var9 == true then "UpVoted" elseif var9 == false then "DownVoted" else "NotVoted"
			t.prevVote = if userVote == true then "UpVoted" elseif userVote == false then "DownVoted" else "NotVoted"
			var8(t, "ExperienceDetailsVoteChip")
		end
		if getFFlagEdpPlayerFeedbackEnabled() and rootPlaceId then
			game.getUserVoteFeedbackMetadataStore(false).clearItem(rootPlaceId)
		end
		var5(var7)
	end, {
		universeId,
		var3,
		rootPlaceId,
		var5,
		var1
	})
	
	return if useAppPolicy(function(p2)
		return p2.getGamePlaysAndRatings()
	end) then reactModule.createElement(sduiDualActionChip, {
		text = reactModule.useMemo(function()
			-- upvalues: votesUtils (copy), var2 (ref)
			return votesUtils.getRatingDisplayText(var2)
		end, { var2 }),
		leadingIconName = foundationModule.Enums.IconName.ThumbUp,
		leadingIconVariant = reactModule.useMemo(function()
			-- upvalues: var3 (ref), iconVariant (copy)
			return if var3 and var3.userVote == true then iconVariant.Filled else iconVariant.Regular
		end, { var3 }),
		leadingOnActivated = reactModule.useCallback(function()
			-- upvalues: var6 (ref)
			var6(true)
		end, { var6 }),
		trailingIconName = foundationModule.Enums.IconName.ThumbDown,
		trailingIconVariant = reactModule.useMemo(function()
			-- upvalues: var3 (ref), iconVariant (copy)
			return if var3 and var3.userVote == false then iconVariant.Filled else iconVariant.Regular
		end, { var3 }),
		trailingOnActivated = reactModule.useCallback(function()
			-- upvalues: var6 (ref)
			var6(false)
		end, { var6 }),
		layoutOrder = layoutOrder
	}) else nil
end)