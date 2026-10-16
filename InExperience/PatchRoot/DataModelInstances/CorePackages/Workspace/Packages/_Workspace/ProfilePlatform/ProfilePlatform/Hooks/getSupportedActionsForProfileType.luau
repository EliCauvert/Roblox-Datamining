local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(ProfilePlatform.Common.Enums)
local SupportedProfileTypesModule = require(ProfilePlatform.Components.CTARow.ProfileActions.SupportedProfileTypes)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: SupportedProfileTypesModule (copy)
	return SupportedProfileTypesModule[p1] or {}
end