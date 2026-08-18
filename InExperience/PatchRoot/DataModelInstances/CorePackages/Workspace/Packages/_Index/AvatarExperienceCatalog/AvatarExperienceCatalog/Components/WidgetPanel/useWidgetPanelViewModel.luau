local collectionService = game:GetService("CollectionService")
local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local gridMetrics = require(parent.UIBlox).App.Grid.GridMetrics
local useNetworking = require(parent.AvatarExperienceCommon).Hooks.useNetworking
local constants = require(parent.Impressions).Constants
local useAvatarRoute = require(parent.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)
local useWidgetListInfoViewModelModule = require(avatarExperienceCatalog.Components.ResultsList.useWidgetListInfoViewModel)
local getOrderedWidgetsModule = require(avatarExperienceCatalog.Components.ResultsList.getOrderedWidgets)
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
local getWidgetItemIdsFromWidgetInfoModule = require(avatarExperienceCatalog.Utils.getWidgetItemIdsFromWidgetInfo)
local getBreakpointFromRowWidthModule = require(avatarExperienceCatalog.Utils.getBreakpointFromRowWidth)
local getUIScaleFromTokensModule = require(avatarExperienceCatalog.Utils.getUIScaleFromTokens)
local constantsModule = require(avatarExperienceCatalog.Constants)
local widgetConstantsModule = require(avatarExperienceCatalog.WidgetConstants)
local useOnRequestImpressionsSignalModule = require(avatarExperienceCatalog.Components.Hooks.useOnRequestImpressionsSignal)
local useCatalogPageMonolithDependenciesModule = require(avatarExperienceCatalog.Providers.useCatalogPageMonolithDependencies)
local _ = require(script.Parent.WidgetPanelView)

return function(p0) --[[ line: 61 | named "useWidgetPanelViewModel" ]]
	-- upvalues: useTokens (ref), getUIScaleFromTokensModule (ref), reactModule (ref), getBreakpointFromRowWidthModule (ref), useCatalogPageMonolithDependenciesModule (ref), useNetworking (ref), useOnRequestImpressionsSignalModule (ref), useAvatarRoute (ref), constants (ref), widgetConstantsModule (ref), collectionService (ref), useWidgetListInfoViewModelModule (ref), getOrderedWidgetsModule (ref), gridMetrics (ref), constantsModule (ref), getWidgetItemIdsFromWidgetInfoModule (ref), view (ref)
	local context = p0.context
	local var13 = getUIScaleFromTokensModule(useTokens())
	local var14, var15 = reactModule.useState(0)
	local var16 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 72 ]]
		-- upvalues: var16 (ref)
		return function() --[[ line: 73 ]]
			-- upvalues: var16 (copy)
			if var16.current then
				task.cancel(var16.current)
				var16.current = nil
			end
		end
	end, {})
	local var17 = reactModule.useCallback(function(p1) --[[ line: 81 ]]
		-- upvalues: var16 (ref), var15 (ref)
		if not p1 then return end
		local x = p1.AbsoluteSize.X
		
		if var16.current then
			task.cancel(var16.current)
		end
		var16.current = task.delay(0.2, function() --[[ line: 89 ]]
			-- upvalues: var16 (copy), var15 (copy), x (ref)
			var16.current = nil
			var15(x)
		end)
	end, {})
	local var18 = if p0.rowWidth ~= nil then var14 else p0.rowWidth
	local var19 = if p0.breakpoint ~= nil then getBreakpointFromRowWidthModule(if var18 > 0 then var18 else 0, var13) else p0.breakpoint
	local var20 = useCatalogPageMonolithDependenciesModule()
	local catalogGridWidget = var20.CatalogGridWidget
	local fetchWidgetInfo = var20.fetchWidgetInfo
	local catalogAnalytics = var20.catalogAnalytics
	local var21 = useNetworking()
	reactModule.useEffect(function() --[[ line: 109 ]]
		-- upvalues: fetchWidgetInfo (ref), var21 (ref), context (ref)
		fetchWidgetInfo(var21, nil, context)
	end, { context, var21, fetchWidgetInfo })
	local var22 = reactModule.useRef(nil)
	local var23 = useOnRequestImpressionsSignalModule()
	local var24 = useAvatarRoute()
	local var25 = reactModule.useRef(nil)
	
	if var25.current == nil then
		var25.current = var24.current.key
	end
	local var26 = reactModule.useCallback(function() --[[ line: 121 ]]
		-- upvalues: var24 (ref), var25 (ref)
		return var24.current.key == var25.current
	end, { var24 })
	local var27 = reactModule.useRef({})
	local var28 = reactModule.useRef({})
	local var29 = reactModule.useCallback(function(p2) --[[ line: 131 ]]
		-- upvalues: var27 (ref), var28 (ref), constants (copy), catalogAnalytics (ref), widgetConstantsModule (copy)
		local current = var27.current
		local current_1 = var28.current
		
		for i, v in p2 do
			if not current[v.Name] then
				local itemIndexAttribute = v:GetAttribute(constants.ItemIndex)
				local var39 = if typeof(itemIndexAttribute) == "number" then current_1[itemIndexAttribute] else nil
				
				if var39 ~= nil then
					catalogAnalytics.widgetInteractionV2(var39, widgetConstantsModule.ActionType.IMPRESSION)
					current[v.Name] = true
				end
			end
		end
	end, { catalogAnalytics })
	local var30 = reactModule.useCallback(function(p3) --[[ line: 152 ]]
		-- upvalues: collectionService (copy), widgetConstantsModule (copy)
		local tagNameTagged = collectionService:GetTagged(widgetConstantsModule.WidgetExposureMetadata.TagName)
		
		if p3 == nil then
			return {}
		end
		local t = {}
		
		for i, v in tagNameTagged do
			if v:IsDescendantOf(p3) then
				table.insert(t, v)
			end
		end
		return t
	end, {})
	local var31 = useWidgetListInfoViewModelModule(nil, context, var19)
	local var32 = if var31 and var31.widgets then getOrderedWidgetsModule(var31.widgets) else {}
	
	if #var32 == 0 then
		return { status = "hidden" }
	end
	local smallMetrics = gridMetrics.getSmallMetrics(var18, constantsModule.WIDGET_COLUMN_PADDING)
	local t = {}
	local t_1 = {}
	
	for i, v in var32 do
		local widget = v.widget
		local position = v.position
		local maxValue = math.max(widget.template.previewColumns or 1, 1)
		local t_2 = {
			requestId = widget.requestId,
			widgetPosition = position,
			widgetId = widget.id,
			widgetType = widget.type,
			widgetAbsPosition = (position - 1) * maxValue,
			widgetItemIds = getWidgetItemIdsFromWidgetInfoModule(widget, maxValue)
		}
		t_1[position] = t_2
		t[widget.id] = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = i }, {
			Widget = reactModule.createElement(catalogGridWidget, {
				widgetRow = position,
				widgetInfo = widget,
				itemsPerRow = maxValue,
				rowCount = widget.template.previewRows,
				rowHeight = smallMetrics.itemWidth,
				itemSize = Vector2.new(smallMetrics.itemWidth, smallMetrics.itemWidth),
				widgetAnalyticsInfo = t_2,
				itemDetailsPeekViewRefs = p0.itemDetailsPeekViewRefs,
				rowWidth = if var18 > 0 then var18 else nil
			})
		})
	end
	var28.current = t_1
	
	return {
		status = "visible",
		viewProps = {
			LayoutOrder = p0.LayoutOrder,
			panelRef = var22,
			onAbsoluteSizeChanged = var17,
			onRequestImpressionsSignal = var23,
			pageFilter = var26,
			onImpressionsDetected = var29,
			collectObjectsFunc = var30,
			children = t
		}
	}
end