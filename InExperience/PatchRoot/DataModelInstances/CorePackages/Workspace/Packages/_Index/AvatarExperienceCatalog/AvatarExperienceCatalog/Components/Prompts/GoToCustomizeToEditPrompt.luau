local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AXPartialPageModal = require(Parent.AvatarExperienceCommon).Components.AXPartialPageModal
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize

return function(p1) --[[ Line: 20 | Named "GoToCustomizeToEditPrompt" ]]
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), RoactNavigationModule (copy), View (copy), Text (copy), AXPartialPageModal (copy), ButtonVariant (copy), InputSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		confirmButtonText = "Feature.Catalog.Action.Checkout.GoToCustomize",
		cancelButtonText = "Feature.Avatar.Action.Stay",
		titleText = "Feature.Catalog.Title.Checkout.GoToCustomizeTitle",
		bodyText = "Feature.Catalog.Label.Checkout.GoToCustomizeBody"
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 28 ]]
		-- upvalues: p1 (copy), RoactNavigationModule (upval)
		p1.navigation.dispatch(RoactNavigationModule.Actions.back(nil))
	end, { p1.navigation })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 37 ]]
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
						onActivated = ReactModule.useCallback(function() --[[ Line: 32 ]]
							-- upvalues: UseResult (copy), p1 (copy)
							UseResult()
							p1.onConfirm()
						end, { p1.onConfirm, UseResult }),
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
	}, ((function() --[[ Line: 41 ]]
		-- upvalues: ReactModule (upval), View (upval), Text (upval), UseLocalizationResult (copy)
		return {
			ViewFrame = ReactModule.createElement(View, {
				tag = "auto-y size-full-0 padding-bottom-xxlarge col align-x-left align-y-top"
			}, {
				PromptBodyTitle = ReactModule.createElement(Text, {
					tag = "auto-xy padding-bottom-small text-align-x-left text-heading-small text-wrap",
					LayoutOrder = 2,
					Text = UseLocalizationResult.titleText
				}),
				PromptBodyText = ReactModule.createElement(Text, {
					tag = "auto-xy text-align-x-left text-truncate-end text-body-large text-wrap",
					LayoutOrder = 3,
					Text = UseLocalizationResult.bodyText
				})
			})
		}
	end)()))
end