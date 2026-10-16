local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Image = FoundationModule.Image
local Skeleton = FoundationModule.Skeleton
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local UseImageLoadingStateModule = require(MomentsCommon.Hooks.useImageLoadingState)
local MusicThumbnailIconSizeModule = require(MomentsCommon.Enums.MusicThumbnailIconSize)
local config = {
	[MusicThumbnailIconSizeModule.Small] = 24,
	[MusicThumbnailIconSizeModule.Large] = 40
}
local config1 = {
	[MusicThumbnailIconSizeModule.Small] = 2,
	[MusicThumbnailIconSizeModule.Large] = 4
}

return function(p1) --[[ Line: 31 ]]
	-- upvalues: GetRbxThumbFunction (copy), FoundationModule (copy), UseImageLoadingStateModule (copy), config (copy), ReactModule (copy), Image (copy), config1 (copy), Skeleton (copy)
	local RbxThumb = GetRbxThumbFunction(FoundationModule.Enums.ThumbnailType.Asset, p1.assetId)
	local Entry = config[p1.size]
	
	return ReactModule.createElement(Image, {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		cornerRadius = UDim.new(0, config1[p1.size]),
		Image = RbxThumb,
		Position = UDim2.fromScale(0.5, 0.5),
		ScaleType = Enum.ScaleType.Fit,
		Size = UDim2.fromOffset(Entry, Entry)
	}, {
		Skeleton = if UseImageLoadingStateModule(RbxThumb) then nil else ReactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1) })
	})
end