local parent = script.Parent.Parent
local API_URLModule = require(parent.API_URL)
local _ = require(parent.Types.networkRequestsTypes)

return function(p0) --[[ line: 7 ]]
	-- upvalues: API_URLModule (ref)
	return p0.roduxNetworking.POST("UploadContactsByUser", function(p1, p2) --[[ line: 12 ]]
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule):path("contacts-api"):path("v1"):path("contacts"):body({
			countryCode = p2.countryCode,
			contacts = p2.contacts,
			source = p2.source
		})
	end)
end