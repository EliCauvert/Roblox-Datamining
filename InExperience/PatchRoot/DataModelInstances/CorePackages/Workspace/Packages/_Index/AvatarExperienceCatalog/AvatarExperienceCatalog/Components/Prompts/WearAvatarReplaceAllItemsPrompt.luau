local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local withMappedNavigationParams = require(parent.AvatarExperienceNavigation).withMappedNavigationParams
local AXPartialPageModal = require(parent.AvatarExperienceCommon).Components.AXPartialPageModal
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local checkbox = foundationModule.Checkbox
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local useMultiItemShoppingFtuxModule = require(avatarExperienceCatalog.Hooks.useMultiItemShoppingFtux)

return withMappedNavigationParams(function(p1)
	-- upvalues: useLocalization (ref), useMultiItemShoppingFtuxModule (ref), reactModule (ref), roactNavigationModule (ref), view (ref), text (ref), checkbox (ref), inputSize (ref), AXPartialPageModal (ref), buttonVariant (ref)
	local var1 = useLocalization({
		confirmButtonText = "Feature.Catalog.Action.Checkout.Wear",
		cancelButtonText = "Feature.Avatar.Action.Cancel",
		titleText = "Feature.Catalog.Title.Checkout.WearAvatarReplaceAllItemsTitle",
		bodyText = "Feature.Catalog.Label.Checkout.WearAvatarReplaceAllItemsBody",
		checkboxText = "Feature.Catalog.Label.Checkout.DontWarnAgainText"
	})
	local var2 = useMultiItemShoppingFtuxModule()
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), roactNavigationModule (copy), var2 (ref)
		p1.navigation.dispatch(roactNavigationModule.Actions.back(nil))
		var2.incrementWearAvatarReplaceAllItemsPromptCount()
	end, { p1.navigation })
	local var6 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		var5()
	end, { var5 })
	
	return reactModule.createElement(AXPartialPageModal, {
		onBackgroundPress = var6,
		buttonStackProps = {
			rowLayout = false,
			buttons = {
				{
					props = {
						onActivated = reactModule.useCallback(function()
							-- upvalues: var5 (ref), p1 (ref), var3 (ref)
							var5()
							p1.onConfirm(var3)
						end, { p1.onConfirm, var5, var3 }),
						text = var1.confirmButtonText,
						variant = buttonVariant.Emphasis,
						size = inputSize.Medium
					}
				},
				{
					props = {
						onActivated = var6,
						text = var1.cancelButtonText,
						variant = buttonVariant.Standard,
						size = inputSize.Medium
					}
				}
			}
		}
	}, (function()
		-- upvalues: reactModule (copy), view (copy), text (copy), var1 (ref), checkbox (copy), var3 (ref), var4 (ref), inputSize (copy)
		return {
			ViewFrame = reactModule.createElement(view, {
				tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
			}, {
				PromptBodyTitle = reactModule.createElement(text, {
					tag = "auto-xy padding-bottom-small text-align-x-left text-heading-small text-wrap",
					LayoutOrder = 1,
					Text = var1.titleText
				}),
				PromptBodyText = reactModule.createElement(text, {
					tag = "auto-xy padding-bottom-xxlarge text-align-x-left text-truncate-end text-body-large text-wrap",
					LayoutOrder = 2,
					Text = var1.bodyText
				}),
				DontWarnCheckbox = reactModule.createElement(checkbox, {
					LayoutOrder = 3,
					isChecked = var3,
					onActivated = function()
						-- upvalues: var4 (copy), var3 (copy)
						var4(not var3)
					end,
					size = inputSize.Medium,
					label = var1.checkboxText
				})
			})
		}
	end)())
end)