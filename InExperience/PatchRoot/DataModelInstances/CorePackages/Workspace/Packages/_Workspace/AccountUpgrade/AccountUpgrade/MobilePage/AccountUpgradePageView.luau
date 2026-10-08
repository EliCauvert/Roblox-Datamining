local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local fullscreenPageWithSafeArea = require(parent.AppBlox).FullscreenPageWithSafeArea
local accountUpgradeFieldsModule = require(accountUpgrade.Components.AccountUpgradeFields)
local accountUpgradeFieldErrorModule = require(accountUpgrade.Components.AccountUpgradeFieldError)
local closeConfirmationDialogModule = require(accountUpgrade.Components.CloseConfirmationDialog)
local accountUpgradeDialogActionsModule = require(accountUpgrade.SuccessModal.AccountUpgradeDialogActions)
local accountUpgradeFieldModule = require(accountUpgrade.AccountUpgradeField)
local birthdaySheetModule = require(script.Parent.BirthdaySheet)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local useLastInputMode = focusNavigationUtilsModule.useLastInputMode
local view = foundationModule.View
local text = foundationModule.Text
local scrollView = foundationModule.ScrollView
local headerBar = foundationModule.HeaderBar
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: foundationModule (ref), useLastInputMode (ref), reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), fullscreenPageWithSafeArea (ref), view (ref), headerBar (ref), text (ref), iconName (ref), scrollView (ref), scrollBarVisibility (ref), accountUpgradeFieldsModule (ref), accountUpgradeDialogActionsModule (ref), buttonVariant (ref), accountUpgradeFieldErrorModule (ref), accountUpgradeFieldModule (ref), birthdaySheetModule (ref), closeConfirmationDialogModule (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = not p1.isSaveEnabled and not p1.isSubmitting
	local onClose = p1.onClose
	local onSignOut = p1.onSignOut
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundTransparency = 0,
		BackgroundColor3 = var1.Color.Surface.Surface_0.Color3
	}, {
		Page = reactModule.createElement(view, {
			tag = "col size-full bg-surface-0",
			testId = "AccountUpgradePage",
			ref = useFocusRoot({
				isAutoFocusRoot = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
				isFocusable = not (p1.isBirthdayPickerOpen or p1.isCloseConfirmationOpen),
				eventMap = t,
				eventHandlers = reactModule.useMemo(function()
					-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), onClose (ref)
					return {
						[focusNavigationEventNameEnum.NavigateBack] = {
							handler = inputHandlersModule.onRelease(function(p2)
								-- upvalues: onClose (copy)
								if onClose then
									onClose()
								end
								p2:cancel()
							end)
						}
					}
				end, { onClose })
			}),
			selectionGroup = {
				SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
				SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
				SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
				SelectionBehaviorRight = Enum.SelectionBehavior.Stop
			}
		}, {
			Header = reactModule.createElement(headerBar.Root, { LayoutOrder = 1, testId = "AccountUpgradePageHeader" }, {
				Leading = reactModule.createElement(headerBar.Leading),
				Content = reactModule.createElement(headerBar.Content, nil, {
					Title = reactModule.createElement(text, {
						tag = "auto-xy text-heading-medium content-emphasis",
						testId = "AccountUpgradePageTitle",
						Text = p1.titleText
					})
				}),
				Trailing = reactModule.createElement(headerBar.Trailing, nil, {
					Actions = if onClose and not (useLastInputMode() == "Focus") then reactModule.createElement(headerBar.Actions, {
						actions = {
							{ id = "close", icon = iconName.X, onActivated = onClose }
						}
					}) else nil
				})
			}),
			Scroll = reactModule.createElement(scrollView, {
				tag = "fill size-full-0",
				LayoutOrder = 2,
				testId = "AccountUpgradePageScroll",
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(1, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					scrollBarVisibility = scrollBarVisibility.Auto
				}
			}, {
				Content = reactModule.createElement(view, {
					tag = "col gap-xxlarge size-full-0 auto-y padding-x-large padding-y-medium"
				}, {
					Subtitle = reactModule.createElement(text, {
						tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
						LayoutOrder = 1,
						testId = "AccountUpgradeSubtitle",
						Text = p1.subtitleText
					}),
					Fields = reactModule.createElement(accountUpgradeFieldsModule, { LayoutOrder = 2, form = p1 }),
					Actions = reactModule.createElement(view, {
						tag = "col gap-small size-full-0 auto-y",
						LayoutOrder = 3,
						testId = "AccountUpgradePageActions"
					}, {
						Buttons = reactModule.createElement(accountUpgradeDialogActionsModule, {
							LayoutOrder = 1,
							buttons = {
								{
									text = p1.saveText,
									variant = if var2 then buttonVariant.Standard else buttonVariant.Emphasis,
									onActivated = p1.onSaveActivated,
									isDisabled = var2,
									isLoading = p1.isSubmitting
								}
							}
						}),
						Error = reactModule.createElement(accountUpgradeFieldErrorModule, {
							LayoutOrder = 2,
							testId = "AccountUpgradeSubmitError",
							text = p1.submitError
						})
					})
				})
			}),
			BirthdayPicker = if p1.fieldStates[accountUpgradeFieldModule.Birthday] ~= nil then nil else reactModule.createElement(birthdaySheetModule, {
				isOpen = p1.isBirthdayPickerOpen,
				birthday = p1.birthday,
				onClose = p1.onBirthdayPickerClosed,
				onConfirm = p1.onBirthdayConfirmed
			}),
			CloseConfirmation = if p1.isCloseConfirmationOpen and onSignOut then reactModule.createElement(closeConfirmationDialogModule, {
				onBack = p1.onCloseConfirmationBack,
				onSignOut = onSignOut
			}) else nil
		})
	})
end