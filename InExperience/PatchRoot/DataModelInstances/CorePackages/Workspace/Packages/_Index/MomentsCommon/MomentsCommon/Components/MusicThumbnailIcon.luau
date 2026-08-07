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

return function(p0) --[[ line: 31 ]]
	-- upvalues: getRbxThumb (ref), foundationModule (ref), useImageLoadingStateModule (ref), t (ref), reactModule (ref), image (ref), t_1 (ref), skeleton (ref)
	local var7 = getRbxThumb(foundationModule.Enums.ThumbnailType.Asset, p0.assetId)
	local size = t[p0.size]
	
	return reactModule.createElement(image, {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		cornerRadius = UDim.new(0, t_1[p0.size]),
		Image = var7,
		Position = UDim2.fromScale(0.5, 0.5),
		ScaleType = Enum.ScaleType.Fit,
		Size = UDim2.fromOffset(size, size)
	}, {
		Skeleton = if not useImageLoadingStateModule(var7) then reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1) }) else nil
	})
end