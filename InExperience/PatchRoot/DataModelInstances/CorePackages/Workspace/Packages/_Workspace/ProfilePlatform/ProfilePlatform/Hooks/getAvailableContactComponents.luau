local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(ProfilePlatform.Types.Component)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local GetSupportedActionsForProfileTypeModule = require(ProfilePlatform.Hooks.getSupportedActionsForProfileType)

return function()
	-- upvalues: EnumsModule (copy), GetSupportedActionsForProfileTypeModule (copy)
	return {
		{ component = EnumsModule.Components.ContactProfileHeader },
		{ component = EnumsModule.Components.ContactDescription },
		{
			isActionsV2Supported = true,
			component = EnumsModule.Components.Actions,
			supportedActions = GetSupportedActionsForProfileTypeModule(EnumsModule.ProfileTypes.Contact)
		}
	}
end