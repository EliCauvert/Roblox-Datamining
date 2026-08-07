local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local signalsReactModule = require(parent.SignalsReact)
local roactUtilsModule = require(parent.RoactUtils)
local cryoModule = require(parent.Cryo)
local game = require(parent.DataHydration).Game
local _ = require(parent.SduiCoreSystem)
local playerFeedbackModule = require(parent.PlayerFeedback)
local centralOverlayModule = require(parent.CentralOverlay)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local sharedFlagsModule = require(parent.SharedFlags)
local useTokens = foundationModule.Hooks.useTokens
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local gamePlayerFeedbackPrompt = playerFeedbackModule.GamePlayerFeedbackPrompt
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local sduiAssociatedItemsRowModule = require(serverDrivenUi.Content.SduiAssociatedItemsRow)
local getFFlagEdpPlayerFeedbackEnabled = sharedFlagsModule.GetFFlagEdpPlayerFeedbackEnabled

return reactModule.memo(function(p0) --[[ line: 35 | named "ExperienceAssociatedItemsRow" ]]
	-- upvalues: useTokens (ref), useDispatch (ref), game (ref), signalsReactModule (ref), reactModule (ref), getFFlagEdpPlayerFeedbackEnabled (ref), setCentralOverlay (ref), centralOverlayType (ref), sduiAssociatedItemsRowModule (ref), cryoModule (ref), gamePlayerFeedbackPrompt (ref)
	local layoutOrder = p0.layoutOrder
	local var11 = useTokens()
	local var12 = useDispatch()
	local universeId = p0.universeId
	local var13 = signalsReactModule.useSignalState(game.getGameInfoStore(false).getAndFetchGameInfo(universeId).data)
	local rootPlaceId = var13 and var13.rootPlaceId
	local var15 = signalsReactModule.useSignalState(game.getVotesStore(false).getAndFetchUserVote(universeId).data)
	local var16 = signalsReactModule.useSignalState(reactModule.useCallback(function(p1) --[[ line: 49 ]]
		-- upvalues: rootPlaceId (ref), game (copy)
		return if rootPlaceId then game.getUserVoteFeedbackMetadataStore(p1).getUserVoteFeedbackMetadata(rootPlaceId).data(p1) else nil
	end, { rootPlaceId }))
	local var17 = reactModule.useCallback(function() --[[ line: 66 ]]
		-- upvalues: rootPlaceId (ref), game (copy)
		if rootPlaceId then
			game.getUserVoteFeedbackMetadataStore(false).clearItem(rootPlaceId)
		end
	end, { rootPlaceId })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = layoutOrder
	}, {
		MinHeightConstraint = reactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(0, var11.Size.Size_700) }),
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var11.Padding.Small)
		}),
		ChipsRow = reactModule.createElement(sduiAssociatedItemsRowModule, cryoModule.Dictionary.join(p0, { universeId = nil, layoutOrder = 1 })),
		FeedbackPrompt = if getFFlagEdpPlayerFeedbackEnabled() and (var16 and var16.canSubmitReview) and rootPlaceId then reactModule.createElement(gamePlayerFeedbackPrompt, {
			LayoutOrder = 2,
			placeId = rootPlaceId,
			onButtonClick = reactModule.useCallback(function() --[[ line: 74 ]]
				-- upvalues: var16 (ref), var15 (ref), var12 (ref), setCentralOverlay (copy), centralOverlayType (copy), universeId (ref), var17 (ref)
				if var16 and var16.canSubmitReview and var15 and (var15.userVote == true or var15.userVote == false) then
					local t = { [true] = "Upvote", [false] = "Downvote" }
					local var19 = nil
					
					for i, v in var16.categories do
						if v.type == t[var15.userVote] then
							var19 = v
							break
						end
					end
					var12(setCentralOverlay(centralOverlayType.GamePlayerFeedbackForm, {
						universeId = universeId,
						playerFeedbackMetadata = {
							rootPlaceId = var16.rootPlaceId,
							canSubmitReview = var16.canSubmitReview,
							canSubmitComment = var16.canSubmitComment,
							categoryType = t[var15.userVote],
							category = var19,
							comment = var16.comment,
							metadata = var16.metadata
						},
						onSubmitted = var17
					}))
				end
			end, {
				var16,
				universeId,
				var12,
				var15,
				var17
			}),
			onDimiss = var17
		}) else nil
	})
end)