local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local CryoModule = require(Parent.Cryo)
local LoadableImage = require(Parent.UIBlox).App.Loading.LoadableImage
local SduiTileModule = require(ServerDrivenUi.Content.SduiTile)
local FFlagSduiTileImagePaddingInset = require(Parent.SharedFlags).FFlagSduiTileImagePaddingInset

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), FFlagSduiTileImagePaddingInset (copy), CryoModule (copy), ReactModule (copy), LoadableImage (copy), SduiTileModule (copy)
	local UseTokensResult = UseTokensFunction()
	local CornerRadius = p1.cornerRadius or UseTokensResult.Radius.Medium
	local ImageCornerRadius = p1.imageCornerRadius or 1000
	local ImagePadding = p1.imagePadding or UseTokensResult.Padding.Medium
	local NoIsContained = p1.isContained == nil or p1.isContained
	local JoinResult = nil
	
	if FFlagSduiTileImagePaddingInset then
		JoinResult = CryoModule.Dictionary.join(p1, {
			testId = "--sdui-badge-tile",
			imagePadding = ImagePadding,
			imageCornerRadius = ImageCornerRadius,
			isContained = NoIsContained
		})
	else
		local YOffset = if NoIsContained then CornerRadius else 0
		JoinResult = CryoModule.Dictionary.join(p1, {
			testId = "--sdui-badge-tile",
			imageComponent = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ClipsDescendants = true,
				ZIndex = -3,
				Size = UDim2.new(1, 0, 1, YOffset),
				BackgroundColor3 = p1.thumbnailBackgroundStyle and p1.thumbnailBackgroundStyle.Color3 or nil,
				BackgroundTransparency = p1.thumbnailBackgroundStyle and p1.thumbnailBackgroundStyle.Transparency or 1
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, CornerRadius) }),
				ThumbnailFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -2 * ImagePadding, 1, -2 * ImagePadding - YOffset),
					Position = if ImagePadding then UDim2.fromOffset(ImagePadding, ImagePadding) else nil
				}, {
					Thumbnail = if p1.imageComponent then p1.imageComponent elseif p1.image then ReactModule.createElement(LoadableImage, {
						BackgroundTransparency = 1,
						showFailedStateWhenLoadingFailed = true,
						useShimmerAnimationWhileLoading = true,
						Image = p1.image,
						Size = UDim2.new(1, 0, 1, 0),
						cornerRadius = UDim.new(0, ImageCornerRadius)
					}) else nil
				})
			}),
			isContained = NoIsContained
		})
	end
	return ReactModule.createElement(SduiTileModule, JoinResult)
end)