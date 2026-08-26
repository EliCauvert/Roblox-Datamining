local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local assetPickerCarouselModule = require(script.AssetPickerCarousel)
local assetPickerGridModule = require(script.AssetPickerGrid)
local _ = require(script.AssetPickerTile)
local _ = require(avatarExperienceProfilePictureEditor.Utils.getAssetPickerStatus)

return {
	AssetPickerCarousel = assetPickerCarouselModule,
	AssetPickerGrid = assetPickerGridModule
}