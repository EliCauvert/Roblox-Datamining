local constantsModule = require(script.Parent.Parent.TopBar.Constants)
local t = {
	UseContainerAspectRatio = false,
	ContainerBackgroundTransparency = 0.3,
	ContainerAspectRatio = 0.9,
	MaxAssetCardsPerRow = 4,
	AvatarHeadShotSize = 48,
	TopSizeY = 50,
	ClipsDescendants = true,
	AssetCardMaxSizeX = 190,
	AssetCardMaxSizeY = 279,
	BorderPaddingSize = 40,
	AssetTextMaxSize = 18,
	ContainerBackgroundColor = require(script.Parent.Colors).Black,
	ContainerSize = function(p1)
		-- upvalues: constantsModule (ref)
		return UDim2.new(0.7, 0, 0.95, -constantsModule.TopBarHeight * p1)
	end,
	ContainerAnchorPoint = Vector2.new(0.5, 0.5),
	ContainerPosition = function(p1)
		-- upvalues: constantsModule (ref)
		return UDim2.new(0.5, 0, 0.5, constantsModule.TopBarHeight * p1)
	end,
	PlayerViewportSize = UDim2.new(0.33, 0, 1, -42),
	AssetListSize = UDim2.new(0.67, 0, 1, -42),
	AssetListPosition = UDim2.new(0.33, 0, 0, 42),
	CloseButtonPosition = UDim2.new(0, 6, 0, -30),
	DetailsThumbnailFrameSize = UDim2.new(0.4, 0, 1, -30),
	DetailsThumbnailFramePosition = UDim2.new(0, 25, 0, 30),
	DetailsThumbnailAnchorPoint = Vector2.new(0.5, 0),
	DetailsThumbnailPosition = UDim2.new(0.5, 0, 0, 0),
	DetailsThumbnailARDominantAxis = Enum.DominantAxis.Width,
	DetailsFramePosition = UDim2.new(0.4, 30, 0, 30),
	DetailsFrameSize = UDim2.new(0.6, -30, 1, -30),
	DefaultCameraOffset = CFrame.new(0, 2, -5),
	ToolOffset = CFrame.new(0, 2, -8),
	TryOnPosition = UDim2.new(0, 25, 0, 30),
	TryOnSize = UDim2.new(0.4, 0, 1, -30)
}
setmetatable(t, {
	__newindex = function(_, _, _) end,
	__index = function(_, p1)
		error("WideView table has no value: " .. tostring(p1))
	end
})

return t