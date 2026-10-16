local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local foundationModule = require(parent.Foundation)
local accountUpgradeDialogActionsModule = require(accountUpgrade.SuccessModal.AccountUpgradeDialogActions)
local birthdayPicker = require(parent.AuthSignup).Components.BirthdayPicker
local view = foundationModule.View
local text = foundationModule.Text
local iconButton = foundationModule.IconButton
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance

return function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), view (ref), stateLayerAffordance (ref), text (ref), iconButton (ref), iconName (ref), inputSize (ref), birthdayPicker (ref), accountUpgradeDialogActionsModule (ref), buttonVariant (ref), reactRobloxModule (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = foundationModule.Hooks.useOverlay()
	local large = var1.Radius.Large
	local backdrop = var1.Color.Common.Backdrop
	local slideProgress = p1.slideProgress
	local var3 = reactModule.createElement(view, {
		tag = "size-full",
		ZIndex = 200,
		testId = "account-upgrade-birthday-sheet"
	}, {
		Backdrop = reactModule.createElement(view, {
			tag = "position-center-center anchor-center-center",
			testId = "account-upgrade-birthday-sheet--backdrop",
			Size = UDim2.fromScale(2, 2),
			backgroundStyle = slideProgress:map(function(p2)
				-- upvalues: backdrop (ref)
				return {
					Color3 = backdrop.Color3,
					Transparency = math.lerp(1, backdrop.Transparency, p2)
				}
			end),
			stateLayer = { affordance = stateLayerAffordance.None },
			onActivated = p1.onDismiss
		}),
		Panel = reactModule.createElement(view, {
			tag = "col gap-medium size-full-0 auto-y radius-large bg-surface-100",
			ZIndex = 2,
			testId = "account-upgrade-birthday-sheet--panel",
			AnchorPoint = slideProgress:map(function(p2)
				return Vector2.new(0.5, p2)
			end),
			Position = slideProgress:map(function(p2)
				-- upvalues: large (ref)
				return UDim2.new(0.5, 0, 1, large * p2)
			end),
			padding = {
				top = UDim.new(0, var1.Padding.Large),
				left = UDim.new(0, var1.Padding.Large),
				right = UDim.new(0, var1.Padding.Large),
				bottom = UDim.new(0, large + var1.Padding.Large)
			},
			stateLayer = { affordance = stateLayerAffordance.None },
			onActivated = function() end
		}, {
			Header = reactModule.createElement(view, {
				tag = "row align-y-center gap-small size-full-0 auto-y",
				LayoutOrder = 1
			}, {
				Title = reactModule.createElement(text, {
					tag = "fill auto-y text-heading-small text-align-x-left content-emphasis",
					LayoutOrder = 1,
					Text = p1.titleText
				}),
				Close = reactModule.createElement(iconButton, {
					LayoutOrder = 2,
					testId = "account-upgrade-birthday-sheet--close",
					icon = iconName.X,
					size = inputSize.Medium,
					onActivated = p1.onDismiss
				})
			}),
			Picker = reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, {
				Wheels = reactModule.createElement(birthdayPicker, {
					layoutOrder = 1,
					minAgeAllowed = p1.minAgeAllowed,
					requireManualSelection = p1.requireManualSelection,
					updateBirthday = p1.updateBirthday,
					initialMonth = p1.initialMonth,
					initialDay = p1.initialDay,
					initialYear = p1.initialYear
				})
			}),
			Actions = reactModule.createElement(accountUpgradeDialogActionsModule, {
				LayoutOrder = 3,
				testId = "account-upgrade-birthday-sheet-actions",
				buttons = {
					{
						text = p1.confirmText,
						variant = buttonVariant.Emphasis,
						onActivated = p1.onConfirmActivated,
						isDisabled = not p1.isConfirmEnabled
					}
				}
			})
		})
	})
	
	return if var2 == nil then var3 else reactRobloxModule.createPortal(var3, var2)
end