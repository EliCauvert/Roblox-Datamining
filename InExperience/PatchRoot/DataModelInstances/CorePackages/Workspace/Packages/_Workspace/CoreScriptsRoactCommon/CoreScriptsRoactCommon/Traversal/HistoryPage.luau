local guiService = game:GetService("GuiService")
local parent = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent
local appCommonLibModule = require(parent.AppCommonLib)
local collectionViewsModule = require(parent.CollectionViews)
local cryoModule = require(parent.Cryo)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local foundationModule = require(parent.Foundation)
local gameCollectionsModule = require(parent.GameCollections)
local impressionsModule = require(parent.Impressions)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local roactServiceTagsModule = require(parent.RoactServiceTags)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local viewportUtilsModule = require(parent.ViewportUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local constantsModule = require(script.Parent.Constants)
local traversalExperienceCardModule = require(script.Parent.TraversalExperienceCard)
local traversalTelemetryModule = require(script.Parent.TraversalTelemetry)
local maxTraversalHistoryCardsPerRow709 = game:DefineFastInt("MaxTraversalHistoryCardsPerRow709", 6)
local fFlagTraversalHistoryDiscoveryTelemetry = sharedFlagsModule.FFlagTraversalHistoryDiscoveryTelemetry
local fFlagTraversalExpPagePaddingFixes = require(script.Parent.Flags).FFlagTraversalExpPagePaddingFixes
local traversalUseDiscoveryCollectionViews = game:DefineFastFlag("TraversalUseDiscoveryCollectionViews", false)
local traversalUseXSmallCollectionItems = game:DefineFastFlag("TraversalUseXSmallCollectionItems", false)
local fFlagIntegrateTraversalHistoryInSideSheet = sharedFlagsModule.FFlagIntegrateTraversalHistoryInSideSheet
local signal = appCommonLibModule.Signal
local collectionLayoutCalculators = collectionViewsModule.CollectionLayoutCalculators
local collectionItemSize = collectionViewsModule.CollectionViewTypes.CollectionItemSize
local gamePlayIntent = discoveryAnalyticsModule.Events.gamePlayIntent
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local text = foundationModule.Text
local view = foundationModule.View
local scrollView = foundationModule.ScrollView
local useTokens = foundationModule.Hooks.useTokens
local sendGameImpressions = gameCollectionsModule.SendGameImpressions
local impressionsTrackerWithoutNavigation = impressionsModule.ImpressionsTrackerWithoutNavigation
local useViewportBounds = viewportUtilsModule.useViewportBounds
local useLocalization = localizationModule.Hooks.useLocalization
local appEventIngestService = roactServiceTagsModule.AppEventIngestService
local roactAnalytics = roactServiceTagsModule.RoactAnalytics
local useRoactService = robloxAppHooksModule.useRoactService

local function getCardsPerRowAndCardWidth(p1)
	local availableWidth = p1.availableWidth
	local maxCardsPerRow = p1.maxCardsPerRow
	local minCardWidth = p1.minCardWidth
	local cardGap = p1.cardGap or 0
	local floored = math.floor((availableWidth + cardGap) / (minCardWidth + cardGap))
	local floored_1 = math.floor((availableWidth - cardGap * (floored - 1)) / floored)
	local floored_2 = math.floor((availableWidth - cardGap * (maxCardsPerRow - 1)) / maxCardsPerRow)
	
	if floored < 1 then
		floored = 1
		
		return floored, minCardWidth
	elseif floored_1 < floored_2 then
		return maxCardsPerRow, floored_2
	end
	return floored, floored_1
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useRoactService (ref), appEventIngestService (ref), roactAnalytics (ref), useTokens (ref), useLocalization (ref), fFlagTraversalExpPagePaddingFixes (ref), reactModule (ref), traversalUseDiscoveryCollectionViews (ref), traversalUseXSmallCollectionItems (ref), guiService (ref), collectionItemSize (ref), collectionLayoutCalculators (ref), collectionViewsModule (ref), getCardsPerRowAndCardWidth (ref), maxTraversalHistoryCardsPerRow709 (ref), signal (ref), cryoModule (ref), traversalExperienceCardModule (ref), constantsModule (ref), traversalTelemetryModule (ref), fFlagTraversalHistoryDiscoveryTelemetry (ref), gamePlayIntent (ref), discoveryAnalyticsModule (ref), useViewportBounds (ref), sendGameImpressions (ref), fFlagIntegrateTraversalHistoryInSideSheet (ref), view (ref), iconButton (ref), iconName (ref), text (ref), scrollView (ref), impressionsTrackerWithoutNavigation (ref)
	local var1, var2
	local var3 = useRoactService(appEventIngestService)
	local var4 = useRoactService(roactAnalytics)
	local var5 = useTokens()
	local var6 = useLocalization({
		historyTitle = "CoreScripts.TopBar.Traversal.History",
		historyDescription = "CoreScripts.InGameMenu.Traversal.HistoryDescription"
	})
	local var7 = if fFlagTraversalExpPagePaddingFixes then var5.Gap.Large else var5.Gap.Small
	local xLarge = var5.Padding.XLarge
	local var8, var9 = reactModule.useState(0)
	local _ = nil
	local _ = nil
	
	if traversalUseDiscoveryCollectionViews then
		local _ = nil
		var1 = collectionLayoutCalculators.calculateNumColumns(var8, 0, var7, if traversalUseXSmallCollectionItems and guiService.ViewportDisplaySize == Enum.DisplaySize.Small then collectionItemSize.XSmall else collectionItemSize.Small, var5)
		var2 = collectionViewsModule.calculateItemWidth(var1, var7, 0, var8, 0)
	else
		local var10, var11 = getCardsPerRowAndCardWidth({
			availableWidth = var8,
			maxCardsPerRow = maxTraversalHistoryCardsPerRow709,
			minCardWidth = var5.Size.Size_2500,
			cardGap = var7
		})
		var1 = var10
		var2 = var11
	end
	var1 = math.max(var1, 1)
	local floored = math.floor(#p1.historyItems / var1)
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useRef({})
	local var14 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var13 (ref)
		var13.current[p3] = p4
	end, {})
	local var15 = reactModule.useRef(nil)
	local var16 = reactModule.useMemo(function()
		-- upvalues: signal (copy)
		return signal.new()
	end, {})
	local var17 = cryoModule.List.map(p1.historyItems, function(p3, p4)
		-- upvalues: reactModule (copy), traversalExperienceCardModule (copy), constantsModule (copy), p1 (ref), traversalTelemetryModule (copy), fFlagTraversalHistoryDiscoveryTelemetry (copy), gamePlayIntent (copy), var3 (ref), discoveryAnalyticsModule (copy), var2 (write), var14 (ref)
		return reactModule.createElement(traversalExperienceCardModule, {
			key = p4,
			name = p3.name,
			image = p3.image,
			impressionIndex = p4,
			impressionTag = constantsModule.CardImpressionTag,
			rating = p3.rating,
			onActivated = function()
				-- upvalues: p1 (copy), traversalTelemetryModule (copy), p3 (ref), p4 (ref), fFlagTraversalHistoryDiscoveryTelemetry (copy), gamePlayIntent (copy), var3 (copy), discoveryAnalyticsModule (copy)
				if not p1.onCardItemActivated then return end
				traversalTelemetryModule.sendHistoryPageExperienceTileClick({
					integration_id = "history_landing_game_tile",
					event_type = "click",
					destination_universe_id = tostring(p3.universeId),
					recency_pos = p4
				})
				
				if fFlagTraversalHistoryDiscoveryTelemetry then
					gamePlayIntent(var3, discoveryAnalyticsModule.Constants.Context.InExpHistoryTile, {
						placeId = tostring(p3.placeId),
						universeId = tostring(p3.universeId),
						sortEntryIndex = tostring(p4)
					})
				end
				p1.onCardItemActivated(p3.universeId)
			end,
			width = var2,
			ref = function(p5)
				-- upvalues: var14 (copy), p4 (ref)
				var14(p4, p5)
			end
		})
	end)
	local var18 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), var12 (ref), var15 (ref), p1 (ref), floored (ref), var1 (write)
		if var18.current then return end
		if not var12.current or not var15.current or not p1.onLoadMoreHistory then return end
		local var19 = var12.current * floored
		
		if var19 + var12.current <= var15.current.AbsoluteSize.Y then
			var18.current = true
			p1.onLoadMoreHistory(math.max(math.floor((var15.current.AbsoluteSize.Y - var19) / var12.current), 1) * var1)
		end
	end, { p1.onLoadMoreHistory, var1, floored })
	local var19 = reactModule.useCallback(function()
		-- upvalues: traversalTelemetryModule (copy), p1 (ref)
		traversalTelemetryModule.sendHistoryPageBackButtonClick({
			integration_id = "history_landing_back_button",
			event_type = "click"
		})
		p1.onHistoryClose()
	end, { p1.onHistoryClose })
	
	return reactModule.createElement(view, {
		tag = "col auto-xy size-full-0",
		selectionGroup = {
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		}
	}, {
		TopContainer = if fFlagIntegrateTraversalHistoryInSideSheet then nil elseif fFlagTraversalExpPagePaddingFixes then reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-x-small padding-bottom-large"
		}, {
			ChevronButton = reactModule.createElement(iconButton, {
				icon = iconName.ChevronLargeLeft,
				onActivated = var19,
				ref = p2
			})
		}) else reactModule.createElement(iconButton, {
			icon = iconName.ChevronLargeLeft,
			onActivated = var19,
			ref = p2
		}),
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col auto-y size-full-0 " .. (if fFlagTraversalExpPagePaddingFixes then "" else "padding-left-medium padding-top-small padding-bottom-large"),
			padding = if fFlagTraversalExpPagePaddingFixes then {
				left = UDim.new(0, xLarge),
				bottom = UDim.new(0, var5.Padding.XLarge)
			} else nil
		}, {
			Title = not fFlagIntegrateTraversalHistoryInSideSheet and reactModule.createElement(text, {
				tag = "auto-xy text-heading-small text-truncate-split",
				Text = var6.historyTitle
			}),
			Description = reactModule.createElement(text, {
				tag = "auto-xy text-body-large text-truncate-split",
				Text = var6.historyDescription
			})
		}),
		ScrollContent = reactModule.createElement(scrollView, {
			tag = "size-full shrink",
			LayoutOrder = 2,
			selectionGroup = false,
			padding = if fFlagIntegrateTraversalHistoryInSideSheet then {
				left = UDim.new(0, xLarge),
				right = UDim.new(0, xLarge),
				top = UDim.new(0, var5.Padding.Small)
			} elseif fFlagTraversalExpPagePaddingFixes then { left = UDim.new(0, xLarge), right = UDim.new(0, xLarge) } else UDim.new(0, xLarge),
			layout = {
				Wraps = true,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, var7)
			},
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(0, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			},
			onAbsoluteSizeChanged = reactModule.useCallback(function(p3)
				-- upvalues: xLarge (ref), var9 (ref), var13 (ref), var12 (ref)
				var9(p3.AbsoluteSize.X - 2 * xLarge)
				
				if var13.current[1] then
					var12.current = var13.current[1].AbsoluteSize.Y
				end
			end, { xLarge }),
			onCanvasPositionChanged = reactModule.useCallback(function(p3)
				-- upvalues: var16 (ref), p1 (ref), var12 (ref), var1 (write)
				var16:fire()
				
				if not p1.onLoadMoreHistory or not var12.current then return end
				if p3.AbsoluteCanvasSize.Y <= p3.CanvasPosition.Y + p3.AbsoluteWindowSize.Y + var12.current then
					p1.onLoadMoreHistory(var1)
				end
			end, { p1.onLoadMoreHistory, var1, var16 }),
			scrollingFrameRef = var15,
			selection = { Selectable = false }
		}, var17),
		TraversalHistoryCardImpressionTracker = fFlagTraversalHistoryDiscoveryTelemetry and reactModule.createElement(impressionsTrackerWithoutNavigation, {
			parentRef = var15,
			impressionsTag = constantsModule.CardImpressionTag,
			scrollViewPositionChangedSignal = var16,
			sendImpressions = reactModule.useCallback(function(p3)
				-- upvalues: fFlagTraversalHistoryDiscoveryTelemetry (copy), p1 (ref), sendGameImpressions (copy), var3 (ref), var4 (ref), var1 (write), floored (ref)
				if fFlagTraversalHistoryDiscoveryTelemetry then
					local t = {}
					
					for i, v in p1.historyItems do
						if v then
							table.insert(t, {
								placeId = tostring(v.placeId),
								universeId = tostring(v.universeId),
								uiIndex = i
							})
						end
					end
					sendGameImpressions.sendFromTraversalHistoryPage(var3, var4, p3, t, var1, floored)
				end
			end, {
				p1.historyItems,
				var4,
				var1,
				var3,
				floored
			}),
			viewPortBounds = useViewportBounds()
		})
	})
end))