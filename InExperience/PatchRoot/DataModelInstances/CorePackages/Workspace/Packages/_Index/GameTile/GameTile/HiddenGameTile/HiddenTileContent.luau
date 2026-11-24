local GuiService = game:GetService("GuiService")
local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local DisplayModule = require(Parent.Display)
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ResponsiveModule = require(Parent.Responsive)
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local RoactUtilsModule = require(Parent.RoactUtils)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = RobloxAppHooksModule.useRoactService
local GetGameTileHiddenStoreModule = require(GameTile.HiddenGameTile.getGameTileHiddenStore)
local UndoGameNotInterestedModule = require(GameTile.undoGameNotInterested)
local FFlagLuaAppNotInterestedTileFeedbackButton = SharedFlagsModule.FFlagLuaAppNotInterestedTileFeedbackButton
local FFlagLuaAppNotInterestedMobileSnackbar = SharedFlagsModule.FFlagLuaAppNotInterestedMobileSnackbar

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), UseTokensFunction (copy), UseFocusGuiObjectFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), FFlagLuaAppNotInterestedMobileSnackbar (copy), SignalsModule (copy), DisplayModule (copy), ResponsiveModule (copy), SignalsReactModule (copy), UseLocalizationFunction (copy), FFlagLuaAppNotInterestedTileFeedbackButton (copy), GetGameTileHiddenStoreModule (copy), GuiService (copy), UndoGameNotInterestedModule (copy), View (copy), Text (copy), Button (copy), InputSize (copy), ButtonVariant (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseTokensResult = UseTokensFunction()
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseSignalStateResult = if FFlagLuaAppNotInterestedMobileSnackbar then SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), DisplayModule (upval), ResponsiveModule (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: DisplayModule (upval), ResponsiveModule (upval)
			return ResponsiveModule.getIsCompactTouch(DisplayModule.GetDisplayStore(p2).getViewportSize(p2), (ResponsiveModule.GetInputModeStore(p2).getPreferredInputType(p2)))
		end)
	end, {}))) else nil
	local UseLocalizationResult = UseLocalizationFunction({
		undoLabel = "Feature.GameDetails.Action.Undo",
		hiddenTileMessage = "Feature.GameDetails.Message.SuggestLessOften",
		giveFeedbackLabel = if FFlagLuaAppNotInterestedTileFeedbackButton then "Feature.GameDetails.Action.GiveFeedback" else nil
	})
	local UseSignalStateResult1 = nil
	local UseResult = nil
	
	if FFlagLuaAppNotInterestedTileFeedbackButton then
		UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: GetGameTileHiddenStoreModule (upval), p1 (copy), SignalsModule (upval)
			local GetFeedbackOpenersFunction = GetGameTileHiddenStoreModule(p1.collectionId or "").getFeedbackOpeners
			
			return SignalsModule.createComputed(function(p2): boolean
				-- upvalues: GetFeedbackOpenersFunction (copy), p1 (upval)
				return GetFeedbackOpenersFunction(p2)[p1.universeId] ~= nil
			end)
		end, { p1.collectionId, p1.universeId })))
		UseResult = ReactModule.useCallback(function()
			-- upvalues: GetGameTileHiddenStoreModule (upval), p1 (copy)
			local FeedbackOpener: () -> () = GetGameTileHiddenStoreModule(p1.collectionId or "").getFeedbackOpeners(false)[p1.universeId]
			
			if FeedbackOpener then
				FeedbackOpener()
			end
		end, { p1.collectionId, p1.universeId })
	end
	return ReactModule.createElement(View, {
		tag = "size-full gap-small col align-x-center align-y-center bg-surface-100 radius-medium padding-medium"
	}, {
		Message = if FFlagLuaAppNotInterestedMobileSnackbar and UseSignalStateResult then nil else ReactModule.createElement(Text, {
			LayoutOrder = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			fontStyle = UseTokensResult.Typography.BodySmall,
			Size = UDim2.fromScale(1, 0),
			Text = UseLocalizationResult.hiddenTileMessage,
			textStyle = UseTokensResult.Color.Content.Default
		}),
		UndoButton = ReactModule.createElement(Button, {
			LayoutOrder = 2,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: GuiService (upval), UseRefResult (copy), p1 (copy), UseFocusGuiObjectResult (copy), UndoGameNotInterestedModule (upval), UseDispatchResult (copy), UseRoactServiceResult (copy)
				UndoGameNotInterestedModule({
					appPage = p1.appPage,
					collectionId = p1.collectionId,
					dispatch = UseDispatchResult,
					isSponsored = p1.isSponsored,
					networking = UseRoactServiceResult,
					onOptimisticUnhide = function()
						-- upvalues: GuiService (upval), UseRefResult (upval), p1 (upval), UseFocusGuiObjectResult (upval)
						if GuiService.SelectedCoreObject == UseRefResult.current then
							task.delay(0, function()
								-- upvalues: p1 (upval), UseFocusGuiObjectResult (upval)
								if p1.parentRef then
									UseFocusGuiObjectResult(p1.parentRef.current)
								end
							end)
						end
					end,
					setGameHidden = p1.setGameHidden,
					universeId = p1.universeId
				})
			end, {
				UseRoactServiceResult, UseFocusGuiObjectResult, p1.setGameHidden,
				p1.universeId, p1.collectionId, p1.appPage, p1.parentRef, UseDispatchResult,
				p1.isSponsored
			}),
			size = InputSize.XSmall,
			text = UseLocalizationResult.undoLabel,
			variant = ButtonVariant.Standard,
			ref = UseRefResult,
			testId = `--game-tile-hidden-undo-{p0.universeId}`
		}),
		GiveFeedbackButton = if FFlagLuaAppNotInterestedTileFeedbackButton and UseSignalStateResult1 then ReactModule.createElement(Button, {
			LayoutOrder = 3,
			onActivated = UseResult,
			size = InputSize.XSmall,
			text = UseLocalizationResult.giveFeedbackLabel,
			variant = ButtonVariant.Standard,
			testId = `--game-tile-hidden-give-feedback-{p0.universeId}`
		}) else nil
	})
end)