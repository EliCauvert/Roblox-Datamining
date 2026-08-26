local networkRequests = script.Parent.networkRequests
local createUpdateProfileCustomizationModule = require(networkRequests.createUpdateProfileCustomization)
local createGetProfileCustomizationModule = require(networkRequests.createGetProfileCustomization)

return function(p1)
	-- upvalues: createUpdateProfileCustomizationModule (ref), createGetProfileCustomizationModule (ref)
	return {
		UpdateProfileCustomization = createUpdateProfileCustomizationModule(p1),
		GetProfileCustomization = createGetProfileCustomizationModule(p1)
	}
end