local UserInputService = require(script:FindFirstAncestor("Foundation").Utility.Wrappers.Services).UserInputService
local ConstantsModule = require(script.Parent.constants)

local function _()
	-- upvalues: UserInputService (copy)
	local LastInputType = UserInputService:GetLastInputType()
	
	return if LastInputType.Name:match("^Gamepad") and table.find(UserInputService:GetConnectedGamepads(), LastInputType) ~= nil then LastInputType else nil
end

local _ = function(KeyCode, GamepadKeyCode)
	-- upvalues: UserInputService (copy)
	if UserInputService:IsKeyDown(KeyCode) then
		return true
	else
		local LastInputType = UserInputService:GetLastInputType()
		local LastInputType1 = if LastInputType.Name:match("^Gamepad") and table.find(UserInputService:GetConnectedGamepads(), LastInputType) ~= nil then LastInputType else nil
		
		return LastInputType1 ~= nil and UserInputService:IsGamepadButtonDown(LastInputType1, GamepadKeyCode)
	end
end

local function getThumbstickDirection(p1): number
	-- upvalues: UserInputService (copy), ConstantsModule (copy)
	local LastInputType = UserInputService:GetLastInputType()
	local LastInputType1 = if LastInputType.Name:match("^Gamepad") and table.find(UserInputService:GetConnectedGamepads(), LastInputType) ~= nil then LastInputType else nil
	
	if not LastInputType1 then
		return 0
	end
	for _, Input in UserInputService:GetGamepadState(LastInputType1) do
		if Input.KeyCode == Enum.KeyCode.Thumbstick1 then
			local X = Input.Position.X
			local Y = Input.Position.Y
			local IsThumbstickDeadzoneBelow: boolean = if p1 then ConstantsModule.thumbstickDeadzone <= Y or ConstantsModule.thumbstickDeadzone <= X else ConstantsModule.thumbstickDeadzone <= X or Y <= -ConstantsModule.thumbstickDeadzone
			local IsYBelow: boolean = if p1 then Y <= -ConstantsModule.thumbstickDeadzone or X <= -ConstantsModule.thumbstickDeadzone else X <= -ConstantsModule.thumbstickDeadzone or Y >= ConstantsModule.thumbstickDeadzone
			
			return if IsThumbstickDeadzoneBelow then 1 elseif IsYBelow then -1 else 0
		end
	end
	return 0
end

return function(p2)
	-- upvalues: UserInputService (copy), getThumbstickDirection (copy)
	local IsGamepadButtonDown = nil
	if p2 then
		local DPadUp = Enum.KeyCode.DPadUp
		
		if UserInputService:IsKeyDown(Enum.KeyCode.Up) then
			IsGamepadButtonDown = true
		else
			local LastInputType = UserInputService:GetLastInputType()
			local LastInputType1 = if LastInputType.Name:match("^Gamepad") and table.find(UserInputService:GetConnectedGamepads(), LastInputType) ~= nil then LastInputType else nil
			IsGamepadButtonDown = LastInputType1 ~= nil and UserInputService:IsGamepadButtonDown(LastInputType1, DPadUp)
		end
		if not IsGamepadButtonDown then
			local DPadRight1 = Enum.KeyCode.DPadRight
			
			if UserInputService:IsKeyDown(Enum.KeyCode.Right) then
				IsGamepadButtonDown = true
			else
				local LastInputType = UserInputService:GetLastInputType()
				local LastInputType2 = if LastInputType.Name:match("^Gamepad") and table.find(UserInputService:GetConnectedGamepads(), LastInputType) ~= nil then LastInputType else nil
				IsGamepadButtonDown = LastInputType2 ~= nil and UserInputService:IsGamepadButtonDown(LastInputType2, DPadRight1)
			end
		end
	else
		local DPadRight = Enum.KeyCode.DPadRight
		
		if UserInputService:IsKeyDown(Enum.KeyCode.Right) then
			IsGamepadButtonDown = true
		else
			local LastInputType = UserInputService:GetLastInputType()
			local LastInputType3 = if LastInputType.Name:match("^Gamepad") and table.find(UserInputService:GetConnectedGamepads(), LastInputType) ~= nil then LastInputType else nil
			IsGamepadButtonDown = LastInputType3 ~= nil and UserInputService:IsGamepadButtonDown(LastInputType3, DPadRight)
		end
		if not IsGamepadButtonDown then
			local DPadDown = Enum.KeyCode.DPadDown
			
			if UserInputService:IsKeyDown(Enum.KeyCode.Down) then
				IsGamepadButtonDown = true
			else
				local LastInputType = UserInputService:GetLastInputType()
				local LastInputType4 = if LastInputType.Name:match("^Gamepad") and table.find(UserInputService:GetConnectedGamepads(), LastInputType) ~= nil then LastInputType else nil
				IsGamepadButtonDown = LastInputType4 ~= nil and UserInputService:IsGamepadButtonDown(LastInputType4, DPadDown)
			end
		end
	end
	local IsGamepadButtonDown1 = nil
	if p2 then
		local DPadDown = Enum.KeyCode.DPadDown
		
		if UserInputService:IsKeyDown(Enum.KeyCode.Down) then
			IsGamepadButtonDown1 = true
		else
			local LastInputType = UserInputService:GetLastInputType()
			local LastInputType6 = if LastInputType.Name:match("^Gamepad") and table.find(UserInputService:GetConnectedGamepads(), LastInputType) ~= nil then LastInputType else nil
			IsGamepadButtonDown1 = LastInputType6 ~= nil and UserInputService:IsGamepadButtonDown(LastInputType6, DPadDown)
		end
		if not IsGamepadButtonDown1 then
			local DPadLeft1 = Enum.KeyCode.DPadLeft
			
			if UserInputService:IsKeyDown(Enum.KeyCode.Left) then
				IsGamepadButtonDown1 = true
			else
				local LastInputType = UserInputService:GetLastInputType()
				local LastInputType7 = if LastInputType.Name:match("^Gamepad") and table.find(UserInputService:GetConnectedGamepads(), LastInputType) ~= nil then LastInputType else nil
				IsGamepadButtonDown1 = LastInputType7 ~= nil and UserInputService:IsGamepadButtonDown(LastInputType7, DPadLeft1)
			end
		end
	else
		local DPadLeft = Enum.KeyCode.DPadLeft
		
		if UserInputService:IsKeyDown(Enum.KeyCode.Left) then
			IsGamepadButtonDown1 = true
		else
			local LastInputType = UserInputService:GetLastInputType()
			local LastInputType5 = if LastInputType.Name:match("^Gamepad") and table.find(UserInputService:GetConnectedGamepads(), LastInputType) ~= nil then LastInputType else nil
			IsGamepadButtonDown1 = LastInputType5 ~= nil and UserInputService:IsGamepadButtonDown(LastInputType5, DPadLeft)
		end
		if not IsGamepadButtonDown1 then
			local DPadUp = Enum.KeyCode.DPadUp
			
			if UserInputService:IsKeyDown(Enum.KeyCode.Up) then
				IsGamepadButtonDown1 = true
			else
				local LastInputType = UserInputService:GetLastInputType()
				local LastInputType8 = if LastInputType.Name:match("^Gamepad") and table.find(UserInputService:GetConnectedGamepads(), LastInputType) ~= nil then LastInputType else nil
				IsGamepadButtonDown1 = LastInputType8 ~= nil and UserInputService:IsGamepadButtonDown(LastInputType8, DPadUp)
			end
		end
	end
	return if IsGamepadButtonDown then 1 elseif IsGamepadButtonDown1 then -1 else getThumbstickDirection(p2)
end