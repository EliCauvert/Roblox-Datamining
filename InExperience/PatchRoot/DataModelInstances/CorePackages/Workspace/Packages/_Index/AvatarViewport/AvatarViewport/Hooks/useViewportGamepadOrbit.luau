local contextActionService = game:GetService("ContextActionService")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local avatarViewport = script:FindFirstAncestor("AvatarViewport")
local reactModule = require(avatarViewport.Parent.React)
local constantsModule = require(avatarViewport.Constants)
local viewportGamepadInputModule = require(avatarViewport.ViewportGamepadInput)

return function(p0) --[[ line: 26 | named "useViewportGamepadOrbit" ]]
	-- upvalues: constantsModule (ref), viewportGamepadInputModule (ref), reactModule (ref), userInputService (ref), contextActionService (ref), runService (ref)
	local var7 = p0.enabled == nil or p0.enabled
	local actionName = p0.actionName or constantsModule.GamepadOrbitActionName
	local thumbstickDeadzone = p0.thumbstickDeadzone or viewportGamepadInputModule.defaultDeadzone
	local yawSpeedDegPerSecond = p0.yawSpeedDegPerSecond or viewportGamepadInputModule.getDefaultYawSpeedDegPerSecond()
	local zoomGestureSpeedPerSecond = p0.zoomGestureSpeedPerSecond or viewportGamepadInputModule.getDefaultZoomGestureSpeedPerSecond()
	local zoomAxisThreshold = p0.zoomAxisThreshold or viewportGamepadInputModule.defaultZoomAxisThreshold
	local thumbstickKeyCode = p0.thumbstickKeyCode or Enum.KeyCode.Thumbstick2
	local var14 = reactModule.useRef(false)
	local var15 = reactModule.useRef(false)
	local var16 = reactModule.useRef(p0.applyYawDelta)
	local var17 = reactModule.useRef(p0.applyZoomGesture)
	local var18 = reactModule.useRef(p0.onOrbitEnded)
	var16.current = p0.applyYawDelta
	var17.current = p0.applyZoomGesture
	var18.current = p0.onOrbitEnded
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: var7 (ref), userInputService (copy), contextActionService (copy), actionName (ref), var14 (ref), viewportGamepadInputModule (copy), thumbstickDeadzone (ref), zoomAxisThreshold (ref), var15 (ref), var18 (ref), thumbstickKeyCode (ref), runService (copy), yawSpeedDegPerSecond (ref), var16 (ref), zoomGestureSpeedPerSecond (ref), var17 (ref)
		if var7 and userInputService.GamepadEnabled then
			local zero = Vector2.zero
			contextActionService:UnbindCoreAction(actionName)
			contextActionService:BindCoreAction(actionName, function(_, p1, p2) --[[ line: 57 ]]
				-- upvalues: zero (write), var14 (copy), viewportGamepadInputModule (copy), thumbstickDeadzone (copy), zoomAxisThreshold (copy), var15 (copy), var18 (copy)
				if p1 == Enum.UserInputState.Change then
					zero = Vector2.new(p2.Position.X, p2.Position.Y)
					var14.current = viewportGamepadInputModule.isRotating(zero, thumbstickDeadzone)
					
					if var14.current or zoomAxisThreshold < math.abs(zero.Y) then
						var15.current = true
					end
				elseif p1 == Enum.UserInputState.End or p1 == Enum.UserInputState.Cancel then
					zero = Vector2.zero
					var14.current = false
					
					if var15.current and var18.current then
						var18.current()
					end
					var15.current = false
				end
				return Enum.ContextActionResult.Sink
			end, false, thumbstickKeyCode)
			local renderSteppedConnection = runService.RenderStepped:Connect(function(p3) --[[ line: 80 ]]
				-- upvalues: viewportGamepadInputModule (copy), zero (write), yawSpeedDegPerSecond (copy), thumbstickDeadzone (copy), var16 (copy), zoomGestureSpeedPerSecond (copy), zoomAxisThreshold (copy), var17 (copy)
				local var21 = viewportGamepadInputModule.computeYawDeltaDegrees(zero, p3, yawSpeedDegPerSecond, thumbstickDeadzone)
				
				if var21 ~= 0 and var16.current then
					var16.current(var21)
				end
				local var22 = viewportGamepadInputModule.computeZoomGestureDelta(zero, p3, zoomGestureSpeedPerSecond, thumbstickDeadzone, zoomAxisThreshold)
				
				if var22 ~= 0 and var17.current then
					var17.current(var22)
				end
			end)
			
			return function() --[[ line: 103 ]]
				-- upvalues: contextActionService (copy), actionName (copy), renderSteppedConnection (ref), zero (write), var14 (copy), var15 (copy)
				contextActionService:UnbindCoreAction(actionName)
				renderSteppedConnection:Disconnect()
				zero = Vector2.zero
				var14.current = false
				var15.current = false
			end
		end
	end, {
		var7, actionName, thumbstickDeadzone, yawSpeedDegPerSecond,
		zoomGestureSpeedPerSecond, zoomAxisThreshold, thumbstickKeyCode
	})
end