local config = {
	Unknown = "Unknown",
	Invalidated = "Invalidated",
	Abandoned = "Abandoned",
	LoadFailed = "LoadFailed",
	RateLimited = "RateLimited"
}
local v1 = require(game:GetService("CorePackages").Packages.enumerate)(script.Name, config)
require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum)(v1, config)

return v1