local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AXPartialPageModal = require(Parent.AvatarExperienceCommon).Components.AXPartialPageModal
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Checkbox = FoundationModule.Checkbox
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local UseMultiItemShoppingFtuxModule = require(AvatarExperienceCatalog.Hooks.useMultiItemShoppingFtux)

return (require(Parent.AvatarExperienceNavigation).withMappedNavigationParams(function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseMultiItemShoppingFtuxModule (copy), ReactModule (copy), RoactNavigationModule (copy), View (copy), Text (copy), Checkbox (copy), InputSize (copy), AXPartialPageModal (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		confirmButtonText = "Feature.Avatar.Action.Clear",
		cancelButtonText = "Feature.Avatar.Action.Cancel",
		titleText = "Feature.Catalog.Title.Checkout.ClearAllItemsOnAvatarTitle",
		bodyText = "Feature.Catalog.Label.Checkout.ClearAllItemsOnAvatarBody",
		checkboxText = "Feature.Catalog.Label.Checkout.DontWarnAgainText"
	})
	local UseMultiItemShoppingFtuxModuleResult = UseMultiItemShoppingFtuxModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), RoactNavigationModule (upval), UseMultiItemShoppingFtuxModuleResult (copy)
		p1.navigation.dispatch(RoactNavigationModule.Actions.back(nil))
		UseMultiItemShoppingFtuxModuleResult.incrementClearAllItemsPromptCount()
	end, { p1.navigation })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult })
	
	return ReactModule.createElement(AXPartialPageModal, {
		onBackgroundPress = UseResult1,
		buttonStackProps = {
			rowLayout = false,
			buttons = {
				{
					props = {
						onActivated = ReactModule.useCallback(function()
							-- upvalues: UseResult (copy), p1 (copy), UseStateResult (copy)
							UseResult()
							p1.onConfirm(UseStateResult)
						end, { p1.onConfirm, UseResult, UseStateResult }),
						text = UseLocalizationResult.confirmButtonText,
						variant = ButtonVariant.Emphasis,
						size = InputSize.Medium
					}
				},
				{
					props = {
						onActivated = UseResult1,
						text = UseLocalizationResult.cancelButtonText,
						variant = ButtonVariant.Standard,
						size = InputSize.Medium
					}
				}
			}
		}
	}, ((function()
		-- upvalues: ReactModule (upval), View (upval), Text (upval), UseLocalizationResult (copy), Checkbox (upval), UseStateResult (copy), UseStateResult2 (copy), InputSize (upval)
		return {
			ViewFrame = ReactModule.createElement(View, {
				tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
			}, {
				PromptBodyTitle = ReactModule.createElement(Text, {
					tag = "auto-xy padding-bottom-small text-align-x-left text-heading-small text-wrap",
					LayoutOrder = 1,
					Text = UseLocalizationResult.titleText
				}),
				PromptBodyText = ReactModule.createElement(Text, {
					tag = "auto-xy padding-bottom-xxlarge text-align-x-left text-truncate-end text-body-large text-wrap",
					LayoutOrder = 2,
					Text = UseLocalizationResult.bodyText
				}),
				DontWarnCheckbox = ReactModule.createElement(Checkbox, {
					LayoutOrder = 3,
					isChecked = UseStateResult,
					onActivated = function()
						-- upvalues: UseStateResult2 (upval), UseStateResult (upval)
						UseStateResult2(not UseStateResult)
					end,
					size = InputSize.Medium,
					label = UseLocalizationResult.checkboxText
				})
			})
		}
	end)()))
end))