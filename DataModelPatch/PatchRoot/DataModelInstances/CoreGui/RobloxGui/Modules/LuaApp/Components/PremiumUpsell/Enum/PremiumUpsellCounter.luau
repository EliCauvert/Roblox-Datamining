local config = {
	Shown = "PremiumUpsellShown",
	Confirmed = "PremiumUpsellConfirmed",
	Cancelled = "PremiumUpsellCancelled",
	Failed = "PremiumUpsellFailed",
	InvalidProducts = "PremiumUpsellFailedInvalidProducts"
}
local v1 = require(game:GetService("CorePackages").Packages.enumerate)(script.Name, config)
require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum)(v1, config)

return v1