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

local function _(p0)
	return if p0 == true then "UpVoted" elseif p0 == false then "DownVoted" else "NotVoted"
end

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), signalsReactModule (ref), game (ref), reactModule (ref), setCurrentToastMessage (ref), toastType (ref), getFFlagEdpPlayerFeedbackEnabled (ref), useOptimisticUpdateStatusModule (ref), playersService (ref), gameVote (ref), votesUtils (ref), iconVariant (ref), useAppPolicy (ref), sduiDualActionChip (ref), foundationModule (ref)
	local layoutOrder = p1.layoutOrder
	local universeId = p1.universeId
	local var11 = useDispatch()
	local var12 = signalsReactModule.useSignalState(game.getVotesStore(false).getAndFetchVote(universeId).data)
	local var13 = signalsReactModule.useSignalState(game.getVotesStore(false).getAndFetchUserVote(universeId).data)
	local var14 = signalsReactModule.useSignalState(game.getGameInfoStore(false).getAndFetchGameInfo(universeId).data)
	local rootPlaceId = var14 and var14.rootPlaceId
	local var16 = useOptimisticUpdateStatusModule(reactModule.useCallback(function(p2)
		-- upvalues: game (copy), universeId (ref)
		return game.getVotesStore(false).updateUserVote(universeId, p2)
	end, { universeId }), reactModule.useCallback(function(p3)
		-- upvalues: var11 (ref), setCurrentToastMessage (copy), toastType (copy), getFFlagEdpPlayerFeedbackEnabled (copy), rootPlaceId (ref), game (copy)
		if p3 == nil then return end
		if p3.type == "error" then
			local var18 = "Feature.Toast.VoteError.Default"
			local reasonForNotVoteable = p3.reasonForNotVoteable
			
			if reasonForNotVoteable == "PlayGame" then
				var18 = "Feature.Toast.VoteError.PlayGame"
			elseif reasonForNotVoteable == "FloodCheckThresholdMet" then
				var18 = "Feature.Toast.VoteError.FloodCheckThresholdMet"
			elseif reasonForNotVoteable == "AssetNotVoteable" then
				var18 = "Feature.Toast.VoteError.AssetNotVoteable"
			end
			var11(setCurrentToastMessage({
				toastType = toastType.NetworkingError,
				toastMessage = var18
			}))
			
			return
		elseif p3.type == "success" then
			if getFFlagEdpPlayerFeedbackEnabled() and p3.userVote ~= nil and rootPlaceId then
				game.getUserVoteFeedbackMetadataStore(false).getAndFetchUserVoteFeedbackMetadata(rootPlaceId)
			end
		end
	end, { rootPlaceId, var11 }))
	local var17 = reactModule.useCallback(function(p4)
		-- upvalues: var13 (ref), rootPlaceId (ref), playersService (copy), gameVote (copy), getFFlagEdpPlayerFeedbackEnabled (copy), game (copy), var16 (ref)
		local userVote = var13 and var13.userVote
		local var20 = if userVote == p4 then nil else p4
		
		if rootPlaceId then
			local var21 = gameVote
			local t = {
				uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
				placeId = rootPlaceId
			}
			local var23 = var20
			t.vote = if var23 == true then "UpVoted" elseif var23 == false then "DownVoted" else "NotVoted"
			t.prevVote = if userVote == true then "UpVoted" elseif userVote == false then "DownVoted" else "NotVoted"
			var21(t, "ExperienceDetailsVoteChip")
		end
		if getFFlagEdpPlayerFeedbackEnabled() and rootPlaceId then
			game.getUserVoteFeedbackMetadataStore(false).clearItem(rootPlaceId)
		end
		var16(var20)
	end, {
		universeId,
		var13,
		rootPlaceId,
		var16,
		var11
	})
	
	return if useAppPolicy(function(p5)
		return p5.getGamePlaysAndRatings()
	end) then reactModule.createElement(sduiDualActionChip, {
		text = reactModule.useMemo(function()
			-- upvalues: votesUtils (copy), var12 (ref)
			return votesUtils.getRatingDisplayText(var12)
		end, { var12 }),
		leadingIconName = foundationModule.Enums.IconName.ThumbUp,
		leadingIconVariant = reactModule.useMemo(function()
			-- upvalues: var13 (ref), iconVariant (copy)
			return if var13 and var13.userVote == true then iconVariant.Filled else iconVariant.Regular
		end, { var13 }),
		leadingOnActivated = reactModule.useCallback(function()
			-- upvalues: var17 (ref)
			var17(true)
		end, { var17 }),
		trailingIconName = foundationModule.Enums.IconName.ThumbDown,
		trailingIconVariant = reactModule.useMemo(function()
			-- upvalues: var13 (ref), iconVariant (copy)
			return if var13 and var13.userVote == false then iconVariant.Filled else iconVariant.Regular
		end, { var13 }),
		trailingOnActivated = reactModule.useCallback(function()
			-- upvalues: var17 (ref)
			var17(false)
		end, { var17 }),
		layoutOrder = layoutOrder
	}) else nil
end)