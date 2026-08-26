local parent = script.Parent
local createGetPhoneInformationModule = require(parent.networkRequests.createGetPhoneInformation)
local _ = require(parent.Types.networkRequestsTypes)

return function(p1)
	-- upvalues: createGetPhoneInformationModule (ref)
	return {
		GetPhoneInformation = createGetPhoneInformationModule(p1)
	}
end