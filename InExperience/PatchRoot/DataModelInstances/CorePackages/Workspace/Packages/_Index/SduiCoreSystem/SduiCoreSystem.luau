local _ = require(script.SduiDataStoreTypes)
local _ = require(script.SduiFocusNavigationTypes)
local _ = require(script.ClientBinding.SduiPoolStoreTypes)

return {
	["jest.config"] = script["jest.config"],
	executeAction = require(script.executeAction),
	findAnalyticsField = require(script.findAnalyticsField),
	findAnalyticsFieldInAncestors = require(script.findAnalyticsFieldInAncestors),
	getActionTelemetryFieldValue = require(script.getActionTelemetryFieldValue),
	getSduiComponentWrapper = require(script.getSduiComponentWrapper),
	reportUnifiedLoggingAction = require(script.Analytics.reportUnifiedLoggingAction),
	reportUnifiedLoggingImpressions = require(script.Analytics.reportUnifiedLoggingImpressions),
	parseProps = require(script.parseProps),
	SduiActionParams = require(script.SduiActionParams),
	SduiActionType = require(script.SduiActionType),
	SduiImpressionEventType = require(script.SduiImpressionEventType),
	SduiBuilder = require(script.SduiBuilder),
	SduiBuilderTypes = require(script.SduiBuilderTypes),
	SduiCollectionAnalyticsBuilder = require(script.Analytics.SduiCollectionAnalyticsBuilder),
	SduiComponent = require(script.SduiComponent),
	SduiComponentType = require(script.SduiComponentType),
	SduiConfigTypes = require(script.SduiConfigTypes),
	SduiContentTypes = require(script.SduiContentTypes),
	SduiErrors = require(script.SduiErrors),
	SduiInstrumentation = require(script.SduiInstrumentation),
	SduiLogger = require(script.SduiLogger),
	SduiMockUtils = require(script.ClientBinding.SduiMockUtils),
	SduiParseHelpers = require(script.SduiParseHelpers),
	SduiPoolStore = require(script.ClientBinding.SduiPoolStore),
	SduiParsers = require(script.SduiParsers),
	SduiResponsiveHelpers = require(script.SduiResponsiveHelpers),
	SduiTemplateRegistry = require(script.SduiTemplateRegistry),
	SduiUsageRecorder = require(script.Analytics.SduiUsageRecorder),
	recordTemplateUsage = require(script.Analytics.recordTemplateUsage),
	recordV1ComponentUsage = require(script.Analytics.recordV1ComponentUsage),
	recordV1RegisteredTemplates = require(script.Analytics.recordV1RegisteredTemplates),
	useUidRefString = require(script.useUidRefString),
	validateInterface = require(script.validateInterface),
	validateSduiComponentConfig = require(script.validateSduiComponentConfig),
	getSduiClientBindingBuilder = function() --[[ Line: 103 ]]
		return require(script.ClientBinding.SduiClientBindingBuilder)
	end,
	getSduiDataBinder = function() --[[ Line: 106 ]]
		return require(script.ClientBinding.SduiDataBinder)
	end,
	getProtoVariableMapper = function() --[[ Line: 109 ]]
		return require(script.ClientBinding.ProtoVariableMapper)
	end,
	getDefaultHydrationIdPaths = function() --[[ Line: 112 ]]
		return require(script.ClientBinding.defaultHydrationIdPaths)
	end,
	createBuilderConfig = function(p1) --[[ Line: 115 ]]
		return require(script.ClientBinding.createBuilderConfig)(p1)
	end,
	getSduiActionHandlerRegistry = function() --[[ Line: 119 ]]
		return require(script.getSduiActionHandlerRegistry)()
	end,
	getSduiImpressionHandlerRegistry = function() --[[ Line: 122 ]]
		return require(script.getSduiImpressionHandlerRegistry)()
	end,
	getSduiTelemetryHandlerNameRegistry = function() --[[ Line: 125 ]]
		return require(script.getSduiTelemetryHandlerNameRegistry)()
	end,
	getSduiServiceDependenciesStore = function() --[[ Line: 128 ]]
		return require(script.ClientBinding.getSduiServiceDependenciesStore)()
	end,
	getOneByTwoTileFlowIdsFromPools = function(p1) --[[ Line: 131 ]]
		return require(script.ClientBinding.PropBuilder.SduiPoolEntryHelpers).getOneByTwoTileFlowIdsFromPools(p1)
	end,
	getSduiTokensStore = function() --[[ Line: 136 ]]
		return require(script.ClientBinding.getSduiTokensStore)()
	end,
	getSduiPolicyStore = function() --[[ Line: 139 ]]
		return require(script.ClientBinding.getSduiPolicyStore)()
	end,
	getSduiComponentRegistry = require(script.getSduiComponentRegistry),
	getSduiClientPageScope = require(script.ClientBinding.getSduiClientPageScope),
	usePageScopeRef = require(script.ClientBinding.usePageScopeRef),
	SduiCapabilities = require(script.ClientBinding.SduiCapabilities)
}