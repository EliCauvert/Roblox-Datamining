local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local cryoModule = require(parent.Cryo)
local loadableImage = require(parent.UIBlox).App.Loading.LoadableImage
local sduiTileModule = require(serverDrivenUi.Content.SduiTile)
local fFlagSduiTileImagePaddingInset = require(parent.SharedFlags).FFlagSduiTileImagePaddingInset

return reactModule.memo(function(p0) --[[ line: 20 | named "SduiBadgeTile" ]]
	-- upvalues: useTokens (ref), fFlagSduiTileImagePaddingInset (ref), cryoModule (ref), reactModule (ref), loadableImage (ref), sduiTileModule (ref)
	local var10
	local var4 = useTokens()
	local cornerRadius = p0.cornerRadius or var4.Radius.Medium
	local imageCornerRadius = p0.imageCornerRadius or 1000
	local imagePadding = p0.imagePadding or var4.Padding.Medium
	local var8 = p0.isContained ~= nil or p0.isContained
	local _ = nil
	
	if fFlagSduiTileImagePaddingInset then
		var10 = cryoModule.Dictionary.join(p0, {
			testId = "--sdui-badge-tile",
			imagePadding = imagePadding,
			imageCornerRadius = imageCornerRadius,
			isContained = var8
		})
	else
		local var9 = if var8 then cornerRadius else 0
		var10 = cryoModule.Dictionary.join(p0, {
			testId = "--sdui-badge-tile",
			imageComponent = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ClipsDescendants = true,
				ZIndex = -3,
				Size = UDim2.new(1, 0, 1, var9),
				BackgroundColor3 = if p0.thumbnailBackgroundStyle then p0.thumbnailBackgroundStyle.Color3 else nil,
				BackgroundTransparency = if p0.thumbnailBackgroundStyle then p0.thumbnailBackgroundStyle.Transparency else 1
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, cornerRadius) }),
				ThumbnailFrame = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -2 * imagePadding, 1, -2 * imagePadding - var9),
					Position = if imagePadding then UDim2.fromOffset(imagePadding, imagePadding) else nil
				}, {
					Thumbnail = if p0.imageComponent then p0.imageComponent elseif p0.image then reactModule.createElement(loadableImage, {
						BackgroundTransparency = 1,
						showFailedStateWhenLoadingFailed = true,
						useShimmerAnimationWhileLoading = true,
						Image = p0.image,
						Size = UDim2.new(1, 0, 1, 0),
						cornerRadius = UDim.new(0, imageCornerRadius)
					}) else nil
				})
			}),
			isContained = var8
		})
	end
	return reactModule.createElement(sduiTileModule, var10)
end)