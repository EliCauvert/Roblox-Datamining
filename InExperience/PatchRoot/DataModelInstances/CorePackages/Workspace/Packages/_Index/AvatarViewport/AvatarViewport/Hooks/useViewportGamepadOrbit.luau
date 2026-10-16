local ContextActionService = game:GetService("ContextActionService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local AvatarViewport = script:FindFirstAncestor("AvatarViewport")
local ReactModule = require(AvatarViewport.Parent.React)
local ConstantsModule = require(AvatarViewport.Constants)
local ViewportGamepadInputModule = require(AvatarViewport.ViewportGamepadInput)

return function(p1) --[[ Line: 26 | Named "useViewportGamepadOrbit" ]]
	-- upvalues: ConstantsModule (copy), ViewportGamepadInputModule (copy), ReactModule (copy), UserInputService (copy), ContextActionService (copy), RunService (copy)
	local NoEnabled = p1.enabled == nil or p1.enabled
	local ActionName = p1.actionName or ConstantsModule.GamepadOrbitActionName
	local ThumbstickDeadzone = p1.thumbstickDeadzone or ViewportGamepadInputModule.defaultDeadzone
	local YawSpeedDegPerSecond = p1.yawSpeedDegPerSecond or ViewportGamepadInputModule.getDefaultYawSpeedDegPerSecond()
	local ZoomGestureSpeedPerSecond = p1.zoomGestureSpeedPerSecond or ViewportGamepadInputModule.getDefaultZoomGestureSpeedPerSecond()
	local ZoomAxisThreshold = p1.zoomAxisThreshold or ViewportGamepadInputModule.defaultZoomAxisThreshold
	local ThumbstickKeyCode = p1.thumbstickKeyCode or Enum.KeyCode.Thumbstick2
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(p1.applyYawDelta)
	local UseRefResult3 = ReactModule.useRef(p1.applyZoomGesture)
	local UseRefResult4 = ReactModule.useRef(p1.onOrbitEnded)
	UseRefResult2.current = p1.applyYawDelta
	UseRefResult3.current = p1.applyZoomGesture
	UseRefResult4.current = p1.onOrbitEnded
	ReactModule.useEffect(function() --[[ Line: 46 ]]
		-- upvalues: NoEnabled (copy), UserInputService (upval), ContextActionService (upval), ActionName (copy), UseRefResult (copy), ViewportGamepadInputModule (upval), ThumbstickDeadzone (copy), ZoomAxisThreshold (copy), UseRefResult1 (copy), UseRefResult4 (copy), ThumbstickKeyCode (copy), RunService (upval), YawSpeedDegPerSecond (copy), UseRefResult2 (copy), ZoomGestureSpeedPerSecond (copy), UseRefResult3 (copy)
		if not NoEnabled or not UserInputService.GamepadEnabled then return end
		local ZeroVector = Vector2.zero
		ContextActionService:UnbindCoreAction(ActionName)
		ContextActionService:BindCoreAction(ActionName, function(_, UserInputState, p2) --[[ Line: 57 ]]
			-- upvalues: ZeroVector (ref), UseRefResult (upval), ViewportGamepadInputModule (upval), ThumbstickDeadzone (upval), ZoomAxisThreshold (upval), UseRefResult1 (upval), UseRefResult4 (upval)
			if UserInputState == Enum.UserInputState.Change then
				ZeroVector = Vector2.new(p2.Position.X, p2.Position.Y)
				UseRefResult.current = ViewportGamepadInputModule.isRotating(ZeroVector, ThumbstickDeadzone)
				
				if UseRefResult.current or ZoomAxisThreshold < math.abs(ZeroVector.Y) then
					UseRefResult1.current = true
				end
			elseif UserInputState == Enum.UserInputState.End or UserInputState == Enum.UserInputState.Cancel then
				ZeroVector = Vector2.zero
				UseRefResult.current = false
				
				if UseRefResult1.current and UseRefResult4.current then
					UseRefResult4.current()
				end
				UseRefResult1.current = false
			end
			return Enum.ContextActionResult.Sink
		end, false, ThumbstickKeyCode)
		local RenderSteppedConnection = RunService.RenderStepped:Connect(function(DeltaTime) --[[ Line: 80 ]]
			-- upvalues: ViewportGamepadInputModule (upval), ZeroVector (ref), YawSpeedDegPerSecond (upval), ThumbstickDeadzone (upval), UseRefResult2 (upval), ZoomGestureSpeedPerSecond (upval), ZoomAxisThreshold (upval), UseRefResult3 (upval)
			local YawDeltaDegrees = ViewportGamepadInputModule.computeYawDeltaDegrees(ZeroVector, DeltaTime, YawSpeedDegPerSecond, ThumbstickDeadzone)
			
			if YawDeltaDegrees ~= 0 and UseRefResult2.current then
				UseRefResult2.current(YawDeltaDegrees)
			end
			local ZoomGestureDelta = ViewportGamepadInputModule.computeZoomGestureDelta(ZeroVector, DeltaTime, ZoomGestureSpeedPerSecond, ThumbstickDeadzone, ZoomAxisThreshold)
			
			if ZoomGestureDelta ~= 0 and UseRefResult3.current then
				UseRefResult3.current(ZoomGestureDelta)
			end
		end)
		
		return function() --[[ Line: 103 ]]
			-- upvalues: ContextActionService (upval), ActionName (upval), RenderSteppedConnection (copy), ZeroVector (ref), UseRefResult (upval), UseRefResult1 (upval)
			ContextActionService:UnbindCoreAction(ActionName)
			RenderSteppedConnection:Disconnect()
			ZeroVector = Vector2.zero
			UseRefResult.current = false
			UseRefResult1.current = false
		end
	end, {
		NoEnabled, ActionName, ThumbstickDeadzone, YawSpeedDegPerSecond,
		ZoomGestureSpeedPerSecond, ZoomAxisThreshold, ThumbstickKeyCode
	})
end