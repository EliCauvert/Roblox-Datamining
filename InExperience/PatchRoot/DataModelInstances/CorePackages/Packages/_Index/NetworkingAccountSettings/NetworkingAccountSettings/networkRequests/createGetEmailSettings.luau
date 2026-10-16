local Parent = script.Parent.Parent
local _ = require(Parent.Types.networkRequestsTypes)
local ACCOUNTSETTINGSURLModule = require(Parent.ACCOUNT_SETTINGS_URL)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: ACCOUNTSETTINGSURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetEmailSettings" }, function(Callback) --[[ Line: 9 ]]
		-- upvalues: ACCOUNTSETTINGSURLModule (upval)
		return Callback(ACCOUNTSETTINGSURLModule):path("v1"):path("email")
	end)
end