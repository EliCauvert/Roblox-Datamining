local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local systemBanner = foundationModule.SystemBanner
local alertSeverity = foundationModule.Enums.AlertSeverity
local buttonVariant = foundationModule.Enums.ButtonVariant
local useLocalization = require(parent.Localization).Hooks.useLocalization

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), systemBanner (ref), alertSeverity (ref), buttonVariant (ref)
	local var1 = useLocalization({
		title = "CommonUI.Messages.Response.PageError",
		description = "Feature.Toast.NetworkingError.SomethingIsWrong",
		retry = "InGame.CommonUI.Button.Retry"
	})
	
	return reactModule.createElement(systemBanner, {
		severity = alertSeverity.Error,
		title = var1.title,
		description = var1.description,
		actions = {
			{
				text = var1.retry,
				variant = buttonVariant.Standard,
				onActivated = p1.refresh
			}
		}
	})
end)