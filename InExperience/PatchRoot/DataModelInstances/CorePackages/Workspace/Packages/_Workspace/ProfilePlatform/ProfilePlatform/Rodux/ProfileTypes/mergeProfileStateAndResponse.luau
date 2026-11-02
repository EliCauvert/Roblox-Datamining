local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local CryoModule = require(ProfilePlatform.Parent.Cryo)
local _ = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Common.Types)
local GetDeepValueModule = require(ProfilePlatform.Utils.getDeepValue)
local FFlagProfilePlatformEnableLazyLoadingComponentsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableLazyLoadingComponents)

return function(p1, p2, p3)
	-- upvalues: GetDeepValueModule (copy), FFlagProfilePlatformEnableLazyLoadingComponentsModule (copy), CryoModule (copy)
	local DeepValueModule = GetDeepValueModule(p1, `{p2.profileId}`) or {}
	local ComponentOrdering = if FFlagProfilePlatformEnableLazyLoadingComponentsModule and p2.onlyEssentialComponents then DeepValueModule.componentOrdering or p2.componentOrdering else p2.componentOrdering or DeepValueModule.componentOrdering
	local Components = DeepValueModule.components or {}
	local Nones = {}
	local P2 = p3 or {}
	for _, value in P2 do
		Nones[value] = CryoModule.None
	end
	return CryoModule.Dictionary.join(p1, {
		[p2.profileId] = {
			profileType = p2.profileType,
			profileId = p2.profileId,
			componentOrdering = ComponentOrdering,
			components = CryoModule.Dictionary.join(Components, p2.components, Nones)
		}
	})
end