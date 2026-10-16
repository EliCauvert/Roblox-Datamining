local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local _ = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local LoadableImage = require(Parent.UIBlox).App.Loading.LoadableImage

return function(p1) --[[ Line: 18 | Named "SduiDefaultTileImage" ]]
	-- upvalues: ReactModule (copy), LoadableImage (copy)
	return ReactModule.createElement(LoadableImage, {
		showFailedStateWhenLoadingFailed = true,
		useShimmerAnimationWhileLoading = true,
		ZIndex = -2,
		BackgroundColor3 = p1.thumbnailBackgroundStyle and p1.thumbnailBackgroundStyle.Color3 or nil,
		BackgroundTransparency = p1.thumbnailBackgroundStyle and p1.thumbnailBackgroundStyle.Transparency or 1,
		Image = p1.image,
		Size = UDim2.new(1, 0, 1, if p1.isContained then p1.cardCornerRadius else 0),
		cornerRadius = UDim.new(0, p1.cardCornerRadius),
		ScaleType = if p1.isContained then Enum.ScaleType.Tile else nil,
		TileSize = if p1.isContained then UDim2.new(1, 0, 1, -p1.cardCornerRadius) else nil
	})
end