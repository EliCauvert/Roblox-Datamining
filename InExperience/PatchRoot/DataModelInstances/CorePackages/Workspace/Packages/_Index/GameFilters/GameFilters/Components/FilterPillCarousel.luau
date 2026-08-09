local gameFilters = script:FindFirstAncestor("GameFilters")
local parent = gameFilters.Parent
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local cryoModule = require(parent.Cryo)
local _ = require(parent.DiscoveryTypes)
local reactModule = require(parent.React)
local screenSizeImpressionsTracker = require(parent.Impressions).ScreenSizeImpressionsTracker
local frameBoundsImpressionsTracker = require(parent.Impressions).FrameBoundsImpressionsTracker
local variableItemWidthCarousel = require(parent.VariableItemWidthCarousel).VariableItemWidthCarousel
local useCollectionImpressionsSignal = require(parent.CollectionViews).useCollectionImpressionsSignal
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useTokens = require(parent.Foundation).Hooks.useTokens
local filterPillModule = require(gameFilters.Components.FilterPill)
local sendFilterImpressionsModule = require(gameFilters.Analytics.sendFilterImpressions)
local fFlagLuaAppUseFrameBoundsImpressions = require(parent.SharedFlags).FFlagLuaAppUseFrameBoundsImpressions
local fFlagLuaAppFilterCarouselCallbacks = require(parent.SharedFlags).FFlagLuaAppFilterCarouselCallbacks
local fFlagLuaAppHideEmptyCarouselHeader = require(parent.SharedFlags).FFlagLuaAppHideEmptyCarouselHeader
local _ = require(gameFilters.FilterCallbackTypes)

return function(p0) --[[ line: 44 ]]
	-- upvalues: useTokens (ref), reactModule (ref), useCollectionImpressionsSignal (ref), fFlagLuaAppFilterCarouselCallbacks (ref), useRoactService (ref), appEventIngestService (ref), sendFilterImpressionsModule (ref), fFlagLuaAppHideEmptyCarouselHeader (ref), filterPillModule (ref), cryoModule (ref), variableItemWidthCarousel (ref), fFlagLuaAppUseFrameBoundsImpressions (ref), frameBoundsImpressionsTracker (ref), screenSizeImpressionsTracker (ref)
	local sendImpressions
	local var5 = useTokens()
	local var6, var7 = reactModule.useState({})
	local var8 = reactModule.useRef(nil)
	local text = "FilterPillCarousel_" .. p0.sortIndex
	local var10, var11 = useCollectionImpressionsSignal(p0.scrollViewPositionChangedSignal)
	local _ = nil
	
	if fFlagLuaAppFilterCarouselCallbacks then
		sendImpressions = p0.sendImpressions
	else
		local var12 = useRoactService(appEventIngestService)
		sendImpressions = reactModule.useCallback(function(p1) --[[ line: 63 ]]
			-- upvalues: sendFilterImpressionsModule (copy), var12 (ref), p0 (ref)
			sendFilterImpressionsModule(var12, p1, p0.filters, p0.pageContext, p0.analyticsInfo)
		end, { var12, p0.filters, p0.pageContext, p0.analyticsInfo })
	end
	return reactModule.createElement(reactModule.Fragment, nil, {
		FilterCarousel = reactModule.createElement(variableItemWidthCarousel, {
			scrollButtonEnabled = true,
			title = if fFlagLuaAppHideEmptyCarouselHeader and (not p0.title or p0.title == "") then "" elseif fFlagLuaAppHideEmptyCarouselHeader or p0.title then reactModule.useCallback(function() --[[ line: 77 ]]
				-- upvalues: var5 (ref), reactModule (copy), p0 (ref)
				local bodyMedium = var5.Typography.BodyMedium
				local muted = var5.Color.Content.Muted
				
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
			end, { p0.title, var5 }) else "",
			items = p0.filters,
			renderItem = reactModule.useCallback(function(p2, p3) --[[ line: 102 ]]
				-- upvalues: reactModule (copy), filterPillModule (copy), p0 (ref), text (ref), var7 (ref), cryoModule (copy), var6 (ref), fFlagLuaAppFilterCarouselCallbacks (copy)
				return reactModule.createElement(filterPillModule, {
					analyticsInfo = p0.analyticsInfo,
					filter = p2,
					impressionsTag = text,
					index = p3,
					onFilterApplied = p0.onFilterApplied,
					onAbsoluteSizeChanged = function(value) --[[ line: 109 ]]
						-- upvalues: var7 (copy), cryoModule (copy), var6 (copy), p3 (ref)
						if value then
							var7(cryoModule.Dictionary.join(var6, { [p3] = value.AbsoluteSize.X }))
						end
					end,
					pageContext = p0.pageContext,
					sendFilterClick = if fFlagLuaAppFilterCarouselCallbacks then p0.sendFilterClick else nil
				})
			end, {
				p0.analyticsInfo, text, p0.onFilterApplied, var6, p0.pageContext,
				if fFlagLuaAppFilterCarouselCallbacks then p0.sendFilterClick else nil
			}),
			onCanvasPositionChanged = var11,
			calculateItemWidth = reactModule.useCallback(function(p4) --[[ line: 128 ]]
				-- upvalues: var6 (ref)
				return var6[p4] or 0
			end, { var6 }),
			itemHeight = var5.Size.Size_800,
			headerContentPadding = var5.Padding.XSmall,
			itemPadding = var5.Padding.XSmall,
			sideMargin = p0.sideMargin,
			LayoutOrder = p0.sortIndex,
			scrollingFrameRef = var8,
			ref = p0.containerRef
		}),
		ImpressionsTracker = reactModule.createElement(if fFlagLuaAppUseFrameBoundsImpressions then frameBoundsImpressionsTracker else screenSizeImpressionsTracker, {
			impressionsTag = text,
			pageContext = p0.pageContext,
			parentRef = var8,
			scrollViewPositionChangedSignal = var10,
			sendImpressions = sendImpressions,
			dataUpdatedTimestamp = p0.dataUpdatedTimestamp
		})
	})
end