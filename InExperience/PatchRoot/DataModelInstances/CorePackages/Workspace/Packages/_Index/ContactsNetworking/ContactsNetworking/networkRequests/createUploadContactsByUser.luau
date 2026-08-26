local parent = script.Parent.Parent
local API_URLModule = require(parent.API_URL)
local _ = require(parent.Types.networkRequestsTypes)

return function(p1)
	-- upvalues: API_URLModule (ref)
	return p1.roduxNetworking.POST("UploadContactsByUser", function(p2, p3)
		-- upvalues: API_URLModule (copy)
		return p2(API_URLModule):path("contacts-api"):path("v1"):path("contacts"):body({
			countryCode = p3.countryCode,
			contacts = p3.contacts,
			source = p3.source
		})
	end)
end