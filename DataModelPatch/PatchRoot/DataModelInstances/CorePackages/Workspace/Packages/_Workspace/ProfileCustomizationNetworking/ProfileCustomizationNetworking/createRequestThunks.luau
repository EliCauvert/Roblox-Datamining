local NetworkRequests = script.Parent.networkRequests
local CreateUpdateProfileCustomizationModule = require(NetworkRequests.createUpdateProfileCustomization)
local CreateGetProfileCustomizationModule = require(NetworkRequests.createGetProfileCustomization)

return function(p1)
	-- upvalues: CreateUpdateProfileCustomizationModule (copy), CreateGetProfileCustomizationModule (copy)
	return {
		UpdateProfileCustomization = CreateUpdateProfileCustomizationModule(p1),
		GetProfileCustomization = CreateGetProfileCustomizationModule(p1)
	}
end