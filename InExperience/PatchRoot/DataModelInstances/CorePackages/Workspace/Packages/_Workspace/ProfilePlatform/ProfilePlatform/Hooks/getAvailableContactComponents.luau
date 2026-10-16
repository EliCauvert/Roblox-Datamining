local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(profilePlatform.Types.Component)
local enumsModule = require(profilePlatform.Common.Enums)
local getSupportedActionsForProfileTypeModule = require(profilePlatform.Hooks.getSupportedActionsForProfileType)
local fFlagProfilePlatformCTAsRefactorModule = require(profilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)

return function()
	-- upvalues: enumsModule (ref), fFlagProfilePlatformCTAsRefactorModule (ref), getSupportedActionsForProfileTypeModule (ref)
	return {
		{ component = enumsModule.Components.ContactProfileHeader },
		{ component = enumsModule.Components.ContactDescription },
		{
			component = enumsModule.Components.Actions,
			supportedActions = if fFlagProfilePlatformCTAsRefactorModule then getSupportedActionsForProfileTypeModule(enumsModule.ProfileTypes.Contact) else nil,
			isActionsV2Supported = if fFlagProfilePlatformCTAsRefactorModule then true else nil
		}
	}
end