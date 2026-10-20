local config = {
	None = "None",
	Pending = "Pending",
	Failed = "Failed",
	Success = "Success",
	Polling = "Polling",
	RobuxPollingFailedAfterNativePurchase = "RobuxPollingFailedAfterNativePurchase"
}
local v1 = require(game:GetService("CorePackages").Packages.enumerate)(script.Name, config)
require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum)(v1, config)

return v1