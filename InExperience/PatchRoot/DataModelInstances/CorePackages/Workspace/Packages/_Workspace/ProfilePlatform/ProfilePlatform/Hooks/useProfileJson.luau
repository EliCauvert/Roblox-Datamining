local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local useSelector = require(profilePlatform.Parent.RoactUtils).Hooks.RoactRodux.useSelector
local constantsModule = require(profilePlatform.Common.Constants)
local getDeepValueModule = require(profilePlatform.Utils.getDeepValue)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)

return function()
	-- upvalues: useProfileWrapperContextModule (ref), useSelector (ref), getDeepValueModule (ref), constantsModule (ref)
	local var4 = useProfileWrapperContextModule()
	local profileId = var4.profileId
	local profileType = var4.profileType
	
	return useSelector(function(p0)
		-- upvalues: getDeepValueModule (copy), constantsModule (copy), profileType (ref), profileId (ref)
		return getDeepValueModule(p0, `{constantsModule.RODUX_KEY}.Profiles.{profileType}.{profileId}`) or {}
	end)
end