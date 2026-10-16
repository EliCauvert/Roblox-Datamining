local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local FFlagCapturesInExpUseMomentsCreationModule = require(Parent.Flags.FFlagCapturesInExpUseMomentsCreation)
local AppStorageService = game:GetService("AppStorageService")
local CaptureService = game:GetService("CaptureService")
local LocalizationService = game:GetService("LocalizationService")
local NotificationService = game:GetService("NotificationService")
local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local DashModule = require(Parent1.Dash)
local MomentsCreationFlowModule = if FFlagCapturesInExpUseMomentsCreationModule then nil else require(Parent1.MomentsCreationFlow)
local ReactModule = require(Parent1.React)
local RoactModule = require(Parent1.Roact)
local RoduxModule = require(Parent1.Rodux)
local Signal = require(Parent1.AppCommonLib).Signal
local AnalyticsServiceModule = require(Parent.Analytics.AnalyticsService)
local CaptureManagerScreenModule = require(Parent.Components.CaptureManager.CaptureManagerScreen)
local CaptureOverlayModule = require(Parent.Components.CoreUI.CaptureOverlay)
local MomentsCreationFlowScreenModule = require(Parent.Components.MomentsCreationFlow.MomentsCreationFlowScreen)
local CapturesActivatedModule = require(Parent.Actions.CapturesActivated)
local CapturesCoreGuiDisabledModule = require(Parent.Actions.CapturesCoreGuiDisabled)
local CapturesCoreGuiEnabledModule = require(Parent.Actions.CapturesCoreGuiEnabled)
local CapturesCoreUIModule = require(Parent.Components.CoreUI.CapturesCoreUI)
local CapturesDeactivatedModule = require(Parent.Actions.CapturesDeactivated)
local CaptureServicePromptsModule = require(Parent.Components.CaptureService.CaptureServicePrompts)
local CapturesPageModule = require(Parent.Components.CoreUI.CapturesPage)
local CapturesPolicyModule = require(Parent.App.CapturesPolicy)
local CarouselScreenModule = require(Parent.Components.CapturesCarousel.CarouselScreen)
local ConstantsModule = require(Parent.Constants)
local EventNamesModule = require(Parent.Analytics.EventNames)
local GetLocalUserIdModule = require(Parent.Utils.getLocalUserId)
local GetUserIdsFromStringModule = require(Parent.Utils.getUserIdsFromString)
local InstallReducerModule = require(Parent.installReducer)
local MakeCaptureSavedHandlerModule = require(Parent.Utils.makeCaptureSavedHandler)
local MakeVideoCaptureInProgressHandlerModule = require(Parent.Utils.makeVideoCaptureInProgressHandler)
local MakeWrapWithProvidersModule = require(Parent.Utils.makeWrapWithProviders)
local MenuClosedModule = require(Parent.Actions.MenuClosed)
local MenuOpenedModule = require(Parent.Actions.MenuOpened)
local MomentsCreationFlowClosedModule = require(Parent.Actions.MomentsCreationFlowClosed)
local NetworkingModule = require(Parent.App.Networking)
local OnToggleActivationModule = require(Parent.Utils.onToggleActivation)
local OnViewportSizeChangedFunction = require(Parent1.CapturesCommon).Utils.onViewportSizeChanged
local CheckMomentsEligibilityModule = require(Parent.Thunks.CheckMomentsEligibility)
local RetrieveCapturesModule = require(Parent.Thunks.RetrieveCaptures)
local ScreenSizeModule = require(Parent.installReducer.ScreenSize)
local ScreenSizeChangedModule = require(Parent.Actions.ScreenSizeChanged)
local ServerTypeModule = require(Parent.installReducer.ServerType)
local ServerTypeDetectedModule = require(Parent.Actions.ServerTypeDetected)
local SetupFireEventModule = require(Parent.Analytics.setupFireEvent)
local TakeCaptureModule = require(Parent.Thunks.TakeCapture)
local _ = require(Parent.Types)
local FFlagCapturesVideoCaptureTriggerHandlerEnabledModule = require(Parent.Flags.FFlagCapturesVideoCaptureTriggerHandlerEnabled)
local FFlagCreateMomentsToastModule = require(Parent.Flags.FFlagCreateMomentsToast)
local FIntCapturesCoreGuiEventsPerMyriadModule = require(Parent.Flags.FIntCapturesCoreGuiEventsPerMyriad)
local SSUIMetaLuaEngineFeature = game:GetEngineFeature("SSUIMetaLua")

return {
	createApp = function(p1) --[[ Line: 88 ]]
		-- upvalues: DashModule (copy), AnalyticsServiceModule (copy), AppStorageService (copy), CaptureService (copy), LocalizationService (copy), NotificationService (copy), Players (copy), RbxAnalyticsService (copy), RobloxReplicatedStorage (copy), StarterGui (copy), SetupFireEventModule (copy), ConstantsModule (copy), GetLocalUserIdModule (copy), InstallReducerModule (copy), NetworkingModule (copy), ScreenSizeModule (copy), ServerTypeModule (copy), MomentsCreationFlowModule (copy), RoduxModule (copy), RetrieveCapturesModule (copy), FFlagCreateMomentsToastModule (copy), CheckMomentsEligibilityModule (copy), MakeCaptureSavedHandlerModule (copy), FFlagCapturesVideoCaptureTriggerHandlerEnabledModule (copy), MakeVideoCaptureInProgressHandlerModule (copy), GetUserIdsFromStringModule (copy), CapturesActivatedModule (copy), CapturesDeactivatedModule (copy), ServerTypeDetectedModule (copy), MenuClosedModule (copy), MenuOpenedModule (copy), TakeCaptureModule (copy), FIntCapturesCoreGuiEventsPerMyriadModule (copy), EventNamesModule (copy), CapturesCoreGuiEnabledModule (copy), CapturesCoreGuiDisabledModule (copy), Signal (copy), SSUIMetaLuaEngineFeature (copy), OnViewportSizeChangedFunction (copy), ScreenSizeChangedModule (copy), OnToggleActivationModule (copy), MakeWrapWithProvidersModule (copy), CapturesPolicyModule (copy), RoactModule (copy), FFlagCapturesInExpUseMomentsCreationModule (copy), Parent1 (copy), MomentsCreationFlowClosedModule (copy), ReactModule (copy), CaptureManagerScreenModule (copy), CaptureOverlayModule (copy), CarouselScreenModule (copy), CaptureServicePromptsModule (copy), CapturesCoreUIModule (copy), CapturesPageModule (copy), MomentsCreationFlowScreenModule (copy)
		local config = {
			_momentsCreationFlowDestroyingConnection = nil,
			_momentsCreationFlowHandle = nil
		}
		local JoinResult = DashModule.join({
			AnalyticsService = AnalyticsServiceModule,
			AppStorageService = AppStorageService,
			CaptureService = CaptureService,
			LocalizationService = LocalizationService,
			NotificationService = NotificationService,
			Players = Players,
			RbxAnalyticsService = RbxAnalyticsService,
			RobloxReplicatedStorage = RobloxReplicatedStorage,
			StarterGui = StarterGui
		}, p1)
		local SetupFireEventModuleResult = SetupFireEventModule({
			analytics = JoinResult.AnalyticsService,
			infoForAllEvents = {
				isUnder13 = if JoinResult.Players.LocalPlayer then JoinResult.Players.LocalPlayer:GetUnder13() else nil,
				pid = tostring(game.PlaceId),
				source = ConstantsModule.AnalyticsSource,
				uid = GetLocalUserIdModule(JoinResult.Players),
				universeId = tostring(game.GameId)
			}
		})
		local config1 = {
			[ConstantsModule.RoduxKey] = InstallReducerModule(),
			NetworkStatus = NetworkingModule.RoduxNetworking.installReducer(),
			ScreenSize = ScreenSizeModule,
			ServerType = ServerTypeModule,
			ShareLinks = NetworkingModule.ShareLinksRodux.installReducer()
		}
		
		if MomentsCreationFlowModule then
			config1[MomentsCreationFlowModule.Constants.RoduxKey] = MomentsCreationFlowModule.installReducer()
		end
		config._store = RoduxModule.Store.new(RoduxModule.combineReducers(config1), {}, { RoduxModule.thunkMiddleware })
		config._store:dispatch(RetrieveCapturesModule())
		
		if FFlagCreateMomentsToastModule then
			config._store:dispatch(CheckMomentsEligibilityModule(game.GameId))
		end
		JoinResult.CaptureService.CaptureSavedInternal:Connect((MakeCaptureSavedHandlerModule(config._store, JoinResult, SetupFireEventModuleResult)))
		
		if FFlagCapturesVideoCaptureTriggerHandlerEnabledModule then
			JoinResult.CaptureService.VideoCaptureInProgress:Connect((MakeVideoCaptureInProgressHandlerModule(config._store, JoinResult, SetupFireEventModuleResult)))
		end
		JoinResult.AppStorageService:WhenLoaded(function() --[[ Line: 146 ]]
			-- upvalues: JoinResult (copy), ConstantsModule (upval), GetUserIdsFromStringModule (upval), GetLocalUserIdModule (upval), config (copy), CapturesActivatedModule (upval), CapturesDeactivatedModule (upval)
			local Success, Result = pcall(function() --[[ Line: 147 ]]
				-- upvalues: JoinResult (upval), ConstantsModule (upval)
				return JoinResult.AppStorageService:GetItem(ConstantsModule.CapturesActiveLocalStorageKey)
			end)
			
			if Success and Result ~= "" then
				if GetUserIdsFromStringModule(Result)[GetLocalUserIdModule(JoinResult.Players) or ""] then
					config._store:dispatch(CapturesActivatedModule())
					
					return
				end
				config._store:dispatch(CapturesDeactivatedModule())
			end
		end)
		task.spawn(function() --[[ Line: 162 ]]
			-- upvalues: JoinResult (copy), config (copy), ServerTypeDetectedModule (upval)
			local Success, Result = pcall(function() --[[ Line: 163 ]]
				-- upvalues: JoinResult (upval)
				return JoinResult.RobloxReplicatedStorage:WaitForChild("GetServerType", 1e999):InvokeServer()
			end)
			
			if Success then
				config._store:dispatch(ServerTypeDetectedModule(Result))
			end
		end)
		
		function config.closeMenu() --[[ Line: 172 ]]
			-- upvalues: config (copy), MenuClosedModule (upval)
			config._store:dispatch(MenuClosedModule())
		end
		
		function config.openMenu() --[[ Line: 176 ]]
			-- upvalues: config (copy), MenuOpenedModule (upval)
			config._store:dispatch(MenuOpenedModule())
		end
		
		function config.takeCapture(p2) --[[ Line: 180 ]]
			-- upvalues: config (copy), TakeCaptureModule (upval)
			config._store:dispatch(TakeCaptureModule(p2))
		end
		
		local function maybeSendCoreGuiEvent(AllTypeChanged, p2) --[[ Line: 184 ]]
			-- upvalues: FIntCapturesCoreGuiEventsPerMyriadModule (upval), SetupFireEventModuleResult (copy), EventNamesModule (upval)
			if FIntCapturesCoreGuiEventsPerMyriadModule == 0 then return end
			if FIntCapturesCoreGuiEventsPerMyriadModule <= Random.new():NextInteger(1, 10000) then return end
			if p2 then
				SetupFireEventModuleResult(EventNamesModule.CapturesCoreGuiEnabled, { allTypeChanged = AllTypeChanged })
				
				return
			else
				SetupFireEventModuleResult(EventNamesModule.CapturesCoreGuiDisabled, { allTypeChanged = AllTypeChanged })
			end
		end
		
		JoinResult.StarterGui.CoreGuiChangedSignal:Connect(function(CoreGuiType, Enabled) --[[ Line: 201 ]]
			-- upvalues: maybeSendCoreGuiEvent (copy), config (copy), CapturesCoreGuiEnabledModule (upval), CapturesCoreGuiDisabledModule (upval)
			if CoreGuiType ~= Enum.CoreGuiType.All and CoreGuiType ~= Enum.CoreGuiType.Captures then return end
			maybeSendCoreGuiEvent(CoreGuiType == Enum.CoreGuiType.All, Enabled)
			
			if Enabled then
				config._store:dispatch(CapturesCoreGuiEnabledModule())
				
				return
			else
				config._store:dispatch(CapturesCoreGuiDisabledModule())
			end
		end)
		
		if JoinResult.StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Captures) then
			config._store:dispatch(CapturesCoreGuiEnabledModule())
		else
			config._store:dispatch(CapturesCoreGuiDisabledModule())
		end
		config.onIsActiveChanged = Signal.new()
		
		function config.getIsActive() --[[ Line: 225 ]]
			-- upvalues: config (copy), ConstantsModule (upval)
			return config._store:getState()[ConstantsModule.RoduxKey].IsActive or false
		end
		
		config._store.changed:connect(function(Value, p2) --[[ Line: 229 ]]
			-- upvalues: ConstantsModule (upval), JoinResult (copy), GetUserIdsFromStringModule (upval), GetLocalUserIdModule (upval), DashModule (upval), config (copy)
			local IsActive = Value[ConstantsModule.RoduxKey].IsActive
			
			if IsActive ~= p2[ConstantsModule.RoduxKey].IsActive then
				pcall(function() --[[ Line: 234 ]]
					-- upvalues: JoinResult (upval), ConstantsModule (upval), GetUserIdsFromStringModule (upval), GetLocalUserIdModule (upval), IsActive (copy), DashModule (upval)
					local UserIdsFromStringModule = GetUserIdsFromStringModule((JoinResult.AppStorageService:GetItem(ConstantsModule.CapturesActiveLocalStorageKey)))
					local LocalUserIdModule = GetLocalUserIdModule(JoinResult.Players) or ""
					
					if IsActive then
						UserIdsFromStringModule[LocalUserIdModule] = true
					else
						UserIdsFromStringModule[LocalUserIdModule] = nil
					end
					JoinResult.AppStorageService:SetItem(ConstantsModule.CapturesActiveLocalStorageKey, (table.concat(DashModule.keys(UserIdsFromStringModule), ",")))
					JoinResult.AppStorageService:Flush()
				end)
				config.onIsActiveChanged:fire(IsActive)
			end
		end)
		
		if SSUIMetaLuaEngineFeature then
			pcall(function() --[[ Line: 255 ]]
				-- upvalues: config (copy), ConstantsModule (upval)
				local SafetyService = game:GetService("SafetyService")
				config._store.changed:connect(function(Value, p2) --[[ Line: 257 ]]
					-- upvalues: ConstantsModule (upval), SafetyService (copy)
					local Entry = Value[ConstantsModule.RoduxKey]
					local v1 = p2[ConstantsModule.RoduxKey]
					local IsMenuOpen = v1.IsMenuOpen or v1.Carousel and v1.Carousel.IsOpen
					local IsMenuOpen1 = Entry.IsMenuOpen or Entry.Carousel and Entry.Carousel.IsOpen
					
					if IsMenuOpen1 and not IsMenuOpen then
						pcall(function() --[[ Line: 267 ]]
							-- upvalues: SafetyService (upval)
							SafetyService:ReportCapturesUIOpen()
						end)
						
						return
					end
					if not IsMenuOpen1 and IsMenuOpen then
						pcall(function() --[[ Line: 271 ]]
							-- upvalues: SafetyService (upval)
							SafetyService:ReportCapturesUIClose()
						end)
					end
				end)
			end)
		end
		OnViewportSizeChangedFunction(function(p2) --[[ Line: 279 ]]
			-- upvalues: config (copy), ScreenSizeChangedModule (upval)
			config._store:dispatch(ScreenSizeChangedModule(p2))
		end)
		
		function config.onToggleActivationFromChrome(...) --[[ Line: 283 ]]
			-- upvalues: config (copy), OnToggleActivationModule (upval), SetupFireEventModuleResult (copy), EventNamesModule (upval)
			OnToggleActivationModule(config.getIsActive(), nil, SetupFireEventModuleResult, function(...) --[[ Line: 284 ]]
				-- upvalues: config (upval)
				config._store:dispatch(...)
			end, EventNamesModule.CapturesActivatedChrome, EventNamesModule.CapturesDeactivatedChrome)
		end
		
		local WrapWithProvidersModule = MakeWrapWithProvidersModule(config._store, JoinResult)
		local ReadResult = CapturesPolicyModule.PolicyImplementation.read()
		local EligibleForCapturesFeatureResult = if ReadResult then CapturesPolicyModule.Mapper(ReadResult).eligibleForCapturesFeature() else false
		local EnableCapturesBulkManagementResult = if ReadResult then CapturesPolicyModule.Mapper(ReadResult).enableCapturesBulkManagement() else false
		local config2 = { fireAnalyticsEvent = SetupFireEventModuleResult }
		
		local function unmountMomentsCreationFlow() --[[ Line: 312 ]]
			-- upvalues: config (copy), RoactModule (upval), FFlagCapturesInExpUseMomentsCreationModule (upval), ConstantsModule (upval), Parent1 (upval), MomentsCreationFlowClosedModule (upval)
			local MomentsCreationFlowDestroyingConnection = config._momentsCreationFlowDestroyingConnection
			config._momentsCreationFlowDestroyingConnection = nil
			
			if MomentsCreationFlowDestroyingConnection then
				MomentsCreationFlowDestroyingConnection:Disconnect()
			end
			local MomentsCreationFlowHandle = config._momentsCreationFlowHandle
			config._momentsCreationFlowHandle = nil
			
			if MomentsCreationFlowHandle then
				RoactModule.unmount(MomentsCreationFlowHandle)
			end
			if FFlagCapturesInExpUseMomentsCreationModule and config._store:getState()[ConstantsModule.RoduxKey].MomentsCreationFlow.IsOpen then
				local MomentsCreationModule = require(Parent1.MomentsCreation)
				MomentsCreationModule.resetCreationFlow(MomentsCreationModule.Enums.CreationFlowState.Preview)
				config._store:dispatch(MomentsCreationFlowClosedModule())
			end
		end
		
		function config.mountCaptureManager(p2) --[[ Line: 337 ]]
			-- upvalues: EnableCapturesBulkManagementResult (copy), EligibleForCapturesFeatureResult (copy), config (copy), WrapWithProvidersModule (copy), config2 (copy), ReactModule (upval), CaptureManagerScreenModule (upval)
			if not EnableCapturesBulkManagementResult then return end
			if EligibleForCapturesFeatureResult then
				config._captureManagerHandle = WrapWithProvidersModule(p2, config2, {
					CaptureManager = ReactModule.createElement(CaptureManagerScreenModule)
				})
				
				return
			end
		end
		
		function config.mountCaptureOverlay(p2) --[[ Line: 349 ]]
			-- upvalues: EligibleForCapturesFeatureResult (copy), ReactModule (upval), CaptureOverlayModule (upval), config (copy), WrapWithProvidersModule (copy), config2 (copy)
			if EligibleForCapturesFeatureResult then
				config._captureOverlayHandle = WrapWithProvidersModule(p2, config2, {
					CaptureOverlay = ReactModule.createElement(CaptureOverlayModule)
				})
				
				return
			end
		end
		
		function config.mountCarousel(p2) --[[ Line: 361 ]]
			-- upvalues: EligibleForCapturesFeatureResult (copy), ReactModule (upval), CarouselScreenModule (upval), config (copy), WrapWithProvidersModule (copy), config2 (copy)
			if EligibleForCapturesFeatureResult then
				config._carouselHandle = WrapWithProvidersModule(p2, config2, {
					CarouselScreen = ReactModule.createElement(CarouselScreenModule)
				})
				
				return
			end
		end
		
		function config.mountCoreUI(p2, ChromeEnabled) --[[ Line: 373 ]]
			-- upvalues: EligibleForCapturesFeatureResult (copy), SetupFireEventModuleResult (copy), config (copy), WrapWithProvidersModule (copy), ReactModule (upval), CaptureServicePromptsModule (upval), CapturesCoreUIModule (upval)
			if EligibleForCapturesFeatureResult then
				config._coreUiHandle = WrapWithProvidersModule(p2, {
					chromeEnabled = ChromeEnabled,
					fireAnalyticsEvent = SetupFireEventModuleResult
				}, {
					CaptureServicePrompts = ReactModule.createElement(CaptureServicePromptsModule),
					CapturesCoreUI = ReactModule.createElement(CapturesCoreUIModule)
				}, "CapturesCoreUI")
				
				return
			end
		end
		
		function config.mountMenuPage(p2, CloseSettingsMenu, ChromeEnabled) --[[ Line: 389 ]]
			-- upvalues: EligibleForCapturesFeatureResult (copy), SetupFireEventModuleResult (copy), config (copy), WrapWithProvidersModule (copy), ReactModule (upval), CapturesPageModule (upval)
			if EligibleForCapturesFeatureResult then
				config._menuPageHandle = WrapWithProvidersModule(p2, {
					chromeEnabled = ChromeEnabled,
					fireAnalyticsEvent = SetupFireEventModuleResult
				}, {
					CapturesPage = ReactModule.createElement(CapturesPageModule, { closeSettingsMenu = CloseSettingsMenu })
				})
				
				return
			end
		end
		
		function config.mountMomentsCreationFlow(p2) --[[ Line: 404 ]]
			-- upvalues: FFlagCreateMomentsToastModule (upval), EligibleForCapturesFeatureResult (copy), FFlagCapturesInExpUseMomentsCreationModule (upval), config (copy), unmountMomentsCreationFlow (copy), WrapWithProvidersModule (copy), config2 (copy), ReactModule (upval), MomentsCreationFlowScreenModule (upval)
			if not FFlagCreateMomentsToastModule then return end
			if not EligibleForCapturesFeatureResult then return end
			if FFlagCapturesInExpUseMomentsCreationModule and config._momentsCreationFlowHandle then
				unmountMomentsCreationFlow()
			end
			config._momentsCreationFlowHandle = WrapWithProvidersModule(p2, config2, {
				MomentsCreationFlowScreen = ReactModule.createElement(MomentsCreationFlowScreenModule)
			}, nil, {
				withFoundationProvider = not FFlagCapturesInExpUseMomentsCreationModule
			})
			
			if FFlagCapturesInExpUseMomentsCreationModule then
				config._momentsCreationFlowDestroyingConnection = p2.Destroying:Connect(unmountMomentsCreationFlow)
			end
		end
		
		return config
	end
}