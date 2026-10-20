local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local UseSelectorFunction = require(ProfilePlatform.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local GetDeepValueModule = require(ProfilePlatform.Utils.getDeepValue)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)

return function()
	-- upvalues: UseProfileWrapperContextModule (copy), UseSelectorFunction (copy), GetDeepValueModule (copy), ConstantsModule (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local ProfileId = UseProfileWrapperContextModuleResult.profileId
	local ProfileType = UseProfileWrapperContextModuleResult.profileType
	
	return UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValueModule (upval), ConstantsModule (upval), ProfileType (copy), ProfileId (copy)
		return GetDeepValueModule(p1, `{ConstantsModule.RODUX_KEY}.Profiles.{ProfileType}.{ProfileId}`) or {}
	end)
end