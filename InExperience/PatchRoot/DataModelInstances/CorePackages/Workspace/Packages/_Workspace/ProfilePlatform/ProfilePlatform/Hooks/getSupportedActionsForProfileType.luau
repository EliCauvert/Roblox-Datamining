local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(profilePlatform.Common.Enums)
local supportedProfileTypesModule = require(profilePlatform.Components.CTARow.ProfileActions.SupportedProfileTypes)

return function(p0) --[[ line: 6 ]]
	-- upvalues: supportedProfileTypesModule (ref)
	return supportedProfileTypesModule[p0] or {}
end