local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Enums.MediaType)
local _ = require(Foundation.Enums.ThumbnailType)
local _ = require(Foundation.Enums.ThumbnailSize)
local MediaShapeModule = require(Foundation.Enums.MediaShape)
local GetRbxThumbModule = require(Foundation.Utility.getRbxThumb)
local UseTileModule = require(Foundation.Components.Tile_DEPRECATED.useTile)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local ImageModule = require(Foundation.Components.Image)
local ViewModule = require(Foundation.Components.View)
local _ = require(Foundation.Components.Types)
local config = {
	[MediaShapeModule.Circle] = 1,
	[MediaShapeModule.Square] = 1,
	[MediaShapeModule.Landscape] = 1.7777777777777777,
	[MediaShapeModule.Portrait] = 0.5625
}
local config1 = { LayoutOrder = 1, shape = MediaShapeModule.Square }

return function(p1) --[[ Line: 54 | Named "TileMedia" ]]
	-- upvalues: WithDefaultsModule (copy), config1 (copy), UseTileModule (copy), ReactModule (copy), GetRbxThumbModule (copy), ImageModule (copy), ViewModule (copy), config (copy), MediaShapeModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config1)
	local UseTileModuleResult = UseTileModule()
	local Style = if WithDefaultsModuleResult.background then WithDefaultsModuleResult.background.style else nil
	local Image = if WithDefaultsModuleResult.background then WithDefaultsModuleResult.background.image else nil
	
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
		tag = {
			["radius-top-medium"] = UseTileModuleResult.fillDirection == Enum.FillDirection.Vertical and UseTileModuleResult.isContained,
			["radius-left-medium"] = UseTileModuleResult.fillDirection == Enum.FillDirection.Horizontal and UseTileModuleResult.isContained,
			["radius-medium"] = WithDefaultsModuleResult.shape ~= MediaShapeModule.Circle and not UseTileModuleResult.isContained,
			["radius-circle"] = WithDefaultsModuleResult.shape == MediaShapeModule.Circle and not UseTileModuleResult.isContained
		},
		onStateChanged = WithDefaultsModuleResult.onStateChanged,
		testId = `{UseTileModuleResult.testId}--media`
	}, {
		Image = ReactModule.createElement(ImageModule, {
			Image = ReactModule.useMemo(function() --[[ Line: 62 ]]
				-- upvalues: WithDefaultsModuleResult (copy), GetRbxThumbModule (upval)
				return if WithDefaultsModuleResult.id == nil or WithDefaultsModuleResult.type == nil then nil else GetRbxThumbModule(WithDefaultsModuleResult.type, WithDefaultsModuleResult.id)
			end, {
				WithDefaultsModuleResult.type,
				WithDefaultsModuleResult.id
			}),
			imageStyle = WithDefaultsModuleResult.style,
			tag = {
				["size-full"] = true,
				["padding-medium"] = WithDefaultsModuleResult.children ~= nil,
				["radius-top-medium"] = UseTileModuleResult.fillDirection == Enum.FillDirection.Vertical and UseTileModuleResult.isContained,
				["radius-left-medium"] = UseTileModuleResult.fillDirection == Enum.FillDirection.Horizontal and UseTileModuleResult.isContained,
				["radius-medium"] = WithDefaultsModuleResult.shape ~= MediaShapeModule.Circle and not UseTileModuleResult.isContained,
				["radius-circle"] = WithDefaultsModuleResult.shape == MediaShapeModule.Circle
			},
			testId = `{UseTileModuleResult.testId}--media-image`
		}, WithDefaultsModuleResult.children)
	})
end