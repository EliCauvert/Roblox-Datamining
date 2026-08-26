local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local cryoModule = require(profilePlatform.Parent.Cryo)
local _ = require(profilePlatform.Common.Types)
local getDeepValueModule = require(profilePlatform.Utils.getDeepValue)
local fFlagProfilePlatformEnableLazyLoadingComponentsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableLazyLoadingComponents)

return function(p1, p2)
	-- upvalues: getDeepValueModule (ref), fFlagProfilePlatformEnableLazyLoadingComponentsModule (ref), cryoModule (ref)
	local var1 = getDeepValueModule(p1, `{p2.profileId}`) or {}
	
	return cryoModule.Dictionary.join(p1, {
		[p2.profileId] = {
			profileType = p2.profileType,
			profileId = p2.profileId,
			componentOrdering = if fFlagProfilePlatformEnableLazyLoadingComponentsModule and p2.onlyEssentialComponents then var1.componentOrdering or p2.componentOrdering else p2.componentOrdering or var1.componentOrdering,
			components = cryoModule.Dictionary.join(var1.components or {}, p2.components)
		}
	})
end