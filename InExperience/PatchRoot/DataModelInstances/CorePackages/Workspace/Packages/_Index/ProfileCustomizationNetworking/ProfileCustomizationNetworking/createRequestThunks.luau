local networkRequests = script.Parent.networkRequests
local createUpdateProfileCustomizationModule = require(networkRequests.createUpdateProfileCustomization)
local createGetProfileCustomizationModule = require(networkRequests.createGetProfileCustomization)

return function(p0) --[[ line: 6 ]]
	-- upvalues: createUpdateProfileCustomizationModule (ref), createGetProfileCustomizationModule (ref)
	return {
		UpdateProfileCustomization = createUpdateProfileCustomizationModule(p0),
		GetProfileCustomization = createGetProfileCustomizationModule(p0)
	}
end