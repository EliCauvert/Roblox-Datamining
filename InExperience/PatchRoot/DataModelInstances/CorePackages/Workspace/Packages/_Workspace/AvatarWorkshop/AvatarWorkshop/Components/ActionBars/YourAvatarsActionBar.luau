local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ScreensModule = require(AvatarWorkshop.Navigation.Screens)
local UseNavigationModule = require(AvatarWorkshop.Hooks.useNavigation)
local ActionBarModule = require(script.Parent.ActionBar)

return function()
	-- upvalues: UseNavigationModule (copy), UseLocalizationFunction (copy), ReactModule (copy), ScreensModule (copy), ActionBarModule (copy), FoundationModule (copy)
	local UseNavigationModuleResult = UseNavigationModule()
	local UseLocalizationResult = UseLocalizationFunction({
		["continue"] = "Feature.AvatarSwitcher.Action.Continue",
		editAvatar = "Feature.AvatarWorkshop.Action.EditAvatar"
	})
	
	return ReactModule.createElement(ActionBarModule, {
		actions = {
			{
				key = "ContinueButton",
				testId = "avatar-workshop-continue-button",
				text = UseLocalizationResult["continue"],
				onActivated = function() end,
				variant = FoundationModule.Enums.ButtonVariant.Emphasis
			},
			{
				key = "EditAvatarButton",
				testId = "avatar-workshop-edit-avatar-button",
				text = UseLocalizationResult.editAvatar,
				onActivated = ReactModule.useCallback(function()
					-- upvalues: UseNavigationModuleResult (copy), ScreensModule (upval)
					UseNavigationModuleResult.navigate(ScreensModule.Workshop.Customize)
				end, { UseNavigationModuleResult }),
				variant = FoundationModule.Enums.ButtonVariant.Standard
			}
		}
	})
end