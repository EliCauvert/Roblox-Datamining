local gameFilters = script:FindFirstAncestor("GameFilters")
local parent = gameFilters.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.DiscoveryTypes)
local reactModule = require(parent.React)
local screenSizeImpressionsTracker = require(parent.Impressions).ScreenSizeImpressionsTracker
local frameBoundsImpressionsTracker = require(parent.Impressions).FrameBoundsImpressionsTracker
local variableItemWidthCarousel = require(parent.VariableItemWidthCarousel).VariableItemWidthCarousel
local useCollectionImpressionsSignal = require(parent.CollectionViews).useCollectionImpressionsSignal
local useTokens = require(parent.Foundation).Hooks.useTokens
local filterPillModule = require(gameFilters.Components.FilterPill)
local fFlagLuaAppUseFrameBoundsImpressions = require(parent.SharedFlags).FFlagLuaAppUseFrameBoundsImpressions
local _ = require(gameFilters.FilterCallbackTypes)

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), useCollectionImpressionsSignal (ref), filterPillModule (ref), cryoModule (ref), variableItemWidthCarousel (ref), fFlagLuaAppUseFrameBoundsImpressions (ref), frameBoundsImpressionsTracker (ref), screenSizeImpressionsTracker (ref)
	local var1 = useTokens()
	local var2, var3 = reactModule.useState({})
	local var4 = reactModule.useRef(nil)
	local text = "FilterPillCarousel_" .. p0.sortIndex
	local var5, var6 = useCollectionImpressionsSignal(p1.scrollViewPositionChangedSignal)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		FilterCarousel = reactModule.createElement(variableItemWidthCarousel, {
			scrollButtonEnabled = true,
			title = if p1.title and p1.title ~= "" then reactModule.useCallback(function()
				-- upvalues: var1 (ref), reactModule (copy), p1 (ref)
				local bodyMedium = var1.Typography.BodyMedium
				local muted = var1.Color.Content.Muted
				
				return reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = false,
					LayoutOrder = 1,
					Text = p1.title,
					Size = UDim2.new(0, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					Font = bodyMedium.Font,
					TextSize = bodyMedium.FontSize,
					TextTransparency = muted.Transparency,
					TextColor3 = muted.Color3,
					TextTruncate = Enum.TextTruncate.SplitWord,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			end, { p1.title, var1 }) else "",
			items = p1.filters,
			renderItem = reactModule.useCallback(function(p2, p3)
				-- upvalues: reactModule (copy), filterPillModule (copy), p1 (ref), text (ref), var3 (ref), cryoModule (copy), var2 (ref)
				return reactModule.createElement(filterPillModule, {
					analyticsInfo = p1.analyticsInfo,
					filter = p2,
					impressionsTag = text,
					index = p3,
					onFilterApplied = p1.onFilterApplied,
					onAbsoluteSizeChanged = function(value)
						-- upvalues: var3 (copy), cryoModule (copy), var2 (copy), p3 (ref)
						if value then
							var3(cryoModule.Dictionary.join(var2, { [p3] = value.AbsoluteSize.X }))
						end
					end,
					pageContext = p1.pageContext,
					sendFilterClick = p1.sendFilterClick
				})
			end, {
				p1.analyticsInfo, text, p1.onFilterApplied, var2, p1.pageContext,
				p1.sendFilterClick
			}),
			onCanvasPositionChanged = var6,
			calculateItemWidth = reactModule.useCallback(function(p2)
				-- upvalues: var2 (ref)
				return var2[p2] or 0
			end, { var2 }),
			itemHeight = var1.Size.Size_800,
			headerContentPadding = var1.Padding.XSmall,
			itemPadding = var1.Padding.XSmall,
			sideMargin = p1.sideMargin,
			LayoutOrder = p1.sortIndex,
			scrollingFrameRef = var4,
			ref = p1.containerRef
		}),
		ImpressionsTracker = reactModule.createElement(if fFlagLuaAppUseFrameBoundsImpressions then frameBoundsImpressionsTracker else screenSizeImpressionsTracker, {
			impressionsTag = text,
			pageContext = p1.pageContext,
			parentRef = var4,
			scrollViewPositionChangedSignal = var5,
			sendImpressions = p1.sendImpressions,
			dataUpdatedTimestamp = p1.dataUpdatedTimestamp
		})
	})
end