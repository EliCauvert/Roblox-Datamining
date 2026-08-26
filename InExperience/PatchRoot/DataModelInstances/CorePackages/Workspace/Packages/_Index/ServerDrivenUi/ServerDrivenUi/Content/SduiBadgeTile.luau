local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local cryoModule = require(parent.Cryo)
local loadableImage = require(parent.UIBlox).App.Loading.LoadableImage
local sduiTileModule = require(serverDrivenUi.Content.SduiTile)
local fFlagSduiTileImagePaddingInset = require(parent.SharedFlags).FFlagSduiTileImagePaddingInset

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), fFlagSduiTileImagePaddingInset (ref), cryoModule (ref), reactModule (ref), loadableImage (ref), sduiTileModule (ref)
	local var1
	local var2 = useTokens()
	local cornerRadius = p1.cornerRadius or var2.Radius.Medium
	local imageCornerRadius = p1.imageCornerRadius or 1000
	local imagePadding = p1.imagePadding or var2.Padding.Medium
	local var3 = p1.isContained ~= nil or p1.isContained
	local _ = nil
	
	if fFlagSduiTileImagePaddingInset then
		var1 = cryoModule.Dictionary.join(p1, {
			testId = "--sdui-badge-tile",
			imagePadding = imagePadding,
			imageCornerRadius = imageCornerRadius,
			isContained = var3
		})
	else
		local var4 = if var3 then cornerRadius else 0
		var1 = cryoModule.Dictionary.join(p1, {
			testId = "--sdui-badge-tile",
			imageComponent = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ClipsDescendants = true,
				ZIndex = -3,
				Size = UDim2.new(1, 0, 1, var4),
				BackgroundColor3 = if p1.thumbnailBackgroundStyle then p1.thumbnailBackgroundStyle.Color3 else nil,
				BackgroundTransparency = if p1.thumbnailBackgroundStyle then p1.thumbnailBackgroundStyle.Transparency else 1
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, cornerRadius) }),
				ThumbnailFrame = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -2 * imagePadding, 1, -2 * imagePadding - var4),
					Position = if imagePadding then UDim2.fromOffset(imagePadding, imagePadding) else nil
				}, {
					Thumbnail = if p1.imageComponent then p1.imageComponent elseif p1.image then reactModule.createElement(loadableImage, {
						BackgroundTransparency = 1,
						showFailedStateWhenLoadingFailed = true,
						useShimmerAnimationWhileLoading = true,
						Image = p1.image,
						Size = UDim2.new(1, 0, 1, 0),
						cornerRadius = UDim.new(0, imageCornerRadius)
					}) else nil
				})
			}),
			isContained = var3
		})
	end
	return reactModule.createElement(sduiTileModule, var1)
end)