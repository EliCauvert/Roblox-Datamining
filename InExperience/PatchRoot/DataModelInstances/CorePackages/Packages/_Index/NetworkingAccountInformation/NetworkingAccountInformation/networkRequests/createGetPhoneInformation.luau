local parent = script.Parent.Parent
local _ = require(parent.Types.networkRequestsTypes)
local ACCOUNT_INFORMATION_URLModule = require(parent.ACCOUNT_INFORMATION_URL)

return function(p1)
	-- upvalues: ACCOUNT_INFORMATION_URLModule (ref)
	return p1.roduxNetworking.GET({ Name = "GetPhoneInformation" }, function(p2)
		-- upvalues: ACCOUNT_INFORMATION_URLModule (copy)
		return p2(ACCOUNT_INFORMATION_URLModule):path("v1"):path("phone")
	end)
end