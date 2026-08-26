local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local _ = require(parent.Foundation)
local reactModule = require(parent.React)
local loadableImage = require(parent.UIBlox).App.Loading.LoadableImage
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone

return function(p1)
	-- upvalues: reactModule (ref), loadableImage (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref)
	return reactModule.createElement(loadableImage, {
		showFailedStateWhenLoadingFailed = true,
		useShimmerAnimationWhileLoading = true,
		ZIndex = -2,
		BackgroundColor3 = if p1.thumbnailBackgroundStyle then p1.thumbnailBackgroundStyle.Color3 else nil,
		BackgroundTransparency = if p1.thumbnailBackgroundStyle then p1.thumbnailBackgroundStyle.Transparency else 1,
		Image = p1.image,
		Size = UDim2.new(1, 0, 1, if p1.isContained then p1.cardCornerRadius else 0),
		cornerRadius = UDim.new(0, p1.cardCornerRadius),
		ScaleType = if p1.isContained then Enum.ScaleType.Tile else nil,
		TileSize = if p1.isContained then UDim2.new(1, 0, 1, -p1.cardCornerRadius) else nil,
		onLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p1.onTileImageLoaded else nil
	})
end