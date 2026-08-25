local playersService = game:GetService("Players")
local reactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)

return function(p0, p1)
	-- upvalues: playersService (ref), reactModule (ref)
	p1 = p1 or playersService
	p0 = p0 or reactModule.useRef(nil)
	local var4 = reactModule.useRef(false)
	local var5 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), p0 (ref)
		var4.current = true
		task.delay(0, function()
			-- upvalues: p0 (copy)
			local current = p0.current
			
			if current and not current:IsFocused() then
				current:CaptureFocus()
			end
		end)
	end, { p0 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), p1 (ref)
		return function()
			-- upvalues: var4 (copy), p1 (copy)
			if not var4.current then return end
			local localPlayer = p1.LocalPlayer
			
			if localPlayer then
				local textBox = Instance.new("TextBox")
				textBox.Visible = false
				textBox.Parent = localPlayer:FindFirstChildOfClass("PlayerGui")
				textBox:CaptureFocus()
				textBox:ReleaseFocus()
				textBox:Destroy()
			end
		end
	end, { p1 })
	
	return { ref = p0, focus = var5 }
end