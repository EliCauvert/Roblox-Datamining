local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

return function(Callback) --[[ Line: 13 | Named "bindLibraryBackInput" ]]
	-- upvalues: UserInputService (copy), CoreGui (copy)
	local BuildLibraryBack = Instance.new("InputContext")
	BuildLibraryBack.Name = "BuildLibraryBack"
	BuildLibraryBack.Priority = 2000
	BuildLibraryBack.Sink = true
	local Back = Instance.new("InputAction")
	Back.Name = "Back"
	Back.Type = Enum.InputActionType.Bool
	
	for _, KeyCode in { Enum.KeyCode.Escape, Enum.KeyCode.ButtonB } do
		local InputBinding = Instance.new("InputBinding")
		InputBinding.KeyCode = KeyCode
		InputBinding.Parent = Back
	end
	Back.Parent = BuildLibraryBack
	local ChatOpen = false
	local IsKeyDown = false
	local Enabled = false
	
	local function update() --[[ Line: 33 ]]
		-- upvalues: ChatOpen (ref), IsKeyDown (ref), UserInputService (upval), Enabled (ref), BuildLibraryBack (copy)
		local NoFocusedTextBox: boolean = not ChatOpen and (not IsKeyDown and UserInputService:GetFocusedTextBox() == nil)
		
		if not NoFocusedTextBox then
			Enabled = false
		end
		BuildLibraryBack.Enabled = NoFocusedTextBox
	end
	
	local NoFocusedTextBox: boolean = not ChatOpen and (not IsKeyDown and UserInputService:GetFocusedTextBox() == nil)
	
	if not NoFocusedTextBox then
		Enabled = false
	end
	BuildLibraryBack.Enabled = NoFocusedTextBox
	local Connections = {
		Back.Pressed:Connect(function() --[[ Line: 43 ]]
			-- upvalues: Enabled (ref), BuildLibraryBack (copy)
			Enabled = BuildLibraryBack.Enabled
		end),
		Back.Released:Connect(function() --[[ Line: 46 ]]
			-- upvalues: Enabled (ref), Callback (copy)
			if Enabled then
				Enabled = false
				Callback()
			end
		end),
		UserInputService.TextBoxFocused:Connect(update),
		UserInputService.TextBoxFocusReleased:Connect(function() --[[ Line: 53 ]]
			-- upvalues: IsKeyDown (ref), UserInputService (upval), ChatOpen (ref), Enabled (ref), BuildLibraryBack (copy)
			IsKeyDown = UserInputService:IsKeyDown(Enum.KeyCode.Escape) or UserInputService:IsGamepadButtonDown(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonB)
			local NoFocusedTextBox: boolean = not ChatOpen and (not IsKeyDown and UserInputService:GetFocusedTextBox() == nil)
			
			if not NoFocusedTextBox then
				Enabled = false
			end
			BuildLibraryBack.Enabled = NoFocusedTextBox
		end),
		UserInputService.InputEnded:Connect(function(Input) --[[ Line: 58 ]]
			-- upvalues: IsKeyDown (ref), ChatOpen (ref), UserInputService (upval), Enabled (ref), BuildLibraryBack (copy)
			if IsKeyDown and (Input.KeyCode == Enum.KeyCode.Escape or Input.KeyCode == Enum.KeyCode.ButtonB) then
				IsKeyDown = false
				local NoFocusedTextBox: boolean = not ChatOpen and (not IsKeyDown and UserInputService:GetFocusedTextBox() == nil)
				
				if not NoFocusedTextBox then
					Enabled = false
				end
				BuildLibraryBack.Enabled = NoFocusedTextBox
			end
		end)
	}
	BuildLibraryBack.Parent = CoreGui
	
	return {
		setChatOpen = function(Value) --[[ Line: 70 ]]
			-- upvalues: ChatOpen (ref), IsKeyDown (ref), UserInputService (upval), Enabled (ref), BuildLibraryBack (copy)
			ChatOpen = Value
			local NoFocusedTextBox: boolean = not ChatOpen and (not IsKeyDown and UserInputService:GetFocusedTextBox() == nil)
			
			if not NoFocusedTextBox then
				Enabled = false
			end
			BuildLibraryBack.Enabled = NoFocusedTextBox
		end,
		unbind = function() --[[ Line: 74 ]]
			-- upvalues: Connections (copy), BuildLibraryBack (copy)
			for _, connection in Connections do
				connection:Disconnect()
			end
			BuildLibraryBack:Destroy()
		end
	}
end