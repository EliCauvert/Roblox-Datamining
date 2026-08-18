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

return function(p0) --[[ line: 20 | named "GoToCustomizeToEditPrompt" ]]
	-- upvalues: useLocalization (ref), reactModule (ref), roactNavigationModule (ref), view (ref), text (ref), AXPartialPageModal (ref), buttonVariant (ref), inputSize (ref)
	local var3 = useLocalization({
		confirmButtonText = "Feature.Catalog.Action.Checkout.GoToCustomize",
		cancelButtonText = "Feature.Avatar.Action.Stay",
		titleText = "Feature.Catalog.Title.Checkout.GoToCustomizeTitle",
		bodyText = "Feature.Catalog.Label.Checkout.GoToCustomizeBody"
	})
	local var4 = reactModule.useCallback(function() --[[ line: 28 ]]
		-- upvalues: p0 (ref), roactNavigationModule (copy)
		p0.navigation.dispatch(roactNavigationModule.Actions.back(nil))
	end, { p0.navigation })
	local var5 = reactModule.useCallback(function() --[[ line: 37 ]]
		-- upvalues: var4 (ref)
		var4()
	end, { var4 })
	
	return reactModule.createElement(AXPartialPageModal, {
		onBackgroundPress = var5,
		buttonStackProps = {
			rowLayout = false,
			buttons = {
				{
					props = {
						onActivated = reactModule.useCallback(function() --[[ line: 32 ]]
							-- upvalues: var4 (ref), p0 (ref)
							var4()
							p0.onConfirm()
						end, { p0.onConfirm, var4 }),
						text = var3.confirmButtonText,
						variant = buttonVariant.Emphasis,
						size = inputSize.Medium
					}
				},
				{
					props = {
						onActivated = var5,
						text = var3.cancelButtonText,
						variant = buttonVariant.Standard,
						size = inputSize.Medium
					}
				}
			}
		}
	}, (function() --[[ line: 41 ]]
		-- upvalues: reactModule (copy), view (copy), text (copy), var3 (ref)
		return {
			ViewFrame = reactModule.createElement(view, {
				tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
			}, {
				PromptBodyTitle = reactModule.createElement(text, {
					tag = "auto-xy padding-bottom-small text-align-x-left text-heading-small text-wrap",
					LayoutOrder = 2,
					Text = var3.titleText
				}),
				PromptBodyText = reactModule.createElement(text, {
					tag = "auto-xy text-align-x-left text-truncate-end text-body-large text-wrap",
					LayoutOrder = 3,
					Text = var3.bodyText
				})
			})
		}
	end)())
end