local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local BaseTileMediaClippingModule = require(Foundation.Enums.BaseTileMediaClipping)
local TileAspectRatioModule = require(Foundation.Enums.TileAspectRatio)
local _ = require(Foundation.Components.Types)
local GetBaseTileMediaCornersModule = require(script.Parent.getBaseTileMediaCorners)
local GetTestIdTagModule = require(Foundation.Utility.getTestIdTag)
local MapBindableModule = require(Foundation.Utility.mapBindable)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local config = {
	[TileAspectRatioModule.Ratio1x1] = 1,
	[TileAspectRatioModule.Ratio16x9] = 1.7777777777777777,
	[TileAspectRatioModule.Ratio2x3] = 0.6666666666666666
}
local _UDim2 = UDim2.fromScale(1, 1)

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensModule (copy), config (copy), _UDim2 (copy), GetBaseTileMediaCornersModule (copy), ReactModule (copy), BaseTileMediaClippingModule (copy), MapBindableModule (copy), GetTestIdTagModule (copy)
	local Entry = config[Frame.aspectRatio]
	local TileSize = if typeof(Frame.tileSize) == "UDim2" then Frame.tileSize else nil
	local Offset = if TileSize == nil or TileSize.X.Scale ~= 0 or Frame.isSizeConstrained then nil else TileSize.X.Offset
	local _UDim2_1 = if Offset == nil then _UDim2 else UDim2.fromOffset(Offset, Offset / Entry)
	local BaseTileMediaCornersModule = GetBaseTileMediaCornersModule(UseTokensModule(), Frame.isContained)
	
	return ReactModule.createElement(if Frame.clippingStyle == BaseTileMediaClippingModule.Rounded and Frame.content ~= nil then "CanvasGroup" else "Frame", {
		BackgroundColor3 = MapBindableModule(Frame.backgroundStyle, function(p1)
			return p1.Color3
		end),
		BackgroundTransparency = MapBindableModule(Frame.backgroundStyle, function(p1)
			return p1.Transparency
		end),
		BorderSizePixel = 0,
		ClipsDescendants = Frame.clippingStyle ~= BaseTileMediaClippingModule.None,
		LayoutOrder = Frame.LayoutOrder,
		Size = if Frame.maxHeight == nil then _UDim2_1 else Frame.maxHeight:map(function(YOffset)
			-- upvalues: _UDim2_1 (copy)
			return if YOffset == nil then _UDim2_1 else UDim2.new(1, 0, 0, YOffset)
		end),
		[ReactModule.Tag] = GetTestIdTagModule(Frame.testId)
	}, {
		Corner = ReactModule.createElement("UICorner", {
			TopLeftRadius = BaseTileMediaCornersModule.TopLeftRadius,
			TopRightRadius = BaseTileMediaCornersModule.TopRightRadius,
			BottomLeftRadius = BaseTileMediaCornersModule.BottomLeftRadius,
			BottomRightRadius = BaseTileMediaCornersModule.BottomRightRadius,
			[ReactModule.Tag] = GetTestIdTagModule(`{Frame.testId}--corner`)
		}),
		AspectRatio = if Offset == nil or Frame.maxHeight ~= nil then ReactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = Entry,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}) else nil,
		Content = Frame.content
	})
end)