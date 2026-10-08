local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local cardDensityModule = require(foundation.Enums.CardDensity)
local cardHeaderSizeModule = require(foundation.Enums.CardHeaderSize)
local cardHeightModule = require(foundation.Enums.CardHeight)
local cardMediaAspectRatioModule = require(foundation.Enums.CardMediaAspectRatio)
local cardMediaPlacementModule = require(foundation.Enums.CardMediaPlacement)
local cardVariantModule = require(foundation.Enums.CardVariant)
local cardActionsModule = require(script.Parent.Subcomponents.CardActions)
local cardHeaderModule = require(script.Parent.Subcomponents.CardHeader)
local cardMediaModule = require(script.Parent.Subcomponents.CardMedia)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useCardVariantsModule = require(script.Parent.useCardVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local ratio2x1 = cardMediaAspectRatioModule.Ratio2x1
local t = {
	[cardMediaAspectRatioModule.Ratio1x1] = 1,
	[cardMediaAspectRatioModule.Ratio5x4] = 1.25,
	[cardMediaAspectRatioModule.Ratio4x3] = 1.333333333333,
	[cardMediaAspectRatioModule.Ratio3x2] = 1.5,
	[cardMediaAspectRatioModule.Ratio16x9] = 1.777777777778,
	[cardMediaAspectRatioModule.Ratio2x1] = 2
}
local t_1 = {
	testId = "--foundation-card",
	variant = cardVariantModule.Standard,
	density = cardDensityModule.Default,
	height = cardHeightModule.Fit
}
local t_2 = {
	[cardDensityModule.Compact] = cardHeaderSizeModule.Small,
	[cardDensityModule.Default] = cardHeaderSizeModule.Medium,
	[cardDensityModule.Comfortable] = cardHeaderSizeModule.Large
}

local function resolveMedia(p1)
	-- upvalues: cardMediaPlacementModule (ref), t (ref), ratio2x1 (ref)
	if typeof(p1) == "string" then
		return {
			width = 136,
			src = p1,
			placement = cardMediaPlacementModule.End,
			aspectRatio = t[ratio2x1]
		}
	elseif typeof(p1) ~= "table" then
		return nil
	end
	local placement = p1.placement or cardMediaPlacementModule.End
	
	return {
		src = p1.image,
		placement = placement,
		width = if placement == cardMediaPlacementModule.End and p1.width ~= nil then p1.width else 136,
		aspectRatio = t[if placement == cardMediaPlacementModule.Bottom and p1.aspectRatio ~= nil then p1.aspectRatio else ratio2x1]
	}
end

local function _(p2, p3)
	-- upvalues: cardMediaPlacementModule (ref)
	return if p2 == nil or p2.placement ~= cardMediaPlacementModule.Bottom then 0 else math.round(p3 / p2.aspectRatio)
end

return reactModule.memo(reactModule.forwardRef(function(p2, p3)
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useTokensModule (ref), t_2 (ref), resolveMedia (ref), cardMediaPlacementModule (ref), cardHeightModule (ref), useCardVariantsModule (ref), reactModule (ref), cardActionsModule (ref), viewModule (ref), withCommonPropsModule (ref), cardHeaderModule (ref), cardMediaModule (ref)
	local var1
	local var2 = withDefaultsModule(p2, t_1)
	local var3 = useTokensModule()
	local headerSize = var2.headerSize or t_2[var2.density]
	local var4 = if var2.title == nil then var2.description ~= nil else true
	local var5 = resolveMedia(var2.media)
	local var6 = var5 ~= nil and var5.placement == cardMediaPlacementModule.End
	local var7 = if var2.onOverflow == nil then var2.onClose ~= nil else true
	local var8 = var4 and not var6
	local var9 = var2.height == cardHeightModule.Fill
	
	if var2.eyebrow ~= nil then
		var1 = var2.title == nil and var2.description == nil
	end
	local var10 = useCardVariantsModule(var3, var2.variant, var2.density, headerSize, var2.height, var6, var1, var8)
	local var11, var12 = reactModule.useState(0)
	local var13, var14 = reactModule.useState(0)
	local var15 = reactModule.useCallback(function(p4)
		-- upvalues: var12 (ref)
		local x = p4.AbsoluteSize.X
		var12(function(p5)
			-- upvalues: x (ref)
			return if p5 == x then p5 else x
		end)
	end, {})
	local var16 = reactModule.useCallback(function(p4)
		-- upvalues: var14 (ref)
		var14(p4.AbsoluteSize.Y)
	end, {})
	local var17 = if var7 then reactModule.createElement(cardActionsModule, {
		testId = var2.testId,
		variantProps = var10,
		onOverflow = var2.onOverflow,
		onClose = var2.onClose,
		overflowRef = var2.overflowRef,
		isOverMedia = var6,
		isInline = var8
	}) else nil
	local var18 = if var5 == nil or var5.placement ~= cardMediaPlacementModule.Bottom then 0 else math.round(var11 / var5.aspectRatio)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var2, {
		tag = var10.container.tag,
		sizeConstraint = if var9 then { MinSize = Vector2.new(0, var13 + var18) } else nil,
		onActivated = var2.onActivated,
		ref = p3
	}), {
		Body = reactModule.createElement(viewModule, { tag = var10.body.tag, onAbsoluteSizeChanged = var15 }, {
			Content = reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = var10.content.tag,
				onAbsoluteSizeChanged = var16
			}, {
				Header = if var4 then reactModule.createElement(cardHeaderModule, {
					testId = var2.testId,
					variantProps = var10,
					eyebrow = var2.eyebrow,
					icon = var2.icon,
					title = var2.title,
					description = var2.description,
					descriptionLineClamp = if var2.lineClamp then var2.lineClamp.description else nil,
					actions = if var8 then var17 else nil
				}) else nil,
				Children = if var2.children then reactModule.createElement(viewModule, {
					LayoutOrder = 2,
					tag = var10.children.tag,
					testId = `{var2.testId}--content`
				}, var2.children) else nil
			}),
			Media = if var5 then reactModule.createElement(cardMediaModule, {
				image = var5.src,
				width = var5.width,
				isEnd = var6,
				isFillHeight = var9,
				bottomHeight = var18,
				tag = var10.media.tag,
				testId = var2.testId
			}) else nil
		}),
		Actions = if var8 then nil else var17
	})
end))