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
local fFlagSduiPoolBackedFeed = require(parent.SharedFlags).FFlagSduiPoolBackedFeed
local sduiFeedIndexInExtraLocalProps = game:DefineFastFlag("SduiFeedIndexInExtraLocalProps", false)
local sduiFeedDebugNameWithImpressionsTag = game:DefineFastFlag("SduiFeedDebugNameWithImpressionsTag", false)
local t = {}

return function(p0) --[[ line: 43 | named "buildSduiFeedChildren" ]]
	-- upvalues: findAnalyticsField (ref), t (ref), sduiBuilder (ref), sduiErrors (ref), getSduiComponentWrapper (ref), fFlagSduiPoolBackedFeed (ref), cryoModule (ref), sduiFeedIndexInExtraLocalProps (ref), reactModule (ref), sduiFeedDebugNameWithImpressionsTag (ref), sduiFeedItemModule (ref)
	local t_1 = {}
	local sduiContext = p0.sduiContext
	local startRow = p0.extraLocalProps and p0.extraLocalProps.startRow
	local var10 = if typeof(startRow) == "number" then startRow else 1
	local maxConfigs = p0.maxConfigs
	
	for i, v in p0.configs do
		if maxConfigs ~= nil and maxConfigs < i then break end
		local componentType = findAnalyticsField("componentType", v.analyticsData or t) or sduiBuilder.getComponentType(v, sduiContext)
		
		if not componentType then
			sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentType, {
				componentType = p0.componentType,
				name = p0.debugName,
				message = `Nil componentType in {p0.componentType} at index {i}`
			}, sduiContext.appPage)
			continue
		end
		local componentType_1 = `{p0.componentType}{i}_{componentType}`
		local var13 = getSduiComponentWrapper(v)
		local t_2 = {
			feedItemPosition = i,
			itemComponentType = componentType,
			componentType = componentType,
			collectionPosition = i
		}
		local var15 = nil
		local extraLocalProps = p0.extraLocalProps
		
		if fFlagSduiPoolBackedFeed then
			local startRowGetter = v.startRowGetter
			var15 = if startRowGetter ~= nil then nil else { startRow = startRowGetter }
			extraLocalProps = cryoModule.Dictionary.join(p0.extraLocalProps or t, {
				startRow = if startRowGetter ~= nil then var10 + i - 1 else cryoModule.None
			})
		else
			extraLocalProps = cryoModule.Dictionary.join(extraLocalProps, { startRow = var10 + i - 1 })
		end
		if sduiFeedIndexInExtraLocalProps then
			extraLocalProps = cryoModule.Dictionary.join(extraLocalProps, { index = i })
		end
		local createElement = reactModule.createElement
		createElement = createElement(var13, {
			debugName = if sduiFeedDebugNameWithImpressionsTag and p0.impressionsTag ~= nil and p0.impressionsTag ~= "" then `{componentType_1}_{p0.impressionsTag}` else componentType_1,
			componentConfig = v,
			sduiContext = sduiContext,
			localAnalyticsData = t_2,
			extraLocalProps = extraLocalProps,
			extraLocalPropSignals = if fFlagSduiPoolBackedFeed then var15 else nil
		})
		t_1[componentType_1] = reactModule.createElement(sduiFeedItemModule, {
			layoutOrder = if v.props and v.props.layoutOrder ~= nil then v.props.layoutOrder else i,
			zIndex = if v.props and v.props.zIndex ~= nil then v.props.zIndex else -i,
			index = if p0.negateImpressionIndex then -i else i,
			impressionsTag = p0.impressionsTag,
			selectionBehaviorLeft = p0.selectionBehaviorLeft,
			selectionBehaviorRight = p0.selectionBehaviorRight
		}, { Item = createElement })
	end
	return t_1
end