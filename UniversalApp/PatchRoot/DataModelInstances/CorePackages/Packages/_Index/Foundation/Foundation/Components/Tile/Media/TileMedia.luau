local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.MediaType)
local _ = require(foundation.Enums.ThumbnailType)
local _ = require(foundation.Enums.ThumbnailSize)
local mediaShapeModule = require(foundation.Enums.MediaShape)
local getRbxThumbModule = require(foundation.Utility.getRbxThumb)
local useTileModule = require(foundation.Components.Tile.useTile)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local imageModule = require(foundation.Components.Image)
local viewModule = require(foundation.Components.View)
local _ = require(foundation.Components.Types)
local t = {
	[mediaShapeModule.Circle] = 1,
	[mediaShapeModule.Square] = 1,
	[mediaShapeModule.Landscape] = 1.777777777778,
	[mediaShapeModule.Portrait] = 0.5625
}
local t_1 = { LayoutOrder = 1, shape = mediaShapeModule.Square }

return function(p0)
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useTileModule (ref), reactModule (ref), getRbxThumbModule (ref), imageModule (ref), viewModule (ref), t (ref), mediaShapeModule (ref)
	local var10 = withDefaultsModule(p0, t_1)
	local var11 = useTileModule()
	local var12 = if var10.background then var10.background.style else nil
	local var13 = if var10.background then var10.background.image else nil
	
	return reactModule.createElement(if var13 then imageModule else viewModule, {
		ZIndex = 0,
		Image = var13,
		imageStyle = if var13 then var12 else nil,
		backgroundStyle = if var13 then nil else var12,
		Size = if var11.fillDirection == Enum.FillDirection.Vertical then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 1),
		LayoutOrder = var10.LayoutOrder,
		aspectRatio = {
			AspectRatio = t[var10.shape],
			AspectType = Enum.AspectType.ScaleWithParentSize,
			DominantAxis = if var11.fillDirection == Enum.FillDirection.Vertical then Enum.DominantAxis.Width else Enum.DominantAxis.Height
		},
		tag = {
			["radius-top-medium"] = var11.fillDirection == Enum.FillDirection.Vertical and var11.isContained,
			["radius-left-medium"] = var11.fillDirection == Enum.FillDirection.Horizontal and var11.isContained,
			["radius-medium"] = var10.shape ~= mediaShapeModule.Circle and not var11.isContained,
			["radius-circle"] = var10.shape == mediaShapeModule.Circle and not var11.isContained
		},
		onStateChanged = var10.onStateChanged,
		testId = `{var11.testId}--media`
	}, {
		Image = reactModule.createElement(imageModule, {
			Image = reactModule.useMemo(function()
				-- upvalues: var10 (ref), getRbxThumbModule (copy)
				return if var10.id == nil or var10.type == nil then nil else getRbxThumbModule(var10.type, var10.id)
			end, { var10.type, var10.id }),
			imageStyle = var10.style,
			tag = {
				["size-full"] = true,
				["padding-medium"] = var10.children ~= nil,
				["radius-top-medium"] = var11.fillDirection == Enum.FillDirection.Vertical and var11.isContained,
				["radius-left-medium"] = var11.fillDirection == Enum.FillDirection.Horizontal and var11.isContained,
				["radius-medium"] = var10.shape ~= mediaShapeModule.Circle and not var11.isContained,
				["radius-circle"] = var10.shape == mediaShapeModule.Circle
			},
			testId = `{var11.testId}--media-image`
		}, var10.children)
	})
end