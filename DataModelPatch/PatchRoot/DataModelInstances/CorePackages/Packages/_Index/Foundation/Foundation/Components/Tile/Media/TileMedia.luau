local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Enums.MediaType)
local _ = require(Foundation.Enums.ThumbnailType)
local _ = require(Foundation.Enums.ThumbnailSize)
local MediaShapeModule = require(Foundation.Enums.MediaShape)
local GradientModule = require(Foundation.Components.Gradient)
local GetRbxThumbModule = require(Foundation.Utility.getRbxThumb)
local UseTileModule = require(Foundation.Components.Tile.useTile)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local ImageModule = require(Foundation.Components.Image)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local _ = require(Foundation.Components.Types)
local config = {
	[MediaShapeModule.Circle] = 1,
	[MediaShapeModule.Square] = 1,
	[MediaShapeModule.Landscape] = 1.7777777777777777,
	[MediaShapeModule.Portrait] = 0.5625
}
local config1 = { LayoutOrder = 1, shape = MediaShapeModule.Square }

return function(p1)
	-- upvalues: WithDefaultsModule (copy), config1 (copy), UseTileModule (copy), UseTokensModule (copy), ReactModule (copy), GetRbxThumbModule (copy), MediaShapeModule (copy), ImageModule (copy), ViewModule (copy), config (copy), GradientModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config1)
	local UseTileModuleResult = UseTileModule()
	local UseTokensModuleResult = UseTokensModule()
	local Style = if WithDefaultsModuleResult.background then WithDefaultsModuleResult.background.style else nil
	local Image = if WithDefaultsModuleResult.background then WithDefaultsModuleResult.background.image else nil
	local _UDim: UDim = if WithDefaultsModuleResult.shape == MediaShapeModule.Circle then UDim.new(0, UseTokensModuleResult.Radius.Circle) else UDim.new(0, UseTokensModuleResult.Radius.Medium)
	local _UDim1 = UseTileModuleResult.isContained and _UDim
	
	return ReactModule.createElement(if Image then ImageModule else ViewModule, {
		ZIndex = 0,
		Image = Image,
		imageStyle = if Image then Style else nil,
		backgroundStyle = if Image then nil else Style,
		Size = if UseTileModuleResult.fillDirection == Enum.FillDirection.Vertical then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 1),
		LayoutOrder = WithDefaultsModuleResult.LayoutOrder,
		aspectRatio = {
			AspectRatio = config[WithDefaultsModuleResult.shape],
			AspectType = Enum.AspectType.ScaleWithParentSize,
			DominantAxis = if UseTileModuleResult.fillDirection == Enum.FillDirection.Vertical then Enum.DominantAxis.Width else Enum.DominantAxis.Height
		},
		cornerRadius = _UDim,
		onStateChanged = WithDefaultsModuleResult.onStateChanged,
		testId = `{UseTileModuleResult.testId}--media`
	}, {
		TransparencyGradient = if _UDim1 then ReactModule.createElement(GradientModule, {
			top = true,
			fillDirection = UseTileModuleResult.fillDirection
		}) else nil,
		MiddleCorners = if _UDim1 then ReactModule.createElement(ImageModule, {
			ZIndex = 0,
			tag = "size-full",
			Image = Image,
			imageStyle = if Image then Style else nil,
			backgroundStyle = if Image then nil else Style
		}, {
			TransparencyGradient = ReactModule.createElement(GradientModule, {
				top = false,
				fillDirection = UseTileModuleResult.fillDirection
			})
		}) else nil,
		Image = ReactModule.createElement(ImageModule, {
			Image = ReactModule.useMemo(function()
				-- upvalues: WithDefaultsModuleResult (copy), GetRbxThumbModule (upval)
				return if WithDefaultsModuleResult.id == nil or WithDefaultsModuleResult.type == nil then nil else GetRbxThumbModule(WithDefaultsModuleResult.type, WithDefaultsModuleResult.id)
			end, {
				WithDefaultsModuleResult.type,
				WithDefaultsModuleResult.id
			}),
			cornerRadius = _UDim,
			imageStyle = WithDefaultsModuleResult.style,
			tag = {
				["size-full"] = true,
				["padding-medium"] = WithDefaultsModuleResult.children ~= nil
			},
			testId = `{UseTileModuleResult.testId}--media-image`
		}, WithDefaultsModuleResult.children)
	})
end