local CollectionService = game:GetService("CollectionService")
local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GridMetrics = require(Parent.UIBlox).App.Grid.GridMetrics
local UseNetworkingFunction = require(Parent.AvatarExperienceCommon).Hooks.useNetworking
local Constants = require(Parent.Impressions).Constants
local UseAvatarRouteFunction = require(Parent.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local _ = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)
local UseWidgetListInfoViewModelModule = require(AvatarExperienceCatalog.Components.ResultsList.useWidgetListInfoViewModel)
local GetOrderedWidgetsModule = require(AvatarExperienceCatalog.Components.ResultsList.getOrderedWidgets)
local _ = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
local GetWidgetItemIdsFromWidgetInfoModule = require(AvatarExperienceCatalog.Utils.getWidgetItemIdsFromWidgetInfo)
local GetBreakpointFromRowWidthModule = require(AvatarExperienceCatalog.Utils.getBreakpointFromRowWidth)
local GetUIScaleFromTokensModule = require(AvatarExperienceCatalog.Utils.getUIScaleFromTokens)
local ConstantsModule = require(AvatarExperienceCatalog.Constants)
local WidgetConstantsModule = require(AvatarExperienceCatalog.WidgetConstants)
local UseOnRequestImpressionsSignalModule = require(AvatarExperienceCatalog.Components.Hooks.useOnRequestImpressionsSignal)
local UseCatalogPageMonolithDependenciesModule = require(AvatarExperienceCatalog.Providers.useCatalogPageMonolithDependencies)
local _ = require(script.Parent.WidgetPanelView)

return function(Frame) --[[ Line: 61 | Named "useWidgetPanelViewModel" ]]
	-- upvalues: UseTokensFunction (copy), GetUIScaleFromTokensModule (copy), ReactModule (copy), GetBreakpointFromRowWidthModule (copy), UseCatalogPageMonolithDependenciesModule (copy), UseNetworkingFunction (copy), UseOnRequestImpressionsSignalModule (copy), UseAvatarRouteFunction (copy), Constants (copy), WidgetConstantsModule (copy), CollectionService (copy), UseWidgetListInfoViewModelModule (copy), GetOrderedWidgetsModule (copy), GridMetrics (copy), ConstantsModule (copy), GetWidgetItemIdsFromWidgetInfoModule (copy), View (copy)
	local Context = Frame.context
	local UIScaleFromTokensModule = GetUIScaleFromTokensModule((UseTokensFunction()))
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 72 ]]
		-- upvalues: UseRefResult (copy)
		return function() --[[ Line: 73 ]]
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				task.cancel(UseRefResult.current)
				UseRefResult.current = nil
			end
		end
	end, {})
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 81 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		if not Frame then return end
		local X = Frame.AbsoluteSize.X
		
		if UseRefResult.current then
			task.cancel(UseRefResult.current)
		end
		UseRefResult.current = task.delay(0.2, function() --[[ Line: 89 ]]
			-- upvalues: UseRefResult (upval), UseStateResult2 (upval), X (copy)
			UseRefResult.current = nil
			UseStateResult2(X)
		end)
	end, {})
	local UseStateResult1 = if Frame.rowWidth == nil then UseStateResult else Frame.rowWidth
	local BreakpointFromRowWidthModule = if Frame.breakpoint == nil then GetBreakpointFromRowWidthModule(if UseStateResult1 > 0 then UseStateResult1 else 0, UIScaleFromTokensModule) else Frame.breakpoint
	local UseCatalogPageMonolithDependenciesModuleResult = UseCatalogPageMonolithDependenciesModule()
	local CatalogGridWidget = UseCatalogPageMonolithDependenciesModuleResult.CatalogGridWidget
	local FetchWidgetInfoFunction = UseCatalogPageMonolithDependenciesModuleResult.fetchWidgetInfo
	local CatalogAnalytics = UseCatalogPageMonolithDependenciesModuleResult.catalogAnalytics
	local UseNetworkingResult = UseNetworkingFunction()
	ReactModule.useEffect(function() --[[ Line: 109 ]]
		-- upvalues: FetchWidgetInfoFunction (copy), UseNetworkingResult (copy), Context (copy)
		FetchWidgetInfoFunction(UseNetworkingResult, nil, Context)
	end, { Context, UseNetworkingResult, FetchWidgetInfoFunction })
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseOnRequestImpressionsSignalModuleResult = UseOnRequestImpressionsSignalModule()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseRefResult2 = ReactModule.useRef(nil)
	
	if UseRefResult2.current == nil then
		UseRefResult2.current = UseAvatarRouteResult.current.key
	end
	local UseResult1 = ReactModule.useCallback(function(): boolean --[[ Line: 121 ]]
		-- upvalues: UseAvatarRouteResult (copy), UseRefResult2 (copy)
		return UseAvatarRouteResult.current.key == UseRefResult2.current
	end, { UseAvatarRouteResult })
	local UseRefResult3 = ReactModule.useRef({})
	local UseRefResult4 = ReactModule.useRef({})
	local UseResult2 = ReactModule.useCallback(function(List) --[[ Line: 131 ]]
		-- upvalues: UseRefResult3 (copy), UseRefResult4 (copy), Constants (upval), CatalogAnalytics (copy), WidgetConstantsModule (upval)
		local Current = UseRefResult3.current
		local Current1 = UseRefResult4.current
		
		for _, value in List do
			local CurrentEntry = Current[value.Name]
			local CurrentEntry1 = nil
			
			if not CurrentEntry then
				local Attribute = value:GetAttribute(Constants.ItemIndex)
				CurrentEntry1 = if typeof(Attribute) == "number" then Current1[Attribute] else nil
				CurrentEntry = CurrentEntry1 == nil
			end
			if not CurrentEntry then
				CatalogAnalytics.widgetInteractionV2(CurrentEntry1, WidgetConstantsModule.ActionType.IMPRESSION)
				Current[value.Name] = true
			end
		end
	end, { CatalogAnalytics })
	local UseResult3 = ReactModule.useCallback(function(Ancestor) --[[ Line: 152 ]]
		-- upvalues: CollectionService (upval), WidgetConstantsModule (upval)
		local Tagged = CollectionService:GetTagged(WidgetConstantsModule.WidgetExposureMetadata.TagName)
		
		if Ancestor == nil then
			return {}
		end
		local List = {}
		
		for _, value in Tagged do
			if value:IsDescendantOf(Ancestor) then
				table.insert(List, value)
			end
		end
		return List
	end, {})
	local UseWidgetListInfoViewModelModuleResult = UseWidgetListInfoViewModelModule(nil, Context, BreakpointFromRowWidthModule)
	local OrderedWidgetsModule = if UseWidgetListInfoViewModelModuleResult and UseWidgetListInfoViewModelModuleResult.widgets then GetOrderedWidgetsModule(UseWidgetListInfoViewModelModuleResult.widgets) else {}
	
	if #OrderedWidgetsModule == 0 then
		return { status = "hidden" }
	end
	local SmallMetrics = GridMetrics.getSmallMetrics(UseStateResult1, ConstantsModule.WIDGET_COLUMN_PADDING)
	local Children = {}
	local Current = {}
	
	for LayoutOrder, value in OrderedWidgetsModule do
		local Widget = value.widget
		local Position: number = value.position
		local Largest = math.max(Widget.template.previewColumns or 1, 1)
		local WidgetAnalyticsInfo = {
			requestId = Widget.requestId,
			widgetPosition = Position,
			widgetId = Widget.id,
			widgetType = Widget.type,
			widgetAbsPosition = (Position - 1) * Largest,
			widgetItemIds = GetWidgetItemIdsFromWidgetInfoModule(Widget, Largest)
		}
		Current[Position] = WidgetAnalyticsInfo
		Children[Widget.id] = ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = LayoutOrder }, {
			Widget = ReactModule.createElement(CatalogGridWidget, {
				widgetRow = Position,
				widgetInfo = Widget,
				itemsPerRow = Largest,
				rowCount = Widget.template.previewRows,
				rowHeight = SmallMetrics.itemWidth,
				itemSize = Vector2.new(SmallMetrics.itemWidth, SmallMetrics.itemWidth),
				widgetAnalyticsInfo = WidgetAnalyticsInfo,
				itemDetailsPeekViewRefs = Frame.itemDetailsPeekViewRefs,
				rowWidth = if UseStateResult1 > 0 then UseStateResult1 else nil
			})
		})
	end
	UseRefResult4.current = Current
	
	return {
		status = "visible",
		viewProps = {
			LayoutOrder = Frame.LayoutOrder,
			panelRef = UseRefResult1,
			onAbsoluteSizeChanged = UseResult,
			onRequestImpressionsSignal = UseOnRequestImpressionsSignalModuleResult,
			pageFilter = UseResult1,
			onImpressionsDetected = UseResult2,
			collectObjectsFunc = UseResult3,
			children = Children
		}
	}
end