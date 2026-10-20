local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local SkeletonModule = require(Foundation.Components.Skeleton)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTextSizeOffsetModule = require(Foundation.Providers.Style.useTextSizeOffset)
local UseTileModule = require(Foundation.Components.Tile_DEPRECATED.useTile)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)

local function getTypographyComponent(Subtitle, CaptionLarge, Default, TextXAlignment, NumLines, LayoutOrder: number, TestId)
	-- upvalues: ReactModule (copy), SkeletonModule (copy), UseTextSizeOffsetModule (copy), TextModule (copy)
	local Text = nil
	local FontStyle = nil
	local ColorStyle = nil
	local NumLines1 = nil
	if typeof(Subtitle) == "string" then
		Text = Subtitle
		FontStyle = CaptionLarge
		ColorStyle = Default
		NumLines1 = NumLines
	else
		if Subtitle.isLoading then
			return ReactModule.createElement(SkeletonModule, {
				Size = UDim2.new(1 / LayoutOrder, 0, 0, CaptionLarge.FontSize),
				LayoutOrder = LayoutOrder
			})
		end
		Text = Subtitle.text
		FontStyle = Subtitle.fontStyle or CaptionLarge
		ColorStyle = Subtitle.colorStyle or Default
		NumLines1 = Subtitle.numLines or NumLines
	end
	assert(FontStyle ~= nil, "fontStyle cannot be nil")
	assert(ColorStyle ~= nil, "colorStyle cannot be nil")
	assert(NumLines1 ~= nil, "numLines cannot be nil")
	FontStyle.LineHeight = 1
	
	return ReactModule.createElement(TextModule, {
		fontStyle = FontStyle,
		textStyle = ColorStyle,
		Text = Text,
		TextXAlignment = TextXAlignment,
		TextTruncate = Enum.TextTruncate.AtEnd,
		TextWrapped = NumLines1 > 1,
		Size = UDim2.new(1, 0, 0, NumLines1 * (FontStyle.FontSize + (UseTextSizeOffsetModule() or 0)) * FontStyle.LineHeight),
		LayoutOrder = LayoutOrder,
		testId = TestId
	})
end

local config = { TextXAlignment = Enum.TextXAlignment.Left }

return function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseTileModule (copy), getTypographyComponent (copy), ReactModule (copy), ViewModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseTileModuleResult = UseTileModule()
	
	return ReactModule.createElement(ViewModule, {
		tag = "gap-xxsmall size-full-0 auto-y",
		flexItem = { FlexMode = Enum.UIFlexMode.Shrink },
		layout = {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		testId = `{UseTileModuleResult.testId}--header`
	}, {
		Title = getTypographyComponent(WithDefaultsModuleResult.title, UseTokensModuleResult.Typography.TitleLarge, UseTokensModuleResult.Color.Content.Emphasis, WithDefaultsModuleResult.TextXAlignment, if WithDefaultsModuleResult.subtitle == nil then 2 else 1, 1, `{UseTileModuleResult.testId}--header-title`),
		Subtitle = if WithDefaultsModuleResult.subtitle == nil then nil else getTypographyComponent(WithDefaultsModuleResult.subtitle, UseTokensModuleResult.Typography.CaptionLarge, UseTokensModuleResult.Color.Content.Default, WithDefaultsModuleResult.TextXAlignment, 1, 2, `{UseTileModuleResult.testId}--header-subtitle`)
	})
end