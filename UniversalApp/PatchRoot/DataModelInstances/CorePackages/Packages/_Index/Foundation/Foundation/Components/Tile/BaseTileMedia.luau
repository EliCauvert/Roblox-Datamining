local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local AspectRatioModule = require(Foundation.Components.AspectRatio)
local CornerRadiusModule = require(Foundation.Components.CornerRadius)
local TileAspectRatioModule = require(Foundation.Enums.TileAspectRatio)
local _ = require(Foundation.Components.Types)
local GetTestIdTagModule = require(Foundation.Utility.getTestIdTag)
local MapBindableModule = require(Foundation.Utility.mapBindable)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local config = {
	[TileAspectRatioModule.Ratio1x1] = 1,
	[TileAspectRatioModule.Ratio16x9] = 1.7777777777777777,
	[TileAspectRatioModule.Ratio2x3] = 0.6666666666666666
}
local _UDim2 = UDim2.fromScale(1, 1)
local _UDim = UDim.new(0, 0)

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensModule (copy), config (copy), _UDim2 (copy), _UDim (copy), ReactModule (copy), MapBindableModule (copy), GetTestIdTagModule (copy), CornerRadiusModule (copy), AspectRatioModule (copy)
	local Entry = config[Frame.aspectRatio]
	local TileSize = if typeof(Frame.tileSize) == "UDim2" then Frame.tileSize else nil
	local Offset = if TileSize == nil or TileSize.X.Scale ~= 0 then nil else TileSize.X.Offset
	local _UDim2_1 = if Offset == nil then _UDim2 else UDim2.fromOffset(Offset, Offset / Entry)
	local _UDim1 = UDim.new(0, UseTokensModule().Radius.Medium)
	local _UDim3 = if Frame.isContained then _UDim else _UDim1
	
	return ReactModule.createElement(if Frame.content == nil then "Frame" else "CanvasGroup", {
		BackgroundColor3 = MapBindableModule(Frame.backgroundStyle, function(p1)
			return p1.Color3
		end),
		BackgroundTransparency = MapBindableModule(Frame.backgroundStyle, function(p1)
			return p1.Transparency
		end),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		LayoutOrder = Frame.LayoutOrder,
		Size = if Frame.maxHeight == nil then _UDim2_1 else Frame.maxHeight:map(function(YOffset)
			-- upvalues: _UDim2_1 (copy)
			return if YOffset == nil then _UDim2_1 else UDim2.new(1, 0, 0, YOffset)
		end),
		[ReactModule.Tag] = GetTestIdTagModule(Frame.testId)
	}, {
		Corner = ReactModule.createElement(CornerRadiusModule, {
			testId = `{Frame.testId}--corner`,
			value = {
				topLeft = _UDim1,
				topRight = _UDim1,
				bottomLeft = _UDim3,
				bottomRight = _UDim3
			}
		}),
		AspectRatio = if Offset == nil or Frame.maxHeight ~= nil then ReactModule.createElement(AspectRatioModule, {
			value = {
				AspectRatio = Entry,
				AspectType = Enum.AspectType.FitWithinMaxSize,
				DominantAxis = Enum.DominantAxis.Width
			}
		}) else nil,
		Content = Frame.content
	})
end)