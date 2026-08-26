local parent = script.Parent.Parent
local API_URLModule = require(parent.API_URL)
local _ = require(parent.Types.networkRequestsTypes)
game:DefineFastString("ContactImporterUploadUrl", "contacts")
local contactImporterUploadUrlFastString = game:GetFastString("ContactImporterUploadUrl")

return function(p1)
	-- upvalues: API_URLModule (ref), contactImporterUploadUrlFastString (ref)
	return p1.roduxNetworking.POST({ Name = "UploadContactsByUser" }, function(p2, p3)
		-- upvalues: API_URLModule (copy), contactImporterUploadUrlFastString (copy)
		return p2(API_URLModule):path("contacts-api"):path("v1"):path(contactImporterUploadUrlFastString):body({ countryCode = p3.countryCode, contacts = p3.contacts })
	end)
end