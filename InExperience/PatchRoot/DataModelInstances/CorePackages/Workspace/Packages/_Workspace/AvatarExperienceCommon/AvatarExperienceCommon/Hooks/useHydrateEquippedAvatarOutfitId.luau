local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local ReactModule = require(AvatarExperienceCommon.Parent.React)
local GetEquippedAvatarOutfitIdStoreModule = require(AvatarExperienceCommon.Stores.EquippedAvatarOutfitIdStore.getEquippedAvatarOutfitIdStore)

return function() --[[ Line: 8 | Named "useHydrateEquippedAvatarOutfitId" ]]
	-- upvalues: GetEquippedAvatarOutfitIdStoreModule (copy), ReactModule (copy)
	local EquippedAvatarOutfitIdStoreModule = GetEquippedAvatarOutfitIdStoreModule(false)
	ReactModule.useEffect(function() --[[ Line: 11 ]]
		-- upvalues: EquippedAvatarOutfitIdStoreModule (copy)
		EquippedAvatarOutfitIdStoreModule.fetchCurrentlyWearingSavedOutfitId()
	end, { EquippedAvatarOutfitIdStoreModule })
end