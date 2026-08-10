local sduiActionTypeModule = require(script.SduiActionType)
local sduiImpressionEventTypeModule = require(script.SduiImpressionEventType)
local sduiBuilderTypesModule = require(script.SduiBuilderTypes)
local sduiComponentTypeModule = require(script.SduiComponentType)
local sduiConfigTypesModule = require(script.SduiConfigTypes)
local sduiContentTypesModule = require(script.SduiContentTypes)
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
	SduiActionType = sduiActionTypeModule,
	SduiImpressionEventType = sduiImpressionEventTypeModule,
	SduiBuilder = require(script.SduiBuilder),
	SduiBuilderTypes = sduiBuilderTypesModule,
	SduiCollectionAnalyticsBuilder = require(script.Analytics.SduiCollectionAnalyticsBuilder),
	SduiComponent = require(script.SduiComponent),
	SduiComponentType = sduiComponentTypeModule,
	SduiConfigTypes = sduiConfigTypesModule,
	SduiContentTypes = sduiContentTypesModule,
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
	getSduiClientBindingBuilder = function() --[[ line: 104 ]]
		return require(script.ClientBinding.SduiClientBindingBuilder)
	end,
	getSduiDataBinder = function() --[[ line: 107 ]]
		return require(script.ClientBinding.SduiDataBinder)
	end,
	getProtoVariableMapper = function() --[[ line: 110 ]]
		return require(script.ClientBinding.ProtoVariableMapper)
	end,
	createBuilderConfig = function(p0) --[[ line: 113 ]]
		return require(script.ClientBinding.createBuilderConfig)(p0)
	end,
	getSduiActionHandlerRegistry = function() --[[ line: 117 ]]
		return require(script.getSduiActionHandlerRegistry)()
	end,
	getSduiImpressionHandlerRegistry = function() --[[ line: 120 ]]
		return require(script.getSduiImpressionHandlerRegistry)()
	end,
	getSduiTelemetryHandlerNameRegistry = if require(script.Parent.SharedFlags).FFlagSduiActionTelemetryHandler then function() --[[ line: 124 ]]
		return require(script.getSduiTelemetryHandlerNameRegistry)()
	end else nil,
	getSduiServiceDependenciesStore = function() --[[ line: 128 ]]
		return require(script.ClientBinding.getSduiServiceDependenciesStore)()
	end,
	getSduiTokensStore = function() --[[ line: 131 ]]
		return require(script.ClientBinding.getSduiTokensStore)()
	end,
	getSduiPolicyStore = function() --[[ line: 134 ]]
		return require(script.ClientBinding.getSduiPolicyStore)()
	end,
	getSduiComponentRegistry = require(script.getSduiComponentRegistry),
	getSduiClientPageScope = require(script.ClientBinding.getSduiClientPageScope),
	usePageScopeRef = require(script.ClientBinding.usePageScopeRef),
	SduiCapabilities = require(script.ClientBinding.SduiCapabilities)
}