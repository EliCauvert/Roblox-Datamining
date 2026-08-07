local virtualInputManagerService = game:GetService("VirtualInputManager")

return function(p0) --[[ line: 7 | named "clickGuiObject" ]]
	-- upvalues: virtualInputManagerService (ref)
	local screenGui = p0:FindFirstAncestorOfClass("ScreenGui")
	local var2 = screenGui or Instance.new("ScreenGui")
	local var3 = screenGui == nil
	local var4 = nil
	
	if var3 then
		var2.Parent = game:GetService("CoreGui")
		local var5 = p0
		while var5.Parent ~= nil and var5.Parent.Parent ~= game do
			var5 = var5.Parent
		end
		var4 = var5
		var5.Parent = var2
	end
	virtualInputManagerService:WaitForInputEventsProcessed()
	local absolutePosition = p0.AbsolutePosition
	local absoluteSize = p0.AbsoluteSize
	local var6 = absolutePosition.X + absoluteSize.X / 2
	local var7 = absolutePosition.Y + absoluteSize.Y / 2
	local var8 = false
	local activatedConnection = p0.Activated:Connect(function() --[[ line: 30 ]]
		-- upvalues: var8 (write)
		var8 = true
	end)
	virtualInputManagerService:SendMouseButtonEvent(var6, var7, 0, true, nil, 1)
	virtualInputManagerService:SendMouseButtonEvent(var6, var7, 0, false, nil, 1)
	virtualInputManagerService:WaitForInputEventsProcessed()
	virtualInputManagerService:SendTouchEvent(1, 0, var6, var7)
	virtualInputManagerService:SendTouchEvent(1, 2, var6, var7)
	virtualInputManagerService:WaitForInputEventsProcessed()
	activatedConnection:Disconnect()
	
	if var3 then
		if var4 then
			var4.Parent = nil
		end
		var2:Destroy()
	end
end