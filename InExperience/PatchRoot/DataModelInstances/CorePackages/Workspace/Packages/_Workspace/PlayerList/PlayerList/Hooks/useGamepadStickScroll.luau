local parent = script.Parent.Parent.Parent
local contextActionService = game:GetService("ContextActionService")
local runService = game:GetService("RunService")
local reactModule = require(parent.React)

local function _(p1)
	local absValue = math.abs(p1)
	
	return if absValue <= 0.2 then 0 else math.sign(p1) * (absValue - 0.2) / 0.8
end

local function scrollByStick(p1, p2, p3)
	local maxValue = math.max(0, p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y)
	
	if maxValue == 0 then return end
	local absValue = math.abs(p2)
	local var1 = if absValue <= 0.2 then 0 else math.sign(p2) * (absValue - 0.2) / 0.8
	
	if var1 == 0 then
		return
	end
	p1.CanvasPosition = Vector2.new(p1.CanvasPosition.X, math.clamp(p1.CanvasPosition.Y + p3 * -var1 * 1000, 0, maxValue))
end

return function(p1)
	-- upvalues: reactModule (ref), contextActionService (ref), runService (ref), scrollByStick (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), contextActionService (copy), runService (copy), scrollByStick (copy)
		if p1.enabled then
			local contextActionServiceOverride = p1.contextActionServiceOverride or contextActionService
			local runServiceOverride = p1.runServiceOverride or runService
			local var1 = nil
			contextActionServiceOverride:BindCoreAction("RbxPlayerListReskinGamepadStickScroll", function(_, p2, p3)
				-- upvalues: var1 (write)
				if p2 == Enum.UserInputState.Change then
					var1 = p3
				elseif p2 == Enum.UserInputState.End then
					var1 = nil
				end
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.Thumbstick2)
			local renderSteppedConnection = runServiceOverride.RenderStepped:Connect(function(p2)
				-- upvalues: p1 (copy), var1 (write), scrollByStick (copy)
				local current = p1.scrollingFrameRef.current
				
				if var1 ~= nil and current ~= nil then
					scrollByStick(current, var1.Position.Y, p2)
				end
			end)
			
			return function()
				-- upvalues: contextActionServiceOverride (ref), renderSteppedConnection (ref)
				contextActionServiceOverride:UnbindCoreAction("RbxPlayerListReskinGamepadStickScroll")
				renderSteppedConnection:Disconnect()
			end
		end
	end, {
		p1.enabled,
		p1.scrollingFrameRef,
		p1.contextActionServiceOverride,
		p1.runServiceOverride
	})
end