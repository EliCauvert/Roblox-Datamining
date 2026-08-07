-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:53 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local API_URLModule = require(parent.API_URL)
local _ = require(parent.Types.networkRequestsTypes)
game:DefineFastString("ContactImporterUploadUrl", "contacts")
local contactImporterUploadUrlFastString = game:GetFastString("ContactImporterUploadUrl")

return function(p0) --[[ line: 8 ]]
	-- upvalues: API_URLModule (ref), contactImporterUploadUrlFastString (ref)
	return p0.roduxNetworking.POST({ Name = "UploadContactsByUser" }, function(p1, p2) --[[ line: 13 ]]
		-- upvalues: API_URLModule (copy), contactImporterUploadUrlFastString (copy)
		return p1(API_URLModule):path("contacts-api"):path("v1"):path(contactImporterUploadUrlFastString):body({ countryCode = p2.countryCode, contacts = p2.contacts })
	end)
end