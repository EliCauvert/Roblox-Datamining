local parent = script.Parent.Parent.Parent
local contextActionService = game:GetService("ContextActionService")
local runService = game:GetService("RunService")
local reactModule = require(parent.React)

local function _(p0)
	local absValue = math.abs(p0)
	
	return if absValue <= 0.2 then 0 else math.sign(p0) * (absValue - 0.2) / 0.8
end

local function scrollByStick(p1, p2, p3)
	local maxValue = math.max(0, p1.AbsoluteCanvasSize.Y - p1.AbsoluteWindowSize.Y)
	
	if maxValue == 0 then return end
	local absValue = math.abs(p2)
	local var7 = if absValue <= 0.2 then 0 else math.sign(p2) * (absValue - 0.2) / 0.8
	
	if var7 == 0 then
		return
	end
	p1.CanvasPosition = Vector2.new(p1.CanvasPosition.X, math.clamp(p1.CanvasPosition.Y + p3 * -var7 * 1000, 0, maxValue))
end

return function(p4)
	-- upvalues: reactModule (ref), contextActionService (ref), runService (ref), scrollByStick (ref)
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), contextActionService (copy), runService (copy), scrollByStick (copy)
		if p4.enabled then
			local contextActionServiceOverride = p4.contextActionServiceOverride or contextActionService
			local runServiceOverride = p4.runServiceOverride or runService
			local var10 = nil
			contextActionServiceOverride:BindCoreAction("RbxPlayerListReskinGamepadStickScroll", function(_, p5, p6)
				-- upvalues: var10 (write)
				if p5 == Enum.UserInputState.Change then
					var10 = p6
				elseif p5 == Enum.UserInputState.End then
					var10 = nil
				end
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.Thumbstick2)
			local renderSteppedConnection = runServiceOverride.RenderStepped:Connect(function(p7)
				-- upvalues: p4 (copy), var10 (write), scrollByStick (copy)
				local current = p4.scrollingFrameRef.current
				
				if var10 ~= nil and current ~= nil then
					scrollByStick(current, var10.Position.Y, p7)
				end
			end)
			
			return function()
				-- upvalues: contextActionServiceOverride (ref), renderSteppedConnection (ref)
				contextActionServiceOverride:UnbindCoreAction("RbxPlayerListReskinGamepadStickScroll")
				renderSteppedConnection:Disconnect()
			end
		end
	end, {
		p4.enabled,
		p4.scrollingFrameRef,
		p4.contextActionServiceOverride,
		p4.runServiceOverride
	})
end