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

return withMappedNavigationParams(function(p0) --[[ line: 23 | named "WearAvatarReplaceAllItemsPrompt" ]]
	-- upvalues: useLocalization (ref), useMultiItemShoppingFtuxModule (ref), reactModule (ref), roactNavigationModule (ref), view (ref), text (ref), checkbox (ref), inputSize (ref), AXPartialPageModal (ref), buttonVariant (ref)
	local var5 = useLocalization({
		confirmButtonText = "Feature.Catalog.Action.Checkout.Wear",
		cancelButtonText = "Feature.Avatar.Action.Cancel",
		titleText = "Feature.Catalog.Title.Checkout.WearAvatarReplaceAllItemsTitle",
		bodyText = "Feature.Catalog.Label.Checkout.WearAvatarReplaceAllItemsBody",
		checkboxText = "Feature.Catalog.Label.Checkout.DontWarnAgainText"
	})
	local var6 = useMultiItemShoppingFtuxModule()
	local var7, var8 = reactModule.useState(false)
	local var9 = reactModule.useCallback(function() --[[ line: 36 ]]
		-- upvalues: p0 (ref), roactNavigationModule (copy), var6 (ref)
		p0.navigation.dispatch(roactNavigationModule.Actions.back(nil))
		var6.incrementWearAvatarReplaceAllItemsPromptCount()
	end, { p0.navigation })
	local var10 = reactModule.useCallback(function() --[[ line: 47 ]]
		-- upvalues: var9 (ref)
		var9()
	end, { var9 })
	
	return reactModule.createElement(AXPartialPageModal, {
		onBackgroundPress = var10,
		buttonStackProps = {
			rowLayout = false,
			buttons = {
				{
					props = {
						onActivated = reactModule.useCallback(function() --[[ line: 42 ]]
							-- upvalues: var9 (ref), p0 (ref), var7 (ref)
							var9()
							p0.onConfirm(var7)
						end, { p0.onConfirm, var9, var7 }),
						text = var5.confirmButtonText,
						variant = buttonVariant.Emphasis,
						size = inputSize.Medium
					}
				},
				{
					props = {
						onActivated = var10,
						text = var5.cancelButtonText,
						variant = buttonVariant.Standard,
						size = inputSize.Medium
					}
				}
			}
		}
	}, (function() --[[ line: 51 ]]
		-- upvalues: reactModule (copy), view (copy), text (copy), var5 (ref), checkbox (copy), var7 (ref), var8 (ref), inputSize (copy)
		return {
			ViewFrame = reactModule.createElement(view, {
				tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
			}, {
				PromptBodyTitle = reactModule.createElement(text, {
					tag = "auto-xy padding-bottom-small text-align-x-left text-heading-small text-wrap",
					LayoutOrder = 1,
					Text = var5.titleText
				}),
				PromptBodyText = reactModule.createElement(text, {
					tag = "auto-xy padding-bottom-xxlarge text-align-x-left text-truncate-end text-body-large text-wrap",
					LayoutOrder = 2,
					Text = var5.bodyText
				}),
				DontWarnCheckbox = reactModule.createElement(checkbox, {
					LayoutOrder = 3,
					isChecked = var7,
					onActivated = function() --[[ line: 68 ]]
						-- upvalues: var8 (copy), var7 (copy)
						var8(not var7)
					end,
					size = inputSize.Medium,
					label = var5.checkboxText
				})
			})
		}
	end)())
end)