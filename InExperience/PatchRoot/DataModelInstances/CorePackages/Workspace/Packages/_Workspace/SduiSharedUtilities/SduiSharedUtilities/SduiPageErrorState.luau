local Parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SystemBanner = FoundationModule.SystemBanner
local AlertSeverity = FoundationModule.Enums.AlertSeverity
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return ReactModule.memo(function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), SystemBanner (copy), AlertSeverity (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "CommonUI.Messages.Response.PageError",
		description = "Feature.Toast.NetworkingError.SomethingIsWrong",
		retry = "InGame.CommonUI.Button.Retry"
	})
	
	return ReactModule.createElement(SystemBanner, {
		severity = AlertSeverity.Error,
		title = UseLocalizationResult.title,
		description = UseLocalizationResult.description,
		actions = {
			{
				text = UseLocalizationResult.retry,
				variant = ButtonVariant.Standard,
				onActivated = p1.refresh
			}
		}
	})
end)