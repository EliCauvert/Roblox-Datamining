local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.MediaType)
local _ = require(foundation.Enums.ThumbnailType)
local _ = require(foundation.Enums.ThumbnailSize)
local mediaShapeModule = require(foundation.Enums.MediaShape)
local gradientModule = require(foundation.Components.Gradient)
local getRbxThumbModule = require(foundation.Utility.getRbxThumb)
local useTileModule = require(foundation.Components.Tile.useTile)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local imageModule = require(foundation.Components.Image)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local _ = require(foundation.Components.Types)
local t = {
	[mediaShapeModule.Circle] = 1,
	[mediaShapeModule.Square] = 1,
	[mediaShapeModule.Landscape] = 1.777777777778,
	[mediaShapeModule.Portrait] = 0.5625
}
local t_1 = { LayoutOrder = 1, shape = mediaShapeModule.Square }

return function(p0) --[[ line: 56 | named "TileMedia" ]]
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useTileModule (ref), useTokensModule (ref), reactModule (ref), getRbxThumbModule (ref), mediaShapeModule (ref), imageModule (ref), viewModule (ref), t (ref), gradientModule (ref)
	local var12 = withDefaultsModule(p0, t_1)
	local var13 = useTileModule()
	local var14 = useTokensModule()
	local var15 = if var12.background then var12.background.style else nil
	local var16 = if var12.background then var12.background.image else nil
	local var17 = reactModule.useMemo(function() --[[ line: 65 ]]
		-- upvalues: var12 (ref), getRbxThumbModule (copy)
		return if var12.id == nil or var12.type == nil then nil else getRbxThumbModule(var12.type, var12.id)
	end, { var12.type, var12.id })
	local var18 = if var12.shape == mediaShapeModule.Circle then UDim.new(0, var14.Radius.Circle) else UDim.new(0, var14.Radius.Medium)
	local var18_1 = var13.isContained and var18
	
	return reactModule.createElement(if var16 then imageModule else viewModule, {
		ZIndex = 0,
		Image = var16,
		imageStyle = if var16 then var15 else nil,
		backgroundStyle = if var16 then nil else var15,
		Size = if var13.fillDirection == Enum.FillDirection.Vertical then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 1),
		LayoutOrder = var12.LayoutOrder,
		aspectRatio = {
			AspectRatio = t[var12.shape],
			AspectType = Enum.AspectType.ScaleWithParentSize,
			DominantAxis = if var13.fillDirection == Enum.FillDirection.Vertical then Enum.DominantAxis.Width else Enum.DominantAxis.Height
		},
		cornerRadius = var18,
		onStateChanged = var12.onStateChanged,
		testId = `{var13.testId}--media`
	}, {
		TransparencyGradient = if var18_1 then reactModule.createElement(gradientModule, { top = true, fillDirection = var13.fillDirection }) else nil,
		MiddleCorners = if var18_1 then reactModule.createElement(imageModule, {
			ZIndex = 0,
			tag = "size-full",
			Image = var16,
			imageStyle = if var16 then var15 else nil,
			backgroundStyle = if var16 then nil else var15
		}, {
			TransparencyGradient = reactModule.createElement(gradientModule, { top = false, fillDirection = var13.fillDirection })
		}) else nil,
		Image = reactModule.createElement(imageModule, {
			Image = var17,
			cornerRadius = var18,
			imageStyle = var12.style,
			tag = {
				["size-full"] = true,
				["padding-medium"] = var12.children ~= nil
			},
			testId = `{var13.testId}--media-image`
		}, var12.children)
	})
end