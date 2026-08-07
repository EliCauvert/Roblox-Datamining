local sduiResponseType = require(script.SduiIntegrationTypes).SduiResponseType
local sduiLoadTimerModule = require(script.SduiLoadTimer)
local sduiSurfaceLoadTimeTrackerModule = require(script.SduiSurfaceLoadTimeTracker)
local _ = require(script.SduiIntegrationTypes)
local parent = script.Parent

return {
	["jest.config"] = script["jest.config"],
	SduiFocusTags = require(script.FocusNavigation.SduiFocusTags),
	OnNavigateBackWrapper = require(script.FocusNavigation.NavigateBackBindings).OnNavigateBackWrapper,
	useOnNavigateBack = function(p0, p1) --[[ line: 24 ]]
		return require(script.FocusNavigation.NavigateBackBindings).useOnNavigateBack(p0, p1)
	end,
	useInitialFocusOnTag = function(p2, p3) --[[ line: 27 ]]
		require(script.FocusNavigation.useInitialFocusOnTag)(p2, p3)
	end,
	useSelectionOrderTracking = function(p4) --[[ line: 30 ]]
		require(script.FocusNavigation.useSelectionOrderTracking)(p4)
	end,
	usePageButtonBindings = function(p5, p6, p7) --[[ line: 33 ]]
		return require(script.FocusNavigation.usePageButtonBindings)(p5, p6, p7)
	end,
	useBackButtonBinding = function(p8) --[[ line: 40 ]]
		return require(script.FocusNavigation.useBackButtonBinding)(p8)
	end,
	createSduiFocusActivationStore = function() --[[ line: 43 ]]
		return require(script.FocusNavigation.createSduiFocusActivationStore)()
	end,
	getSduiFocusActivationStore = function() --[[ line: 46 ]]
		return require(script.FocusNavigation.getSduiFocusActivationStore)()
	end,
	useSduiFocusActivation = function(p9, p10) --[[ line: 49 ]]
		require(script.FocusNavigation.useSduiFocusActivation)(p9, p10)
	end,
	createSduiApiStore = require(script.createSduiApiStore),
	getSduiApiStore = require(script.getSduiApiStore),
	handleSduiApiResponse = require(script.handleSduiApiResponse),
	SduiLoadTimer = sduiLoadTimerModule,
	SduiSurfaceLoadTimeTracker = sduiSurfaceLoadTimeTrackerModule,
	SduiPageEntryPoint = require(script.SduiPageEntryPoint),
	SduiPageNavigationHeader = require(script.SduiPageNavigationHeader),
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
	streamingFeedMergeStrategy = require(script.streamingFeedMergeStrategy),
	buildSduiCollectionInfo = require(script.buildSduiCollectionInfo)
}