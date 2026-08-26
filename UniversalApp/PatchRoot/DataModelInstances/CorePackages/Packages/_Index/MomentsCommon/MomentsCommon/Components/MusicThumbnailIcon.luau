local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local getRbxThumb = foundationModule.Utility.getRbxThumb
local useImageLoadingStateModule = require(momentsCommon.Hooks.useImageLoadingState)
local musicThumbnailIconSizeModule = require(momentsCommon.Enums.MusicThumbnailIconSize)
local t = {
	[musicThumbnailIconSizeModule.Small] = 24,
	[musicThumbnailIconSizeModule.Large] = 40
}
local t_1 = {
	[musicThumbnailIconSizeModule.Small] = 2,
	[musicThumbnailIconSizeModule.Large] = 4
}

return function(p1)
	-- upvalues: getRbxThumb (ref), foundationModule (ref), useImageLoadingStateModule (ref), t (ref), reactModule (ref), image (ref), t_1 (ref), skeleton (ref)
	local var1 = getRbxThumb(foundationModule.Enums.ThumbnailType.Asset, p1.assetId)
	local size = t[p1.size]
	
	return if useImageLoadingStateModule(var1) then reactModule.createElement(image, {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		cornerRadius = UDim.new(0, t_1[p1.size]),
		Image = var1,
		Position = UDim2.fromScale(0.5, 0.5),
		ScaleType = Enum.ScaleType.Fit,
		Size = UDim2.fromOffset(size, size)
	}) else reactModule.createElement(skeleton, {
		LayoutOrder = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(size, size)
	})
end