local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(Robux, PremiumRobux, Subscriptions)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(Robux, "table", "SetIAPProducts: robuxProducts")
	ArgCheckModule.isType(PremiumRobux, "table", "SetIAPProducts: robuxPremiumProducts")
	ArgCheckModule.isType(Subscriptions, "table", "SetIAPProducts: subscriptionProducts")
	
	return {
		robux = Robux,
		premiumRobux = PremiumRobux,
		subscriptions = Subscriptions
	}
end)