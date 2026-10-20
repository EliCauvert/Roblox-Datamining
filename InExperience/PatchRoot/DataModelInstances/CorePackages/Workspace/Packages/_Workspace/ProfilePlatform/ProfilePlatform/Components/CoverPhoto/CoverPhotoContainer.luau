local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local Constants = require(Parent.UserLib).Utils.Constants
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseProfileScrollContextModule = require(ProfilePlatform.Contexts.ProfileScrollContext.useProfileScrollContext)
local CoverPhotoModule = require(ProfilePlatform.Components.CoverPhoto.CoverPhoto)

return function(p1)
	-- upvalues: UseProfileJsonComponentModule (copy), EnumsModule (copy), UseProfileFormFactorModule (copy), UseProfileScrollContextModule (copy), Constants (copy), ReactModule (copy), CoverPhotoModule (copy)
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.CoverPhoto) or {}
	local UseProfileFormFactorModuleResult = UseProfileFormFactorModule()
	local UseProfileScrollContextModuleResult = UseProfileScrollContextModule()
	local ScrollYRatio = UseProfileScrollContextModuleResult.scrollY / 2
	
	return if UseProfileJsonComponentModuleResult.coverPhotoId == nil then nil else ReactModule.createElement(CoverPhotoModule, {
		layoutOrder = p1.layoutOrder,
		coverPhotoThumbnail = string.format("rbxthumb://type=%s&id=%s&w=%d&h=%d", Constants.RbxthumbTypes.Asset, UseProfileJsonComponentModuleResult.coverPhotoId, 1440, 456),
		profileFormFactorInfo = UseProfileFormFactorModuleResult,
		parallaxOffset = ScrollYRatio,
		peekViewOpenPercent = UseProfileScrollContextModuleResult.peekViewOpenPercent
	})
end