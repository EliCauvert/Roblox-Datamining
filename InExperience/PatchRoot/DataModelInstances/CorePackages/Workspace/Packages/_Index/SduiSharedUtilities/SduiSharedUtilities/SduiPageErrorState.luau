local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local systemBanner = foundationModule.SystemBanner
local alertSeverity = foundationModule.Enums.AlertSeverity
local buttonVariant = foundationModule.Enums.ButtonVariant
local useLocalization = require(parent.Localization).Hooks.useLocalization

return reactModule.memo(function(p0) --[[ line: 18 | named "SduiPageErrorState" ]]
	-- upvalues: useLocalization (ref), reactModule (ref), systemBanner (ref), alertSeverity (ref), buttonVariant (ref)
	local var2 = useLocalization({
		title = "CommonUI.Messages.Response.PageError",
		description = "Feature.Toast.NetworkingError.SomethingIsWrong",
		retry = "InGame.CommonUI.Button.Retry"
	})
	
	return reactModule.createElement(systemBanner, {
		severity = alertSeverity.Error,
		title = var2.title,
		description = var2.description,
		actions = {
			{
				text = var2.retry,
				variant = buttonVariant.Standard,
				onActivated = p0.refresh
			}
		}
	})
end)