local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsReactModule = require(Parent.SignalsReact)
local Game1 = require(Parent.DataHydration).Game
local VotesUtils = Game1.VotesUtils
local ToastRoduxModule = require(Parent.ToastRodux)
local IconVariant = FoundationModule.Enums.IconVariant
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local SduiDualActionChip = require(Parent.SduiSharedContent).SduiDualActionChip
local ToastType = ToastRoduxModule.Enums.ToastType
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local GameVoteFunction = require(Parent.DiscoveryAnalytics).Events.gameVote
local UseOptimisticUpdateStatusModule = require(script.Parent.Hooks.useOptimisticUpdateStatus)
local GetFFlagEdpPlayerFeedbackEnabledFunction = require(Parent.SharedFlags).GetFFlagEdpPlayerFeedbackEnabled

local function _(Enabled): string
	return if Enabled == true then "UpVoted" elseif Enabled == false then "DownVoted" else "NotVoted"
end

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), SignalsReactModule (copy), Game1 (copy), ReactModule (copy), SetCurrentToastMessageFunction (copy), ToastType (copy), GetFFlagEdpPlayerFeedbackEnabledFunction (copy), UseOptimisticUpdateStatusModule (copy), Players (copy), GameVoteFunction (copy), VotesUtils (copy), IconVariant (copy), UseAppPolicyFunction (copy), SduiDualActionChip (copy), FoundationModule (copy)
	local LayoutOrder = p1.layoutOrder
	local UniverseId = p1.universeId
	local UseDispatchResult = UseDispatchFunction()
	local UseSignalStateResult = SignalsReactModule.useSignalState(Game1.getVotesStore(false).getAndFetchVote(UniverseId).data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(Game1.getVotesStore(false).getAndFetchUserVote(UniverseId).data)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(Game1.getGameInfoStore(false).getAndFetchGameInfo(UniverseId).data)
	local RootPlaceId = UseSignalStateResult2 and UseSignalStateResult2.rootPlaceId
	local UseOptimisticUpdateStatusModuleResult = UseOptimisticUpdateStatusModule(ReactModule.useCallback(function(p2)
		-- upvalues: Game1 (upval), UniverseId (copy)
		return Game1.getVotesStore(false).updateUserVote(UniverseId, p2)
	end, { UniverseId }), (ReactModule.useCallback(function(p2)
		-- upvalues: UseDispatchResult (copy), SetCurrentToastMessageFunction (upval), ToastType (upval), GetFFlagEdpPlayerFeedbackEnabledFunction (upval), RootPlaceId (copy), Game1 (upval)
		if p2 == nil then return end
		if p2.type == "error" then
			local ToastMessage = "Feature.Toast.VoteError.Default"
			local ReasonForNotVoteable = p2.reasonForNotVoteable
			
			if ReasonForNotVoteable == "PlayGame" then
				ToastMessage = "Feature.Toast.VoteError.PlayGame"
			elseif ReasonForNotVoteable == "FloodCheckThresholdMet" then
				ToastMessage = "Feature.Toast.VoteError.FloodCheckThresholdMet"
			elseif ReasonForNotVoteable == "AssetNotVoteable" then
				ToastMessage = "Feature.Toast.VoteError.AssetNotVoteable"
			end
			UseDispatchResult(SetCurrentToastMessageFunction({
				toastType = ToastType.NetworkingError,
				toastMessage = ToastMessage
			}))
			
			return
		elseif p2.type == "success" then
			local UserVote = p2.userVote
			
			if GetFFlagEdpPlayerFeedbackEnabledFunction() and UserVote ~= nil and RootPlaceId then
				Game1.getUserVoteFeedbackMetadataStore(false).getAndFetchUserVoteFeedbackMetadata(RootPlaceId)
			end
		end
	end, { RootPlaceId, UseDispatchResult })))
	local UseResult = ReactModule.useCallback(function(UserVote)
		-- upvalues: UseSignalStateResult1 (copy), RootPlaceId (copy), Players (upval), GameVoteFunction (upval), GetFFlagEdpPlayerFeedbackEnabledFunction (upval), Game1 (upval), UseOptimisticUpdateStatusModuleResult (copy)
		local UserVote1 = UseSignalStateResult1 and UseSignalStateResult1.userVote
		local UserVote2 = if UserVote1 == UserVote then nil else UserVote
		
		if RootPlaceId then
			GameVoteFunction({
				uid = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId),
				placeId = RootPlaceId,
				vote = if UserVote2 == true then "UpVoted" elseif UserVote2 == false then "DownVoted" else "NotVoted",
				prevVote = if UserVote1 == true then "UpVoted" elseif UserVote1 == false then "DownVoted" else "NotVoted"
			}, "ExperienceDetailsVoteChip")
		end
		if GetFFlagEdpPlayerFeedbackEnabledFunction() and RootPlaceId then
			Game1.getUserVoteFeedbackMetadataStore(false).clearItem(RootPlaceId)
		end
		UseOptimisticUpdateStatusModuleResult(UserVote2)
	end, {
		UniverseId,
		UseSignalStateResult1,
		RootPlaceId,
		UseOptimisticUpdateStatusModuleResult,
		UseDispatchResult
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy)
		UseResult(true)
	end, { UseResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy)
		UseResult(false)
	end, { UseResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: VotesUtils (upval), UseSignalStateResult (copy)
		return VotesUtils.getRatingDisplayText(UseSignalStateResult)
	end, { UseSignalStateResult })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult1 (copy), IconVariant (upval)
		return if UseSignalStateResult1 and UseSignalStateResult1.userVote == true then IconVariant.Filled else IconVariant.Regular
	end, { UseSignalStateResult1 })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult1 (copy), IconVariant (upval)
		return if UseSignalStateResult1 and UseSignalStateResult1.userVote == false then IconVariant.Filled else IconVariant.Regular
	end, { UseSignalStateResult1 })
	
	return if UseAppPolicyFunction(function(p2)
		return p2.getGamePlaysAndRatings()
	end) then ReactModule.createElement(SduiDualActionChip, {
		text = UseMemoResult,
		leadingIconName = FoundationModule.Enums.IconName.ThumbUp,
		leadingIconVariant = UseMemoResult1,
		leadingOnActivated = UseResult1,
		trailingIconName = FoundationModule.Enums.IconName.ThumbDown,
		trailingIconVariant = UseMemoResult2,
		trailingOnActivated = UseResult2,
		layoutOrder = LayoutOrder
	}) else nil
end)