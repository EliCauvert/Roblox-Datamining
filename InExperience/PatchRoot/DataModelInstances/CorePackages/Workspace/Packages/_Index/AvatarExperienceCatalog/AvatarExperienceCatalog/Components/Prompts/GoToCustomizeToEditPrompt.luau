local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local AXPartialPageModal = require(parent.AvatarExperienceCommon).Components.AXPartialPageModal
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), roactNavigationModule (ref), view (ref), text (ref), AXPartialPageModal (ref), buttonVariant (ref), inputSize (ref)
	local var1 = useLocalization({
		confirmButtonText = "Feature.Catalog.Action.Checkout.GoToCustomize",
		cancelButtonText = "Feature.Avatar.Action.Stay",
		titleText = "Feature.Catalog.Title.Checkout.GoToCustomizeTitle",
		bodyText = "Feature.Catalog.Label.Checkout.GoToCustomizeBody"
	})
	local var2 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), roactNavigationModule (copy)
		p1.navigation.dispatch(roactNavigationModule.Actions.back(nil))
	end, { p1.navigation })
	local var3 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2()
	end, { var2 })
	
	return reactModule.createElement(AXPartialPageModal, {
		onBackgroundPress = var3,
		buttonStackProps = {
			rowLayout = false,
			buttons = {
				{
					props = {
						onActivated = reactModule.useCallback(function()
							-- upvalues: var2 (ref), p1 (ref)
							var2()
							p1.onConfirm()
						end, { p1.onConfirm, var2 }),
						text = var1.confirmButtonText,
						variant = buttonVariant.Emphasis,
						size = inputSize.Medium
					}
				},
				{
					props = {
						onActivated = var3,
						text = var1.cancelButtonText,
						variant = buttonVariant.Standard,
						size = inputSize.Medium
					}
				}
			}
		}
	}, (function()
		-- upvalues: reactModule (copy), view (copy), text (copy), var1 (ref)
		return {
			ViewFrame = reactModule.createElement(view, {
				tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
			}, {
				PromptBodyTitle = reactModule.createElement(text, {
					tag = "auto-xy padding-bottom-small text-align-x-left text-heading-small text-wrap",
					LayoutOrder = 2,
					Text = var1.titleText
				}),
				PromptBodyText = reactModule.createElement(text, {
					tag = "auto-xy text-align-x-left text-truncate-end text-body-large text-wrap",
					LayoutOrder = 3,
					Text = var1.bodyText
				})
			})
		}
	end)())
end