local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Foundation)
local LoadableImage = require(Parent.UIBlox).App.Loading.LoadableImage

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), LoadableImage (copy)
	local CardCornerRadius = if p1.isContained then p1.cardCornerRadius else 0
	
	return ReactModule.createElement("Frame", {
		[ReactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil,
		Size = UDim2.new(1, 0, 1, CardCornerRadius),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		BackgroundColor3 = if p1.backgroundStyle then p1.backgroundStyle.Color3 else nil,
		BackgroundTransparency = if p1.backgroundStyle then p1.backgroundStyle.Transparency else 1,
		ZIndex = -3
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cardCornerRadius) }),
		ThumbnailFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, p1.imagePadding * -2, 1, p1.imagePadding * -2 - CardCornerRadius),
			Position = UDim2.fromOffset(p1.imagePadding, p1.imagePadding)
		}, {
			Thumbnail = if p1.imageComponent then p1.imageComponent elseif p1.image then ReactModule.createElement(LoadableImage, {
				BackgroundTransparency = 1,
				showFailedStateWhenLoadingFailed = true,
				useShimmerAnimationWhileLoading = true,
				Image = p1.image,
				Size = UDim2.new(1, 0, 1, 0),
				cornerRadius = UDim.new(0, p1.imageCornerRadius)
			}) else nil
		})
	})
end)