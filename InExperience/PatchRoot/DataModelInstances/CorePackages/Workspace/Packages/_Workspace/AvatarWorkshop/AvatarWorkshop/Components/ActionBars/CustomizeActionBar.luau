local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseContinueActionModule = require(AvatarWorkshop.Hooks.useContinueAction)
local ActionBarModule = require(script.Parent.ActionBar)

return function()
	-- upvalues: UseContinueActionModule (copy), UseLocalizationFunction (copy), ReactModule (copy), ActionBarModule (copy), FoundationModule (copy)
	return ReactModule.createElement(ActionBarModule, {
		actions = {
			{
				key = "ContinueButton",
				testId = "avatar-workshop-continue-button",
				text = UseLocalizationFunction({ ["continue"] = "Feature.AvatarSwitcher.Action.Continue" })["continue"],
				onActivated = UseContinueActionModule(),
				variant = FoundationModule.Enums.ButtonVariant.Emphasis
			}
		}
	})
end