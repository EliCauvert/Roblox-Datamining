local parent = script.Parent
local createGetPhoneInformationModule = require(parent.networkRequests.createGetPhoneInformation)
local _ = require(parent.Types.networkRequestsTypes)

return function(p0) --[[ line: 6 ]]
	-- upvalues: createGetPhoneInformationModule (ref)
	return {
		GetPhoneInformation = createGetPhoneInformationModule(p0)
	}
end