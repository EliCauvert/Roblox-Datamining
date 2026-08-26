local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local reactModule = require(profilePlatform.Parent.React)
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local contactProfileHeaderModule = require(profilePlatform.Components.ContactProfileHeader.ContactProfileHeader)

return function(p1)
	-- upvalues: useProfileJsonComponentModule (ref), enumsModule (ref), reactModule (ref), contactProfileHeaderModule (ref)
	local var1 = useProfileJsonComponentModule(enumsModule.Components.ContactProfileHeader)
	
	return reactModule.createElement(contactProfileHeaderModule, {
		layoutOrder = p1.layoutOrder,
		contactName = var1.contactName,
		avatarThumbnailUrl = var1.avatarThumbnailUrl
	})
end