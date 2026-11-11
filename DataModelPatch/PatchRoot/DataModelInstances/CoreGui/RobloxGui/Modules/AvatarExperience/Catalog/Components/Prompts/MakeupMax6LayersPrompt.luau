local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local AXPartialPageModal = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.AXPartialPageModal
local FoundationModule = require(CorePackages.Packages.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Checkbox = FoundationModule.Checkbox
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local v1 = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)(function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), RoactNavigationModule (copy), View (copy), Text (copy), Checkbox (copy), InputSize (copy), AXPartialPageModal (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		confirmButtonText = "Feature.Catalog.Action.Replace",
		cancelButtonText = "Feature.Avatar.Action.Cancel",
		titleText = "Feature.Catalog.Title.Makeup.MakeupMax6LayersPromptTitle",
		bodyText = "Feature.Catalog.Label.Makeup.MakeupMax6LayersPromptBody",
		checkboxText = "Feature.Catalog.Label.Checkout.DontWarnAgainText"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), RoactNavigationModule (upval)
		p1.navigation.dispatch(RoactNavigationModule.Actions.back(nil))
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
	}, ReactModule.useCallback(function()
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
	end, { UseLocalizationResult, UseStateResult })())
end)

if require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixAvatarScreenVR then
	v1 = WithOverlayFocusHandlingModule(v1)
end
return v1