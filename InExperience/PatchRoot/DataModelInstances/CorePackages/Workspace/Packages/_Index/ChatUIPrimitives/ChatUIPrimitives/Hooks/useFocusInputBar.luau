local playersService = game:GetService("Players")
local reactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)

return function(p1, p2)
	-- upvalues: playersService (ref), reactModule (ref)
	p2 = p2 or playersService
	p1 = p1 or reactModule.useRef(nil)
	local var1 = reactModule.useRef(false)
	local var2 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), p1 (ref)
		var1.current = true
		task.delay(0, function()
			-- upvalues: p1 (copy)
			local current = p1.current
			
			if current and not current:IsFocused() then
				current:CaptureFocus()
			end
		end)
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p2 (ref)
		return function()
			-- upvalues: var1 (copy), p2 (copy)
			if not var1.current then return end
			local localPlayer = p2.LocalPlayer
			
			if localPlayer then
				local textBox = Instance.new("TextBox")
				textBox.Visible = false
				textBox.Parent = localPlayer:FindFirstChildOfClass("PlayerGui")
				textBox:CaptureFocus()
				textBox:ReleaseFocus()
				textBox:Destroy()
			end
		end
	end, { p2 })
	
	return { ref = p1, focus = var2 }
end