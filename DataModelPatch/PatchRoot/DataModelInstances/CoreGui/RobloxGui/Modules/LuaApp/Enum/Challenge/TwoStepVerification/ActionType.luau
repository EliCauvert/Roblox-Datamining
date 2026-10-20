local config = {
	Unknown = "Unknown",
	Login = "Login",
	RobuxSpend = "RobuxSpend",
	ItemTrade = "ItemTrade"
}
local v1 = require(game:GetService("CorePackages").Packages.enumerate)(script.Name, config)
require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum)(v1, config)

return v1