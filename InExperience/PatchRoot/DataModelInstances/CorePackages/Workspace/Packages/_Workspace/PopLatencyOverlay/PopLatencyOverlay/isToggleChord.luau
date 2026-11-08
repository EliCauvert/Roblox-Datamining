local UserInputService = game:GetService("UserInputService")

return function(Input, p1)
	-- upvalues: UserInputService (copy)
	local P1 = p1 or UserInputService
	
	if Input.KeyCode == Enum.KeyCode.L then
		local IsKeyDown = P1:IsKeyDown(Enum.KeyCode.LeftMeta) or (P1:IsKeyDown(Enum.KeyCode.RightMeta) or (P1:IsKeyDown(Enum.KeyCode.LeftControl) or P1:IsKeyDown(Enum.KeyCode.RightControl)))
		
		return (P1:IsKeyDown(Enum.KeyCode.LeftShift) or P1:IsKeyDown(Enum.KeyCode.RightShift)) and IsKeyDown
	else
		return false
	end
end