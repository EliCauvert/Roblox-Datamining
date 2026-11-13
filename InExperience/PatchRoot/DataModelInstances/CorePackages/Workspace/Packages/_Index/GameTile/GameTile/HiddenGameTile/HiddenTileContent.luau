local GuiService = game:GetService("GuiService")
local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local RoactUtilsModule = require(Parent.RoactUtils)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
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
local UndoGameNotInterestedModule = require(GameTile.undoGameNotInterested)

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), UseTokensFunction (copy), UseFocusGuiObjectFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseLocalizationFunction (copy), GuiService (copy), UndoGameNotInterestedModule (copy), View (copy), Text (copy), Button (copy), InputSize (copy), ButtonVariant (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseTokensResult = UseTokensFunction()
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseLocalizationResult = UseLocalizationFunction({
		undoLabel = "Feature.GameDetails.Action.Undo",
		hiddenTileMessage = "Feature.GameDetails.Message.SuggestLessOften"
	})
	
	return ReactModule.createElement(View, {
		tag = "size-full gap-small col align-x-center align-y-center bg-surface-100 radius-medium padding-medium"
	}, {
		Message = ReactModule.createElement(Text, {
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
		})
	})
end)