local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local _ = require(profilePlatform.Types.Component)
local enumsModule = require(profilePlatform.Common.Enums)
local getSupportedActionsForProfileTypeModule = require(profilePlatform.Hooks.getSupportedActionsForProfileType)

return function()
	-- upvalues: enumsModule (ref), getSupportedActionsForProfileTypeModule (ref)
	return {
		{ component = enumsModule.Components.ContactProfileHeader },
		{ component = enumsModule.Components.ContactDescription },
		{
			isActionsV2Supported = true,
			component = enumsModule.Components.Actions,
			supportedActions = getSupportedActionsForProfileTypeModule(enumsModule.ProfileTypes.Contact)
		}
	}
end