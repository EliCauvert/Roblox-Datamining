local config = {
	EXPERIENCE_AFFILIATE_DEEP_LINK_FALLBACK_TYPE_INVALID = 0,
	EXPERIENCE_AFFILIATE_DEEP_LINK_FALLBACK_TYPE_PROFILE = 1,
	EXPERIENCE_AFFILIATE_DEEP_LINK_FALLBACK_TYPE_HOME = 2
}
local v1 = require(game:GetService("CorePackages").Packages.enumerate)(script.Name, config)
require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum)(v1, config)

return v1