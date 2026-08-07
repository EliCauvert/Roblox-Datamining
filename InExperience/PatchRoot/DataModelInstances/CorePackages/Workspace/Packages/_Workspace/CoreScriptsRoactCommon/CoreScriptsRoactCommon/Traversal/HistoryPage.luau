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

local function getCardsPerRowAndCardWidth(p0) --[[ line: 73 ]]
	local availableWidth = p0.availableWidth
	local maxCardsPerRow = p0.maxCardsPerRow
	local minCardWidth = p0.minCardWidth
	local cardGap = p0.cardGap or 0
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

return reactModule.memo(reactModule.forwardRef(function(p1, p2) --[[ line: 95 | named "HistoryPage" ]]
	-- upvalues: useRoactService (ref), appEventIngestService (ref), roactAnalytics (ref), useTokens (ref), useLocalization (ref), fFlagTraversalExpPagePaddingFixes (ref), reactModule (ref), traversalUseDiscoveryCollectionViews (ref), traversalUseXSmallCollectionItems (ref), guiService (ref), collectionItemSize (ref), collectionLayoutCalculators (ref), collectionViewsModule (ref), getCardsPerRowAndCardWidth (ref), maxTraversalHistoryCardsPerRow709 (ref), signal (ref), cryoModule (ref), traversalExperienceCardModule (ref), constantsModule (ref), traversalTelemetryModule (ref), fFlagTraversalHistoryDiscoveryTelemetry (ref), gamePlayIntent (ref), discoveryAnalyticsModule (ref), useViewportBounds (ref), sendGameImpressions (ref), fFlagIntegrateTraversalHistoryInSideSheet (ref), view (ref), iconButton (ref), iconName (ref), text (ref), scrollView (ref), impressionsTrackerWithoutNavigation (ref)
	local var34, var35
	local var25 = useRoactService(appEventIngestService)
	local var26 = useRoactService(roactAnalytics)
	local var27 = useTokens()
	local var28 = useLocalization({
		historyTitle = "CoreScripts.TopBar.Traversal.History",
		historyDescription = "CoreScripts.InGameMenu.Traversal.HistoryDescription"
	})
	local var29 = if fFlagTraversalExpPagePaddingFixes then var27.Gap.Large else var27.Gap.Small
	local xLarge = var27.Padding.XLarge
	local var30, var31 = reactModule.useState(0)
	local _ = nil
	local _ = nil
	
	if traversalUseDiscoveryCollectionViews then
		local _ = nil
		var34 = collectionLayoutCalculators.calculateNumColumns(var30, 0, var29, if traversalUseXSmallCollectionItems and guiService.ViewportDisplaySize == Enum.DisplaySize.Small then collectionItemSize.XSmall else collectionItemSize.Small, var27)
		var35 = collectionViewsModule.calculateItemWidth(var34, var29, 0, var30, 0)
	else
		local var32, var33 = getCardsPerRowAndCardWidth({
			availableWidth = var30,
			maxCardsPerRow = maxTraversalHistoryCardsPerRow709,
			minCardWidth = var27.Size.Size_2500,
			cardGap = var29
		})
		var34 = var32
		var35 = var33
	end
	var34 = math.max(var34, 1)
	local floored = math.floor(#p1.historyItems / var34)
	local var37 = reactModule.useRef(nil)
	local var38 = reactModule.useRef({})
	local var39 = reactModule.useCallback(function(p3, p4) --[[ line: 130 ]]
		-- upvalues: var38 (ref)
		var38.current[p3] = p4
	end, {})
	local var40 = reactModule.useRef(nil)
	local var41 = reactModule.useMemo(function() --[[ line: 134 ]]
		-- upvalues: signal (copy)
		return signal.new()
	end, {})
	local var42 = cryoModule.List.map(p1.historyItems, function(p5, p6) --[[ line: 138 ]]
		-- upvalues: reactModule (copy), traversalExperienceCardModule (copy), constantsModule (copy), p1 (ref), traversalTelemetryModule (copy), fFlagTraversalHistoryDiscoveryTelemetry (copy), gamePlayIntent (copy), var25 (ref), discoveryAnalyticsModule (copy), var35 (write), var39 (ref)
		return reactModule.createElement(traversalExperienceCardModule, {
			key = p6,
			name = p5.name,
			image = p5.image,
			impressionIndex = p6,
			impressionTag = constantsModule.CardImpressionTag,
			rating = p5.rating,
			onActivated = function() --[[ line: 146 ]]
				-- upvalues: p1 (copy), traversalTelemetryModule (copy), p5 (ref), p6 (ref), fFlagTraversalHistoryDiscoveryTelemetry (copy), gamePlayIntent (copy), var25 (copy), discoveryAnalyticsModule (copy)
				if not p1.onCardItemActivated then return end
				traversalTelemetryModule.sendHistoryPageExperienceTileClick({
					integration_id = "history_landing_game_tile",
					event_type = "click",
					destination_universe_id = tostring(p5.universeId),
					recency_pos = p6
				})
				
				if fFlagTraversalHistoryDiscoveryTelemetry then
					gamePlayIntent(var25, discoveryAnalyticsModule.Constants.Context.InExpHistoryTile, {
						placeId = tostring(p5.placeId),
						universeId = tostring(p5.universeId),
						sortEntryIndex = tostring(p6)
					})
				end
				p1.onCardItemActivated(p5.universeId)
			end,
			width = var35,
			ref = function(p7) --[[ line: 168 ]]
				-- upvalues: var39 (copy), p6 (ref)
				var39(p6, p7)
			end
		})
	end)
	local var43 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 177 ]]
		-- upvalues: var43 (ref), var37 (ref), var40 (ref), p1 (ref), floored (ref), var34 (write)
		if var43.current then return end
		if not var37.current or not var40.current or not p1.onLoadMoreHistory then return end
		local var45 = var37.current * floored
		
		if var45 + var37.current <= var40.current.AbsoluteSize.Y then
			var43.current = true
			p1.onLoadMoreHistory(math.max(math.floor((var40.current.AbsoluteSize.Y - var45) / var37.current), 1) * var34)
		end
	end, { p1.onLoadMoreHistory, var34, floored })
	local var44 = reactModule.useCallback(function() --[[ line: 237 ]]
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
				onActivated = var44,
				ref = p2
			})
		}) else reactModule.createElement(iconButton, {
			icon = iconName.ChevronLargeLeft,
			onActivated = var44,
			ref = p2
		}),
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col auto-y size-full-0 " .. (if fFlagTraversalExpPagePaddingFixes then "" else "padding-left-medium padding-top-small padding-bottom-large"),
			padding = if fFlagTraversalExpPagePaddingFixes then {
				left = UDim.new(0, xLarge),
				bottom = UDim.new(0, var27.Padding.XLarge)
			} else nil
		}, {
			Title = not fFlagIntegrateTraversalHistoryInSideSheet and reactModule.createElement(text, {
				tag = "auto-xy text-heading-small text-truncate-split",
				Text = var28.historyTitle
			}),
			Description = reactModule.createElement(text, {
				tag = "auto-xy text-body-large text-truncate-split",
				Text = var28.historyDescription
			})
		}),
		ScrollContent = reactModule.createElement(scrollView, {
			tag = "size-full shrink",
			LayoutOrder = 2,
			selectionGroup = false,
			padding = if fFlagIntegrateTraversalHistoryInSideSheet then {
				left = UDim.new(0, xLarge),
				right = UDim.new(0, xLarge),
				top = UDim.new(0, var27.Padding.Small)
			} elseif fFlagTraversalExpPagePaddingFixes then { left = UDim.new(0, xLarge), right = UDim.new(0, xLarge) } else UDim.new(0, xLarge),
			layout = {
				Wraps = true,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, var29)
			},
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(0, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			},
			onAbsoluteSizeChanged = reactModule.useCallback(function(p8) --[[ line: 246 ]]
				-- upvalues: xLarge (ref), var31 (ref), var38 (ref), var37 (ref)
				var31(p8.AbsoluteSize.X - 2 * xLarge)
				
				if var38.current[1] then
					var37.current = var38.current[1].AbsoluteSize.Y
				end
			end, { xLarge }),
			onCanvasPositionChanged = reactModule.useCallback(function(p9) --[[ line: 255 ]]
				-- upvalues: var41 (ref), p1 (ref), var37 (ref), var34 (write)
				var41:fire()
				
				if not p1.onLoadMoreHistory or not var37.current then return end
				if p9.AbsoluteCanvasSize.Y <= p9.CanvasPosition.Y + p9.AbsoluteWindowSize.Y + var37.current then
					p1.onLoadMoreHistory(var34)
				end
			end, { p1.onLoadMoreHistory, var34, var41 }),
			scrollingFrameRef = var40,
			selection = { Selectable = false }
		}, var42),
		TraversalHistoryCardImpressionTracker = fFlagTraversalHistoryDiscoveryTelemetry and reactModule.createElement(impressionsTrackerWithoutNavigation, {
			parentRef = var40,
			impressionsTag = constantsModule.CardImpressionTag,
			scrollViewPositionChangedSignal = var41,
			sendImpressions = reactModule.useCallback(function(p10) --[[ line: 205 ]]
				-- upvalues: fFlagTraversalHistoryDiscoveryTelemetry (copy), p1 (ref), sendGameImpressions (copy), var25 (ref), var26 (ref), var34 (write), floored (ref)
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
					sendGameImpressions.sendFromTraversalHistoryPage(var25, var26, p10, t, var34, floored)
				end
			end, {
				p1.historyItems,
				var26,
				var34,
				var25,
				floored
			}),
			viewPortBounds = useViewportBounds()
		})
	})
end))