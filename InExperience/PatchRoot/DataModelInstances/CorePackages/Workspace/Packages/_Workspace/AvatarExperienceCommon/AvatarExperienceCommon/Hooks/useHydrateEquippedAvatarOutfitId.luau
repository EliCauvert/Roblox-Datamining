local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local reactModule = require(avatarExperienceCommon.Parent.React)
local getEquippedAvatarOutfitIdStoreModule = require(avatarExperienceCommon.Stores.EquippedAvatarOutfitIdStore.getEquippedAvatarOutfitIdStore)

return function()
	-- upvalues: getEquippedAvatarOutfitIdStoreModule (ref), reactModule (ref)
	local var1 = getEquippedAvatarOutfitIdStoreModule(false)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		var1.fetchCurrentlyWearingSavedOutfitId()
	end, { var1 })
end