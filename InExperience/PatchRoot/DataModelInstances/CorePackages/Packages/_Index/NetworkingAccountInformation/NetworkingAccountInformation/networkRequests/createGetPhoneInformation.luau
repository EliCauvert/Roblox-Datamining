local Parent = script.Parent.Parent
local _ = require(Parent.Types.networkRequestsTypes)
local ACCOUNTINFORMATIONURLModule = require(Parent.ACCOUNT_INFORMATION_URL)

return function(p1) --[[ Line: 7 ]]
	-- upvalues: ACCOUNTINFORMATIONURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetPhoneInformation" }, function(Callback) --[[ Line: 10 ]]
		-- upvalues: ACCOUNTINFORMATIONURLModule (upval)
		return Callback(ACCOUNTINFORMATIONURLModule):path("v1"):path("phone")
	end)
end