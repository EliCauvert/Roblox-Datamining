local _ = require(script.SduiIntegrationTypes)
local Parent = script.Parent
local _ = require(Parent.SduiCoreSystem)
local FFlagHomePageRefetchOnDataHydrationAccountReset = require(Parent.SharedFlags).FFlagHomePageRefetchOnDataHydrationAccountReset

return {
	["jest.config"] = script["jest.config"],
	["jest.mockDataModel.config"] = script["jest.mockDataModel.config"],
	SduiFocusTags = require(script.FocusNavigation.SduiFocusTags),
	OnNavigateBackWrapper = require(script.FocusNavigation.NavigateBackBindings).OnNavigateBackWrapper,
	useOnNavigateBack = function(p1, p2) --[[ Line: 49 ]]
		return require(script.FocusNavigation.NavigateBackBindings).useOnNavigateBack(p1, p2)
	end,
	useInitialFocusOnTag = function(p1, p2) --[[ Line: 52 ]]
		require(script.FocusNavigation.useInitialFocusOnTag)(p1, p2)
	end,
	useSelectionOrderTracking = function(p1) --[[ Line: 55 ]]
		require(script.FocusNavigation.useSelectionOrderTracking)(p1)
	end,
	usePageButtonBindings = function(p1, p2, p3) --[[ Line: 58 ]]
		return require(script.FocusNavigation.usePageButtonBindings)(p1, p2, p3)
	end,
	useBackButtonBinding = function(p1) --[[ Line: 65 ]]
		return require(script.FocusNavigation.useBackButtonBinding)(p1)
	end,
	createSduiFocusActivationStore = function() --[[ Line: 68 ]]
		return require(script.FocusNavigation.createSduiFocusActivationStore)()
	end,
	getSduiFocusActivationStore = function() --[[ Line: 71 ]]
		return require(script.FocusNavigation.getSduiFocusActivationStore)()
	end,
	useSduiFocusActivation = function(p1, p2) --[[ Line: 74 ]]
		require(script.FocusNavigation.useSduiFocusActivation)(p1, p2)
	end,
	createSduiApiStore = require(script.createSduiApiStore),
	getSduiApiStore = require(script.getSduiApiStore),
	SduiInputDataUpdates = if require(Parent.SharedFlags).FFlagSduiApiStoreUpdateInputData then require(script.SduiInputDataUpdates) else nil,
	useDataHydrationAccountGeneration = if FFlagHomePageRefetchOnDataHydrationAccountReset then require(script.hooks.useDataHydrationAccountGeneration) else nil,
	fetchSduiTemplates = function(p1, p2) --[[ Line: 85 ]]
		return require(script.fetchSduiTemplates)(p1, p2)
	end,
	createTemplateApiRequestConfig = function(p1) --[[ Line: 88 ]]
		return require(script.createTemplateApiRequestConfig)(p1)
	end,
	handleSduiApiResponse = require(script.handleSduiApiResponse),
	prewarmAppTemplatesOnLaunch = function() --[[ Line: 92 ]]
		return require(script.prewarmAppTemplatesOnLaunch)()
	end,
	SduiLoadTimer = require(script.SduiLoadTimer),
	SduiSurfaceLoadTimeTracker = require(script.SduiSurfaceLoadTimeTracker),
	SduiPageEntryPoint = require(script.SduiPageEntryPoint),
	SduiPageWrapperEntryPoint = require(script.SduiPageWrapperEntryPoint),
	SduiPageNavigationHeader = require(script.SduiPageNavigationHeader),
	useScrollAwayHeaderPosition = require(script.useScrollAwayHeaderPosition),
	SduiFeatureEntryPoint = require(script.SduiFeatureEntryPoint),
	getSduiTemplateStore = require(script.getSduiTemplateStore),
	getSduiPageEntrySnackbarStore = require(script.getSduiPageEntrySnackbarStore),
	usePageEntrySnackbar = require(script.usePageEntrySnackbar),
	useComponentConfig = require(script.hooks.useComponentConfig),
	usePreferredTextSizeLineBudget = require(script.hooks.usePreferredTextSizeLineBudget),
	useEntrySurfacing = require(script.hooks.useEntrySurfacing),
	useInputData = require(script.hooks.useInputData),
	useSduiPageScopeField = require(script.hooks.useSduiPageScopeField),
	useUiStatus = require(script.hooks.useUiStatus),
	UiStatus = require(script.SduiIntegrationTypes).UiStatus,
	SduiProtobufResponseHelpers = require(script.SduiProtobufResponseHelpers),
	SduiPageAnalytics = require(script.SduiPageAnalytics),
	SduiRequestConcurrencyPolicy = require(script.SduiIntegrationTypes).SduiRequestConcurrencyPolicy,
	SduiResponseType = require(script.SduiIntegrationTypes).SduiResponseType,
	SduiApiStorePostConfigContentType = require(script.SduiApiStorePostConfig).SduiApiStorePostConfigContentType,
	SduiOverlayEntryPoint = require(script.SduiOverlayEntryPoint),
	getSduiClientPageScope = require(Parent.SduiCoreSystem).getSduiClientPageScope,
	usePageScopeRef = require(Parent.SduiCoreSystem).usePageScopeRef,
	SduiCapabilities = require(Parent.SduiCoreSystem).SduiCapabilities,
	getSduiDataBinder = require(Parent.SduiCoreSystem).getSduiDataBinder,
	streamingFeedMergeStrategy = require(script.streamingFeedMergeStrategy),
	buildSduiCollectionInfo = require(script.buildSduiCollectionInfo),
	getPreferredTextSizeLineBudget = require(script.getPreferredTextSizeLineBudget)
}