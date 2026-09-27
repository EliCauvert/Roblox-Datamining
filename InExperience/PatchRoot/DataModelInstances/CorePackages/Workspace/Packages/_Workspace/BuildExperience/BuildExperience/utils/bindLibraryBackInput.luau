local coreGuiService = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")

return function(p1)
	-- upvalues: userInputService (ref), coreGuiService (ref)
	local buildLibraryBack = Instance.new("InputContext")
	buildLibraryBack.Name = "BuildLibraryBack"
	buildLibraryBack.Priority = 2000
	buildLibraryBack.Sink = true
	local back = Instance.new("InputAction")
	back.Name = "Back"
	back.Type = Enum.InputActionType.Bool
	
	for i, v in { Enum.KeyCode.Escape, Enum.KeyCode.ButtonB } do
		local inputBinding = Instance.new("InputBinding")
		inputBinding.KeyCode = v
		inputBinding.Parent = back
	end
	back.Parent = buildLibraryBack
	local var1 = false
	local var2 = false
	local var3 = false
	
	local function update()
		-- upvalues: var1 (write), var2 (write), userInputService (copy), var3 (write), buildLibraryBack (ref)
		local var4 = not var1 and (not var2 and userInputService:GetFocusedTextBox() == nil)
		
		if not var4 then
			var3 = false
		end
		buildLibraryBack.Enabled = var4
	end
	
	local var4 = not var1 and (not var2 and userInputService:GetFocusedTextBox() == nil)
	
	if not var4 then
		var3 = false
	end
	buildLibraryBack.Enabled = var4
	local list = {
		back.Pressed:Connect(function()
			-- upvalues: var3 (write), buildLibraryBack (ref)
			var3 = buildLibraryBack.Enabled
		end),
		back.Released:Connect(function()
			-- upvalues: var3 (write), p1 (ref)
			if var3 then
				var3 = false
				p1()
			end
		end),
		userInputService.TextBoxFocused:Connect(update),
		userInputService.TextBoxFocusReleased:Connect(function()
			-- upvalues: var2 (write), userInputService (copy), var1 (write), var3 (write), buildLibraryBack (ref)
			var2 = userInputService:IsKeyDown(Enum.KeyCode.Escape) or userInputService:IsGamepadButtonDown(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonB)
			local var5 = not var1 and (not var2 and userInputService:GetFocusedTextBox() == nil)
			
			if not var5 then
				var3 = false
			end
			buildLibraryBack.Enabled = var5
		end),
		userInputService.InputEnded:Connect(function(p2)
			-- upvalues: var2 (write), var1 (write), userInputService (copy), var3 (write), buildLibraryBack (ref)
			if var2 and (p2.KeyCode == Enum.KeyCode.Escape or p2.KeyCode == Enum.KeyCode.ButtonB) then
				var2 = false
				local var5 = not var1 and (not var2 and userInputService:GetFocusedTextBox() == nil)
				
				if not var5 then
					var3 = false
				end
				buildLibraryBack.Enabled = var5
			end
		end)
	}
	buildLibraryBack.Parent = coreGuiService
	
	return {
		setChatOpen = function(value)
			-- upvalues: var1 (write), var2 (write), userInputService (copy), var3 (write), buildLibraryBack (ref)
			var1 = value
			local var5 = not var1 and (not var2 and userInputService:GetFocusedTextBox() == nil)
			
			if not var5 then
				var3 = false
			end
			buildLibraryBack.Enabled = var5
		end,
		unbind = function()
			-- upvalues: list (ref), buildLibraryBack (ref)
			for i, v in list do
				v:Disconnect()
			end
			buildLibraryBack:Destroy()
		end
	}
end