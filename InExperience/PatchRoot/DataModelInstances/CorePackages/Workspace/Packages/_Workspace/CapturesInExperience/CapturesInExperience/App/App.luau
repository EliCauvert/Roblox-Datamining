local parent = script.Parent.Parent
local parent_1 = parent.Parent
local fFlagCapturesInExpUseMomentsCreationModule = require(parent.Flags.FFlagCapturesInExpUseMomentsCreation)
local appStorageService = game:GetService("AppStorageService")
local captureService = game:GetService("CaptureService")
local localizationService = game:GetService("LocalizationService")
local notificationService = game:GetService("NotificationService")
local playersService = game:GetService("Players")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local starterGuiService = game:GetService("StarterGui")
local appCommonLibModule = require(parent_1.AppCommonLib)
local capturesCommonModule = require(parent_1.CapturesCommon)
local dashModule = require(parent_1.Dash)
local var1 = if not fFlagCapturesInExpUseMomentsCreationModule then require(parent_1.MomentsCreationFlow) else nil
local reactModule = require(parent_1.React)
local roactModule = require(parent_1.Roact)
local roduxModule = require(parent_1.Rodux)
local signal = appCommonLibModule.Signal
local analyticsServiceModule = require(parent.Analytics.AnalyticsService)
local captureManagerScreenModule = require(parent.Components.CaptureManager.CaptureManagerScreen)
local captureOverlayModule = require(parent.Components.CoreUI.CaptureOverlay)
local momentsCreationFlowScreenModule = require(parent.Components.MomentsCreationFlow.MomentsCreationFlowScreen)
local capturesActivatedModule = require(parent.Actions.CapturesActivated)
local capturesCoreGuiDisabledModule = require(parent.Actions.CapturesCoreGuiDisabled)
local capturesCoreGuiEnabledModule = require(parent.Actions.CapturesCoreGuiEnabled)
local capturesCoreUIModule = require(parent.Components.CoreUI.CapturesCoreUI)
local capturesDeactivatedModule = require(parent.Actions.CapturesDeactivated)
local captureServicePromptsModule = require(parent.Components.CaptureService.CaptureServicePrompts)
local capturesPageModule = require(parent.Components.CoreUI.CapturesPage)
local capturesPolicyModule = require(parent.App.CapturesPolicy)
local carouselScreenModule = require(parent.Components.CapturesCarousel.CarouselScreen)
local constantsModule = require(parent.Constants)
local eventNamesModule = require(parent.Analytics.EventNames)
local getLocalUserIdModule = require(parent.Utils.getLocalUserId)
local getUserIdsFromStringModule = require(parent.Utils.getUserIdsFromString)
local installReducerModule = require(parent.installReducer)
local makeCaptureSavedHandlerModule = require(parent.Utils.makeCaptureSavedHandler)
local makeVideoCaptureInProgressHandlerModule = require(parent.Utils.makeVideoCaptureInProgressHandler)
local makeWrapWithProvidersModule = require(parent.Utils.makeWrapWithProviders)
local menuClosedModule = require(parent.Actions.MenuClosed)
local menuOpenedModule = require(parent.Actions.MenuOpened)
local momentsCreationFlowClosedModule = require(parent.Actions.MomentsCreationFlowClosed)
local networkingModule = require(parent.App.Networking)
local onToggleActivationModule = require(parent.Utils.onToggleActivation)
local onViewportSizeChanged = capturesCommonModule.Utils.onViewportSizeChanged
local checkMomentsEligibilityModule = require(parent.Thunks.CheckMomentsEligibility)
local retrieveCapturesModule = require(parent.Thunks.RetrieveCaptures)
local screenSizeModule = require(parent.installReducer.ScreenSize)
local screenSizeChangedModule = require(parent.Actions.ScreenSizeChanged)
local serverTypeModule = require(parent.installReducer.ServerType)
local serverTypeDetectedModule = require(parent.Actions.ServerTypeDetected)
local setupFireEventModule = require(parent.Analytics.setupFireEvent)
local takeCaptureModule = require(parent.Thunks.TakeCapture)
local _ = require(parent.Types)
local fFlagCapturesVideoCaptureTriggerHandlerEnabledModule = require(parent.Flags.FFlagCapturesVideoCaptureTriggerHandlerEnabled)
local fFlagCreateMomentsToastModule = require(parent.Flags.FFlagCreateMomentsToast)
local fIntCapturesCoreGuiEventsPerMyriadModule = require(parent.Flags.FIntCapturesCoreGuiEventsPerMyriad)
local SSUIMetaLuaEngineFeature = game:GetEngineFeature("SSUIMetaLua")

return {
	createApp = function(p1)
		-- upvalues: dashModule (ref), analyticsServiceModule (ref), appStorageService (ref), captureService (ref), localizationService (ref), notificationService (ref), playersService (ref), rbxAnalyticsService (ref), robloxReplicatedStorageService (ref), starterGuiService (ref), setupFireEventModule (ref), constantsModule (ref), getLocalUserIdModule (ref), installReducerModule (ref), networkingModule (ref), screenSizeModule (ref), serverTypeModule (ref), var1 (ref), roduxModule (ref), retrieveCapturesModule (ref), fFlagCreateMomentsToastModule (ref), checkMomentsEligibilityModule (ref), makeCaptureSavedHandlerModule (ref), fFlagCapturesVideoCaptureTriggerHandlerEnabledModule (ref), makeVideoCaptureInProgressHandlerModule (ref), getUserIdsFromStringModule (ref), capturesActivatedModule (ref), capturesDeactivatedModule (ref), serverTypeDetectedModule (ref), menuClosedModule (ref), menuOpenedModule (ref), takeCaptureModule (ref), fIntCapturesCoreGuiEventsPerMyriadModule (ref), eventNamesModule (ref), capturesCoreGuiEnabledModule (ref), capturesCoreGuiDisabledModule (ref), signal (ref), SSUIMetaLuaEngineFeature (ref), onViewportSizeChanged (ref), screenSizeChangedModule (ref), onToggleActivationModule (ref), makeWrapWithProvidersModule (ref), capturesPolicyModule (ref), roactModule (ref), fFlagCapturesInExpUseMomentsCreationModule (ref), parent_1 (ref), momentsCreationFlowClosedModule (ref), reactModule (ref), captureManagerScreenModule (ref), captureOverlayModule (ref), carouselScreenModule (ref), captureServicePromptsModule (ref), capturesCoreUIModule (ref), capturesPageModule (ref), momentsCreationFlowScreenModule (ref)
		local t = {
			_momentsCreationFlowDestroyingConnection = nil,
			_momentsCreationFlowHandle = nil
		}
		local var2 = dashModule.join({
			AnalyticsService = analyticsServiceModule,
			AppStorageService = appStorageService,
			CaptureService = captureService,
			LocalizationService = localizationService,
			NotificationService = notificationService,
			Players = playersService,
			RbxAnalyticsService = rbxAnalyticsService,
			RobloxReplicatedStorage = robloxReplicatedStorageService,
			StarterGui = starterGuiService
		}, p1)
		local var3 = setupFireEventModule({
			analytics = var2.AnalyticsService,
			infoForAllEvents = {
				isUnder13 = if var2.Players.LocalPlayer then var2.Players.LocalPlayer:GetUnder13() else nil,
				pid = tostring(game.PlaceId),
				source = constantsModule.AnalyticsSource,
				uid = getLocalUserIdModule(var2.Players),
				universeId = tostring(game.GameId)
			}
		})
		local t_1 = {
			[constantsModule.RoduxKey] = installReducerModule(),
			NetworkStatus = networkingModule.RoduxNetworking.installReducer(),
			ScreenSize = screenSizeModule,
			ServerType = serverTypeModule,
			ShareLinks = networkingModule.ShareLinksRodux.installReducer()
		}
		
		if var1 then
			t_1[var1.Constants.RoduxKey] = var1.installReducer()
		end
		t._store = roduxModule.Store.new(roduxModule.combineReducers(t_1), {}, { roduxModule.thunkMiddleware })
		t._store:dispatch(retrieveCapturesModule())
		
		if fFlagCreateMomentsToastModule then
			t._store:dispatch(checkMomentsEligibilityModule(game.GameId))
		end
		var2.CaptureService.CaptureSavedInternal:Connect(makeCaptureSavedHandlerModule(t._store, var2, var3))
		
		if fFlagCapturesVideoCaptureTriggerHandlerEnabledModule then
			var2.CaptureService.VideoCaptureInProgress:Connect(makeVideoCaptureInProgressHandlerModule(t._store, var2, var3))
		end
		var2.AppStorageService:WhenLoaded(function()
			-- upvalues: var2 (ref), constantsModule (copy), getUserIdsFromStringModule (copy), getLocalUserIdModule (copy), t (ref), capturesActivatedModule (copy), capturesDeactivatedModule (copy)
			local ok, status = pcall(function()
				-- upvalues: var2 (copy), constantsModule (copy)
				return var2.AppStorageService:GetItem(constantsModule.CapturesActiveLocalStorageKey)
			end)
			
			if ok and status ~= "" then
				if getUserIdsFromStringModule(status)[getLocalUserIdModule(var2.Players) or ""] then
					t._store:dispatch(capturesActivatedModule())
					
					return
				end
				t._store:dispatch(capturesDeactivatedModule())
			end
		end)
		task.spawn(function()
			-- upvalues: var2 (ref), t (ref), serverTypeDetectedModule (copy)
			local ok, status = pcall(function()
				-- upvalues: var2 (copy)
				return var2.RobloxReplicatedStorage:WaitForChild("GetServerType", 1e999):InvokeServer()
			end)
			
			if ok then
				t._store:dispatch(serverTypeDetectedModule(status))
			end
		end)
		
		function t.closeMenu()
			-- upvalues: t (ref), menuClosedModule (copy)
			t._store:dispatch(menuClosedModule())
		end
		
		function t.openMenu()
			-- upvalues: t (ref), menuOpenedModule (copy)
			t._store:dispatch(menuOpenedModule())
		end
		
		function t.takeCapture(p2)
			-- upvalues: t (ref), takeCaptureModule (copy)
			t._store:dispatch(takeCaptureModule(p2))
		end
		
		local function maybeSendCoreGuiEvent(p2, p3)
			-- upvalues: fIntCapturesCoreGuiEventsPerMyriadModule (copy), var3 (ref), eventNamesModule (copy)
			if fIntCapturesCoreGuiEventsPerMyriadModule == 0 then return end
			if fIntCapturesCoreGuiEventsPerMyriadModule <= Random.new():NextInteger(1, 10000) then return end
			if p3 then
				var3(eventNamesModule.CapturesCoreGuiEnabled, { allTypeChanged = p2 })
				
				return
			end
			var3(eventNamesModule.CapturesCoreGuiDisabled, { allTypeChanged = p2 })
		end
		
		var2.StarterGui.CoreGuiChangedSignal:Connect(function(p2, p3)
			-- upvalues: maybeSendCoreGuiEvent (ref), t (ref), capturesCoreGuiEnabledModule (copy), capturesCoreGuiDisabledModule (copy)
			if not (if p2 ~= Enum.CoreGuiType.All then p2 == Enum.CoreGuiType.Captures else true) then return end
			maybeSendCoreGuiEvent(p2 == Enum.CoreGuiType.All, p3)
			
			if p3 then
				t._store:dispatch(capturesCoreGuiEnabledModule())
				
				return
			end
			t._store:dispatch(capturesCoreGuiDisabledModule())
		end)
		
		if var2.StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Captures) then
			t._store:dispatch(capturesCoreGuiEnabledModule())
		else
			t._store:dispatch(capturesCoreGuiDisabledModule())
		end
		t.onIsActiveChanged = signal.new()
		
		function t.getIsActive()
			-- upvalues: t (ref), constantsModule (copy)
			return t._store:getState()[constantsModule.RoduxKey].IsActive or false
		end
		
		t._store.changed:connect(function(p2, p3)
			-- upvalues: constantsModule (copy), var2 (ref), getUserIdsFromStringModule (copy), getLocalUserIdModule (copy), dashModule (copy), t (ref)
			local isActive = p2[constantsModule.RoduxKey].IsActive
			
			if isActive ~= p3[constantsModule.RoduxKey].IsActive then
				pcall(function()
					-- upvalues: var2 (copy), constantsModule (copy), getUserIdsFromStringModule (copy), getLocalUserIdModule (copy), isActive (ref), dashModule (copy)
					local var4 = getUserIdsFromStringModule(var2.AppStorageService:GetItem(constantsModule.CapturesActiveLocalStorageKey))
					local players = getLocalUserIdModule(var2.Players) or ""
					
					if isActive then
						var4[players] = true
					else
						var4[players] = nil
					end
					var2.AppStorageService:SetItem(constantsModule.CapturesActiveLocalStorageKey, table.concat(dashModule.keys(var4), ","))
					var2.AppStorageService:Flush()
				end)
				t.onIsActiveChanged:fire(isActive)
			end
		end)
		
		if SSUIMetaLuaEngineFeature then
			pcall(function()
				-- upvalues: t (ref), constantsModule (copy)
				local safetyService = game:GetService("SafetyService")
				t._store.changed:connect(function(p2, p3)
					-- upvalues: constantsModule (copy), safetyService (ref)
					local roduxKey = p2[constantsModule.RoduxKey]
					local roduxKey_1 = p3[constantsModule.RoduxKey]
					local isMenuOpen = roduxKey_1.IsMenuOpen or roduxKey_1.Carousel and roduxKey_1.Carousel.IsOpen
					local isMenuOpen_1 = roduxKey.IsMenuOpen or roduxKey.Carousel and roduxKey.Carousel.IsOpen
					
					if isMenuOpen_1 and not isMenuOpen then
						pcall(function()
							-- upvalues: safetyService (copy)
							safetyService:ReportCapturesUIOpen()
						end)
						
						return
					elseif not isMenuOpen_1 and isMenuOpen then
						pcall(function()
							-- upvalues: safetyService (copy)
							safetyService:ReportCapturesUIClose()
						end)
					end
				end)
			end)
		end
		onViewportSizeChanged(function(p2)
			-- upvalues: t (ref), screenSizeChangedModule (copy)
			t._store:dispatch(screenSizeChangedModule(p2))
		end)
		
		function t.onToggleActivationFromChrome(...)
			-- upvalues: t (ref), onToggleActivationModule (copy), var3 (ref), eventNamesModule (copy)
			onToggleActivationModule(t.getIsActive(), nil, var3, function(...)
				-- upvalues: t (copy)
				t._store:dispatch(...)
			end, eventNamesModule.CapturesActivatedChrome, eventNamesModule.CapturesDeactivatedChrome)
		end
		
		local var4 = makeWrapWithProvidersModule(t._store, var2)
		local var5 = capturesPolicyModule.PolicyImplementation.read()
		local var6 = if var5 then capturesPolicyModule.Mapper(var5).eligibleForCapturesFeature() else false
		local var7 = if var5 then capturesPolicyModule.Mapper(var5).enableCapturesBulkManagement() else false
		local t_2 = { fireAnalyticsEvent = var3 }
		
		local function unmountMomentsCreationFlow()
			-- upvalues: t (ref), roactModule (copy), fFlagCapturesInExpUseMomentsCreationModule (copy), constantsModule (copy), parent_1 (copy), momentsCreationFlowClosedModule (copy)
			local momentsCreationFlowDestroyingConnection = t._momentsCreationFlowDestroyingConnection
			t._momentsCreationFlowDestroyingConnection = nil
			
			if momentsCreationFlowDestroyingConnection then
				momentsCreationFlowDestroyingConnection:Disconnect()
			end
			local momentsCreationFlowHandle = t._momentsCreationFlowHandle
			t._momentsCreationFlowHandle = nil
			
			if momentsCreationFlowHandle then
				roactModule.unmount(momentsCreationFlowHandle)
			end
			if fFlagCapturesInExpUseMomentsCreationModule and t._store:getState()[constantsModule.RoduxKey].MomentsCreationFlow.IsOpen then
				local momentsCreationModule = require(parent_1.MomentsCreation)
				momentsCreationModule.resetCreationFlow(momentsCreationModule.Enums.CreationFlowState.Preview)
				t._store:dispatch(momentsCreationFlowClosedModule())
			end
		end
		
		function t.mountCaptureManager(p2)
			-- upvalues: var7 (ref), var6 (ref), t (ref), var4 (ref), t_2 (ref), reactModule (copy), captureManagerScreenModule (copy)
			if not var7 then return end
			if var6 then
				t._captureManagerHandle = var4(p2, t_2, {
					CaptureManager = reactModule.createElement(captureManagerScreenModule)
				})
				
				return
			end
		end
		
		function t.mountCaptureOverlay(p2)
			-- upvalues: var6 (ref), reactModule (copy), captureOverlayModule (copy), t (ref), var4 (ref), t_2 (ref)
			if var6 then
				t._captureOverlayHandle = var4(p2, t_2, {
					CaptureOverlay = reactModule.createElement(captureOverlayModule)
				})
				
				return
			end
		end
		
		function t.mountCarousel(p2)
			-- upvalues: var6 (ref), reactModule (copy), carouselScreenModule (copy), t (ref), var4 (ref), t_2 (ref)
			if var6 then
				t._carouselHandle = var4(p2, t_2, {
					CarouselScreen = reactModule.createElement(carouselScreenModule)
				})
				
				return
			end
		end
		
		function t.mountCoreUI(p2, p3)
			-- upvalues: var6 (ref), var3 (ref), t (ref), var4 (ref), reactModule (copy), captureServicePromptsModule (copy), capturesCoreUIModule (copy)
			if var6 then
				t._coreUiHandle = var4(p2, { chromeEnabled = p3, fireAnalyticsEvent = var3 }, {
					CaptureServicePrompts = reactModule.createElement(captureServicePromptsModule),
					CapturesCoreUI = reactModule.createElement(capturesCoreUIModule)
				}, "CapturesCoreUI")
				
				return
			end
		end
		
		function t.mountMenuPage(p2, p3, p4)
			-- upvalues: var6 (ref), var3 (ref), t (ref), var4 (ref), reactModule (copy), capturesPageModule (copy)
			if var6 then
				t._menuPageHandle = var4(p2, { chromeEnabled = p4, fireAnalyticsEvent = var3 }, {
					CapturesPage = reactModule.createElement(capturesPageModule, { closeSettingsMenu = p3 })
				})
				
				return
			end
		end
		
		function t.mountMomentsCreationFlow(p2)
			-- upvalues: fFlagCreateMomentsToastModule (copy), var6 (ref), fFlagCapturesInExpUseMomentsCreationModule (copy), t (ref), unmountMomentsCreationFlow (ref), var4 (ref), t_2 (ref), reactModule (copy), momentsCreationFlowScreenModule (copy)
			if not fFlagCreateMomentsToastModule then return end
			if not var6 then return end
			if fFlagCapturesInExpUseMomentsCreationModule and t._momentsCreationFlowHandle then
				unmountMomentsCreationFlow()
			end
			t._momentsCreationFlowHandle = var4(p2, t_2, {
				MomentsCreationFlowScreen = reactModule.createElement(momentsCreationFlowScreenModule)
			}, nil, {
				withFoundationProvider = not fFlagCapturesInExpUseMomentsCreationModule
			})
			
			if fFlagCapturesInExpUseMomentsCreationModule then
				t._momentsCreationFlowDestroyingConnection = p2.Destroying:Connect(unmountMomentsCreationFlow)
			end
		end
		
		return t
	end
}