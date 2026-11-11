local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local CryoModule = require(ProfilePlatform.Parent.Cryo)
local _ = require(ProfilePlatform.Common.Types)
local GetDeepValueModule = require(ProfilePlatform.Utils.getDeepValue)
local FFlagProfilePlatformEnableLazyLoadingComponentsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableLazyLoadingComponents)

return function(p1, p2)
	-- upvalues: GetDeepValueModule (copy), FFlagProfilePlatformEnableLazyLoadingComponentsModule (copy), CryoModule (copy)
	local DeepValueModule = GetDeepValueModule(p1, `{p2.profileId}`) or {}
	
	return CryoModule.Dictionary.join(p1, {
		[p2.profileId] = {
			profileType = p2.profileType,
			profileId = p2.profileId,
			componentOrdering = if FFlagProfilePlatformEnableLazyLoadingComponentsModule and p2.onlyEssentialComponents then DeepValueModule.componentOrdering or p2.componentOrdering else p2.componentOrdering or DeepValueModule.componentOrdering,
			components = CryoModule.Dictionary.join(DeepValueModule.components or {}, p2.components)
		}
	})
end