local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local AvatarRouteContext = AvatarExperienceNavigationModule.AvatarRoute.Context.AvatarRouteContext
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperiencePhotoboothModule = require(CorePackages.Workspace.Packages.AvatarExperiencePhotobooth)
local MakeAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.makeAvatarRoute)
local AvatarExperienceAlwaysMountedModule = require(Modules.AvatarExperience.Common.Components.AvatarExperienceAlwaysMounted)
local AvatarExperienceRootNavigatorModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceRootNavigator)
local CurrentTabContextModule = require(Modules.LuaApp.Navigation.CurrentTabContext)
local SwitchNavigatorVisibleContextModule = require(Modules.LuaApp.Navigation.SwitchNavigatorVisibleContext)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local AxLoadtime = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.loadtime")
local IntervalPerformanceTracker = require(CorePackages.Workspace.Packages.IntervalPerformanceTracker).IntervalPerformanceTracker
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local OnFocusExperimentExposureLoggerModule = require(Modules.AvatarExperience.Catalog.Components.OnFocusExperimentExposureLogger)
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local NamedRefsContextModule = require(Modules.AvatarExperience.Common.Context.NamedRefsContext)
local AvatarExperienceRootContainer = RoactModule.Component:extend("AvatarExperienceRootContainer")
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local UseUnifiedEventListenerFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventListener.useUnifiedEventListener
local ProviderContainer = require(CorePackages.Workspace.Packages.RoactUtils).Components.ProviderContainer
local AXCatalogStoreContext = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Context.AXCatalogStoreContext
local GetCatalogStoresFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Stores.getCatalogStores
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local AvatarEditorStores = AvatarExperienceSlotBasedEditorModule.Context.AvatarEditorStores
local CreateInventoryStoresFromCategoriesModule = require(Modules.AvatarExperience.SlotBasedEditor.Utils.createInventoryStoresFromCategories)
local CreateAvatarEditorStoresFunction = AvatarExperienceSlotBasedEditorModule.Stores.createAvatarEditorStores
local AnimatedVisibilityProvider = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Stores.AnimatedVisibilityStore.AnimatedVisibilityProvider
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local GetTopLevelPageFPSCounterNameModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.Utils.GetTopLevelPageFPSCounterName)
local AvatarExperienceFPSDuration = game:DefineFastInt("AvatarExperienceFPSDuration", 6)
local GetFFlagAXFPSEventStreamAndCountersFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagAXFPSEventStreamAndCounters
local AXEnableAccessoryAdjustmentDuringTryOnIXP = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP
local FFlagAXPhotoboothFunctionality = AvatarExperienceFlagsModule.FFlagAXPhotoboothFunctionality
local FFlagAXAvatarEditorStoresContext = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarEditorStoresContext
local OnFocusLayerExposureLoggerModule = require(Modules.AvatarExperience.Catalog.Components.OnFocusLayerExposureLogger)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local FFlagAXPhotoboothExposure = AvatarExperienceFlagsModule.FFlagAXPhotoboothExposure
local FFlagAXHideMenuOnScroll = AvatarExperienceFlagsModule.FFlagAXHideMenuOnScroll
local AXGamepadNoHarmExposureLogging = game:DefineFastFlag("AXGamepadNoHarmExposureLogging", false)
local AXUseFlagLinkedUserLayerExposure = game:DefineFastFlag("AXUseFlagLinkedUserLayerExposure", false)
local AXAllViewsSecondaryExposure = game:DefineFastFlag("AXAllViewsSecondaryExposure", false)
local FFlagAXDurablesSupportExposureLogging = AvatarExperienceFlagsModule.FFlagAXDurablesSupportExposureLogging
local FStringAXDurablesSupportExposureLayer = AvatarExperienceFlagsModule.FStringAXDurablesSupportExposureLayer
local FFlagAXSlotsDesignUpdatesExposureLogging = AvatarExperienceFlagsModule.FFlagAXSlotsDesignUpdatesExposureLogging

local function v48()
	-- upvalues: UseUnifiedEventListenerFunction (copy)
	UseUnifiedEventListenerFunction()
	
	return nil
end

function AvatarExperienceRootContainer.init(p1)
	-- upvalues: RoactGamepadModule (copy), MakeAvatarRouteModule (copy), FFlagAXAvatarEditorStoresContext (copy), CreateAvatarEditorStoresFunction (copy), CreateInventoryStoresFromCategoriesModule (copy), GetCatalogStoresFunction (copy)
	p1.namedRefs = RoactGamepadModule.createRefCache()
	p1.startAXLatencyTimer = os.clock()
	p1.isNavigating = false
	p1:trackTopLevelPageFPS((MakeAvatarRouteModule(p1.props.navigation, false)))
	
	if FFlagAXAvatarEditorStoresContext then
		p1.avatarEditorStores = CreateAvatarEditorStoresFunction()
		p1.avatarEditorStores.categoryInventoryStores = CreateInventoryStoresFromCategoriesModule()
	end
	p1.catalogStores = GetCatalogStoresFunction()
end

function AvatarExperienceRootContainer.getProviders(p1)
	-- upvalues: FFlagAXPhotoboothFunctionality (copy), AvatarExperiencePhotoboothModule (copy), FFlagAXHideMenuOnScroll (copy), AnimatedVisibilityProvider (copy), FFlagAXAvatarEditorStoresContext (copy), AvatarEditorStores (copy), AXCatalogStoreContext (copy)
	local List = {}
	
	if FFlagAXPhotoboothFunctionality then
		table.insert(List, {
			class = AvatarExperiencePhotoboothModule.Context.PhotoboothContextProvider
		})
	end
	if FFlagAXHideMenuOnScroll then
		table.insert(List, { class = AnimatedVisibilityProvider })
	end
	if FFlagAXAvatarEditorStoresContext then
		table.insert(List, {
			class = AvatarEditorStores.Provider,
			props = { value = p1.avatarEditorStores }
		})
	end
	table.insert(List, {
		class = AXCatalogStoreContext.Provider,
		props = { value = p1.catalogStores }
	})
	
	return List
end

function AvatarExperienceRootContainer.render(p1)
	-- upvalues: RoactModule (copy), CurrentTabContextModule (copy), SwitchNavigatorVisibleContextModule (copy), AvatarScreen (copy), OnFocusExperimentExposureLoggerModule (copy), AXEnableAccessoryAdjustmentDuringTryOnIXP (copy), FFlagAXDurablesSupportExposureLogging (copy), FFlagAXSlotsDesignUpdatesExposureLogging (copy), FStringAXDurablesSupportExposureLayer (copy), FFlagAXPhotoboothExposure (copy), OnFocusLayerExposureLoggerModule (copy), AppUserLayers (copy)
	return RoactModule.createElement(CurrentTabContextModule.Consumer, {
		render = function(AvatarExperienceRoot)
			-- upvalues: RoactModule (upval), SwitchNavigatorVisibleContextModule (upval), p1 (copy), AvatarScreen (upval), OnFocusExperimentExposureLoggerModule (upval), AXEnableAccessoryAdjustmentDuringTryOnIXP (upval), FFlagAXDurablesSupportExposureLogging (upval), FFlagAXSlotsDesignUpdatesExposureLogging (upval), FStringAXDurablesSupportExposureLayer (upval), FFlagAXPhotoboothExposure (upval), OnFocusLayerExposureLoggerModule (upval), AppUserLayers (upval)
			return RoactModule.createElement(SwitchNavigatorVisibleContextModule.Consumer, {
				render = function(p2)
					-- upvalues: p1 (upval), AvatarExperienceRoot (copy), AvatarScreen (upval), RoactModule (upval), OnFocusExperimentExposureLoggerModule (upval), AXEnableAccessoryAdjustmentDuringTryOnIXP (upval), FFlagAXDurablesSupportExposureLogging (upval), FFlagAXSlotsDesignUpdatesExposureLogging (upval), FStringAXDurablesSupportExposureLayer (upval), FFlagAXPhotoboothExposure (upval), OnFocusLayerExposureLoggerModule (upval), AppUserLayers (upval)
					local IsVisible = p1.props.screenProps and p1.props.screenProps.isVisible or (if p2 then AvatarExperienceRoot == AvatarScreen.AvatarExperienceRoot else false)
					
					return RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.fromScale(1, 1),
						Visible = IsVisible
					}, {
						AvatarExperienceRoot = p1:renderWithVisibility(IsVisible),
						OnFocusExperimentExposureLogger = RoactModule.createElement(OnFocusExperimentExposureLoggerModule, {
							ixpTests = {
								if AXEnableAccessoryAdjustmentDuringTryOnIXP.isEnabled() then AXEnableAccessoryAdjustmentDuringTryOnIXP else nil
							},
							flagIXPTestLayers = if FFlagAXDurablesSupportExposureLogging or FFlagAXSlotsDesignUpdatesExposureLogging then {
								if FFlagAXDurablesSupportExposureLogging then FStringAXDurablesSupportExposureLayer else nil
							} else nil
						}),
						OnFocusLayerExposureLogger = if FFlagAXPhotoboothExposure then RoactModule.createElement(OnFocusLayerExposureLoggerModule, { ixpLayers = { AppUserLayers.AvatarExperienceUAAllViews } }) else nil
					})
				end
			})
		end
	})
end

function AvatarExperienceRootContainer.renderWithVisibility(p2, IsVisible)
	-- upvalues: MakeAvatarRouteModule (copy), RoactModule (copy), AvatarRouteContext (copy), ProviderContainer (copy), NamedRefsContextModule (copy), AvatarExperienceRootNavigatorModule (copy), AvatarExperienceAlwaysMountedModule (copy), v48 (copy)
	local Navigation = p2.props.navigation
	local AvatarRouteModule = MakeAvatarRouteModule(Navigation, IsVisible)
	
	return RoactModule.createElement(AvatarRouteContext.Provider, { value = AvatarRouteModule }, {
		ProviderContainer = RoactModule.createElement(ProviderContainer, { providers = p2:getProviders() }, {
			AvatarExperienceRootWithProviders = RoactModule.createElement(NamedRefsContextModule.Provider, { value = p2.namedRefs }, {
				RootNavigator = RoactModule.createElement(AvatarExperienceRootNavigatorModule, { navigation = Navigation, avatarRoute = AvatarRouteModule }),
				AlwaysMounted = RoactModule.createElement(AvatarExperienceAlwaysMountedModule, { navigation = Navigation, avatarRoute = AvatarRouteModule }),
				Analytics = RoactModule.createElement(v48)
			})
		})
	})
end

local function getPageErrorCounterMap(IsWithinViewContext)
	-- upvalues: ConstantsModule (copy), AvatarScreen (copy)
	local TopLevelErrors = ConstantsModule.Counter.TopLevelErrors
	
	return {
		[AvatarScreen.Catalog] = TopLevelErrors.CatalogViewError,
		[AvatarScreen.CatalogSearch] = TopLevelErrors.SearchViewError,
		[AvatarScreen.AvatarEditor] = TopLevelErrors.EditorViewError,
		[AvatarScreen.ItemDetails] = IsWithinViewContext and TopLevelErrors.SearchItemDetailsViewError or TopLevelErrors.CatalogItemDetailsViewError,
		[AvatarScreen.SortAndFilters] = IsWithinViewContext and TopLevelErrors.SearchFiltersViewError or TopLevelErrors.CatalogFiltersViewError
	}
end

local function trackTopLevelErrorCounters(p2, CatalogAnalytics)
	-- upvalues: NavigationUtilsModule (copy), AvatarScreen (copy), getPageErrorCounterMap (copy), ConstantsModule (copy)
	local PageErrorCounter = getPageErrorCounterMap((NavigationUtilsModule.isWithinViewContext(p2, AvatarScreen.CatalogSearch)))[p2.current.name] or ConstantsModule.Counter.TopLevelErrors.UnknownViewError
	task.spawn(function()
		-- upvalues: CatalogAnalytics (copy), PageErrorCounter (copy)
		CatalogAnalytics.sendAXCounter(PageErrorCounter)
	end)
end

local function getPageLatencyCountersMap(IsWithinViewContext)
	-- upvalues: ConstantsModule (copy), AvatarScreen (copy)
	local TopLevelLatency = ConstantsModule.Counter.TopLevelLatency
	
	return {
		[AvatarScreen.Catalog] = TopLevelLatency.CatalogViewLatency,
		[AvatarScreen.CatalogSearch] = TopLevelLatency.SearchViewLatency,
		[AvatarScreen.AvatarEditor] = TopLevelLatency.EditorViewLatency,
		[AvatarScreen.ItemDetails] = IsWithinViewContext and TopLevelLatency.SearchItemDetailsViewLatency or TopLevelLatency.CatalogItemDetailsViewLatency,
		[AvatarScreen.SortAndFilters] = IsWithinViewContext and TopLevelLatency.SearchFiltersViewLatency or TopLevelLatency.CatalogFiltersViewLatency
	}
end

function AvatarExperienceRootContainer.trackTopLevelPageLatency(p2)
	-- upvalues: MakeAvatarRouteModule (copy), NavigationUtilsModule (copy), AvatarScreen (copy), getPageLatencyCountersMap (copy), ConstantsModule (copy), AxLoadtime (copy), UtilsModule (copy)
	local AvatarRouteModule = MakeAvatarRouteModule(p2.props.navigation, false)
	local AppAnalytics = p2.props.appAnalytics
	local PageLatencyCounters = getPageLatencyCountersMap((NavigationUtilsModule.isWithinViewContext(AvatarRouteModule, AvatarScreen.CatalogSearch)))[AvatarRouteModule.current.name] or ConstantsModule.Counter.TopLevelLatency.UnknownViewLatency
	local ScaledClockTime = (os.clock() - p2.startAXLatencyTimer) * 1000
	AxLoadtime:info("Avatar experirence load time: {} ms", ScaledClockTime)
	AppAnalytics.Diag:reportStats(PageLatencyCounters .. "_" .. UtilsModule.getDeviceType(), ScaledClockTime)
	p2.props.catalogAnalytics.sendAXStat(ConstantsModule.Counter.TopLevelLatency.Name, ScaledClockTime, { Page = PageLatencyCounters })
	p2.startAXLatencyTimer = nil
end

function AvatarExperienceRootContainer:trackTopLevelPageFPS(p2)
	-- upvalues: GetTopLevelPageFPSCounterNameModule (copy), AvatarExperienceFPSDuration (ref), IntervalPerformanceTracker (copy), GetFFlagAXFPSEventStreamAndCountersFunction (copy)
	local TopLevelPageFPSCounterNameModule = GetTopLevelPageFPSCounterNameModule(p2.current.name, p2)
	
	if not AvatarExperienceFPSDuration or AvatarExperienceFPSDuration <= 0 then
		AvatarExperienceFPSDuration = 1
	end
	IntervalPerformanceTracker:startTracking(TopLevelPageFPSCounterNameModule, AvatarExperienceFPSDuration, nil, if GetFFlagAXFPSEventStreamAndCountersFunction() then true else nil, if GetFFlagAXFPSEventStreamAndCountersFunction() then true else nil)
end

function AvatarExperienceRootContainer.componentDidCatch(p2, p3, _)
	-- upvalues: MakeAvatarRouteModule (copy), trackTopLevelErrorCounters (copy)
	trackTopLevelErrorCounters(MakeAvatarRouteModule(p2.props.navigation, false), p2.props.catalogAnalytics)
	error(p3)
end

function AvatarExperienceRootContainer.didMount(p2)
	-- upvalues: AXGamepadNoHarmExposureLogging (copy), AXUseFlagLinkedUserLayerExposure (copy), IXPServiceWrapper (copy), AppUserLayers (copy), IxpUtilsModule (copy), AXAllViewsSecondaryExposure (copy)
	p2:trackTopLevelPageLatency()
	
	if AXGamepadNoHarmExposureLogging then
		if AXUseFlagLinkedUserLayerExposure then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AppUserLayers.AvatarExperienceUAAllViews)
		else
			IxpUtilsModule.logLayerExposure(AppUserLayers.AvatarExperienceUAAllViews)
		end
	end
	if AXAllViewsSecondaryExposure then
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure("AvatarExperience.UA.AllViews.Secondary")
	end
end

function AvatarExperienceRootContainer.willUpdate(p2, p3)
	-- upvalues: MakeAvatarRouteModule (copy)
	local AvatarRouteModule = MakeAvatarRouteModule(p3.navigation, false)
	
	if AvatarRouteModule.current.name ~= MakeAvatarRouteModule(p2.props.navigation, false).current.name then
		p2.startAXLatencyTimer = os.clock()
		p2.isNavigating = true
		p2:trackTopLevelPageFPS(AvatarRouteModule)
	end
end

function AvatarExperienceRootContainer.didUpdate(p2, p3)
	-- upvalues: MakeAvatarRouteModule (copy)
	local AvatarRouteModule = MakeAvatarRouteModule(p2.props.navigation, false)
	local Name = MakeAvatarRouteModule(p3.navigation, false).current.name
	local Name1 = AvatarRouteModule.current.name
	
	if p2.isNavigating and Name1 ~= Name then
		p2:trackTopLevelPageLatency()
		p2.isNavigating = false
	end
end

local v1 = RoactServices.connect({
	catalogAnalytics = AnalyticsModule,
	appAnalytics = RoactAnalyticsModule
})(AvatarExperienceRootContainer)
v1.router = AvatarExperienceRootNavigatorModule.router

return v1