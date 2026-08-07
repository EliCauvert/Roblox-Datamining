local parent = script.Parent.Parent
local _ = require(parent.Types.networkRequestsTypes)
local ACCOUNT_SETTINGS_URLModule = require(parent.ACCOUNT_SETTINGS_URL)

return function(p0) --[[ line: 6 ]]
	-- upvalues: ACCOUNT_SETTINGS_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetEmailSettings" }, function(p1) --[[ line: 9 ]]
		-- upvalues: ACCOUNT_SETTINGS_URLModule (copy)
		return p1(ACCOUNT_SETTINGS_URLModule):path("v1"):path("email")
	end)
end