local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local _ = require(parent.Foundation)
local loadableImage = require(parent.UIBlox).App.Loading.LoadableImage

return reactModule.memo(function(value) --[[ line: 50 | named "SduiTileInsetImage" ]]
	-- upvalues: reactModule (ref), loadableImage (ref)
	local var1 = if value.isContained then value.cardCornerRadius else 0
	
	return reactModule.createElement("Frame", {
		[reactModule.Tag] = if value.testId then `data-testid={value.testId}` else nil,
		Size = UDim2.new(1, 0, 1, var1),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		BackgroundColor3 = if value.backgroundStyle then value.backgroundStyle.Color3 else nil,
		BackgroundTransparency = if value.backgroundStyle then value.backgroundStyle.Transparency else 1,
		ZIndex = -3
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, value.cardCornerRadius) }),
		ThumbnailFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, value.imagePadding * -2, 1, value.imagePadding * -2 - var1),
			Position = UDim2.fromOffset(value.imagePadding, value.imagePadding)
		}, {
			Thumbnail = if value.imageComponent then value.imageComponent elseif value.image then reactModule.createElement(loadableImage, {
				BackgroundTransparency = 1,
				showFailedStateWhenLoadingFailed = true,
				useShimmerAnimationWhileLoading = true,
				Image = value.image,
				Size = UDim2.new(1, 0, 1, 0),
				cornerRadius = UDim.new(0, value.imageCornerRadius)
			}) else nil
		})
	})
end)