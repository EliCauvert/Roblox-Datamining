local parent = script.Parent.Parent
local _ = require(parent.Types.networkRequestsTypes)
local ACCOUNT_INFORMATION_URLModule = require(parent.ACCOUNT_INFORMATION_URL)

return function(p0) --[[ line: 7 ]]
	-- upvalues: ACCOUNT_INFORMATION_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetPhoneInformation" }, function(p1) --[[ line: 10 ]]
		-- upvalues: ACCOUNT_INFORMATION_URLModule (copy)
		return p1(ACCOUNT_INFORMATION_URLModule):path("v1"):path("phone")
	end)
end