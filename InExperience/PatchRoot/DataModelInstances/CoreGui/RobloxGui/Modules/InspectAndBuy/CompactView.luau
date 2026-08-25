local constantsModule = require(script.Parent.Parent.TopBar.Constants)
local t = {
	ContainerBackgroundTransparency = 0,
	UseContainerAspectRatio = false,
	ContainerAspectRatio = nil,
	MaxAssetCardsPerRow = 3,
	AvatarHeadShotSize = 48,
	TopSizeY = 90,
	ClipsDescendants = false,
	AssetCardMaxSizeX = 108,
	AssetCardMaxSizeY = 157,
	BorderPaddingSize = 20,
	AssetTextMaxSize = 14,
	ContainerBackgroundColor = require(script.Parent.Colors).Carbon,
	ContainerSize = function(p0)
		-- upvalues: constantsModule (ref)
		return UDim2.new(1, 0, 1, -constantsModule.TopBarHeight * p0)
	end,
	ContainerAnchorPoint = Vector2.new(0.5, 0),
	ContainerPosition = function(p1)
		-- upvalues: constantsModule (ref)
		return UDim2.new(0.5, 0, 0, constantsModule.TopBarHeight * p1)
	end,
	PlayerViewportSize = UDim2.new(1, 0, 0.41, 0),
	AssetListSize = UDim2.new(1, 0, 0.59, -42),
	AssetListPosition = UDim2.new(0, 0, 0.41, 42),
	CloseButtonPosition = UDim2.new(0, 6, 0, -20),
	DetailsThumbnailFrameSize = UDim2.new(1, 0, 0.4, 0),
	DetailsThumbnailFramePosition = UDim2.new(0, 0, 0, 15),
	DetailsThumbnailAnchorPoint = Vector2.new(0.5, 0.5),
	DetailsThumbnailPosition = UDim2.new(0.5, 0, 0.5, 0),
	DetailsThumbnailARDominantAxis = Enum.DominantAxis.Height,
	DetailsFramePosition = UDim2.new(0, 15, 0.4, 15),
	DetailsFrameSize = UDim2.new(1, -30, 0.6, -30),
	DefaultCameraOffset = CFrame.new(0, 2, -5),
	ToolOffset = CFrame.new(0, 2, -8),
	TryOnPosition = UDim2.new(0, 0, 0, 15),
	TryOnSize = UDim2.new(1, 0, 0.4, 0)
}
setmetatable(t, {
	__newindex = function(_, _, _) end,
	__index = function(_, p2)
		error("CompactView table has no value: " .. tostring(p2))
	end
})

return t