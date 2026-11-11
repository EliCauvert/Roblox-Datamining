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

return (require(Parent.AvatarExperienceNavigation).withMappedNavigationParams(function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), RoactNavigationModule (copy), View (copy), Text (copy), AXPartialPageModal (copy), ButtonVariant (copy), InputSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		confirmButtonText = "Feature.Catalog.Action.Checkout.UnavailableItems",
		titleText = "Feature.Catalog.Title.Checkout.UnavailableItems",
		bodyText = "Feature.Catalog.Message.Checkout.UnavailableItems"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), RoactNavigationModule (upval)
		p1.navigation.dispatch(RoactNavigationModule.Actions.back(nil))
	end, { p1.navigation })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), p1 (copy)
		UseResult()
		
		if p1.onConfirm then
			p1.onConfirm()
		end
	end, { p1.onConfirm, UseResult })
	
	return ReactModule.createElement(AXPartialPageModal, {
		onBackgroundPress = UseResult1,
		buttonStackProps = {
			rowLayout = false,
			buttons = {
				{
					props = {
						onActivated = UseResult1,
						text = UseLocalizationResult.confirmButtonText,
						variant = ButtonVariant.Standard,
						size = InputSize.Medium
					}
				}
			}
		}
	}, ((function()
		-- upvalues: ReactModule (upval), View (upval), Text (upval), UseLocalizationResult (copy)
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
				})
			})
		}
	end)()))
end))