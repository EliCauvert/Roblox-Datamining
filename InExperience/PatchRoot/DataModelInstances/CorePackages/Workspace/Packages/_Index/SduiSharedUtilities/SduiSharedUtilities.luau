local sduiResponseType = require(script.SduiIntegrationTypes).SduiResponseType
local sduiLoadTimerModule = require(script.SduiLoadTimer)
local sduiSurfaceLoadTimeTrackerModule = require(script.SduiSurfaceLoadTimeTracker)
local _ = require(script.SduiIntegrationTypes)
local parent = script.Parent
local _ = require(parent.SduiCoreSystem)
local fFlagSduiClientDrivenTemplates = require(parent.SharedFlags).FFlagSduiClientDrivenTemplates

return {
	["jest.config"] = script["jest.config"],
	SduiFocusTags = require(script.FocusNavigation.SduiFocusTags),
	OnNavigateBackWrapper = require(script.FocusNavigation.NavigateBackBindings).OnNavigateBackWrapper,
	useOnNavigateBack = function(p1, p2)
		return require(script.FocusNavigation.NavigateBackBindings).useOnNavigateBack(p1, p2)
	end,
	useInitialFocusOnTag = function(p1, p2)
		require(script.FocusNavigation.useInitialFocusOnTag)(p1, p2)
	end,
	useSelectionOrderTracking = function(p1)
		require(script.FocusNavigation.useSelectionOrderTracking)(p1)
	end,
	usePageButtonBindings = function(p1, p2, p3)
		return require(script.FocusNavigation.usePageButtonBindings)(p1, p2, p3)
	end,
	useBackButtonBinding = function(p1)
		return require(script.FocusNavigation.useBackButtonBinding)(p1)
	end,
	createSduiFocusActivationStore = function()
		return require(script.FocusNavigation.createSduiFocusActivationStore)()
	end,
	getSduiFocusActivationStore = function()
		return require(script.FocusNavigation.getSduiFocusActivationStore)()
	end,
	useSduiFocusActivation = function(p1, p2)
		require(script.FocusNavigation.useSduiFocusActivation)(p1, p2)
	end,
	createSduiApiStore = require(script.createSduiApiStore),
	getSduiApiStore = require(script.getSduiApiStore),
	fetchSduiTemplates = if fFlagSduiClientDrivenTemplates then function(p1, p2)
		return require(script.fetchSduiTemplates)(p1, p2)
	end else nil,
	createTemplateApiRequestConfig = if fFlagSduiClientDrivenTemplates then function(p1)
		return require(script.createTemplateApiRequestConfig)(p1)
	end else nil,
	handleSduiApiResponse = require(script.handleSduiApiResponse),
	prewarmAppTemplatesOnLaunch = require(script.prewarmAppTemplatesOnLaunch),
	SduiLoadTimer = sduiLoadTimerModule,
	SduiSurfaceLoadTimeTracker = sduiSurfaceLoadTimeTrackerModule,
	SduiPageEntryPoint = require(script.SduiPageEntryPoint),
	SduiPageNavigationHeader = require(script.SduiPageNavigationHeader),
	useScrollAwayHeaderPosition = require(script.useScrollAwayHeaderPosition),
	SduiFeatureEntryPoint = require(script.SduiFeatureEntryPoint),
	getSduiTemplateStore = require(script.getSduiTemplateStore),
	getSduiPageEntrySnackbarStore = require(script.getSduiPageEntrySnackbarStore),
	usePageEntrySnackbar = require(script.usePageEntrySnackbar),
	useComponentConfig = require(script.hooks.useComponentConfig),
	useEntrySurfacing = require(script.hooks.useEntrySurfacing),
	useInputData = require(script.hooks.useInputData),
	useSduiPageScopeField = require(script.hooks.useSduiPageScopeField),
	useUiStatus = require(script.hooks.useUiStatus),
	UiStatus = require(script.SduiIntegrationTypes).UiStatus,
	SduiProtobufResponseHelpers = require(script.SduiProtobufResponseHelpers),
	SduiPageAnalytics = require(script.SduiPageAnalytics),
	SduiResponseType = sduiResponseType,
	SduiApiStorePostConfigContentType = require(script.SduiApiStorePostConfig).SduiApiStorePostConfigContentType,
	SduiOverlayEntryPoint = require(script.SduiOverlayEntryPoint),
	getSduiClientPageScope = require(parent.SduiCoreSystem).getSduiClientPageScope,
	usePageScopeRef = require(parent.SduiCoreSystem).usePageScopeRef,
	SduiCapabilities = require(parent.SduiCoreSystem).SduiCapabilities,
	getSduiDataBinder = require(parent.SduiCoreSystem).getSduiDataBinder,
	streamingFeedMergeStrategy = require(script.streamingFeedMergeStrategy),
	buildSduiCollectionInfo = require(script.buildSduiCollectionInfo)
}