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
	getSduiClientBindingBuilder = function()
		return require(script.ClientBinding.SduiClientBindingBuilder)
	end,
	getSduiDataBinder = function()
		return require(script.ClientBinding.SduiDataBinder)
	end,
	getProtoVariableMapper = function()
		return require(script.ClientBinding.ProtoVariableMapper)
	end,
	createBuilderConfig = function(p1)
		return require(script.ClientBinding.createBuilderConfig)(p1)
	end,
	getSduiActionHandlerRegistry = function()
		return require(script.getSduiActionHandlerRegistry)()
	end,
	getSduiImpressionHandlerRegistry = function()
		return require(script.getSduiImpressionHandlerRegistry)()
	end,
	getSduiTelemetryHandlerNameRegistry = function()
		return require(script.getSduiTelemetryHandlerNameRegistry)()
	end,
	getSduiServiceDependenciesStore = function()
		return require(script.ClientBinding.getSduiServiceDependenciesStore)()
	end,
	getSduiTokensStore = function()
		return require(script.ClientBinding.getSduiTokensStore)()
	end,
	getSduiPolicyStore = function()
		return require(script.ClientBinding.getSduiPolicyStore)()
	end,
	getSduiComponentRegistry = require(script.getSduiComponentRegistry),
	getSduiClientPageScope = require(script.ClientBinding.getSduiClientPageScope),
	usePageScopeRef = require(script.ClientBinding.usePageScopeRef),
	SduiCapabilities = require(script.ClientBinding.SduiCapabilities)
}