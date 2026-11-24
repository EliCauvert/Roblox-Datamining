local ModelViewport = script:FindFirstAncestor("ModelViewport")
local ReactModule = require(ModelViewport.Parent.React)
local ConstantsModule = require(ModelViewport.Constants)
local RotationModeModule = require(ModelViewport.Enums.RotationMode)
local _ = require(ModelViewport.Types)
local ViewportGamepadInputModule = require(ModelViewport.ViewportGamepadInput)
local ViewportGamepadSubscriptionsModule = require(ModelViewport.ViewportGamepadSubscriptions)

return function(Current)
	-- upvalues: ReactModule (copy), ViewportGamepadSubscriptionsModule (copy), ConstantsModule (copy), RotationModeModule (copy), ViewportGamepadInputModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(ViewportGamepadSubscriptionsModule.isGamepadEnabled)
	ReactModule.useEffect(function()
		-- upvalues: ViewportGamepadSubscriptionsModule (upval), UseStateResult2 (copy)
		local ConnectGamepadEnabledChangedResult = ViewportGamepadSubscriptionsModule.connectGamepadEnabledChanged(UseStateResult2)
		UseStateResult2(ViewportGamepadSubscriptionsModule.isGamepadEnabled())
		
		return function()
			-- upvalues: ConnectGamepadEnabledChangedResult (copy)
			ConnectGamepadEnabledChangedResult:Disconnect()
		end
	end, {})
	local Config = Current.config
	local UseStateResult1 = Current.enabled and (Config ~= nil and UseStateResult)
	local ActionName = if Config then Config.actionName else ""
	local Deadzone = Config and Config.deadzone or ConstantsModule.GamepadDeadzone
	local YawDegPerSecond = Config and Config.yawDegPerSecond or ConstantsModule.GamepadYawDegPerSecond
	local PitchDegPerSecond = Config and Config.pitchDegPerSecond or ConstantsModule.GamepadPitchDegPerSecond
	local ZoomStepsPerSecond = Config and Config.zoomStepsPerSecond or ConstantsModule.GamepadZoomStepsPerSecond
	local Rotation = Current.rotation
	local CanZoom = Current.canZoom
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy), CanZoom (copy), Rotation (copy), RotationModeModule (upval), ViewportGamepadInputModule (upval), Deadzone (copy), YawDegPerSecond (copy), PitchDegPerSecond (copy), ConstantsModule (upval), ZoomStepsPerSecond (copy), ViewportGamepadSubscriptionsModule (upval), ActionName (copy), UseRefResult (copy)
		if not UseStateResult1 then return end
		local ZeroVector = Vector2.zero
		local Z = 0
		local Z1 = 0
		local Flag = false
		local IsRotationMatch: boolean = CanZoom and Rotation == RotationModeModule.Gimbal
		local List = { Enum.KeyCode.Thumbstick2 }
		
		if IsRotationMatch then
			table.insert(List, Enum.KeyCode.ButtonR2)
			table.insert(List, Enum.KeyCode.ButtonL2)
		end
		local function getRates()
			-- upvalues: ViewportGamepadInputModule (upval), ZeroVector (ref), Deadzone (upval), Rotation (upval), RotationModeModule (upval), YawDegPerSecond (upval), PitchDegPerSecond (upval), CanZoom (upval), ConstantsModule (upval), ZoomStepsPerSecond (upval), IsRotationMatch (copy), Z (ref), Z1 (ref)
			local ApplyStickDeadzoneResult = ViewportGamepadInputModule.applyStickDeadzone(ZeroVector, Deadzone)
			local v1 = 0
			local v2 = 0
			local NewApplyTriggerDeadzoneResult = 0
			
			if Rotation ~= RotationModeModule.None then
				v1 = -ApplyStickDeadzoneResult.X * YawDegPerSecond
			end
			if Rotation == RotationModeModule.Gimbal then
				v2 = -ApplyStickDeadzoneResult.Y * PitchDegPerSecond
			elseif CanZoom and ConstantsModule.GamepadZoomAxisThreshold <= math.abs(ApplyStickDeadzoneResult.Y) then
				NewApplyTriggerDeadzoneResult = ApplyStickDeadzoneResult.Y * ZoomStepsPerSecond
			end
			if IsRotationMatch then
				NewApplyTriggerDeadzoneResult += (ViewportGamepadInputModule.applyTriggerDeadzone(Z, Deadzone) - ViewportGamepadInputModule.applyTriggerDeadzone(Z1, Deadzone)) * ZoomStepsPerSecond
			end
			return v1, v2, NewApplyTriggerDeadzoneResult
		end
		
		local function _(): boolean
			-- upvalues: getRates (copy)
			local Rates, Rates2, Rates3 = getRates()
			
			return Rates == 0 and Rates2 == 0 and Rates3 == 0
		end
		
		ViewportGamepadSubscriptionsModule.unbindCoreAction(ActionName)
		ViewportGamepadSubscriptionsModule.bindCoreAction(ActionName, function(_, UserInputState, Input)
			-- upvalues: ZeroVector (ref), Z (ref), Z1 (ref), Flag (ref), getRates (copy), UseRefResult (upval)
			local IsUserInputStateMatch: boolean = UserInputState == Enum.UserInputState.End or UserInputState == Enum.UserInputState.Cancel
			local KeyCode = Input.KeyCode
			
			if KeyCode == Enum.KeyCode.Thumbstick2 then
				ZeroVector = if IsUserInputStateMatch then Vector2.zero else Vector2.new(Input.Position.X, Input.Position.Y)
			elseif KeyCode == Enum.KeyCode.ButtonR2 then
				Z = if IsUserInputStateMatch then 0 else Input.Position.Z
			elseif KeyCode == Enum.KeyCode.ButtonL2 then
				Z1 = if IsUserInputStateMatch then 0 else Input.Position.Z
			end
			if Flag then
				local Rates, Rates2, Rates3 = getRates()
				
				if Rates == 0 and (Rates2 == 0 and Rates3 == 0) then
					Flag = false
					UseRefResult.current.onEnded()
				end
			end
			return Enum.ContextActionResult.Sink
		end, List)
		local ConnectRenderSteppedResult = ViewportGamepadSubscriptionsModule.connectRenderStepped(function(p1)
			-- upvalues: getRates (copy), Flag (ref), UseRefResult (upval)
			local Rates, Rates2, Rates3 = getRates()
			local ScaledRates = Rates * p1
			local ScaledRates1 = Rates2 * p1
			local ScaledRates2 = Rates3 * p1
			
			if ScaledRates ~= 0 or ScaledRates1 ~= 0 then
				Flag = true
				UseRefResult.current.onRotate(ScaledRates, ScaledRates1)
			end
			if ScaledRates2 ~= 0 then
				Flag = true
				UseRefResult.current.onZoom(ScaledRates2)
			end
		end)
		
		return function()
			-- upvalues: ViewportGamepadSubscriptionsModule (upval), ActionName (upval), ConnectRenderSteppedResult (copy), Flag (ref), UseRefResult (upval)
			ViewportGamepadSubscriptionsModule.unbindCoreAction(ActionName)
			ConnectRenderSteppedResult:Disconnect()
			
			if Flag then
				Flag = false
				UseRefResult.current.onEnded()
			end
		end
	end, {
		UseStateResult1, ActionName, Deadzone, YawDegPerSecond, PitchDegPerSecond,
		ZoomStepsPerSecond, Rotation, CanZoom
	})
end