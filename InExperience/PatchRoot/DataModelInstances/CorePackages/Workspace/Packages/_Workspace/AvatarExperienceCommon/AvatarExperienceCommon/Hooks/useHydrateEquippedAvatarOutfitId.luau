local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local ReactModule = require(AvatarExperienceCommon.Parent.React)
local GetEquippedAvatarOutfitIdStoreModule = require(AvatarExperienceCommon.Stores.EquippedAvatarOutfitIdStore.getEquippedAvatarOutfitIdStore)

return function()
	-- upvalues: GetEquippedAvatarOutfitIdStoreModule (copy), ReactModule (copy)
	local EquippedAvatarOutfitIdStoreModule = GetEquippedAvatarOutfitIdStoreModule(false)
	ReactModule.useEffect(function()
		-- upvalues: EquippedAvatarOutfitIdStoreModule (copy)
		EquippedAvatarOutfitIdStoreModule.fetchCurrentlyWearingSavedOutfitId()
	end, { EquippedAvatarOutfitIdStoreModule })
end