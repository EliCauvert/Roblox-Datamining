local VirtualInputManager = game:GetService("VirtualInputManager")

return function(Frame: Frame) --[[ Line: 7 | Named "clickGuiObject" ]]
	-- upvalues: VirtualInputManager (copy)
	local ScreenGui = Frame:FindFirstAncestorOfClass("ScreenGui")
	local ScreenGui1 = if ScreenGui then ScreenGui else Instance.new("ScreenGui")
	local NoScreenGui = ScreenGui == nil
	local v1 = nil
	
	if NoScreenGui then
		ScreenGui1.Parent = game:GetService("CoreGui")
		local Parent = Frame
		while Parent.Parent ~= nil and Parent.Parent.Parent ~= game do
			Parent = Parent.Parent
		end
		v1 = Parent
		Parent.Parent = ScreenGui1
	end
	VirtualInputManager:WaitForInputEventsProcessed()
	local AbsolutePosition = Frame.AbsolutePosition
	local AbsoluteSize = Frame.AbsoluteSize
	local NewX = AbsolutePosition.X + AbsoluteSize.X / 2
	local NewY = AbsolutePosition.Y + AbsoluteSize.Y / 2
	local Flag = false
	local ActivatedConnection = Frame.Activated:Connect(function() --[[ Line: 30 ]]
		-- upvalues: Flag (ref)
		Flag = true
	end)
	VirtualInputManager:SendMouseButtonEvent(NewX, NewY, 0, true, nil, 1)
	VirtualInputManager:SendMouseButtonEvent(NewX, NewY, 0, false, nil, 1)
	VirtualInputManager:WaitForInputEventsProcessed()
	
	if not Flag then
		VirtualInputManager:SendTouchEvent(1, 0, NewX, NewY)
		VirtualInputManager:SendTouchEvent(1, 2, NewX, NewY)
		VirtualInputManager:WaitForInputEventsProcessed()
	end
	ActivatedConnection:Disconnect()
	
	if NoScreenGui then
		if v1 then
			v1.Parent = nil
		end
		ScreenGui1:Destroy()
	end
end