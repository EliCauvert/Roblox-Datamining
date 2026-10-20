local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local CardDensityModule = require(Foundation.Enums.CardDensity)
local CardHeaderSizeModule = require(Foundation.Enums.CardHeaderSize)
local CardHeightModule = require(Foundation.Enums.CardHeight)
local CardMediaAspectRatioModule = require(Foundation.Enums.CardMediaAspectRatio)
local CardMediaPlacementModule = require(Foundation.Enums.CardMediaPlacement)
local CardActionsModule = require(script.Parent.Subcomponents.CardActions)
local CardHeaderModule = require(script.Parent.Subcomponents.CardHeader)
local CardMediaModule = require(script.Parent.Subcomponents.CardMedia)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseCardVariantsModule = require(script.Parent.useCardVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local Ratio2x1 = CardMediaAspectRatioModule.Ratio2x1
local config = {
	[CardMediaAspectRatioModule.Ratio1x1] = 1,
	[CardMediaAspectRatioModule.Ratio5x4] = 1.25,
	[CardMediaAspectRatioModule.Ratio4x3] = 1.3333333333333333,
	[CardMediaAspectRatioModule.Ratio3x2] = 1.5,
	[CardMediaAspectRatioModule.Ratio16x9] = 1.7777777777777777,
	[CardMediaAspectRatioModule.Ratio2x1] = 2
}
local config1 = {
	testId = "--foundation-card",
	variant = require(Foundation.Enums.CardVariant).Standard,
	density = CardDensityModule.Default,
	height = CardHeightModule.Fit
}
local config2 = {
	[CardDensityModule.Compact] = CardHeaderSizeModule.Small,
	[CardDensityModule.Default] = CardHeaderSizeModule.Medium,
	[CardDensityModule.Comfortable] = CardHeaderSizeModule.Large
}

local function resolveMedia(Src)
	-- upvalues: CardMediaPlacementModule (copy), config (copy), Ratio2x1 (copy)
	if typeof(Src) == "string" then
		return {
			width = 136,
			src = Src,
			placement = CardMediaPlacementModule.End,
			aspectRatio = config[Ratio2x1]
		}
	elseif typeof(Src) == "table" then
		local Placement = Src.placement or CardMediaPlacementModule.End
		
		return {
			src = Src.image,
			placement = Placement,
			width = if Placement == CardMediaPlacementModule.End and Src.width ~= nil then Src.width else 136,
			aspectRatio = config[if Placement == CardMediaPlacementModule.Bottom and Src.aspectRatio ~= nil then Src.aspectRatio else Ratio2x1]
		}
	else
		return nil
	end
end

local function _(p1, p2): number
	-- upvalues: CardMediaPlacementModule (copy)
	return if p1 == nil or p1.placement ~= CardMediaPlacementModule.Bottom then 0 else math.round(p2 / p1.aspectRatio)
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config1 (copy), UseTokensModule (copy), config2 (copy), resolveMedia (copy), CardMediaPlacementModule (copy), CardHeightModule (copy), UseCardVariantsModule (copy), ReactModule (copy), CardActionsModule (copy), ViewModule (copy), WithCommonPropsModule (copy), CardHeaderModule (copy), CardMediaModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config1)
	local UseTokensModuleResult = UseTokensModule()
	local HeaderSize = WithDefaultsModuleResult.headerSize or config2[WithDefaultsModuleResult.density]
	local HasTitle: boolean = WithDefaultsModuleResult.title ~= nil or WithDefaultsModuleResult.description ~= nil
	local ResolveMediaResult = resolveMedia(WithDefaultsModuleResult.media)
	local IsPlacementMatch: boolean = ResolveMediaResult ~= nil and ResolveMediaResult.placement == CardMediaPlacementModule.End
	local HasOnOverflow: boolean = WithDefaultsModuleResult.onOverflow ~= nil or WithDefaultsModuleResult.onClose ~= nil
	local NoIsPlacementMatch: boolean = HasTitle and not IsPlacementMatch
	local IsHeightMatch = WithDefaultsModuleResult.height == CardHeightModule.Fill
	local UseCardVariantsModuleResult = UseCardVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.variant, WithDefaultsModuleResult.density, HeaderSize, WithDefaultsModuleResult.height, IsPlacementMatch, if WithDefaultsModuleResult.eyebrow == nil then WithDefaultsModuleResult.description == nil else WithDefaultsModuleResult.title == nil and WithDefaultsModuleResult.description == nil, NoIsPlacementMatch)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local Element = if HasOnOverflow then ReactModule.createElement(CardActionsModule, {
		testId = WithDefaultsModuleResult.testId,
		variantProps = UseCardVariantsModuleResult,
		onOverflow = WithDefaultsModuleResult.onOverflow,
		onClose = WithDefaultsModuleResult.onClose,
		overflowRef = WithDefaultsModuleResult.overflowRef,
		isOverMedia = IsPlacementMatch,
		isInline = NoIsPlacementMatch
	}) else nil
	local Rounded: number = if ResolveMediaResult == nil or ResolveMediaResult.placement ~= CardMediaPlacementModule.Bottom then 0 else math.round(UseStateResult / ResolveMediaResult.aspectRatio)
	local Y = UseStateResult1 + Rounded
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseCardVariantsModuleResult.container.tag,
		sizeConstraint = if IsHeightMatch then { MinSize = Vector2.new(0, Y) } else nil,
		onActivated = WithDefaultsModuleResult.onActivated,
		ref = Ref
	}), {
		Body = ReactModule.createElement(ViewModule, {
			tag = UseCardVariantsModuleResult.body.tag,
			onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
				-- upvalues: UseStateResult2 (copy)
				local X = Frame.AbsoluteSize.X
				UseStateResult2(function(X1)
					-- upvalues: X (copy)
					return if X1 == X then X1 else X
				end)
			end, {})
		}, {
			Content = ReactModule.createElement(ViewModule, {
				LayoutOrder = 1,
				tag = UseCardVariantsModuleResult.content.tag,
				onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
					-- upvalues: UseStateResult2_1 (copy)
					UseStateResult2_1(Frame.AbsoluteSize.Y)
				end, {})
			}, {
				Header = if HasTitle then ReactModule.createElement(CardHeaderModule, {
					testId = WithDefaultsModuleResult.testId,
					variantProps = UseCardVariantsModuleResult,
					eyebrow = WithDefaultsModuleResult.eyebrow,
					icon = WithDefaultsModuleResult.icon,
					title = WithDefaultsModuleResult.title,
					description = WithDefaultsModuleResult.description,
					descriptionLineClamp = if WithDefaultsModuleResult.lineClamp then WithDefaultsModuleResult.lineClamp.description else nil,
					actions = if NoIsPlacementMatch then Element else nil
				}) else nil,
				Children = if WithDefaultsModuleResult.children then ReactModule.createElement(ViewModule, {
					LayoutOrder = 2,
					tag = UseCardVariantsModuleResult.children.tag,
					testId = `{WithDefaultsModuleResult.testId}--content`
				}, WithDefaultsModuleResult.children) else nil
			}),
			Media = if ResolveMediaResult then ReactModule.createElement(CardMediaModule, {
				image = ResolveMediaResult.src,
				width = ResolveMediaResult.width,
				isEnd = IsPlacementMatch,
				isFillHeight = IsHeightMatch,
				bottomHeight = Rounded,
				tag = UseCardVariantsModuleResult.media.tag,
				testId = WithDefaultsModuleResult.testId
			}) else nil
		}),
		Actions = if NoIsPlacementMatch then nil else Element
	})
end))