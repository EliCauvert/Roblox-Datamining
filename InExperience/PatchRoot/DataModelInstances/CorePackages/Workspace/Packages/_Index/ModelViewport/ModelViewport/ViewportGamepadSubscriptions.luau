local ContextActionService = game:GetService("ContextActionService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

return {
	isGamepadEnabled = function()
		-- upvalues: UserInputService (copy)
		return UserInputService.GamepadEnabled
	end,
	connectGamepadEnabledChanged = function(Callback)
		-- upvalues: UserInputService (copy)
		return UserInputService:GetPropertyChangedSignal("GamepadEnabled"):Connect(function()
			-- upvalues: Callback (copy), UserInputService (upval)
			Callback(UserInputService.GamepadEnabled)
		end)
	end,
	bindCoreAction = function(ActionName, FunctionToBind, p1)
		-- upvalues: ContextActionService (copy)
		ContextActionService:BindCoreAction(ActionName, FunctionToBind, false, table.unpack(p1))
	end,
	unbindCoreAction = function(ActionName)
		-- upvalues: ContextActionService (copy)
		ContextActionService:UnbindCoreAction(ActionName)
	end,
	connectRenderStepped = function(Callback)
		-- upvalues: RunService (copy)
		return RunService.RenderStepped:Connect(Callback)
	end
}