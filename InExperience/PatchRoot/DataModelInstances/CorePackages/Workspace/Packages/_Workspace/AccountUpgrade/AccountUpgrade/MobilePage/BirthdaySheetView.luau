local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local FoundationModule = require(Parent.Foundation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local AccountUpgradeDialogActionsModule = require(AccountUpgrade.SuccessModal.AccountUpgradeDialogActions)
local BirthdayPicker = require(Parent.AuthSignup).Components.BirthdayPicker
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local View = FoundationModule.View
local Text = FoundationModule.Text
local IconButton = FoundationModule.IconButton
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(p1) --[[ Line: 57 | Named "BirthdaySheetView" ]]
	-- upvalues: FoundationModule (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), View (copy), StateLayerAffordance (copy), Text (copy), IconButton (copy), IconName (copy), InputSize (copy), BirthdayPicker (copy), AccountUpgradeDialogActionsModule (copy), ButtonVariant (copy), ReactRobloxModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseOverlayResult = FoundationModule.Hooks.useOverlay()
	local Large = UseTokensResult.Radius.Large
	local Backdrop = UseTokensResult.Color.Common.Backdrop
	local SlideProgress = p1.slideProgress
	local IsCentered = p1.isCentered
	local OnDismissFunction = p1.onDismiss
	local Element = ReactModule.createElement(View, {
		tag = "size-full",
		ZIndex = 200,
		testId = "account-upgrade-birthday-sheet",
		ref = UseFocusRootFunction({
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			eventMap = EventMap,
			eventHandlers = ReactModule.useMemo(function() --[[ Line: 66 ]]
				-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnDismissFunction (copy)
				return {
					[FocusNavigationEventNameEnum.NavigateBack] = {
						handler = InputHandlersModule.onRelease(function(p2) --[[ Line: 69 ]]
							-- upvalues: OnDismissFunction (upval)
							OnDismissFunction()
							p2:cancel()
						end)
					}
				}
			end, { OnDismissFunction })
		}),
		selectionGroup = {
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		}
	}, {
		Backdrop = ReactModule.createElement(View, {
			tag = "position-center-center anchor-center-center",
			testId = "account-upgrade-birthday-sheet--backdrop",
			Size = UDim2.fromScale(2, 2),
			backgroundStyle = SlideProgress:map(function(Alpha: number) --[[ Line: 102 ]]
				-- upvalues: Backdrop (copy)
				return {
					Color3 = Backdrop.Color3,
					Transparency = math.lerp(1, Backdrop.Transparency, Alpha)
				}
			end),
			stateLayer = { affordance = StateLayerAffordance.None },
			onActivated = p1.onDismiss
		}),
		Panel = ReactModule.createElement(View, {
			tag = "col gap-medium size-full-0 auto-y radius-large bg-surface-100",
			ZIndex = 2,
			testId = "account-upgrade-birthday-sheet--panel",
			AnchorPoint = SlideProgress:map(function(p2): Vector2 --[[ Line: 118 ]]
				-- upvalues: IsCentered (copy)
				return Vector2.new(0.5, if IsCentered then 0.5 else p2)
			end),
			Position = SlideProgress:map(function(p2: number): UDim2 --[[ Line: 121 ]]
				-- upvalues: IsCentered (copy), Large (copy)
				return if IsCentered then UDim2.fromScale(0.5, 1.5 - p2) else UDim2.new(0.5, 0, 1, Large * p2)
			end),
			padding = {
				top = UDim.new(0, UseTokensResult.Padding.Large),
				left = UDim.new(0, UseTokensResult.Padding.Large),
				right = UDim.new(0, UseTokensResult.Padding.Large),
				bottom = UDim.new(0, if IsCentered then UseTokensResult.Padding.Large else Large + UseTokensResult.Padding.Large)
			},
			stateLayer = { affordance = StateLayerAffordance.None },
			onActivated = function() --[[ Line: 136 ]] end
		}, {
			SizeConstraint = if IsCentered then ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(540, 1e999) }) else nil,
			Header = ReactModule.createElement(View, {
				tag = "row align-y-center gap-small size-full-0 auto-y",
				LayoutOrder = 1
			}, {
				Title = ReactModule.createElement(Text, {
					tag = "fill auto-y text-heading-small text-align-x-left content-emphasis",
					LayoutOrder = 1,
					Text = p1.titleText
				}),
				Close = ReactModule.createElement(IconButton, {
					LayoutOrder = 2,
					testId = "account-upgrade-birthday-sheet--close",
					icon = IconName.X,
					size = InputSize.Medium,
					onActivated = p1.onDismiss
				})
			}),
			Picker = ReactModule.createElement(View, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, {
				Wheels = ReactModule.createElement(BirthdayPicker, {
					layoutOrder = 1,
					minAgeAllowed = p1.minAgeAllowed,
					requireManualSelection = p1.requireManualSelection,
					updateBirthday = p1.updateBirthday,
					initialMonth = p1.initialMonth,
					initialDay = p1.initialDay,
					initialYear = p1.initialYear
				})
			}),
			AgeSummary = if p1.ageSummaryText then ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-label-medium text-wrap text-align-x-center content-default",
				LayoutOrder = 3,
				testId = "account-upgrade-birthday-sheet--age-summary",
				Text = p1.ageSummaryText
			}) else nil,
			Actions = ReactModule.createElement(AccountUpgradeDialogActionsModule, {
				LayoutOrder = 4,
				testId = "account-upgrade-birthday-sheet-actions",
				buttons = {
					{
						text = p1.confirmText,
						variant = ButtonVariant.Emphasis,
						onActivated = p1.onConfirmActivated,
						isDisabled = not p1.isConfirmEnabled
					}
				}
			})
		})
	})
	
	return if UseOverlayResult == nil then Element else ReactRobloxModule.createPortal(Element, UseOverlayResult)
end