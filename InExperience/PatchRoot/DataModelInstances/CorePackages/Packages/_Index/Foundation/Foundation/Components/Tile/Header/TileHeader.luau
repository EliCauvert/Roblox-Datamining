local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local skeletonModule = require(foundation.Components.Skeleton)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTextSizeOffsetModule = require(foundation.Providers.Style.useTextSizeOffset)
local useTileModule = require(foundation.Components.Tile.useTile)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withDefaultsModule = require(foundation.Utility.withDefaults)

local function getTypographyComponent(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: reactModule (ref), skeletonModule (ref), useTextSizeOffsetModule (ref), textModule (ref)
	local var11, var12, var13, var14
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if typeof(p0) == "string" then
		var11 = p0
		var12 = p1
		var13 = p2
		var14 = p4
	elseif p0.isLoading then
		return reactModule.createElement(skeletonModule, {
			Size = UDim2.new(1 / p5, 0, 0, p1.FontSize),
			LayoutOrder = p5
		})
	end
	var11 = p0.text
	var12 = p0.fontStyle or p1
	var13 = p0.colorStyle or p2
	var14 = p0.numLines or p4
	assert(var12 ~= nil, "fontStyle cannot be nil")
	assert(var13 ~= nil, "colorStyle cannot be nil")
	assert(var14 ~= nil, "numLines cannot be nil")
	var12.LineHeight = 1
	
	return reactModule.createElement(textModule, {
		fontStyle = var12,
		textStyle = var13,
		Text = var11,
		TextXAlignment = p3,
		TextTruncate = Enum.TextTruncate.AtEnd,
		TextWrapped = var14 <= 1,
		Size = UDim2.new(1, 0, 0, var14 * (var12.FontSize + (useTextSizeOffsetModule() or 0)) * var12.LineHeight),
		LayoutOrder = p5,
		testId = p6
	})
end

local t = { TextXAlignment = Enum.TextXAlignment.Left }

return function(p7)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useTileModule (ref), getTypographyComponent (ref), reactModule (ref), viewModule (ref)
	local var15 = withDefaultsModule(p7, t)
	local var16 = useTokensModule()
	local var17 = useTileModule()
	
	return reactModule.createElement(viewModule, {
		tag = "gap-xxsmall size-full-0 auto-y",
		flexItem = { FlexMode = Enum.UIFlexMode.Shrink },
		layout = {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		testId = `{var17.testId}--header`
	}, {
		Title = getTypographyComponent(var15.title, var16.Typography.TitleLarge, var16.Color.Content.Emphasis, var15.TextXAlignment, if var15.subtitle == nil then 2 else 1, 1, `{var17.testId}--header-title`),
		Subtitle = if var15.subtitle ~= nil then nil else getTypographyComponent(var15.subtitle, var16.Typography.CaptionLarge, var16.Color.Content.Default, var15.TextXAlignment, 1, 2, `{var17.testId}--header-subtitle`)
	})
end