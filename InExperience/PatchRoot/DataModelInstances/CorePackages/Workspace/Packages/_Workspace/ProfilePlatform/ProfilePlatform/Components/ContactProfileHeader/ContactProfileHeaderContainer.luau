local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local reactModule = require(profilePlatform.Parent.React)
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local contactProfileHeaderModule = require(profilePlatform.Components.ContactProfileHeader.ContactProfileHeader)

return function(p0)
	-- upvalues: useProfileJsonComponentModule (ref), enumsModule (ref), reactModule (ref), contactProfileHeaderModule (ref)
	local var5 = useProfileJsonComponentModule(enumsModule.Components.ContactProfileHeader)
	
	return reactModule.createElement(contactProfileHeaderModule, {
		layoutOrder = p0.layoutOrder,
		contactName = var5.contactName,
		avatarThumbnailUrl = var5.avatarThumbnailUrl
	})
end