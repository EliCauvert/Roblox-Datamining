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

return function(p1)
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useTileModule (ref), reactModule (ref), getRbxThumbModule (ref), imageModule (ref), viewModule (ref), t (ref), mediaShapeModule (ref)
	local var1 = withDefaultsModule(p1, t_1)
	local var2 = useTileModule()
	local var3 = if var1.background then var1.background.style else nil
	local var4 = if var1.background then var1.background.image else nil
	
	return reactModule.createElement(if var4 then imageModule else viewModule, {
		ZIndex = 0,
		Image = var4,
		imageStyle = if var4 then var3 else nil,
		backgroundStyle = if var4 then nil else var3,
		Size = if var2.fillDirection == Enum.FillDirection.Vertical then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 1),
		LayoutOrder = var1.LayoutOrder,
		aspectRatio = {
			AspectRatio = t[var1.shape],
			AspectType = Enum.AspectType.ScaleWithParentSize,
			DominantAxis = if var2.fillDirection == Enum.FillDirection.Vertical then Enum.DominantAxis.Width else Enum.DominantAxis.Height
		},
		tag = {
			["radius-top-medium"] = var2.fillDirection == Enum.FillDirection.Vertical and var2.isContained,
			["radius-left-medium"] = var2.fillDirection == Enum.FillDirection.Horizontal and var2.isContained,
			["radius-medium"] = var1.shape ~= mediaShapeModule.Circle and not var2.isContained,
			["radius-circle"] = var1.shape == mediaShapeModule.Circle and not var2.isContained
		},
		onStateChanged = var1.onStateChanged,
		testId = `{var2.testId}--media`
	}, {
		Image = reactModule.createElement(imageModule, {
			Image = reactModule.useMemo(function()
				-- upvalues: var1 (ref), getRbxThumbModule (copy)
				return if var1.id == nil or var1.type == nil then nil else getRbxThumbModule(var1.type, var1.id)
			end, { var1.type, var1.id }),
			imageStyle = var1.style,
			tag = {
				["size-full"] = true,
				["padding-medium"] = var1.children ~= nil,
				["radius-top-medium"] = var2.fillDirection == Enum.FillDirection.Vertical and var2.isContained,
				["radius-left-medium"] = var2.fillDirection == Enum.FillDirection.Horizontal and var2.isContained,
				["radius-medium"] = var1.shape ~= mediaShapeModule.Circle and not var2.isContained,
				["radius-circle"] = var1.shape == mediaShapeModule.Circle
			},
			testId = `{var2.testId}--media-image`
		}, var1.children)
	})
end