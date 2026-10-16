local Parent = script.Parent.Parent
local APIURLModule = require(Parent.API_URL)
local _ = require(Parent.Types.networkRequestsTypes)
game:DefineFastString("ContactImporterUploadUrl", "contacts")
local ContactImporterUploadUrlFastString = game:GetFastString("ContactImporterUploadUrl")

return function(p1) --[[ Line: 8 ]]
	-- upvalues: APIURLModule (copy), ContactImporterUploadUrlFastString (copy)
	return p1.roduxNetworking.POST({ Name = "UploadContactsByUser" }, function(Callback, p2) --[[ Line: 13 ]]
		-- upvalues: APIURLModule (upval), ContactImporterUploadUrlFastString (upval)
		return Callback(APIURLModule):path("contacts-api"):path("v1"):path(ContactImporterUploadUrlFastString):body({ countryCode = p2.countryCode, contacts = p2.contacts })
	end)
end