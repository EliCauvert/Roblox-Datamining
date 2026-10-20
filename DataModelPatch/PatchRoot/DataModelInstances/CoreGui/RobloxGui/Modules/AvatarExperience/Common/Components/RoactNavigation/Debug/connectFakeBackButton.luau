local UserInputService = game:GetService("UserInputService")

return if game:GetService("RunService"):IsStudio() then function(Callback)
	-- upvalues: UserInputService (copy)
	UserInputService.InputEnded:Connect(function(Input)
		-- upvalues: Callback (copy)
		local IsModifierKeyDown = Input:isModifierKeyDown(Enum.ModifierKey.Shift)
		
		if Input.UserInputType == Enum.UserInputType.Keyboard and IsModifierKeyDown and Input.KeyCode == Enum.KeyCode.Backspace then
			Callback()
		end
	end)
end else function(_) end