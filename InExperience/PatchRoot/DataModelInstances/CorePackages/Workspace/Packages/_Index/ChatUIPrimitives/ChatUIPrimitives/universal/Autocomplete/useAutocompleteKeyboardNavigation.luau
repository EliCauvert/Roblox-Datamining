local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)

return function(p1, Callback, p2)
	-- upvalues: ReactModule (copy), UserInputService (copy), ContextActionService (copy)
	local Text = "AutocompleteSourcesSink_" .. tostring((ReactModule.useRef({})))
	local InputBegan = if p2 == nil then UserInputService.InputBegan else p2.InputBegan
	ReactModule.useEffect(function()
		-- upvalues: Callback (copy), InputBegan (copy)
		if Callback == nil then return end
		local Connection = InputBegan:Connect(function(Input)
			-- upvalues: Callback (upval)
			Callback(Input.KeyCode)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { Callback, InputBegan })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), ContextActionService (upval), Text (copy)
		if not p1 then return end
		ContextActionService:BindCoreAction(Text, function()
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.Up, Enum.KeyCode.Down, Enum.KeyCode.Escape)
		
		return function()
			-- upvalues: ContextActionService (upval), Text (upval)
			ContextActionService:UnbindCoreAction(Text)
		end
	end, { p1, Text })
end