local sduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local parent = sduiSharedContent.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local findAnalyticsField = sduiCoreSystemModule.findAnalyticsField
local getSduiComponentWrapper = sduiCoreSystemModule.getSduiComponentWrapper
local sduiBuilder = sduiCoreSystemModule.SduiBuilder
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiFeedItemModule = require(sduiSharedContent.Components.SduiFeedItem)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiPoolBackedFeed = sharedFlagsModule.FFlagSduiPoolBackedFeed
local fFlagSduiCollectionGridRevealRows = sharedFlagsModule.FFlagSduiCollectionGridRevealRows
local sduiFeedIndexInExtraLocalProps = game:DefineFastFlag("SduiFeedIndexInExtraLocalProps", false)
local sduiFeedDebugNameWithImpressionsTag = game:DefineFastFlag("SduiFeedDebugNameWithImpressionsTag", false)
local t = {}

return function(p1)
	-- upvalues: findAnalyticsField (ref), t (ref), sduiBuilder (ref), sduiErrors (ref), getSduiComponentWrapper (ref), fFlagSduiPoolBackedFeed (ref), cryoModule (ref), fFlagSduiCollectionGridRevealRows (ref), sduiFeedIndexInExtraLocalProps (ref), reactModule (ref), sduiFeedDebugNameWithImpressionsTag (ref), sduiFeedItemModule (ref)
	local t_1 = {}
	local sduiContext = p1.sduiContext
	local startRow = p1.extraLocalProps and p1.extraLocalProps.startRow
	local var1 = if typeof(startRow) == "number" then startRow else 1
	local maxConfigs = p1.maxConfigs
	
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
		local var2 = getSduiComponentWrapper(v)
		local t_2 = {
			feedItemPosition = i,
			itemComponentType = componentType,
			componentType = componentType,
			collectionPosition = i
		}
		local var3 = nil
		local extraLocalProps = p1.extraLocalProps
		
		if fFlagSduiPoolBackedFeed then
			local startRowGetter = v.startRowGetter
			var3 = if startRowGetter ~= nil then nil else { startRow = startRowGetter }
			extraLocalProps = cryoModule.Dictionary.join(p1.extraLocalProps or t, {
				startRow = if startRowGetter ~= nil then var1 + i - 1 else cryoModule.None,
				setDisplayedRowCount = if fFlagSduiCollectionGridRevealRows then v.setDisplayedRowCount else nil
			})
		else
			extraLocalProps = cryoModule.Dictionary.join(extraLocalProps, { startRow = var1 + i - 1 })
		end
		if sduiFeedIndexInExtraLocalProps then
			extraLocalProps = cryoModule.Dictionary.join(extraLocalProps, { index = i })
		end
		local createElement = reactModule.createElement
		createElement = createElement(var2, {
			debugName = if sduiFeedDebugNameWithImpressionsTag and p1.impressionsTag ~= nil and p1.impressionsTag ~= "" then `{componentType_1}_{p1.impressionsTag}` else componentType_1,
			componentConfig = v,
			sduiContext = sduiContext,
			localAnalyticsData = t_2,
			extraLocalProps = extraLocalProps,
			extraLocalPropSignals = if fFlagSduiPoolBackedFeed then var3 else nil
		})
		t_1[componentType_1] = reactModule.createElement(sduiFeedItemModule, {
			layoutOrder = if v.props and v.props.layoutOrder ~= nil then v.props.layoutOrder else i,
			zIndex = if v.props and v.props.zIndex ~= nil then v.props.zIndex else -i,
			index = if p1.negateImpressionIndex then -i else i,
			impressionsTag = p1.impressionsTag,
			selectionBehaviorLeft = p1.selectionBehaviorLeft,
			selectionBehaviorRight = p1.selectionBehaviorRight
		}, { Item = createElement })
	end
	return t_1
end