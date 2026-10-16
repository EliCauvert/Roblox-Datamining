local UserInputService = game:GetService("UserInputService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local ConstantsModule = require(script.Parent.Parent.Resources.Constants)
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local InputTypeMap = ConstantsModule.InputTypeMap

return function(EventContext, EventName, AdditionalArgs, Enabled, RbxAnalyticsService1) --[[ Line: 11 ]]
	-- upvalues: RbxAnalyticsService (copy), UserInputService (copy), ConstantsModule (copy), InputTypeMap (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy)
	if RbxAnalyticsService1 == nil then
		RbxAnalyticsService1 = RbxAnalyticsService
	end
	local function reportSettingsForAnalytics() --[[ Line: 17 ]]
		-- upvalues: UserInputService (upval)
		local GameSettings = UserSettings().GameSettings
		local t = {}
		
		if UserInputService.TouchEnabled then
			t.camera_mode_touch = tostring(GameSettings.TouchCameraMovementMode)
		else
			t.camera_mode_desktop = tostring(GameSettings.ComputerCameraMovementMode)
		end
		if UserInputService.TouchEnabled then
			t.movement_mode_touch = tostring(GameSettings.TouchMovementMode)
		else
			t.movement_mode_desktop = tostring(GameSettings.ComputerMovementMode)
		end
		if UserInputService.MouseEnabled then
			t.shift_lock_enabled = tostring(GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch)
		end
		if UserInputService.GamepadEnabled and GameSettings.IsUsingGamepadCameraSensitivity then
			t.camera_sensitivity_gamepad = string.format("%.2f", GameSettings.GamepadCameraSensitivity)
		end
		if UserInputService.MouseEnabled then
			t.camera_sensitivity_mouse = string.format("%.2f", GameSettings.MouseSensitivityFirstPerson.X)
		end
		t.camera_y_inverted = tostring(GameSettings.CameraYInverted)
		t.show_performance_stats = tostring(GameSettings.PerformanceStatsVisible)
		t.volume = tostring((math.floor(GameSettings.MasterVolume * 10 + 0.5)))
		t.gfx_quality_level = tostring(settings().Rendering.QualityLevel)
		t.fullscreen_enabled = tostring(GameSettings:InFullScreen())
		t.microprofiler_enabled = tostring(GameSettings.OnScreenProfilerEnabled)
		t.microprofiler_webserver_enabled = tostring(GameSettings.MicroProfilerWebServerEnabled)
		
		return t
	end
	
	if Enabled == true then
		AdditionalArgs = reportSettingsForAnalytics()
		EventName = ConstantsModule.AnalyticsSettingsChangeName
		EventContext = ConstantsModule.AnalyticsInGameMenuName
	end
	if not AdditionalArgs then
		AdditionalArgs = {}
	end
	AdditionalArgs.universeid = tostring(game.GameId)
	AdditionalArgs.inputDevice = tostring(InputTypeMap[UserInputService:GetLastInputType()] or UserInputService:GetLastInputType())
	
	if AdditionalArgs.playsessionid == nil and RbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		AdditionalArgs.playsessionid = RbxAnalyticsService:GetPlaySessionId()
	end
	RbxAnalyticsService1:SetRBXEventStream(ConstantsModule.AnalyticsTargetName, EventContext, EventName, AdditionalArgs)
end