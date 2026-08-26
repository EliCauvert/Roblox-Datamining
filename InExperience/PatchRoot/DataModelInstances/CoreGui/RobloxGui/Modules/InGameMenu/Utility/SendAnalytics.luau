local userInputService = game:GetService("UserInputService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local constantsModule = require(script.Parent.Parent.Resources.Constants)
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local inputTypeMap = constantsModule.InputTypeMap

return function(p1, p2, p3, p4, p5)
	-- upvalues: rbxAnalyticsService (ref), userInputService (ref), constantsModule (ref), inputTypeMap (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref)
	if p5 == nil then
		p5 = rbxAnalyticsService
	end
	local function reportSettingsForAnalytics()
		-- upvalues: userInputService (copy)
		local gameSettings = UserSettings().GameSettings
		local t = {}
		
		if userInputService.TouchEnabled then
			t.camera_mode_touch = tostring(gameSettings.TouchCameraMovementMode)
		else
			t.camera_mode_desktop = tostring(gameSettings.ComputerCameraMovementMode)
		end
		if userInputService.TouchEnabled then
			t.movement_mode_touch = tostring(gameSettings.TouchMovementMode)
		else
			t.movement_mode_desktop = tostring(gameSettings.ComputerMovementMode)
		end
		if userInputService.MouseEnabled then
			t.shift_lock_enabled = tostring(gameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch)
		end
		if userInputService.GamepadEnabled and gameSettings.IsUsingGamepadCameraSensitivity then
			t.camera_sensitivity_gamepad = string.format("%.2f", gameSettings.GamepadCameraSensitivity)
		end
		if userInputService.MouseEnabled then
			t.camera_sensitivity_mouse = string.format("%.2f", gameSettings.MouseSensitivityFirstPerson.X)
		end
		t.camera_y_inverted = tostring(gameSettings.CameraYInverted)
		t.show_performance_stats = tostring(gameSettings.PerformanceStatsVisible)
		t.volume = tostring(math.floor(gameSettings.MasterVolume * 10 + 0.5))
		t.gfx_quality_level = tostring(settings().Rendering.QualityLevel)
		t.fullscreen_enabled = tostring(gameSettings:InFullScreen())
		t.microprofiler_enabled = tostring(gameSettings.OnScreenProfilerEnabled)
		t.microprofiler_webserver_enabled = tostring(gameSettings.MicroProfilerWebServerEnabled)
		
		return t
	end
	
	if p4 == true then
		p3 = reportSettingsForAnalytics()
		p2 = constantsModule.AnalyticsSettingsChangeName
		p1 = constantsModule.AnalyticsInGameMenuName
	end
	p3 = p3 or {}
	p3.universeid = tostring(game.GameId)
	p3.inputDevice = tostring(inputTypeMap[userInputService:GetLastInputType()] or userInputService:GetLastInputType())
	
	if p3.playsessionid == nil and rbxAnalyticsServiceExposePlaySessionIdEngineFeature then
		p3.playsessionid = rbxAnalyticsService:GetPlaySessionId()
	end
	p5:SetRBXEventStream(constantsModule.AnalyticsTargetName, p1, p2, p3)
end