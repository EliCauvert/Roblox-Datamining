local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local constants = require(parent.UserLib).Utils.Constants
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useProfileScrollContextModule = require(profilePlatform.Contexts.ProfileScrollContext.useProfileScrollContext)
local coverPhotoModule = require(profilePlatform.Components.CoverPhoto.CoverPhoto)

return function(p1)
	-- upvalues: useProfileJsonComponentModule (ref), enumsModule (ref), useProfileFormFactorModule (ref), useProfileScrollContextModule (ref), constants (ref), reactModule (ref), coverPhotoModule (ref)
	local coverPhoto = useProfileJsonComponentModule(enumsModule.Components.CoverPhoto) or {}
	local var1 = useProfileScrollContextModule()
	
	return if coverPhoto.coverPhotoId == nil then nil else reactModule.createElement(coverPhotoModule, {
		layoutOrder = p1.layoutOrder,
		coverPhotoThumbnail = string.format("rbxthumb://type=%s&id=%s&w=%d&h=%d", constants.RbxthumbTypes.Asset, coverPhoto.coverPhotoId, 1440, 456),
		profileFormFactorInfo = useProfileFormFactorModule(),
		parallaxOffset = var1.scrollY / 2,
		peekViewOpenPercent = var1.peekViewOpenPercent
	})
end