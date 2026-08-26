local constantsModule = require(script.Parent.Parent.TopBar.Constants)
local t = {
	ContainerBackgroundTransparency = 0,
	UseContainerAspectRatio = false,
	ContainerAspectRatio = nil,
	MaxAssetCardsPerRow = 4,
	AvatarHeadShotSize = 48,
	TopSizeY = 50,
	AssetCardMaxSizeX = 190,
	AssetCardMaxSizeY = 279,
	BorderPaddingSize = 20,
	AssetTextMaxSize = 14,
	ContainerBackgroundColor = require(script.Parent.Colors).Carbon,
	ContainerSize = function(p1)
		-- upvalues: constantsModule (ref)
		return UDim2.new(1, 0, 1, -constantsModule.TopBarHeight * p1)
	end,
	ContainerAnchorPoint = Vector2.new(0.5, 0),
	ContainerPosition = function(p1)
		-- upvalues: constantsModule (ref)
		return UDim2.new(0.5, 0, 0, constantsModule.TopBarHeight * p1)
	end,
	PlayerViewportSize = UDim2.new(0.33, 0, 1, -42),
	AssetListSize = UDim2.new(0.67, 0, 1, -42),
	AssetListPosition = UDim2.new(0.33, 0, 0, 42),
	CloseButtonPosition = UDim2.new(0, 6, 0, -20),
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
		error("WideLandscapeView table has no value: " .. tostring(p1))
	end
})

return t