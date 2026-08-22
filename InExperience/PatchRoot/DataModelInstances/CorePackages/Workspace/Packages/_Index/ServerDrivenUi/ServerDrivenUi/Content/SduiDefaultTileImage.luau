local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local _ = require(parent.Foundation)
local reactModule = require(parent.React)
local loadableImage = require(parent.UIBlox).App.Loading.LoadableImage
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone

return function(p0) --[[ line: 22 | named "SduiDefaultTileImage" ]]
	-- upvalues: reactModule (ref), loadableImage (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref)
	return reactModule.createElement(loadableImage, {
		showFailedStateWhenLoadingFailed = true,
		useShimmerAnimationWhileLoading = true,
		ZIndex = -2,
		BackgroundColor3 = if p0.thumbnailBackgroundStyle then p0.thumbnailBackgroundStyle.Color3 else nil,
		BackgroundTransparency = if p0.thumbnailBackgroundStyle then p0.thumbnailBackgroundStyle.Transparency else 1,
		Image = p0.image,
		Size = UDim2.new(1, 0, 1, if p0.isContained then p0.cardCornerRadius else 0),
		cornerRadius = UDim.new(0, p0.cardCornerRadius),
		ScaleType = if p0.isContained then Enum.ScaleType.Tile else nil,
		TileSize = if p0.isContained then UDim2.new(1, 0, 1, -p0.cardCornerRadius) else nil,
		onLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p0.onTileImageLoaded else nil
	})
end