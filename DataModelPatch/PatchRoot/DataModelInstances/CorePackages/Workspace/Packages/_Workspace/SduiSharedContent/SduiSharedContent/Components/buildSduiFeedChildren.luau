local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local FindAnalyticsFieldFunction = SduiCoreSystemModule.findAnalyticsField
local GetSduiComponentWrapperFunction = SduiCoreSystemModule.getSduiComponentWrapper
local SduiBuilder = SduiCoreSystemModule.SduiBuilder
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiFeedItemModule = require(SduiSharedContent.Components.SduiFeedItem)
local FFlagSduiPoolBackedFeed = require(Parent.SharedFlags).FFlagSduiPoolBackedFeed
local SduiFeedIndexInExtraLocalProps = game:DefineFastFlag("SduiFeedIndexInExtraLocalProps", false)
local t = {}

return function(p1)
	-- upvalues: FindAnalyticsFieldFunction (copy), t (copy), SduiBuilder (copy), SduiErrors (copy), GetSduiComponentWrapperFunction (copy), FFlagSduiPoolBackedFeed (copy), CryoModule (copy), SduiFeedIndexInExtraLocalProps (copy), ReactModule (copy), SduiFeedItemModule (copy)
	local Elements = {}
	local SduiContext = p1.sduiContext
	local StartRow = p1.extraLocalProps and p1.extraLocalProps.startRow
	local StartRow1 = if typeof(StartRow) == "number" then StartRow else 1
	local MaxConfigs = p1.maxConfigs
	
	for CollectionPosition, config in p1.configs do
		if MaxConfigs ~= nil and MaxConfigs < CollectionPosition then break end
		local ComponentType = FindAnalyticsFieldFunction("componentType", config.analyticsData or t) or SduiBuilder.getComponentType(config, SduiContext)
		
		if not ComponentType then
			SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.NilComponentType, {
				componentType = p1.componentType,
				name = p1.debugName,
				message = `Nil componentType in {p1.componentType} at index {CollectionPosition}`
			}, SduiContext.appPage)
			continue
		end
		local Text: string = `{p1.componentType}{CollectionPosition}_{ComponentType}`
		local SduiComponentWrapper = GetSduiComponentWrapperFunction(config)
		local LocalAnalyticsData = {
			feedItemPosition = CollectionPosition,
			itemComponentType = ComponentType,
			componentType = ComponentType,
			collectionPosition = CollectionPosition
		}
		local v1 = nil
		local ExtraLocalProps = p1.extraLocalProps
		local JoinResult = nil
		
		if FFlagSduiPoolBackedFeed then
			local StartRowGetter = config.startRowGetter
			v1 = if StartRowGetter == nil then nil else { startRow = StartRowGetter }
			JoinResult = CryoModule.Dictionary.join(p1.extraLocalProps or t, {
				startRow = if StartRowGetter == nil then StartRow1 + CollectionPosition - 1 else CryoModule.None
			})
		else
			JoinResult = CryoModule.Dictionary.join(ExtraLocalProps, { startRow = StartRow1 + CollectionPosition - 1 })
		end
		if SduiFeedIndexInExtraLocalProps then
			JoinResult = CryoModule.Dictionary.join(JoinResult, { index = CollectionPosition })
		end
		Elements[Text] = ReactModule.createElement(SduiFeedItemModule, {
			layoutOrder = if config.props and config.props.layoutOrder ~= nil then config.props.layoutOrder else CollectionPosition,
			zIndex = if config.props and config.props.zIndex ~= nil then config.props.zIndex else -CollectionPosition,
			index = if p1.negateImpressionIndex then -CollectionPosition else CollectionPosition,
			impressionsTag = p1.impressionsTag,
			selectionBehaviorLeft = p1.selectionBehaviorLeft,
			selectionBehaviorRight = p1.selectionBehaviorRight
		}, {
			Item = ReactModule.createElement(SduiComponentWrapper, {
				debugName = Text,
				componentConfig = config,
				sduiContext = SduiContext,
				localAnalyticsData = LocalAnalyticsData,
				extraLocalProps = JoinResult,
				extraLocalPropSignals = if FFlagSduiPoolBackedFeed then v1 else nil
			})
		})
	end
	return Elements
end