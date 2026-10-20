local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(ProfilePlatform.Types.Component)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local GetSupportedActionsForProfileTypeModule = require(ProfilePlatform.Hooks.getSupportedActionsForProfileType)
local FFlagProfilePlatformCTAsRefactorModule = require(ProfilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)

return function()
	-- upvalues: EnumsModule (copy), FFlagProfilePlatformCTAsRefactorModule (copy), GetSupportedActionsForProfileTypeModule (copy)
	return {
		{ component = EnumsModule.Components.ContactProfileHeader },
		{ component = EnumsModule.Components.ContactDescription },
		{
			component = EnumsModule.Components.Actions,
			supportedActions = if FFlagProfilePlatformCTAsRefactorModule then GetSupportedActionsForProfileTypeModule(EnumsModule.ProfileTypes.Contact) else nil,
			isActionsV2Supported = if FFlagProfilePlatformCTAsRefactorModule then true else nil
		}
	}
end