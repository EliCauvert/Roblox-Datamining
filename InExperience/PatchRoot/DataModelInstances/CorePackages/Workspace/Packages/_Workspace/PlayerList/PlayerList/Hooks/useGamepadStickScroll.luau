local ContextActionService = game:GetService("ContextActionService")
local RunService = game:GetService("RunService")
local ReactModule = require(script.Parent.Parent.Parent.React)

local function _(Value: number): number
	local Magnitude = math.abs(Value)
	
	return if Magnitude <= 0.2 then 0 else math.sign(Value) * (Magnitude - 0.2) / 0.8
end

local function scrollByStick(ScrollFrame, Value: number, p1)
	local Largest = math.max(0, ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteWindowSize.Y)
	
	if Largest == 0 then return end
	local Magnitude = math.abs(Value)
	local SignRatio: number = if Magnitude <= 0.2 then 0 else math.sign(Value) * (Magnitude - 0.2) / 0.8
	
	if SignRatio ~= 0 then
		ScrollFrame.CanvasPosition = Vector2.new(ScrollFrame.CanvasPosition.X, (math.clamp(ScrollFrame.CanvasPosition.Y + p1 * -SignRatio * 1000, 0, Largest)))
		
		return
	end
end

return function(p1)
	-- upvalues: ReactModule (copy), ContextActionService (copy), RunService (copy), scrollByStick (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), ContextActionService (upval), RunService (upval), scrollByStick (upval)
		if not p1.enabled then return end
		local ContextActionServiceOverride = p1.contextActionServiceOverride or ContextActionService
		local RunServiceOverride = p1.runServiceOverride or RunService
		local v1 = nil
		ContextActionServiceOverride:BindCoreAction("RbxPlayerListReskinGamepadStickScroll", function(_, UserInputState, p2)
			-- upvalues: v1 (ref)
			if UserInputState == Enum.UserInputState.Change then
				v1 = p2
			elseif UserInputState == Enum.UserInputState.End then
				v1 = nil
			end
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.Thumbstick2)
		local RenderSteppedConnection = RunServiceOverride.RenderStepped:Connect(function(DeltaTime)
			-- upvalues: p1 (upval), v1 (ref), scrollByStick (upval)
			local Current = p1.scrollingFrameRef.current
			
			if v1 ~= nil and Current ~= nil then
				scrollByStick(Current, v1.Position.Y, DeltaTime)
			end
		end)
		
		return function()
			-- upvalues: ContextActionServiceOverride (copy), RenderSteppedConnection (copy)
			ContextActionServiceOverride:UnbindCoreAction("RbxPlayerListReskinGamepadStickScroll")
			RenderSteppedConnection:Disconnect()
		end
	end, {
		p1.enabled,
		p1.scrollingFrameRef,
		p1.contextActionServiceOverride,
		p1.runServiceOverride
	})
end