local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local VideoService = game:GetService("VideoService")
local Parent = script:FindFirstAncestor("VideoServerScreen").Parent
local EnableAudioPlaybackInAppFunction = require(Parent.MediaPlayback).enableAudioPlaybackInApp
local NotificationType = require(Parent.RobloxAppEnums).NotificationType
local CryoModule = require(Parent.Cryo)
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local ExperienceService = require(Parent.ExperienceService).ExperienceService
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AndroidTVExitButtonManager = require(Parent.RobloxAppNavigationCore).AndroidTVExitButtonManager
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local VideoPlaybackCoordinator = require(Parent.VideoUtils).VideoPlaybackCoordinator
local FFlagLuaAppVideoPlaybackRefCount = require(Parent.SharedFlags).FFlagLuaAppVideoPlaybackRefCount
local FFlagInternalOnlyStratusBugReportEnabled = require(Parent.SharedFlags).FFlagInternalOnlyStratusBugReportEnabled
local FFlagLuaAppStratusBugReportAfterConnect = require(Parent.SharedFlags).FFlagLuaAppStratusBugReportAfterConnect
local EnableGameStreamingResolutionReadySignalEngineFeature = game:GetEngineFeature("EnableGameStreamingResolutionReadySignal")
local FFlagLuaAppStratusDisable3dRendering = require(Parent.SharedFlags).FFlagLuaAppStratusDisable3dRendering
local FFlagLuaAppStratusLoadingSpinner = require(Parent.SharedFlags).FFlagLuaAppStratusLoadingSpinner
local FFlagAndroidTVExitWithB = require(Parent.SharedFlags).FFlagAndroidTVExitWithB
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local StratusBugReportPanelModule = require(script.Parent.StratusBugReportPanel)

local function _(Hidden)
	-- upvalues: GuiService (copy), HttpService (copy), NotificationType (copy)
	GuiService:BroadcastNotification(HttpService:JSONEncode({ hidden = Hidden }), NotificationType.SET_STATUS_BAR_STYLE)
end

local _ = function(InGameStreaming)
	-- upvalues: GuiService (copy), HttpService (copy), NotificationType (copy)
	GuiService:BroadcastNotification(HttpService:JSONEncode({ inGameStreaming = InGameStreaming }), NotificationType.GAME_STREAMING_STATUS_CHANGED)
end

return function()
	-- upvalues: UseNavigationFunction (copy), UseDispatchFunction (copy), ReactModule (copy), FFlagLuaAppStratusBugReportAfterConnect (copy), FFlagLuaAppVideoPlaybackRefCount (copy), VideoPlaybackCoordinator (copy), UseAppPolicyFunction (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), FFlagAndroidTVExitWithB (copy), GuiService (copy), AndroidTVExitButtonManager (copy), EnableGameStreamingResolutionReadySignalEngineFeature (copy), CryoModule (copy), FFlagLuaAppStratusLoadingSpinner (copy), ExperienceService (copy), HttpService (copy), NotificationType (copy), FFlagLuaAppStratusDisable3dRendering (copy), RunService (copy), EnableAudioPlaybackInAppFunction (copy), VideoService (copy), RoactModule (copy), FFlagInternalOnlyStratusBugReportEnabled (copy), StratusBugReportPanelModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local PlaceIdParam = UseNavigationResult.getParam("placeId")
	local LaunchSourceParam = UseNavigationResult.getParam("launchSource")
	local ExtraParamsParam = UseNavigationResult.getParam("extraParams")
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local v1 = false
	
	local function v32(_) end
	
	if FFlagLuaAppStratusBugReportAfterConnect then
		v1, v32 = ReactModule.useState(false)
	end
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseMemoResult = if FFlagLuaAppVideoPlaybackRefCount then ReactModule.useMemo(function()
		-- upvalues: VideoPlaybackCoordinator (upval)
		return VideoPlaybackCoordinator.new()
	end, {}) else VideoPlaybackCoordinator.default
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseRefResult6 = ReactModule.useRef(nil)
	local UseRefResult7 = ReactModule.useRef(nil)
	local UseRefResult8 = ReactModule.useRef(nil)
	local UseRefResult9 = ReactModule.useRef(0)
	local UseRefResult10 = ReactModule.useRef(nil)
	local UseRefResult11 = ReactModule.useRef(nil)
	local UseRefResult12 = ReactModule.useRef(nil)
	local UseRefResult13 = ReactModule.useRef(nil)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.getThrottleFramerate()
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval)
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.back(true)
			
			return
		else
			UseDispatchResult(NavigateBackFunction(true))
		end
	end, { UseDispatchResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult4 (copy), UseRefResult5 (copy)
		if UseRefResult4.current then
			UseRefResult4.current:Destroy()
			UseRefResult4.current = nil
		end
		if UseRefResult5.current then
			UseRefResult5.current:Destroy()
			UseRefResult5.current = nil
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseResult1 (copy), UseRefResult4 (copy), UseRefResult5 (copy)
		local Current = UseRefResult.current
		local Current1 = UseRefResult1.current
		local Current2 = UseRefResult2.current
		local Current3 = UseRefResult3.current
		
		if Current and Current1 and Current2 and Current3 then
			UseResult1()
			local Wire = Instance.new("Wire")
			Wire.SourceInstance = Current1
			Wire.TargetInstance = Current2
			Wire.SourceName = "Output"
			Wire.TargetName = "Input"
			Wire.Parent = Current
			UseRefResult4.current = Wire
			local Wire1 = Instance.new("Wire")
			Wire1.SourceInstance = Current1
			Wire1.TargetInstance = Current3
			Wire1.SourceName = "Output"
			Wire1.TargetName = "Input"
			Wire1.Parent = Current
			UseRefResult5.current = Wire1
			
			return
		end
	end, { UseResult1 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult6 (copy), UseRefResult7 (copy)
		if UseRefResult6.current then
			UseRefResult6.current:Disconnect()
			UseRefResult6.current = nil
		end
		UseRefResult7.current = nil
	end, {})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseResult3 (copy), UseRefResult1 (copy), UseRefResult7 (copy), UseRefResult6 (copy), UseResult (copy)
		UseResult3()
		local Current = UseRefResult1.current
		
		if Current then
			UseRefResult7.current = Current.IsConnected
			UseRefResult6.current = Current:GetPropertyChangedSignal("IsConnected"):Connect(function()
				-- upvalues: Current (copy), UseRefResult7 (upval), UseResult (upval)
				local IsConnected = Current.IsConnected
				
				if UseRefResult7.current == true and IsConnected == false then
					UseResult()
				end
				UseRefResult7.current = IsConnected
			end)
			
			return
		end
	end, { UseResult3, UseResult })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult11 (copy), FFlagAndroidTVExitWithB (upval), UseRefResult12 (copy)
		if UseRefResult11.current then
			UseRefResult11.current:Disconnect()
			UseRefResult11.current = nil
		end
		if FFlagAndroidTVExitWithB and UseRefResult12.current then
			UseRefResult12.current()
			UseRefResult12.current = nil
		end
	end, {})
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseResult5 (copy), UseRefResult11 (copy), GuiService (upval), UseResult (copy), FFlagAndroidTVExitWithB (upval), UseRefResult12 (copy), AndroidTVExitButtonManager (upval)
		UseResult5()
		UseRefResult11.current = GuiService.ShowLeaveConfirmation:Connect(function()
			-- upvalues: UseResult (upval)
			UseResult()
		end)
		
		if FFlagAndroidTVExitWithB then
			UseRefResult12.current = AndroidTVExitButtonManager.register(UseResult)
		end
	end, { UseResult5, UseResult })
	local UseResult7 = if EnableGameStreamingResolutionReadySignalEngineFeature then ReactModule.useCallback(function()
		-- upvalues: UseRefResult13 (copy)
		if UseRefResult13.current then
			UseRefResult13.current:Disconnect()
			UseRefResult13.current = nil
		end
	end, {}) else function() end
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult10 (copy)
		if UseRefResult10.current then
			task.cancel(UseRefResult10.current)
			UseRefResult10.current = nil
		end
	end, {})
	local UseResult9 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult8 (copy), UseRefResult1 (copy)
		if UseRefResult8.current then
			if UseRefResult1.current then
				UseRefResult1.current:Disconnect()
			end
			task.cancel(UseRefResult8.current)
			UseRefResult8.current = nil
		end
	end, {})
	local UseResult10 = ReactModule.useCallback(function(): boolean
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy), UseResult2 (copy), PlaceIdParam (copy), ExtraParamsParam (copy), CryoModule (upval), UseResult9 (copy), UseRefResult9 (copy), FFlagLuaAppStratusLoadingSpinner (upval), UseStateResult2 (copy), UseRefResult8 (copy), LaunchSourceParam (copy), ExperienceService (upval), EnableGameStreamingResolutionReadySignalEngineFeature (upval), GuiService (upval), HttpService (upval), NotificationType (upval), UseResult (copy), FFlagLuaAppStratusBugReportAfterConnect (upval), v32 (ref), UseResult4 (copy)
		if not UseRefResult1.current or not UseRefResult2.current then
			return false
		end
		UseResult2()
		local Current = UseRefResult2.current
		local JoinResult = {
			placeId = PlaceIdParam,
			width = Current.AbsoluteSize.X,
			height = Current.AbsoluteSize.Y
		}
		
		if ExtraParamsParam then
			JoinResult = CryoModule.Dictionary.join(JoinResult, ExtraParamsParam)
		end
		UseResult9()
		UseRefResult9.current += 1
		local Current1 = UseRefResult9.current
		
		if FFlagLuaAppStratusLoadingSpinner then
			UseStateResult2(true)
		end
		UseRefResult8.current = task.spawn(function()
			-- upvalues: UseRefResult1 (upval), JoinResult (ref), UseRefResult9 (upval), Current1 (copy), UseRefResult8 (upval), PlaceIdParam (upval), LaunchSourceParam (upval), ExtraParamsParam (upval), CryoModule (upval), ExperienceService (upval), EnableGameStreamingResolutionReadySignalEngineFeature (upval), GuiService (upval), HttpService (upval), NotificationType (upval), UseResult (upval), FFlagLuaAppStratusLoadingSpinner (upval), UseStateResult2 (upval), FFlagLuaAppStratusBugReportAfterConnect (upval), v32 (upval), UseResult4 (upval)
			local ConnectAsyncResult = UseRefResult1.current:ConnectAsync("", JoinResult)
			
			if UseRefResult9.current ~= Current1 then return end
			UseRefResult8.current = nil
			
			if ConnectAsyncResult then
				if FFlagLuaAppStratusLoadingSpinner then
					UseStateResult2(false)
				end
				if FFlagLuaAppStratusBugReportAfterConnect then
					v32(true)
				end
				UseResult4()
				
				return
			else
				local function launchFallback()
					-- upvalues: PlaceIdParam (upval), LaunchSourceParam (upval), ExtraParamsParam (upval), CryoModule (upval), ExperienceService (upval), EnableGameStreamingResolutionReadySignalEngineFeature (upval), GuiService (upval), HttpService (upval), NotificationType (upval), UseResult (upval)
					local JoinResult = {
						placeId = tonumber(PlaceIdParam),
						referralPage = LaunchSourceParam
					}
					
					if ExtraParamsParam then
						JoinResult = CryoModule.Dictionary.join(JoinResult, ExtraParamsParam)
					end
					ExperienceService:LaunchExperience(JoinResult, LaunchSourceParam)
					
					if EnableGameStreamingResolutionReadySignalEngineFeature then
						GuiService:BroadcastNotification(HttpService:JSONEncode({ inGameStreaming = false }), NotificationType.GAME_STREAMING_STATUS_CHANGED)
					end
					UseResult()
				end
				
				if FFlagLuaAppStratusLoadingSpinner then
					UseStateResult2(false)
					task.defer(launchFallback)
					
					return
				else
					launchFallback()
				end
			end
		end)
		
		return true
	end, {
		UseResult2, UseResult9, UseResult, UseResult4, PlaceIdParam, LaunchSourceParam,
		ExtraParamsParam
	})
	local UseResult11 = ReactModule.useCallback(function()
		-- upvalues: EnableGameStreamingResolutionReadySignalEngineFeature (upval), UseResult7 (copy), UseResult5 (copy), UseResult8 (copy), UseResult9 (copy), UseRefResult1 (copy), GuiService (upval), HttpService (upval), NotificationType (upval), FFlagLuaAppStratusDisable3dRendering (upval), RunService (upval), UseResult3 (copy), UseResult1 (copy), FFlagLuaAppVideoPlaybackRefCount (upval), UseMemoResult (copy), UseAppPolicyResult (copy)
		if EnableGameStreamingResolutionReadySignalEngineFeature then
			UseResult7()
		end
		UseResult5()
		UseResult8()
		UseResult9()
		
		if UseRefResult1.current then
			UseRefResult1.current:Disconnect()
		end
		GuiService:BroadcastNotification(HttpService:JSONEncode({ hidden = false }), NotificationType.SET_STATUS_BAR_STYLE)
		
		if FFlagLuaAppStratusDisable3dRendering then
			RunService:Set3dRenderingEnabled(true)
		end
		if EnableGameStreamingResolutionReadySignalEngineFeature then
			GuiService:BroadcastNotification(HttpService:JSONEncode({ inGameStreaming = false }), NotificationType.GAME_STREAMING_STATUS_CHANGED)
		end
		UseResult3()
		UseResult1()
		
		if FFlagLuaAppVideoPlaybackRefCount then
			UseMemoResult:cancelPlayback("VideoServerStream", "VideoServerStream finished")
			
			return
		end
		if UseAppPolicyResult then
			RunService:setThrottleFramerateEnabled(true)
		end
	end, {
		if EnableGameStreamingResolutionReadySignalEngineFeature then UseResult7 else nil,
		UseResult5, UseResult8, UseResult9, UseResult3, UseResult1, UseAppPolicyResult,
		if FFlagLuaAppVideoPlaybackRefCount then UseMemoResult else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), RunService (upval), UseBindingResult2 (copy)
		if not UseStateResult then return end
		local v2 = 0
		local HeartbeatConnection = RunService.Heartbeat:Connect(function(DeltaTime: number)
			-- upvalues: v2 (ref), UseBindingResult2 (upval)
			v2 = (v2 + DeltaTime * 180) % 360
			UseBindingResult2(v2)
		end)
		
		return function()
			-- upvalues: HeartbeatConnection (copy)
			HeartbeatConnection:Disconnect()
		end
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: EnableAudioPlaybackInAppFunction (upval), FFlagLuaAppVideoPlaybackRefCount (upval), UseMemoResult (copy), UseAppPolicyResult (copy), RunService (upval), GuiService (upval), HttpService (upval), NotificationType (upval), FFlagLuaAppStratusDisable3dRendering (upval), UseResult6 (copy), EnableGameStreamingResolutionReadySignalEngineFeature (upval), UseResult10 (copy), UseResult8 (copy), UseRefResult10 (copy), UseResult7 (copy), UseRefResult13 (copy), VideoService (upval), UseResult11 (copy)
		EnableAudioPlaybackInAppFunction()
		
		if FFlagLuaAppVideoPlaybackRefCount then
			UseMemoResult:forcePlayback("VideoServerStream", "VideoServerStream started")
		elseif UseAppPolicyResult then
			RunService:setThrottleFramerateEnabled(false)
		end
		GuiService:BroadcastNotification(HttpService:JSONEncode({ hidden = true }), NotificationType.SET_STATUS_BAR_STYLE)
		
		if FFlagLuaAppStratusDisable3dRendering then
			RunService:Set3dRenderingEnabled(false)
		end
		UseResult6()
		
		if EnableGameStreamingResolutionReadySignalEngineFeature then
			local function _()
				-- upvalues: UseResult10 (upval), UseResult8 (upval), UseRefResult10 (upval)
				if not UseResult10() then
					UseResult8()
					UseRefResult10.current = task.defer(function()
						-- upvalues: UseRefResult10 (upval), UseResult10 (upval)
						UseRefResult10.current = nil
						UseResult10()
					end)
				end
			end
			
			UseResult7()
			UseRefResult13.current = VideoService.GameStreamingResolutionReady:Connect(function()
				-- upvalues: UseResult7 (upval), UseResult10 (upval), UseResult8 (upval), UseRefResult10 (upval)
				UseResult7()
				
				if not UseResult10() then
					UseResult8()
					UseRefResult10.current = task.defer(function()
						-- upvalues: UseRefResult10 (upval), UseResult10 (upval)
						UseRefResult10.current = nil
						UseResult10()
					end)
				end
			end)
			GuiService:BroadcastNotification(HttpService:JSONEncode({ inGameStreaming = true }), NotificationType.GAME_STREAMING_STATUS_CHANGED)
		elseif not UseResult10() then
			UseResult8()
			UseRefResult10.current = task.defer(function()
				-- upvalues: UseRefResult10 (upval), UseResult10 (upval)
				UseRefResult10.current = nil
				UseResult10()
			end)
		end
		return UseResult11
	end, {
		UseResult6, UseResult10,
		if EnableGameStreamingResolutionReadySignalEngineFeature then UseResult7 else nil,
		UseResult8, UseResult11, UseAppPolicyResult,
		if FFlagLuaAppVideoPlaybackRefCount then UseMemoResult else nil
	})
	
	return RoactModule.createElement("ScreenGui", {
		DisplayOrder = 200,
		IgnoreGuiInset = true,
		ResetOnSpawn = false,
		ScreenInsets = Enum.ScreenInsets.None,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		VideoServerScreenView = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.new(0, 0, 0),
			ref = UseRefResult
		}, {
			RealtimeMedia = RoactModule.createElement("RealtimeMedia", { ForwardInput = true, ref = UseRefResult1 }),
			VideoDisplay = RoactModule.createElement("VideoDisplay", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				ref = UseRefResult2
			}),
			AudioDeviceOutput = RoactModule.createElement("AudioDeviceOutput", { ref = UseRefResult3 }),
			InputBlocker = RoactModule.createElement("ImageButton", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 3,
				AutoButtonColor = false,
				Modal = true,
				Size = UDim2.fromScale(1, 1)
			}),
			LoadingSpinner = FFlagLuaAppStratusLoadingSpinner and UseStateResult and RoactModule.createElement("ImageLabel", {
				Image = "rbxasset://textures/ui/LoadingScreen/LoadingSpinner.png",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 4,
				Size = UDim2.fromOffset(48, 48),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Rotation = UseBindingResult
			}) or nil,
			BugReport = (if FFlagLuaAppStratusBugReportAfterConnect then v1 else FFlagInternalOnlyStratusBugReportEnabled) and RoactModule.createElement(StratusBugReportPanelModule) or nil
		})
	})
end