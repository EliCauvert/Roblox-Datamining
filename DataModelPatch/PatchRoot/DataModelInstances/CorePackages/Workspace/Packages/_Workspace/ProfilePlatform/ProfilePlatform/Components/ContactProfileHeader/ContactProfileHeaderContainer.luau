local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ReactModule = require(ProfilePlatform.Parent.React)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local ContactProfileHeaderModule = require(ProfilePlatform.Components.ContactProfileHeader.ContactProfileHeader)

return function(p1)
	-- upvalues: UseProfileJsonComponentModule (copy), EnumsModule (copy), ReactModule (copy), ContactProfileHeaderModule (copy)
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.ContactProfileHeader)
	
	return ReactModule.createElement(ContactProfileHeaderModule, {
		layoutOrder = p1.layoutOrder,
		contactName = UseProfileJsonComponentModuleResult.contactName,
		avatarThumbnailUrl = UseProfileJsonComponentModuleResult.avatarThumbnailUrl
	})
end