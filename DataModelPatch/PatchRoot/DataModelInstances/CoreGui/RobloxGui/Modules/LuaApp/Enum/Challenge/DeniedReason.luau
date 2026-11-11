local config = {
	Unknown = "DENIED_REASON_UNKNOWN",
	RateLimited = "DENIED_REASON_RATE_LIMITED"
}
local v1 = require(game:GetService("CorePackages").Packages.enumerate)(script.Name, config)
require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum)(v1, config)

return v1