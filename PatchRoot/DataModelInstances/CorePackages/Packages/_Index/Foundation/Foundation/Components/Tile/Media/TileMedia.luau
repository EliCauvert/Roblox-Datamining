-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:10 2026 Pacific Standard Time.

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
local flagsModule = require(foundation.Utility.Flags)
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

return function(p0) --[[ line: 58 | named "TileMedia" ]]
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useTileModule (ref), useTokensModule (ref), reactModule (ref), getRbxThumbModule (ref), flagsModule (ref), mediaShapeModule (ref), imageModule (ref), viewModule (ref), t (ref), gradientModule (ref)
	local var13 = withDefaultsModule(p0, t_1)
	local var14 = useTileModule()
	local var15 = useTokensModule()
	local var16 = if var13.background then var13.background.style else nil
	local var17 = if var13.background then var13.background.image else nil
	local var18 = reactModule.useMemo(function() --[[ line: 67 ]]
		-- upvalues: var13 (ref), getRbxThumbModule (copy)
		return if var13.id == nil or var13.type == nil then nil else getRbxThumbModule(var13.type, var13.id)
	end, { var13.type, var13.id })
	local var19 = if not flagsModule.FoundationMediaRoundedCornerTags then if var13.shape == mediaShapeModule.Circle then UDim.new(0, var15.Radius.Circle) else UDim.new(0, var15.Radius.Medium) else nil
	local var20 = if not flagsModule.FoundationMediaRoundedCornerTags then var14.isContained and var19 else nil
	
	return reactModule.createElement(if var17 then imageModule else viewModule, {
		ZIndex = 0,
		Image = var17,
		imageStyle = if var17 then var16 else nil,
		backgroundStyle = if var17 then nil else var16,
		Size = if var14.fillDirection == Enum.FillDirection.Vertical then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 1),
		LayoutOrder = var13.LayoutOrder,
		aspectRatio = {
			AspectRatio = t[var13.shape],
			AspectType = Enum.AspectType.ScaleWithParentSize,
			DominantAxis = if var14.fillDirection == Enum.FillDirection.Vertical then Enum.DominantAxis.Width else Enum.DominantAxis.Height
		},
		cornerRadius = var19,
		tag = if flagsModule.FoundationMediaRoundedCornerTags then {
			["radius-top-medium"] = var14.fillDirection == Enum.FillDirection.Vertical and var14.isContained,
			["radius-left-medium"] = var14.fillDirection == Enum.FillDirection.Horizontal and var14.isContained,
			["radius-medium"] = var13.shape ~= mediaShapeModule.Circle and not var14.isContained,
			["radius-circle"] = var13.shape == mediaShapeModule.Circle and not var14.isContained
		} else nil,
		onStateChanged = var13.onStateChanged,
		testId = `{var14.testId}--media`
	}, {
		TransparencyGradient = if var20 then reactModule.createElement(gradientModule, { top = true, fillDirection = var14.fillDirection }) else nil,
		MiddleCorners = if var20 then reactModule.createElement(imageModule, {
			ZIndex = 0,
			tag = "size-full",
			Image = var17,
			imageStyle = if var17 then var16 else nil,
			backgroundStyle = if var17 then nil else var16
		}, {
			TransparencyGradient = reactModule.createElement(gradientModule, { top = false, fillDirection = var14.fillDirection })
		}) else nil,
		Image = reactModule.createElement(imageModule, {
			Image = var18,
			cornerRadius = var19,
			imageStyle = var13.style,
			tag = if flagsModule.FoundationMediaRoundedCornerTags then {
				["size-full"] = true,
				["padding-medium"] = var13.children ~= nil,
				["radius-top-medium"] = var14.fillDirection == Enum.FillDirection.Vertical and var14.isContained,
				["radius-left-medium"] = var14.fillDirection == Enum.FillDirection.Horizontal and var14.isContained,
				["radius-medium"] = var13.shape ~= mediaShapeModule.Circle and not var14.isContained,
				["radius-circle"] = var13.shape == mediaShapeModule.Circle
			} else {
				["size-full"] = true,
				["padding-medium"] = var13.children ~= nil
			},
			testId = `{var14.testId}--media-image`
		}, var13.children)
	})
end