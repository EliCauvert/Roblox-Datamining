local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(UniverseId, SubscriptionProducts)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(UniverseId, "string", "universeId")
	ArgCheckModule.isType(SubscriptionProducts, "table", "subscriptionProducts")
	
	return {
		universeId = UniverseId,
		subscriptionProducts = SubscriptionProducts
	}
end)