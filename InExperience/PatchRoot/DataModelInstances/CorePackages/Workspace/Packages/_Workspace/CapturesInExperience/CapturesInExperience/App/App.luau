local parent = script.Parent.Parent
local parent_1 = parent.Parent
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
local momentsCreationFlowModule = require(parent_1.MomentsCreationFlow)
local reactModule = require(parent_1.React)
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
		-- upvalues: dashModule (ref), analyticsServiceModule (ref), appStorageService (ref), captureService (ref), localizationService (ref), notificationService (ref), playersService (ref), rbxAnalyticsService (ref), robloxReplicatedStorageService (ref), starterGuiService (ref), setupFireEventModule (ref), constantsModule (ref), getLocalUserIdModule (ref), roduxModule (ref), installReducerModule (ref), momentsCreationFlowModule (ref), networkingModule (ref), screenSizeModule (ref), serverTypeModule (ref), retrieveCapturesModule (ref), fFlagCreateMomentsToastModule (ref), checkMomentsEligibilityModule (ref), makeCaptureSavedHandlerModule (ref), fFlagCapturesVideoCaptureTriggerHandlerEnabledModule (ref), makeVideoCaptureInProgressHandlerModule (ref), getUserIdsFromStringModule (ref), capturesActivatedModule (ref), capturesDeactivatedModule (ref), serverTypeDetectedModule (ref), menuClosedModule (ref), menuOpenedModule (ref), takeCaptureModule (ref), fIntCapturesCoreGuiEventsPerMyriadModule (ref), eventNamesModule (ref), capturesCoreGuiEnabledModule (ref), capturesCoreGuiDisabledModule (ref), signal (ref), SSUIMetaLuaEngineFeature (ref), onViewportSizeChanged (ref), screenSizeChangedModule (ref), onToggleActivationModule (ref), makeWrapWithProvidersModule (ref), capturesPolicyModule (ref), reactModule (ref), captureManagerScreenModule (ref), captureOverlayModule (ref), carouselScreenModule (ref), captureServicePromptsModule (ref), capturesCoreUIModule (ref), capturesPageModule (ref), momentsCreationFlowScreenModule (ref)
		local t = {
			_store = roduxModule.Store.new(roduxModule.combineReducers({
				[constantsModule.RoduxKey] = installReducerModule(),
				[momentsCreationFlowModule.Constants.RoduxKey] = momentsCreationFlowModule.installReducer(),
				NetworkStatus = networkingModule.RoduxNetworking.installReducer(),
				ScreenSize = screenSizeModule,
				ServerType = serverTypeModule,
				ShareLinks = networkingModule.ShareLinksRodux.installReducer()
			}), {}, { roduxModule.thunkMiddleware })
		}
		local var1 = dashModule.join({
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
		local var2 = setupFireEventModule({
			analytics = var1.AnalyticsService,
			infoForAllEvents = {
				isUnder13 = if var1.Players.LocalPlayer then var1.Players.LocalPlayer:GetUnder13() else nil,
				pid = tostring(game.PlaceId),
				source = constantsModule.AnalyticsSource,
				uid = getLocalUserIdModule(var1.Players),
				universeId = tostring(game.GameId)
			}
		})
		t._store:dispatch(retrieveCapturesModule())
		
		if fFlagCreateMomentsToastModule then
			t._store:dispatch(checkMomentsEligibilityModule(game.GameId))
		end
		var1.CaptureService.CaptureSavedInternal:Connect(makeCaptureSavedHandlerModule(t._store, var1, var2))
		
		if fFlagCapturesVideoCaptureTriggerHandlerEnabledModule then
			var1.CaptureService.VideoCaptureInProgress:Connect(makeVideoCaptureInProgressHandlerModule(t._store, var1, var2))
		end
		var1.AppStorageService:WhenLoaded(function()
			-- upvalues: var1 (ref), constantsModule (copy), getUserIdsFromStringModule (copy), getLocalUserIdModule (copy), t (ref), capturesActivatedModule (copy), capturesDeactivatedModule (copy)
			local ok, status = pcall(function()
				-- upvalues: var1 (copy), constantsModule (copy)
				return var1.AppStorageService:GetItem(constantsModule.CapturesActiveLocalStorageKey)
			end)
			
			if ok and status ~= "" then
				if getUserIdsFromStringModule(status)[getLocalUserIdModule(var1.Players) or ""] then
					t._store:dispatch(capturesActivatedModule())
					
					return
				end
				t._store:dispatch(capturesDeactivatedModule())
			end
		end)
		task.spawn(function()
			-- upvalues: var1 (ref), t (ref), serverTypeDetectedModule (copy)
			local ok, status = pcall(function()
				-- upvalues: var1 (copy)
				return var1.RobloxReplicatedStorage:WaitForChild("GetServerType", 1e999):InvokeServer()
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
		
		function t.takeCapture()
			-- upvalues: t (ref), takeCaptureModule (copy)
			t._store:dispatch(takeCaptureModule())
		end
		
		local function maybeSendCoreGuiEvent(p2, p3)
			-- upvalues: fIntCapturesCoreGuiEventsPerMyriadModule (copy), var2 (ref), eventNamesModule (copy)
			if fIntCapturesCoreGuiEventsPerMyriadModule == 0 then return end
			if fIntCapturesCoreGuiEventsPerMyriadModule <= Random.new():NextInteger(1, 10000) then return end
			if p3 then
				var2(eventNamesModule.CapturesCoreGuiEnabled, { allTypeChanged = p2 })
				
				return
			end
			var2(eventNamesModule.CapturesCoreGuiDisabled, { allTypeChanged = p2 })
		end
		
		var1.StarterGui.CoreGuiChangedSignal:Connect(function(p2, p3)
			-- upvalues: maybeSendCoreGuiEvent (ref), t (ref), capturesCoreGuiEnabledModule (copy), capturesCoreGuiDisabledModule (copy)
			if not (if p2 ~= Enum.CoreGuiType.All then p2 == Enum.CoreGuiType.Captures else true) then return end
			maybeSendCoreGuiEvent(p2 == Enum.CoreGuiType.All, p3)
			
			if p3 then
				t._store:dispatch(capturesCoreGuiEnabledModule())
				
				return
			end
			t._store:dispatch(capturesCoreGuiDisabledModule())
		end)
		
		if var1.StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Captures) then
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
			-- upvalues: constantsModule (copy), var1 (ref), getUserIdsFromStringModule (copy), getLocalUserIdModule (copy), dashModule (copy), t (ref)
			local isActive = p2[constantsModule.RoduxKey].IsActive
			
			if isActive ~= p3[constantsModule.RoduxKey].IsActive then
				pcall(function()
					-- upvalues: var1 (copy), constantsModule (copy), getUserIdsFromStringModule (copy), getLocalUserIdModule (copy), isActive (ref), dashModule (copy)
					local var3 = getUserIdsFromStringModule(var1.AppStorageService:GetItem(constantsModule.CapturesActiveLocalStorageKey))
					local players = getLocalUserIdModule(var1.Players) or ""
					
					if isActive then
						var3[players] = true
					else
						var3[players] = nil
					end
					var1.AppStorageService:SetItem(constantsModule.CapturesActiveLocalStorageKey, table.concat(dashModule.keys(var3), ","))
					var1.AppStorageService:Flush()
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
			-- upvalues: t (ref), onToggleActivationModule (copy), var2 (ref), eventNamesModule (copy)
			onToggleActivationModule(t.getIsActive(), nil, var2, function(...)
				-- upvalues: t (copy)
				t._store:dispatch(...)
			end, eventNamesModule.CapturesActivatedChrome, eventNamesModule.CapturesDeactivatedChrome)
		end
		
		local var3 = makeWrapWithProvidersModule(t._store, var1)
		local var4 = capturesPolicyModule.PolicyImplementation.read()
		local var5 = if var4 then capturesPolicyModule.Mapper(var4).eligibleForCapturesFeature() else false
		local var6 = if var4 then capturesPolicyModule.Mapper(var4).enableCapturesBulkManagement() else false
		local t_1 = { fireAnalyticsEvent = var2 }
		
		function t.mountCaptureManager(p2)
			-- upvalues: var6 (ref), var5 (ref), t (ref), var3 (ref), t_1 (ref), reactModule (copy), captureManagerScreenModule (copy)
			if not var6 then return end
			if var5 then
				t._captureManagerHandle = var3(p2, t_1, {
					CaptureManager = reactModule.createElement(captureManagerScreenModule)
				})
				
				return
			end
		end
		
		function t.mountCaptureOverlay(p2)
			-- upvalues: var5 (ref), reactModule (copy), captureOverlayModule (copy), t (ref), var3 (ref), t_1 (ref)
			if var5 then
				t._captureOverlayHandle = var3(p2, t_1, {
					CaptureOverlay = reactModule.createElement(captureOverlayModule)
				})
				
				return
			end
		end
		
		function t.mountCarousel(p2)
			-- upvalues: var5 (ref), reactModule (copy), carouselScreenModule (copy), t (ref), var3 (ref), t_1 (ref)
			if var5 then
				t._carouselHandle = var3(p2, t_1, {
					CarouselScreen = reactModule.createElement(carouselScreenModule)
				})
				
				return
			end
		end
		
		function t.mountCoreUI(p2, p3)
			-- upvalues: var5 (ref), var2 (ref), t (ref), var3 (ref), reactModule (copy), captureServicePromptsModule (copy), capturesCoreUIModule (copy)
			if var5 then
				t._coreUiHandle = var3(p2, { chromeEnabled = p3, fireAnalyticsEvent = var2 }, {
					CaptureServicePrompts = reactModule.createElement(captureServicePromptsModule),
					CapturesCoreUI = reactModule.createElement(capturesCoreUIModule)
				}, "CapturesCoreUI")
				
				return
			end
		end
		
		function t.mountMenuPage(p2, p3, p4)
			-- upvalues: var5 (ref), var2 (ref), t (ref), var3 (ref), reactModule (copy), capturesPageModule (copy)
			if var5 then
				t._menuPageHandle = var3(p2, { chromeEnabled = p4, fireAnalyticsEvent = var2 }, {
					CapturesPage = reactModule.createElement(capturesPageModule, { closeSettingsMenu = p3 })
				})
				
				return
			end
		end
		
		function t.mountMomentsCreationFlow(p2)
			-- upvalues: fFlagCreateMomentsToastModule (copy), var5 (ref), t (ref), var3 (ref), t_1 (ref), reactModule (copy), momentsCreationFlowScreenModule (copy)
			if not fFlagCreateMomentsToastModule then return end
			if var5 then
				t._momentsCreationFlowHandle = var3(p2, t_1, {
					MomentsCreationFlowScreen = reactModule.createElement(momentsCreationFlowScreenModule)
				})
				
				return
			end
		end
		
		return t
	end
}