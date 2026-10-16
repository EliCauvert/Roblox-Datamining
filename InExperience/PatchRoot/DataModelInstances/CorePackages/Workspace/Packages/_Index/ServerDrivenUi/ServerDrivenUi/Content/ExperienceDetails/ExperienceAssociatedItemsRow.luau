local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local CryoModule = require(Parent.Cryo)
local Game = require(Parent.DataHydration).Game
local _ = require(Parent.SduiCoreSystem)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local GamePlayerFeedbackPrompt = require(Parent.PlayerFeedback).GamePlayerFeedbackPrompt
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SduiAssociatedItemsRowModule = require(ServerDrivenUi.Content.SduiAssociatedItemsRow)
local GetFFlagEdpPlayerFeedbackEnabledFunction = require(Parent.SharedFlags).GetFFlagEdpPlayerFeedbackEnabled

return ReactModule.memo(function(p1) --[[ Line: 35 | Named "ExperienceAssociatedItemsRow" ]]
	-- upvalues: UseTokensFunction (copy), UseDispatchFunction (copy), Game (copy), SignalsReactModule (copy), ReactModule (copy), GetFFlagEdpPlayerFeedbackEnabledFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), SduiAssociatedItemsRowModule (copy), CryoModule (copy), GamePlayerFeedbackPrompt (copy)
	local LayoutOrder = p1.layoutOrder
	local UseTokensResult = UseTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UniverseId = p1.universeId
	local UseSignalStateResult = SignalsReactModule.useSignalState(Game.getGameInfoStore(false).getAndFetchGameInfo(UniverseId).data)
	local RootPlaceId = UseSignalStateResult and UseSignalStateResult.rootPlaceId
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(Game.getVotesStore(false).getAndFetchUserVote(UniverseId).data)
	local UseSignalStateResult11 = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2) --[[ Line: 49 ]]
		-- upvalues: RootPlaceId (copy), Game (upval)
		return if RootPlaceId then Game.getUserVoteFeedbackMetadataStore(p2).getUserVoteFeedbackMetadata(RootPlaceId).data(p2) else nil
	end, { RootPlaceId })))
	local CanSubmitReview = GetFFlagEdpPlayerFeedbackEnabledFunction() and (UseSignalStateResult11 and UseSignalStateResult11.canSubmitReview)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 66 ]]
		-- upvalues: RootPlaceId (copy), Game (upval)
		if RootPlaceId then
			Game.getUserVoteFeedbackMetadataStore(false).clearItem(RootPlaceId)
		end
	end, { RootPlaceId })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 74 ]]
		-- upvalues: UseSignalStateResult11 (copy), UseSignalStateResult1 (copy), UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), UniverseId (copy), UseResult (copy)
		if UseSignalStateResult11 and UseSignalStateResult11.canSubmitReview and UseSignalStateResult1 and (UseSignalStateResult1.userVote == true or UseSignalStateResult1.userVote == false) then
			local config = { [true] = "Upvote", [false] = "Downvote" }
			local Category = nil
			
			for _, category in UseSignalStateResult11.categories do
				if category.type == config[UseSignalStateResult1.userVote] then
					Category = category
					break
				end
			end
			UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.GamePlayerFeedbackForm, {
				universeId = UniverseId,
				playerFeedbackMetadata = {
					rootPlaceId = UseSignalStateResult11.rootPlaceId,
					canSubmitReview = UseSignalStateResult11.canSubmitReview,
					canSubmitComment = UseSignalStateResult11.canSubmitComment,
					categoryType = config[UseSignalStateResult1.userVote],
					category = Category,
					comment = UseSignalStateResult11.comment,
					metadata = UseSignalStateResult11.metadata
				},
				onSubmitted = UseResult
			}))
		end
	end, {
		UseSignalStateResult11,
		UniverseId,
		UseDispatchResult,
		UseSignalStateResult1,
		UseResult
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = LayoutOrder
	}, {
		MinHeightConstraint = ReactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(0, UseTokensResult.Size.Size_700) }),
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, UseTokensResult.Padding.Small)
		}),
		ChipsRow = ReactModule.createElement(SduiAssociatedItemsRowModule, CryoModule.Dictionary.join(p1, { universeId = nil, layoutOrder = 1 })),
		FeedbackPrompt = if CanSubmitReview and RootPlaceId then ReactModule.createElement(GamePlayerFeedbackPrompt, {
			LayoutOrder = 2,
			placeId = RootPlaceId,
			onButtonClick = UseResult1,
			onDimiss = UseResult
		}) else nil
	})
end)