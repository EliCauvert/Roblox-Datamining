local GuiService = game:GetService("GuiService")
local Parent = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent
local CollectionViewsModule = require(Parent.CollectionViews)
local CryoModule = require(Parent.Cryo)
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local SharedFlagsModule = require(Parent.SharedFlags)
local ConstantsModule = require(script.Parent.Constants)
local TraversalExperienceCardModule = require(script.Parent.TraversalExperienceCard)
local TraversalTelemetryModule = require(script.Parent.TraversalTelemetry)
local MaxTraversalHistoryCardsPerRow709 = game:DefineFastInt("MaxTraversalHistoryCardsPerRow709", 6)
local FFlagTraversalHistoryDiscoveryTelemetry = SharedFlagsModule.FFlagTraversalHistoryDiscoveryTelemetry
local FFlagTraversalExpPagePaddingFixes = require(script.Parent.Flags).FFlagTraversalExpPagePaddingFixes
local TraversalUseDiscoveryCollectionViews = game:DefineFastFlag("TraversalUseDiscoveryCollectionViews", false)
local TraversalUseXSmallCollectionItems = game:DefineFastFlag("TraversalUseXSmallCollectionItems", false)
local FFlagIntegrateTraversalHistoryInSideSheet = SharedFlagsModule.FFlagIntegrateTraversalHistoryInSideSheet
local Signal = require(Parent.AppCommonLib).Signal
local CollectionLayoutCalculators = CollectionViewsModule.CollectionLayoutCalculators
local CollectionItemSize = CollectionViewsModule.CollectionViewTypes.CollectionItemSize
local GamePlayIntentFunction = DiscoveryAnalyticsModule.Events.gamePlayIntent
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local Text = FoundationModule.Text
local View = FoundationModule.View
local ScrollView = FoundationModule.ScrollView
local UseTokensFunction = FoundationModule.Hooks.useTokens
local SendGameImpressions = require(Parent.GameCollections).SendGameImpressions
local ImpressionsTrackerWithoutNavigation = require(Parent.Impressions).ImpressionsTrackerWithoutNavigation
local UseViewportBoundsFunction = require(Parent.ViewportUtils).useViewportBounds
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService

local function getCardsPerRowAndCardWidth(p1) --[[ Line: 73 ]]
	local AvailableWidth = p1.availableWidth
	local MaxCardsPerRow: number = p1.maxCardsPerRow
	local MinCardWidth = p1.minCardWidth
	local CardGap = p1.cardGap or 0
	local Floored = math.floor((AvailableWidth + CardGap) / (MinCardWidth + CardGap))
	local Floored1 = math.floor((AvailableWidth - CardGap * (Floored - 1)) / Floored)
	local Floored2 = math.floor((AvailableWidth - CardGap * (MaxCardsPerRow - 1)) / MaxCardsPerRow)
	
	if Floored < 1 then
		Floored = 1
		
		return Floored, MinCardWidth
	elseif Floored1 < Floored2 then
		return MaxCardsPerRow, Floored2
	else
		return Floored, Floored1
	end
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 95 | Named "HistoryPage" ]]
	-- upvalues: UseRoactServiceFunction (copy), AppEventIngestService (copy), RoactAnalytics (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), FFlagTraversalExpPagePaddingFixes (copy), ReactModule (copy), TraversalUseDiscoveryCollectionViews (copy), TraversalUseXSmallCollectionItems (copy), GuiService (copy), CollectionItemSize (copy), CollectionLayoutCalculators (copy), CollectionViewsModule (copy), getCardsPerRowAndCardWidth (copy), MaxTraversalHistoryCardsPerRow709 (copy), Signal (copy), CryoModule (copy), TraversalExperienceCardModule (copy), ConstantsModule (copy), TraversalTelemetryModule (copy), FFlagTraversalHistoryDiscoveryTelemetry (copy), GamePlayIntentFunction (copy), DiscoveryAnalyticsModule (copy), UseViewportBoundsFunction (copy), SendGameImpressions (copy), FFlagIntegrateTraversalHistoryInSideSheet (copy), View (copy), IconButton (copy), IconName (copy), Text (copy), ScrollView (copy), ImpressionsTrackerWithoutNavigation (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalytics)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		historyTitle = "CoreScripts.TopBar.Traversal.History",
		historyDescription = "CoreScripts.InGameMenu.Traversal.HistoryDescription"
	})
	local Large = if FFlagTraversalExpPagePaddingFixes then UseTokensResult.Gap.Large else UseTokensResult.Gap.Small
	local XLarge = UseTokensResult.Padding.XLarge
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local Largest = nil
	local ItemWidth = nil
	local NumColumns = nil
	
	if TraversalUseDiscoveryCollectionViews then
		NumColumns = CollectionLayoutCalculators.calculateNumColumns(UseStateResult, 0, Large, if TraversalUseXSmallCollectionItems and GuiService.ViewportDisplaySize == Enum.DisplaySize.Small then CollectionItemSize.XSmall else CollectionItemSize.Small, UseTokensResult)
		ItemWidth = CollectionViewsModule.calculateItemWidth(NumColumns, Large, 0, UseStateResult, 0)
	else
		NumColumns, ItemWidth = getCardsPerRowAndCardWidth({
			availableWidth = UseStateResult,
			maxCardsPerRow = MaxTraversalHistoryCardsPerRow709,
			minCardWidth = UseTokensResult.Size.Size_2500,
			cardGap = Large
		})
	end
	Largest = math.max(NumColumns, 1)
	local Floored = math.floor(#p1.historyItems / Largest)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef({})
	local UseResult = ReactModule.useCallback(function(p2, p3) --[[ Line: 130 ]]
		-- upvalues: UseRefResult1 (copy)
		UseRefResult1.current[p2] = p3
	end, {})
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 134 ]]
		-- upvalues: Signal (upval)
		return Signal.new()
	end, {})
	local MapResult = CryoModule.List.map(p1.historyItems, function(p2, ImpressionIndex) --[[ Line: 138 ]]
		-- upvalues: ReactModule (upval), TraversalExperienceCardModule (upval), ConstantsModule (upval), p1 (copy), TraversalTelemetryModule (upval), FFlagTraversalHistoryDiscoveryTelemetry (upval), GamePlayIntentFunction (upval), UseRoactServiceResult (copy), DiscoveryAnalyticsModule (upval), ItemWidth (ref), UseResult (copy)
		return ReactModule.createElement(TraversalExperienceCardModule, {
			key = ImpressionIndex,
			name = p2.name,
			image = p2.image,
			impressionIndex = ImpressionIndex,
			impressionTag = ConstantsModule.CardImpressionTag,
			rating = p2.rating,
			onActivated = function() --[[ Line: 146 ]]
				-- upvalues: p1 (upval), TraversalTelemetryModule (upval), p2 (copy), ImpressionIndex (copy), FFlagTraversalHistoryDiscoveryTelemetry (upval), GamePlayIntentFunction (upval), UseRoactServiceResult (upval), DiscoveryAnalyticsModule (upval)
				if not p1.onCardItemActivated then return end
				TraversalTelemetryModule.sendHistoryPageExperienceTileClick({
					integration_id = "history_landing_game_tile",
					event_type = "click",
					destination_universe_id = tostring(p2.universeId),
					recency_pos = ImpressionIndex
				})
				
				if FFlagTraversalHistoryDiscoveryTelemetry then
					GamePlayIntentFunction(UseRoactServiceResult, DiscoveryAnalyticsModule.Constants.Context.InExpHistoryTile, {
						placeId = tostring(p2.placeId),
						universeId = tostring(p2.universeId),
						sortEntryIndex = tostring(ImpressionIndex)
					})
				end
				p1.onCardItemActivated(p2.universeId)
			end,
			width = ItemWidth,
			ref = function(p3) --[[ Line: 168 ]]
				-- upvalues: UseResult (upval), ImpressionIndex (copy)
				UseResult(ImpressionIndex, p3)
			end
		})
	end)
	local UseRefResult3 = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 177 ]]
		-- upvalues: UseRefResult3 (copy), UseRefResult (copy), UseRefResult2 (copy), p1 (copy), Floored (copy), Largest (ref)
		if UseRefResult3.current then return end
		if not UseRefResult.current or not UseRefResult2.current or not p1.onLoadMoreHistory then return end
		local ScaledCurrent = UseRefResult.current * Floored
		
		if ScaledCurrent + UseRefResult.current <= UseRefResult2.current.AbsoluteSize.Y then
			UseRefResult3.current = true
			p1.onLoadMoreHistory(math.max(math.floor((UseRefResult2.current.AbsoluteSize.Y - ScaledCurrent) / UseRefResult.current), 1) * Largest)
		end
	end, { p1.onLoadMoreHistory, Largest, Floored })
	local UseViewportBoundsResult = UseViewportBoundsFunction()
	local UseResult1 = ReactModule.useCallback(function(p2) --[[ Line: 205 ]]
		-- upvalues: FFlagTraversalHistoryDiscoveryTelemetry (upval), p1 (copy), SendGameImpressions (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), Largest (ref), Floored (copy)
		if FFlagTraversalHistoryDiscoveryTelemetry then
			local List = {}
			
			for UiIndex, historyItem in p1.historyItems do
				if historyItem then
					table.insert(List, {
						placeId = tostring(historyItem.placeId),
						universeId = tostring(historyItem.universeId),
						uiIndex = UiIndex
					})
				end
			end
			SendGameImpressions.sendFromTraversalHistoryPage(UseRoactServiceResult, UseRoactServiceResult1, p2, List, Largest, Floored)
		end
	end, {
		p1.historyItems,
		UseRoactServiceResult1,
		Largest,
		UseRoactServiceResult,
		Floored
	})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 237 ]]
		-- upvalues: TraversalTelemetryModule (upval), p1 (copy)
		TraversalTelemetryModule.sendHistoryPageBackButtonClick({
			integration_id = "history_landing_back_button",
			event_type = "click"
		})
		p1.onHistoryClose()
	end, { p1.onHistoryClose })
	
	return ReactModule.createElement(View, {
		tag = "col auto-xy size-full-0",
		selectionGroup = {
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop
		}
	}, {
		TopContainer = if FFlagIntegrateTraversalHistoryInSideSheet then nil elseif FFlagTraversalExpPagePaddingFixes then ReactModule.createElement(View, {
			tag = "size-full-0 auto-y padding-x-small padding-bottom-large"
		}, {
			ChevronButton = ReactModule.createElement(IconButton, {
				icon = IconName.ChevronLargeLeft,
				onActivated = UseResult2,
				ref = Ref
			})
		}) else ReactModule.createElement(IconButton, {
			icon = IconName.ChevronLargeLeft,
			onActivated = UseResult2,
			ref = Ref
		}),
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col auto-y size-full-0 " .. (if FFlagTraversalExpPagePaddingFixes then "" else "padding-left-medium padding-top-small padding-bottom-large"),
			padding = if FFlagTraversalExpPagePaddingFixes then {
				left = UDim.new(0, XLarge),
				bottom = UDim.new(0, UseTokensResult.Padding.XLarge)
			} else nil
		}, {
			Title = not FFlagIntegrateTraversalHistoryInSideSheet and ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-small text-truncate-split",
				Text = UseLocalizationResult.historyTitle
			}),
			Description = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-large text-truncate-split",
				Text = UseLocalizationResult.historyDescription
			})
		}),
		ScrollContent = ReactModule.createElement(ScrollView, {
			tag = "size-full shrink",
			LayoutOrder = 2,
			selectionGroup = false,
			padding = if FFlagIntegrateTraversalHistoryInSideSheet then {
				left = UDim.new(0, XLarge),
				right = UDim.new(0, XLarge),
				top = UDim.new(0, UseTokensResult.Padding.Small)
			} elseif FFlagTraversalExpPagePaddingFixes then { left = UDim.new(0, XLarge), right = UDim.new(0, XLarge) } else UDim.new(0, XLarge),
			layout = {
				Wraps = true,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, Large)
			},
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(0, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			},
			onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame) --[[ Line: 246 ]]
				-- upvalues: XLarge (copy), UseStateResult2 (copy), UseRefResult1 (copy), UseRefResult (copy)
				UseStateResult2(Frame.AbsoluteSize.X - 2 * XLarge)
				
				if UseRefResult1.current[1] then
					UseRefResult.current = UseRefResult1.current[1].AbsoluteSize.Y
				end
			end, { XLarge }),
			onCanvasPositionChanged = ReactModule.useCallback(function(ScrollFrame) --[[ Line: 255 ]]
				-- upvalues: UseMemoResult (copy), p1 (copy), UseRefResult (copy), Largest (ref)
				UseMemoResult:fire()
				
				if not p1.onLoadMoreHistory or not UseRefResult.current then return end
				if ScrollFrame.AbsoluteCanvasSize.Y <= ScrollFrame.CanvasPosition.Y + ScrollFrame.AbsoluteWindowSize.Y + UseRefResult.current then
					p1.onLoadMoreHistory(Largest)
				end
			end, { p1.onLoadMoreHistory, Largest, UseMemoResult }),
			scrollingFrameRef = UseRefResult2,
			selection = { Selectable = false }
		}, MapResult),
		TraversalHistoryCardImpressionTracker = FFlagTraversalHistoryDiscoveryTelemetry and ReactModule.createElement(ImpressionsTrackerWithoutNavigation, {
			parentRef = UseRefResult2,
			impressionsTag = ConstantsModule.CardImpressionTag,
			scrollViewPositionChangedSignal = UseMemoResult,
			sendImpressions = UseResult1,
			viewPortBounds = UseViewportBoundsResult
		})
	})
end))