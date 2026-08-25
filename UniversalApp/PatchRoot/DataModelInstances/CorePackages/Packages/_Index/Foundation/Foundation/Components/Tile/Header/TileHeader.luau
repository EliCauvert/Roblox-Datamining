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

local function getTypographyComponent(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: reactModule (ref), skeletonModule (ref), useTextSizeOffsetModule (ref), textModule (ref)
	local var1, var2, var3, var4
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if typeof(p1) == "string" then
		var1 = p1
		var2 = p2
		var3 = p3
		var4 = p5
	elseif p1.isLoading then
		return reactModule.createElement(skeletonModule, {
			Size = UDim2.new(1 / p6, 0, 0, p2.FontSize),
			LayoutOrder = p6
		})
	end
	var1 = p1.text
	var2 = p1.fontStyle or p2
	var3 = p1.colorStyle or p3
	var4 = p1.numLines or p5
	assert(var2 ~= nil, "fontStyle cannot be nil")
	assert(var3 ~= nil, "colorStyle cannot be nil")
	assert(var4 ~= nil, "numLines cannot be nil")
	var2.LineHeight = 1
	
	return reactModule.createElement(textModule, {
		fontStyle = var2,
		textStyle = var3,
		Text = var1,
		TextXAlignment = p4,
		TextTruncate = Enum.TextTruncate.AtEnd,
		TextWrapped = var4 <= 1,
		Size = UDim2.new(1, 0, 0, var4 * (var2.FontSize + (useTextSizeOffsetModule() or 0)) * var2.LineHeight),
		LayoutOrder = p6,
		testId = p7
	})
end

local t = { TextXAlignment = Enum.TextXAlignment.Left }

return function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useTileModule (ref), getTypographyComponent (ref), reactModule (ref), viewModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3 = useTileModule()
	
	return reactModule.createElement(viewModule, {
		tag = "gap-xxsmall size-full-0 auto-y",
		flexItem = { FlexMode = Enum.UIFlexMode.Shrink },
		layout = {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		testId = `{var3.testId}--header`
	}, {
		Title = getTypographyComponent(var1.title, var2.Typography.TitleLarge, var2.Color.Content.Emphasis, var1.TextXAlignment, if var1.subtitle == nil then 2 else 1, 1, `{var3.testId}--header-title`),
		Subtitle = if var1.subtitle ~= nil then nil else getTypographyComponent(var1.subtitle, var2.Typography.CaptionLarge, var2.Color.Content.Default, var1.TextXAlignment, 1, 2, `{var3.testId}--header-subtitle`)
	})
end