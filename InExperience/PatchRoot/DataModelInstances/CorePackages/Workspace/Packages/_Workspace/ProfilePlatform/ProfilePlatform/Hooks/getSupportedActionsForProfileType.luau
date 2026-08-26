local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(profilePlatform.Common.Enums)
local supportedProfileTypesModule = require(profilePlatform.Components.CTARow.ProfileActions.SupportedProfileTypes)

return function(p1)
	-- upvalues: supportedProfileTypesModule (ref)
	return supportedProfileTypesModule[p1] or {}
end