local config = {
	LeftShift = true,
	RightShift = true,
	LeftControl = true,
	RightControl = true,
	LeftAlt = true,
	RightAlt = true,
	LeftMeta = true,
	RightMeta = true,
	LeftSuper = true,
	RightSuper = true
}

return {
	withheld = function(p1, p2, p3): boolean
		-- upvalues: config (copy)
		if p2 ~= p3 then
			return false
		end
		local Success, Result = pcall(p1.GetKeysPressed, p1)
		
		if not Success or type(Result) ~= "table" or #Result == 0 then
			return false
		end
		for _, Input in Result do
			if not config[Input.KeyCode.Name] then
				return false
			end
		end
		local Success1, Result1 = pcall(p1.GetMouseButtonsPressed, p1)
		
		if Success1 then
			Success1 = type(Result1) == "table" and #Result1 > 0
		end
		return not Success1
	end,
	nudges = function(p4, Input, Callback)
		local InputBeganConnection = p4.InputBegan:Connect(function(_, _)
			-- upvalues: Callback (copy)
			Callback()
		end)
		local InputChangedConnection = p4.InputChanged:Connect(function(Input1)
			-- upvalues: Input (copy), Callback (copy)
			local UserInputType = Input1.UserInputType
			
			if UserInputType == Input.UserInputType.MouseMovement or UserInputType == Input.UserInputType.MouseWheel then
				Callback()
			end
		end)
		
		return function()
			-- upvalues: InputBeganConnection (copy), InputChangedConnection (copy)
			InputBeganConnection:Disconnect()
			InputChangedConnection:Disconnect()
		end
	end
}