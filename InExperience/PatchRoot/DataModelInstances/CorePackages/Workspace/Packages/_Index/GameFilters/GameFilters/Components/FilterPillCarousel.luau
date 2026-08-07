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
local fFlagLuaAppHideEmptyCarouselHeader = require(parent.SharedFlags).FFlagLuaAppHideEmptyCarouselHeader
local _ = require(gameFilters.FilterCallbackTypes)

return function(p0) --[[ line: 40 ]]
	-- upvalues: useTokens (ref), reactModule (ref), useCollectionImpressionsSignal (ref), fFlagLuaAppHideEmptyCarouselHeader (ref), filterPillModule (ref), cryoModule (ref), variableItemWidthCarousel (ref), fFlagLuaAppUseFrameBoundsImpressions (ref), frameBoundsImpressionsTracker (ref), screenSizeImpressionsTracker (ref)
	local var4 = useTokens()
	local var5, var6 = reactModule.useState({})
	local var7 = reactModule.useRef(nil)
	local text = "FilterPillCarousel_" .. p0.sortIndex
	local var9, var10 = useCollectionImpressionsSignal(p0.scrollViewPositionChangedSignal)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		FilterCarousel = reactModule.createElement(variableItemWidthCarousel, {
			scrollButtonEnabled = true,
			title = if fFlagLuaAppHideEmptyCarouselHeader and (not p0.title or p0.title == "") then "" elseif fFlagLuaAppHideEmptyCarouselHeader or p0.title then reactModule.useCallback(function() --[[ line: 59 ]]
				-- upvalues: var4 (ref), reactModule (copy), p0 (ref)
				local bodyMedium = var4.Typography.BodyMedium
				local muted = var4.Color.Content.Muted
				
				return reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = false,
					LayoutOrder = 1,
					Text = p0.title,
					Size = UDim2.new(0, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					Font = bodyMedium.Font,
					TextSize = bodyMedium.FontSize,
					TextTransparency = muted.Transparency,
					TextColor3 = muted.Color3,
					TextTruncate = Enum.TextTruncate.SplitWord,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			end, { p0.title, var4 }) else "",
			items = p0.filters,
			renderItem = reactModule.useCallback(function(p1, p2) --[[ line: 84 ]]
				-- upvalues: reactModule (copy), filterPillModule (copy), p0 (ref), text (ref), var6 (ref), cryoModule (copy), var5 (ref)
				return reactModule.createElement(filterPillModule, {
					analyticsInfo = p0.analyticsInfo,
					filter = p1,
					impressionsTag = text,
					index = p2,
					onFilterApplied = p0.onFilterApplied,
					onAbsoluteSizeChanged = function(value) --[[ line: 91 ]]
						-- upvalues: var6 (copy), cryoModule (copy), var5 (copy), p2 (ref)
						if value then
							var6(cryoModule.Dictionary.join(var5, { [p2] = value.AbsoluteSize.X }))
						end
					end,
					pageContext = p0.pageContext,
					sendFilterClick = p0.sendFilterClick
				})
			end, {
				p0.analyticsInfo, text, p0.onFilterApplied, var5, p0.pageContext,
				p0.sendFilterClick
			}),
			onCanvasPositionChanged = var10,
			calculateItemWidth = reactModule.useCallback(function(p3) --[[ line: 110 ]]
				-- upvalues: var5 (ref)
				return var5[p3] or 0
			end, { var5 }),
			itemHeight = var4.Size.Size_800,
			headerContentPadding = var4.Padding.XSmall,
			itemPadding = var4.Padding.XSmall,
			sideMargin = p0.sideMargin,
			LayoutOrder = p0.sortIndex,
			scrollingFrameRef = var7,
			ref = p0.containerRef
		}),
		ImpressionsTracker = reactModule.createElement(if fFlagLuaAppUseFrameBoundsImpressions then frameBoundsImpressionsTracker else screenSizeImpressionsTracker, {
			impressionsTag = text,
			pageContext = p0.pageContext,
			parentRef = var7,
			scrollViewPositionChangedSignal = var9,
			sendImpressions = p0.sendImpressions,
			dataUpdatedTimestamp = p0.dataUpdatedTimestamp
		})
	})
end