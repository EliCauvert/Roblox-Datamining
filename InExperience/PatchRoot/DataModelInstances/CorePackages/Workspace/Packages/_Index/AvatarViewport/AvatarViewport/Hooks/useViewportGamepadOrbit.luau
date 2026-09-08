local contextActionService = game:GetService("ContextActionService")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local avatarViewport = script:FindFirstAncestor("AvatarViewport")
local reactModule = require(avatarViewport.Parent.React)
local constantsModule = require(avatarViewport.Constants)
local viewportGamepadInputModule = require(avatarViewport.ViewportGamepadInput)

return function(p1)
	-- upvalues: constantsModule (ref), viewportGamepadInputModule (ref), reactModule (ref), userInputService (ref), contextActionService (ref), runService (ref)
	local var1 = p1.enabled == nil or p1.enabled
	local actionName = p1.actionName or constantsModule.GamepadOrbitActionName
	local thumbstickDeadzone = p1.thumbstickDeadzone or viewportGamepadInputModule.defaultDeadzone
	local yawSpeedDegPerSecond = p1.yawSpeedDegPerSecond or viewportGamepadInputModule.getDefaultYawSpeedDegPerSecond()
	local zoomGestureSpeedPerSecond = p1.zoomGestureSpeedPerSecond or viewportGamepadInputModule.getDefaultZoomGestureSpeedPerSecond()
	local zoomAxisThreshold = p1.zoomAxisThreshold or viewportGamepadInputModule.defaultZoomAxisThreshold
	local thumbstickKeyCode = p1.thumbstickKeyCode or Enum.KeyCode.Thumbstick2
	local var2 = reactModule.useRef(false)
	local var3 = reactModule.useRef(false)
	local var4 = reactModule.useRef(p1.applyYawDelta)
	local var5 = reactModule.useRef(p1.applyZoomGesture)
	local var6 = reactModule.useRef(p1.onOrbitEnded)
	var4.current = p1.applyYawDelta
	var5.current = p1.applyZoomGesture
	var6.current = p1.onOrbitEnded
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), userInputService (copy), contextActionService (copy), actionName (ref), var2 (ref), viewportGamepadInputModule (copy), thumbstickDeadzone (ref), zoomAxisThreshold (ref), var3 (ref), var6 (ref), thumbstickKeyCode (ref), runService (copy), yawSpeedDegPerSecond (ref), var4 (ref), zoomGestureSpeedPerSecond (ref), var5 (ref)
		if var1 and userInputService.GamepadEnabled then
			local zero = Vector2.zero
			contextActionService:UnbindCoreAction(actionName)
			contextActionService:BindCoreAction(actionName, function(_, p2, p3)
				-- upvalues: zero (write), var2 (copy), viewportGamepadInputModule (copy), thumbstickDeadzone (copy), zoomAxisThreshold (copy), var3 (copy), var6 (copy)
				if p2 == Enum.UserInputState.Change then
					zero = Vector2.new(p3.Position.X, p3.Position.Y)
					var2.current = viewportGamepadInputModule.isRotating(zero, thumbstickDeadzone)
					
					if var2.current or zoomAxisThreshold < math.abs(zero.Y) then
						var3.current = true
					end
				elseif p2 == Enum.UserInputState.End or p2 == Enum.UserInputState.Cancel then
					zero = Vector2.zero
					var2.current = false
					
					if var3.current and var6.current then
						var6.current()
					end
					var3.current = false
				end
				return Enum.ContextActionResult.Sink
			end, false, thumbstickKeyCode)
			local renderSteppedConnection = runService.RenderStepped:Connect(function(p2)
				-- upvalues: viewportGamepadInputModule (copy), zero (write), yawSpeedDegPerSecond (copy), thumbstickDeadzone (copy), var4 (copy), zoomGestureSpeedPerSecond (copy), zoomAxisThreshold (copy), var5 (copy)
				local var7 = viewportGamepadInputModule.computeYawDeltaDegrees(zero, p2, yawSpeedDegPerSecond, thumbstickDeadzone)
				
				if var7 ~= 0 and var4.current then
					var4.current(var7)
				end
				local var8 = viewportGamepadInputModule.computeZoomGestureDelta(zero, p2, zoomGestureSpeedPerSecond, thumbstickDeadzone, zoomAxisThreshold)
				
				if var8 ~= 0 and var5.current then
					var5.current(var8)
				end
			end)
			
			return function()
				-- upvalues: contextActionService (copy), actionName (copy), renderSteppedConnection (ref), zero (write), var2 (copy), var3 (copy)
				contextActionService:UnbindCoreAction(actionName)
				renderSteppedConnection:Disconnect()
				zero = Vector2.zero
				var2.current = false
				var3.current = false
			end
		end
	end, {
		var1, actionName, thumbstickDeadzone, yawSpeedDegPerSecond,
		zoomGestureSpeedPerSecond, zoomAxisThreshold, thumbstickKeyCode
	})
end