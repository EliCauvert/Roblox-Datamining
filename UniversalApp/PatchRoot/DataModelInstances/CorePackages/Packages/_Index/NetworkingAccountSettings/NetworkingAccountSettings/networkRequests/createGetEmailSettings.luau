local parent = script.Parent.Parent
local _ = require(parent.Types.networkRequestsTypes)
local ACCOUNT_SETTINGS_URLModule = require(parent.ACCOUNT_SETTINGS_URL)

return function(p1)
	-- upvalues: ACCOUNT_SETTINGS_URLModule (ref)
	return p1.roduxNetworking.GET({ Name = "GetEmailSettings" }, function(p2)
		-- upvalues: ACCOUNT_SETTINGS_URLModule (copy)
		return p2(ACCOUNT_SETTINGS_URLModule):path("v1"):path("email")
	end)
end