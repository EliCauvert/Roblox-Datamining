local sduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local parent = sduiSharedContent.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local discoveryTypesModule = require(parent.DiscoveryTypes)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local findAnalyticsField = sduiCoreSystemModule.findAnalyticsField
local getSduiComponentWrapper = sduiCoreSystemModule.getSduiComponentWrapper
local sduiBuilder = sduiCoreSystemModule.SduiBuilder
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiFeedItemModule = require(sduiSharedContent.Components.SduiFeedItem)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiCollectionGridRevealRows = sharedFlagsModule.FFlagSduiCollectionGridRevealRows
local fFlagAppPageShellScrollToTopFocus = sharedFlagsModule.FFlagAppPageShellScrollToTopFocus
local fFlagLuaAppsDefaultSelection = sharedFlagsModule.FFlagLuaAppsDefaultSelection
local fFlagSduiIndividualFeedItemSpacing = sharedFlagsModule.FFlagSduiIndividualFeedItemSpacing
local sduiFeedIndexInExtraLocalProps = game:DefineFastFlag("SduiFeedIndexInExtraLocalProps", false)
local sduiFeedDebugNameWithImpressionsTag = game:DefineFastFlag("SduiFeedDebugNameWithImpressionsTag", false)
local SORT_INDEX_SELECTION_ORDER_MULTIPLIER = discoveryTypesModule.Constants.SORT_INDEX_SELECTION_ORDER_MULTIPLIER
local t = {}

local function _(p1, p2, p3)
	return if p1 == nil then nil elseif p2 == 1 and p3 ~= nil and p3 >= 0 then p3 else p1
end

return function(p1)
	-- upvalues: fFlagSduiIndividualFeedItemSpacing (ref), findAnalyticsField (ref), t (ref), sduiBuilder (ref), sduiErrors (ref), getSduiComponentWrapper (ref), cryoModule (ref), fFlagSduiCollectionGridRevealRows (ref), sduiFeedIndexInExtraLocalProps (ref), fFlagAppPageShellScrollToTopFocus (ref), SORT_INDEX_SELECTION_ORDER_MULTIPLIER (ref), reactModule (ref), sduiFeedDebugNameWithImpressionsTag (ref), sduiFeedItemModule (ref), fFlagLuaAppsDefaultSelection (ref)
	local t_1 = {}
	local sduiContext = p1.sduiContext
	local startRow = p1.extraLocalProps and p1.extraLocalProps.startRow
	local var1 = if typeof(startRow) == "number" then startRow else 1
	local maxConfigs = p1.maxConfigs
	local var2 = if fFlagSduiIndividualFeedItemSpacing then p1.gapBetweenFeedItems else nil
	local var3 = if fFlagSduiIndividualFeedItemSpacing then p1.gapAfterFirstFeedItem else nil
	
	for i, v in p1.configs do
		if maxConfigs ~= nil and maxConfigs < i then break end
		local componentType = findAnalyticsField("componentType", v.analyticsData or t) or sduiBuilder.getComponentType(v, sduiContext)
		
		if not componentType then
			sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentType, {
				componentType = p1.componentType,
				name = p1.debugName,
				message = `Nil componentType in {p1.componentType} at index {i}`
			}, sduiContext.appPage)
			continue
		end
		local componentType_1 = `{p1.componentType}{i}_{componentType}`
		local var4 = getSduiComponentWrapper(v)
		local t_2 = {
			feedItemPosition = i,
			itemComponentType = componentType,
			componentType = componentType,
			collectionPosition = i
		}
		local _ = nil
		local _ = p1.extraLocalProps
		local startRowGetter = v.startRowGetter
		local var5 = if startRowGetter ~= nil then nil else { startRow = startRowGetter }
		local var6 = cryoModule.Dictionary.join(p1.extraLocalProps or t, {
			startRow = if startRowGetter ~= nil then var1 + i - 1 else cryoModule.None,
			setDisplayedRowCount = if fFlagSduiCollectionGridRevealRows then v.setDisplayedRowCount else nil
		})
		
		if sduiFeedIndexInExtraLocalProps then
			var6 = cryoModule.Dictionary.join(var6, { index = i })
		end
		if fFlagAppPageShellScrollToTopFocus and p1.selectionOrderBase ~= nil then
			var6 = cryoModule.Dictionary.join(var6, {
				selectionOrderBase = p1.selectionOrderBase + i * SORT_INDEX_SELECTION_ORDER_MULTIPLIER
			})
		end
		local createElement = reactModule.createElement
		createElement = createElement(var4, {
			debugName = if sduiFeedDebugNameWithImpressionsTag and p1.impressionsTag ~= nil and p1.impressionsTag ~= "" then `{componentType_1}_{p1.impressionsTag}` else componentType_1,
			componentConfig = v,
			sduiContext = sduiContext,
			localAnalyticsData = t_2,
			extraLocalProps = var6,
			extraLocalPropSignals = var5
		})
		local var7 = if v.props and v.props.layoutOrder ~= nil then v.props.layoutOrder else i
		local var8 = if v.props and v.props.zIndex ~= nil then v.props.zIndex else -i
		local var9 = if p1.negateImpressionIndex then -i else i
		local var10 = nil
		
		if fFlagSduiIndividualFeedItemSpacing then
			var10 = var7 * 2
			local var11 = if var2 == nil then nil elseif i == 1 and var3 ~= nil and var3 >= 0 then var3 else var2
			
			if var11 ~= nil and var11 > 0 then
				t_1[`{componentType_1}_GapAfter`] = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, var11),
					LayoutOrder = var10 + 1
				})
			end
		end
		t_1[componentType_1] = reactModule.createElement(sduiFeedItemModule, {
			layoutOrder = if fFlagSduiIndividualFeedItemSpacing then var10 else var7,
			zIndex = var8,
			index = var9,
			impressionsTag = p1.impressionsTag,
			selectionBehaviorLeft = p1.selectionBehaviorLeft,
			selectionBehaviorRight = p1.selectionBehaviorRight,
			defaultFocusRef = if fFlagAppPageShellScrollToTopFocus and fFlagLuaAppsDefaultSelection and i == 1 then p1.defaultFocusRef else nil
		}, { Item = createElement })
	end
	return t_1
end