local Parent = script:FindFirstAncestor("AmpUpsell").Parent
local ReactModule = require(Parent.React)
local AppLinking = require(Parent.RoactServiceTags).AppLinking
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UIBloxModule = require(Parent.UIBlox)
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Images = UIBloxModule.App.ImageSet.Images
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AuthButtonClickFunction = require(Parent.AuthAnalytics).Events.authButtonClick
local FFlagAgeVerificationFocusNav = require(Parent.SharedFlags).FFlagAgeVerificationFocusNav
local UseDefaultFocusBehaviorFunction = require(Parent.ReactFocusNavigation).useDefaultFocusBehavior
local FocusNavigationUtilsModule = if FFlagAgeVerificationFocusNav then require(Parent.FocusNavigationUtils) else nil
local InputHandlersModule = if FFlagAgeVerificationFocusNav then require(Parent.InputHandlers) else nil
local FocusNavigableSurfaceIdentifierEnum = if FFlagAgeVerificationFocusNav then FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum else nil
local FocusNavigationEventNameEnum = if FFlagAgeVerificationFocusNav then FocusNavigationUtilsModule.FocusNavigationEventNameEnum else nil
local UseFocusRoot = if FFlagAgeVerificationFocusNav then FocusNavigationUtilsModule.useFocusRoot else nil
local Config = if FFlagAgeVerificationFocusNav then {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
} else nil

return function(p1)
	-- upvalues: UseScreenSizeFunction (copy), UseTokensFunction (copy), UseRoactServiceFunction (copy), AppLinking (copy), UseLocalizationFunction (copy), ReactModule (copy), AuthButtonClickFunction (copy), FFlagAgeVerificationFocusNav (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), Config (copy), UseDefaultFocusBehaviorFunction (copy), PartialPageModal (copy), ButtonType (copy), Images (copy), Text (copy)
	local WebLink = p1.webLink
	local OnCancelFunction = p1.onCancel
	local SessionId = p1.sessionId
	local EntryPointEventCtx = p1.entryPointEventCtx
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseTokensResult = UseTokensFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppLinking)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Amp.FAEUpsell.Modal.ExternalLink.Title",
		bodyText = "Amp.FAEUpsell.Modal.ExternalLink.Text",
		startBtn = "Amp.FAEUpsell.Modal.ExternalLink.ButtonStart",
		cancelBtn = "Amp.FAEUpsell.Modal.ExternalLink.ButtonCancel"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: AuthButtonClickFunction (upval), EntryPointEventCtx (copy), SessionId (copy), UseRoactServiceResult (copy), WebLink (copy)
		AuthButtonClickFunction(EntryPointEventCtx, "startFaeNonNative", SessionId)
		UseRoactServiceResult:openURL(WebLink)
	end, {
		UseRoactServiceResult,
		WebLink,
		SessionId,
		EntryPointEventCtx
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: AuthButtonClickFunction (upval), EntryPointEventCtx (copy), SessionId (copy), OnCancelFunction (copy)
		AuthButtonClickFunction(EntryPointEventCtx, "cancelFaeNonNative", SessionId)
		OnCancelFunction()
	end, { OnCancelFunction, SessionId, EntryPointEventCtx })
	local Ref = nil
	local v1 = nil
	
	if FFlagAgeVerificationFocusNav then
		v1, Ref = UseDefaultFocusBehaviorFunction((UseFocusRoot({
			shouldRestoreFocus = false,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			eventMap = Config,
			eventHandlers = ReactModule.useMemo(function()
				-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult1 (copy)
				return {
					[FocusNavigationEventNameEnum.NavigateBack] = {
						handler = InputHandlersModule.onRelease(function(p2)
							-- upvalues: UseResult1 (upval)
							UseResult1()
							p2:cancel()
						end)
					}
				}
			end, { UseResult1 })
		})))
	end
	local Element = ReactModule.createElement(PartialPageModal, {
		title = UseLocalizationResult.title,
		screenSize = UseScreenSizeResult,
		onCloseClicked = UseResult1,
		buttonStackProps = {
			forcedFillDirection = Enum.FillDirection.Vertical,
			disableGamepadRefs = if FFlagAgeVerificationFocusNav then true else nil,
			buttons = {
				{
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = UseResult1,
						text = UseLocalizationResult.cancelBtn
					}
				},
				{
					buttonType = ButtonType.PrimaryContextual,
					props = {
						icon = Images["icons/navigation/externallink_medium"],
						onActivated = UseResult,
						text = UseLocalizationResult.startBtn,
						buttonRef = if FFlagAgeVerificationFocusNav then v1 else nil
					}
				}
			}
		}
	}, {
		ViewFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			OuterPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, UseTokensResult.Padding.XXLarge),
				PaddingBottom = UDim.new(0, UseTokensResult.Padding.XXLarge)
			}),
			BodyText = ReactModule.createElement(Text, {
				tag = "auto-y grow size-full-0 text-align-x-left text-wrap",
				LayoutOrder = 1,
				Text = UseLocalizationResult.bodyText
			})
		})
	})
	
	return if FFlagAgeVerificationFocusNav then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		SelectionGroup = true,
		Size = UDim2.fromScale(1, 1),
		SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
		SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
		SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
		SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
		ref = Ref
	}, { Modal = Element }) else Element
end