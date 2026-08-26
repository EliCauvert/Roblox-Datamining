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

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useDispatch (ref), game (ref), signalsReactModule (ref), reactModule (ref), getFFlagEdpPlayerFeedbackEnabled (ref), setCentralOverlay (ref), centralOverlayType (ref), sduiAssociatedItemsRowModule (ref), cryoModule (ref), gamePlayerFeedbackPrompt (ref)
	local layoutOrder = p1.layoutOrder
	local var1 = useTokens()
	local var2 = useDispatch()
	local universeId = p1.universeId
	local var3 = signalsReactModule.useSignalState(game.getGameInfoStore(false).getAndFetchGameInfo(universeId).data)
	local rootPlaceId = var3 and var3.rootPlaceId
	local var4 = signalsReactModule.useSignalState(game.getVotesStore(false).getAndFetchUserVote(universeId).data)
	local var5 = signalsReactModule.useSignalState(reactModule.useCallback(function(p2)
		-- upvalues: rootPlaceId (ref), game (copy)
		return if rootPlaceId then game.getUserVoteFeedbackMetadataStore(p2).getUserVoteFeedbackMetadata(rootPlaceId).data(p2) else nil
	end, { rootPlaceId }))
	local var6 = reactModule.useCallback(function()
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
		MinHeightConstraint = reactModule.createElement("UISizeConstraint", { MinSize = Vector2.new(0, var1.Size.Size_700) }),
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var1.Padding.Small)
		}),
		ChipsRow = reactModule.createElement(sduiAssociatedItemsRowModule, cryoModule.Dictionary.join(p1, { universeId = nil, layoutOrder = 1 })),
		FeedbackPrompt = if getFFlagEdpPlayerFeedbackEnabled() and (var5 and var5.canSubmitReview) and rootPlaceId then reactModule.createElement(gamePlayerFeedbackPrompt, {
			LayoutOrder = 2,
			placeId = rootPlaceId,
			onButtonClick = reactModule.useCallback(function()
				-- upvalues: var5 (ref), var4 (ref), var2 (ref), setCentralOverlay (copy), centralOverlayType (copy), universeId (ref), var6 (ref)
				if var5 and var5.canSubmitReview and var4 and (var4.userVote == true or var4.userVote == false) then
					local t = { [true] = "Upvote", [false] = "Downvote" }
					local var7 = nil
					
					for i, v in var5.categories do
						if v.type == t[var4.userVote] then
							var7 = v
							break
						end
					end
					var2(setCentralOverlay(centralOverlayType.GamePlayerFeedbackForm, {
						universeId = universeId,
						playerFeedbackMetadata = {
							rootPlaceId = var5.rootPlaceId,
							canSubmitReview = var5.canSubmitReview,
							canSubmitComment = var5.canSubmitComment,
							categoryType = t[var4.userVote],
							category = var7,
							comment = var5.comment,
							metadata = var5.metadata
						},
						onSubmitted = var6
					}))
				end
			end, {
				var5,
				universeId,
				var2,
				var4,
				var6
			}),
			onDimiss = var6
		}) else nil
	})
end)