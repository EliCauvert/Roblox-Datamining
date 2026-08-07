local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local cryoModule = require(profilePlatform.Parent.Cryo)
local _ = require(profilePlatform.Common.Types)
local getDeepValueModule = require(profilePlatform.Utils.getDeepValue)
local fFlagProfilePlatformEnableLazyLoadingComponentsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableLazyLoadingComponents)

return function(p0, p1) --[[ line: 11 ]]
	-- upvalues: getDeepValueModule (ref), fFlagProfilePlatformEnableLazyLoadingComponentsModule (ref), cryoModule (ref)
	local var4 = getDeepValueModule(p0, `{p1.profileId}`) or {}
	
	return cryoModule.Dictionary.join(p0, {
		[p1.profileId] = {
			profileType = p1.profileType,
			profileId = p1.profileId,
			componentOrdering = if fFlagProfilePlatformEnableLazyLoadingComponentsModule and p1.onlyEssentialComponents then var4.componentOrdering or p1.componentOrdering else p1.componentOrdering or var4.componentOrdering,
			components = cryoModule.Dictionary.join(var4.components or {}, p1.components)
		}
	})
end