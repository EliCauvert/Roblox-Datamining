local Parent = script.Parent
local CreateGetPhoneInformationModule = require(Parent.networkRequests.createGetPhoneInformation)
local _ = require(Parent.Types.networkRequestsTypes)

return function(p1)
	-- upvalues: CreateGetPhoneInformationModule (copy)
	return {
		GetPhoneInformation = CreateGetPhoneInformationModule(p1)
	}
end