local _ = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Models.SubscriptionApi.SubscriptionStatusModel)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(SubscriptionStatuses)
	return { subscriptionStatuses = SubscriptionStatuses }
end)