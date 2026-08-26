local virtualInputManagerService = game:GetService("VirtualInputManager")

return function(p1)
	-- upvalues: virtualInputManagerService (ref)
	local screenGui = p1:FindFirstAncestorOfClass("ScreenGui")
	local var1 = screenGui or Instance.new("ScreenGui")
	local var2 = screenGui == nil
	local var3 = nil
	
	if var2 then
		var1.Parent = game:GetService("CoreGui")
		local var4 = p1
		while var4.Parent ~= nil and var4.Parent.Parent ~= game do
			var4 = var4.Parent
		end
		var3 = var4
		var4.Parent = var1
	end
	virtualInputManagerService:WaitForInputEventsProcessed()
	local absolutePosition = p1.AbsolutePosition
	local absoluteSize = p1.AbsoluteSize
	local var5 = absolutePosition.X + absoluteSize.X / 2
	local var6 = absolutePosition.Y + absoluteSize.Y / 2
	local var7 = false
	local activatedConnection = p1.Activated:Connect(function()
		-- upvalues: var7 (write)
		var7 = true
	end)
	virtualInputManagerService:SendMouseButtonEvent(var5, var6, 0, true, nil, 1)
	virtualInputManagerService:SendMouseButtonEvent(var5, var6, 0, false, nil, 1)
	virtualInputManagerService:WaitForInputEventsProcessed()
	virtualInputManagerService:SendTouchEvent(1, 0, var5, var6)
	virtualInputManagerService:SendTouchEvent(1, 2, var5, var6)
	virtualInputManagerService:WaitForInputEventsProcessed()
	activatedConnection:Disconnect()
	
	if var2 then
		if var3 then
			var3.Parent = nil
		end
		var1:Destroy()
	end
end