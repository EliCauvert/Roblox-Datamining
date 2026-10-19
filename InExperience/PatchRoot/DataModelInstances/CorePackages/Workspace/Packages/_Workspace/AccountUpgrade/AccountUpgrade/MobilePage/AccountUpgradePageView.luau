local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local FoundationModule = require(Parent.Foundation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local LegalTextWithLinks = require(Parent.AuthCommon).Components.LegalTextWithLinks
local AccountUpgradeFieldsModule = require(AccountUpgrade.Components.AccountUpgradeFields)
local AccountUpgradeFieldErrorModule = require(AccountUpgrade.Components.AccountUpgradeFieldError)
local CloseConfirmationDialogModule = require(AccountUpgrade.Components.CloseConfirmationDialog)
local AccountUpgradeFieldModule = require(AccountUpgrade.AccountUpgradeField)
local FFlagAccountUpgradeOAuthDialogFitsContentModule = require(AccountUpgrade.Flags.FFlagAccountUpgradeOAuthDialogFitsContent)
local FFlagAccountUpgradeOAuthTelemetryModule = require(AccountUpgrade.Flags.FFlagAccountUpgradeOAuthTelemetry)
local BirthdaySheetModule = require(script.Parent.BirthdaySheet)
local FFlagAccountUpgradeFullPageInOverlayModule = require(script.Parent.FFlagAccountUpgradeFullPageInOverlay)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local UseLastInputModeFunction = FocusNavigationUtilsModule.useLastInputMode
local View = FoundationModule.View
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local ScrollView = FoundationModule.ScrollView
local HeaderBar = FoundationModule.HeaderBar
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local IconName = FoundationModule.Enums.IconName
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

local function sinkPress() --[[ Line: 51 ]] end

local function OverlayPageLayer(p1) --[[ Line: 60 ]]
	-- upvalues: ReactRobloxModule (copy), ReactModule (copy), View (copy), StateLayerAffordance (copy), sinkPress (copy)
	return ReactRobloxModule.createPortal(ReactModule.createElement(View, {
		tag = "size-full",
		ZIndex = 100,
		testId = "AccountUpgradePageLayer"
	}, {
		Background = ReactModule.createElement(View, {
			tag = "position-center-center anchor-center-center bg-surface-0",
			ZIndex = 1,
			testId = "AccountUpgradePageBackground",
			Size = UDim2.fromScale(2, 2),
			stateLayer = { affordance = StateLayerAffordance.None },
			selection = { Selectable = false },
			onActivated = sinkPress
		}),
		Content = ReactModule.createElement(View, { tag = "size-full", ZIndex = 2 }, p1.children)
	}), p1.overlay)
end

return function(Form) --[[ Line: 85 | Named "AccountUpgradePageView" ]]
	-- upvalues: FoundationModule (copy), UseLastInputModeFunction (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), FFlagAccountUpgradeFullPageInOverlayModule (copy), FullscreenPageWithSafeArea (copy), OverlayPageLayer (copy), View (copy), HeaderBar (copy), Text (copy), IconName (copy), ScrollView (copy), ScrollBarVisibility (copy), AccountUpgradeFieldsModule (copy), InputSize (copy), Button (copy), ButtonVariant (copy), AccountUpgradeFieldErrorModule (copy), FFlagAccountUpgradeOAuthDialogFitsContentModule (copy), LegalTextWithLinks (copy), AccountUpgradeFieldModule (copy), BirthdaySheetModule (copy), FFlagAccountUpgradeOAuthTelemetryModule (copy), CloseConfirmationDialogModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local NoIsSubmitting: boolean = not Form.isSaveEnabled and not Form.isSubmitting
	local OnCloseFunction = Form.onClose
	local OnSignOut = Form.onSignOut
	local IsFocus = UseLastInputModeFunction() == "Focus"
	local UseFocusRootResult = UseFocusRootFunction({
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = not (Form.isBirthdayPickerOpen or Form.isCloseConfirmationOpen),
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function() --[[ Line: 93 ]]
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnCloseFunction (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p1) --[[ Line: 96 ]]
						-- upvalues: OnCloseFunction (upval)
						if OnCloseFunction then
							OnCloseFunction()
						end
						p1:cancel()
					end)
				}
			}
		end, { OnCloseFunction })
	})
	local UseOverlayResult = if FFlagAccountUpgradeFullPageInOverlayModule then FoundationModule.Hooks.useOverlay() else nil
	local FullscreenPageWithSafeArea1 = FullscreenPageWithSafeArea
	local config = {
		includeStatusBar = true,
		BackgroundTransparency = 0,
		BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3
	}
	
	if UseOverlayResult ~= nil then
		FullscreenPageWithSafeArea1 = OverlayPageLayer
		config = { overlay = UseOverlayResult }
	end
	return ReactModule.createElement(FullscreenPageWithSafeArea1, config, {
		Page = ReactModule.createElement(View, {
			tag = "col size-full bg-surface-0",
			testId = "AccountUpgradePage",
			ref = UseFocusRootResult,
			selectionGroup = {
				SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
				SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
				SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
				SelectionBehaviorRight = Enum.SelectionBehavior.Stop
			}
		}, {
			Header = ReactModule.createElement(HeaderBar.Root, { LayoutOrder = 1, testId = "AccountUpgradePageHeader" }, {
				Leading = ReactModule.createElement(HeaderBar.Leading),
				Content = ReactModule.createElement(HeaderBar.Content, nil, {
					Title = ReactModule.createElement(Text, {
						tag = "auto-xy text-heading-medium content-emphasis",
						testId = "AccountUpgradePageTitle",
						Text = Form.titleText
					})
				}),
				Trailing = ReactModule.createElement(HeaderBar.Trailing, nil, {
					Actions = if OnCloseFunction and not IsFocus then ReactModule.createElement(HeaderBar.Actions, {
						actions = {
							{
								id = "close",
								icon = IconName.X,
								onActivated = OnCloseFunction
							}
						}
					}) else nil
				})
			}),
			Scroll = ReactModule.createElement(ScrollView, {
				tag = "fill size-full-0",
				LayoutOrder = 2,
				testId = "AccountUpgradePageScroll",
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(1, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					scrollBarVisibility = ScrollBarVisibility.Auto
				}
			}, {
				Content = ReactModule.createElement(View, {
					tag = "col gap-xxlarge size-full-0 auto-y padding-x-large padding-y-medium"
				}, {
					Subtitle = ReactModule.createElement(Text, {
						tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
						LayoutOrder = 1,
						testId = "AccountUpgradeSubtitle",
						Text = Form.subtitleText
					}),
					Fields = ReactModule.createElement(AccountUpgradeFieldsModule, {
						boldLabels = true,
						LayoutOrder = 2,
						form = Form,
						size = InputSize.Large
					}),
					Actions = ReactModule.createElement(View, {
						tag = "col gap-small size-full-0 auto-y",
						LayoutOrder = 3,
						testId = "AccountUpgradePageActions"
					}, {
						Save = ReactModule.createElement(Button, {
							LayoutOrder = 1,
							testId = "AccountUpgradePageSaveButton",
							text = Form.saveText,
							variant = if NoIsSubmitting then ButtonVariant.Standard else ButtonVariant.Emphasis,
							size = InputSize.Large,
							width = UDim.new(1, 0),
							onActivated = Form.onSaveActivated,
							isDisabled = NoIsSubmitting,
							isLoading = Form.isSubmitting
						}),
						Error = ReactModule.createElement(AccountUpgradeFieldErrorModule, {
							LayoutOrder = 2,
							testId = "AccountUpgradeSubmitError",
							text = Form.submitError
						}),
						LegalText = if FFlagAccountUpgradeOAuthDialogFitsContentModule and Form.legalText then ReactModule.createElement(LegalTextWithLinks, {
							LayoutOrder = 3,
							testId = "AccountUpgradeLegalText",
							text = Form.legalText,
							onLinkActivated = Form.onLegalLinkActivated
						}) else nil
					})
				})
			}),
			BirthdayPicker = if Form.fieldStates[AccountUpgradeFieldModule.Birthday] == nil then nil else ReactModule.createElement(BirthdaySheetModule, {
				isOpen = Form.isBirthdayPickerOpen,
				birthday = Form.birthday,
				onClose = Form.onBirthdayPickerClosed,
				onConfirm = Form.onBirthdayConfirmed,
				onAllPicked = if FFlagAccountUpgradeOAuthTelemetryModule then Form.onBirthdayPickerAllPicked else nil
			}),
			CloseConfirmation = if Form.isCloseConfirmationOpen and OnSignOut then ReactModule.createElement(CloseConfirmationDialogModule, {
				onBack = Form.onCloseConfirmationBack,
				onSignOut = OnSignOut
			}) else nil
		})
	})
end