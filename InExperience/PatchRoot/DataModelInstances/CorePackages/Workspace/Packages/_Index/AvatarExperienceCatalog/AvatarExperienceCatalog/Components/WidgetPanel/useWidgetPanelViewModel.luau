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

return function(p1)
	-- upvalues: useTokens (ref), getUIScaleFromTokensModule (ref), reactModule (ref), getBreakpointFromRowWidthModule (ref), useCatalogPageMonolithDependenciesModule (ref), useNetworking (ref), useOnRequestImpressionsSignalModule (ref), useAvatarRoute (ref), constants (ref), widgetConstantsModule (ref), collectionService (ref), useWidgetListInfoViewModelModule (ref), getOrderedWidgetsModule (ref), gridMetrics (ref), constantsModule (ref), getWidgetItemIdsFromWidgetInfoModule (ref), view (ref)
	local context = p1.context
	local var1 = getUIScaleFromTokensModule(useTokens())
	local var2, var3 = reactModule.useState(0)
	local var4 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref)
		return function()
			-- upvalues: var4 (copy)
			if var4.current then
				task.cancel(var4.current)
				var4.current = nil
			end
		end
	end, {})
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), var3 (ref)
		if not p2 then return end
		local x = p2.AbsoluteSize.X
		
		if var4.current then
			task.cancel(var4.current)
		end
		var4.current = task.delay(0.2, function()
			-- upvalues: var4 (copy), var3 (copy), x (ref)
			var4.current = nil
			var3(x)
		end)
	end, {})
	local var6 = if p1.rowWidth ~= nil then var2 else p1.rowWidth
	local var7 = if p1.breakpoint ~= nil then getBreakpointFromRowWidthModule(if var6 > 0 then var6 else 0, var1) else p1.breakpoint
	local var8 = useCatalogPageMonolithDependenciesModule()
	local catalogGridWidget = var8.CatalogGridWidget
	local fetchWidgetInfo = var8.fetchWidgetInfo
	local catalogAnalytics = var8.catalogAnalytics
	local var9 = useNetworking()
	reactModule.useEffect(function()
		-- upvalues: fetchWidgetInfo (ref), var9 (ref), context (ref)
		fetchWidgetInfo(var9, nil, context)
	end, { context, var9, fetchWidgetInfo })
	local var10 = reactModule.useRef(nil)
	local var11 = useOnRequestImpressionsSignalModule()
	local var12 = useAvatarRoute()
	local var13 = reactModule.useRef(nil)
	
	if var13.current == nil then
		var13.current = var12.current.key
	end
	local var14 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), var13 (ref)
		return var12.current.key == var13.current
	end, { var12 })
	local var15 = reactModule.useRef({})
	local var16 = reactModule.useRef({})
	local var17 = reactModule.useCallback(function(p2)
		-- upvalues: var15 (ref), var16 (ref), constants (copy), catalogAnalytics (ref), widgetConstantsModule (copy)
		local current = var15.current
		local current_1 = var16.current
		
		for i, v in p2 do
			if not current[v.Name] then
				local itemIndexAttribute = v:GetAttribute(constants.ItemIndex)
				local var18 = if typeof(itemIndexAttribute) == "number" then current_1[itemIndexAttribute] else nil
				
				if var18 ~= nil then
					catalogAnalytics.widgetInteractionV2(var18, widgetConstantsModule.ActionType.IMPRESSION)
					current[v.Name] = true
				end
			end
		end
	end, { catalogAnalytics })
	local var19 = reactModule.useCallback(function(p3)
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
	local var20 = useWidgetListInfoViewModelModule(nil, context, var7)
	local var21 = if var20 and var20.widgets then getOrderedWidgetsModule(var20.widgets) else {}
	
	if #var21 == 0 then
		return { status = "hidden" }
	end
	local smallMetrics = gridMetrics.getSmallMetrics(var6, constantsModule.WIDGET_COLUMN_PADDING)
	local t = {}
	local t_1 = {}
	
	for i, v in var21 do
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
				itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
				rowWidth = if var6 > 0 then var6 else nil
			})
		})
	end
	var16.current = t_1
	
	return {
		status = "visible",
		viewProps = {
			LayoutOrder = p1.LayoutOrder,
			panelRef = var10,
			onAbsoluteSizeChanged = var5,
			onRequestImpressionsSignal = var11,
			pageFilter = var14,
			onImpressionsDetected = var17,
			collectObjectsFunc = var19,
			children = t
		}
	}
end