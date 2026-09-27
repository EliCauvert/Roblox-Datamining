local userInputService = require(script:FindFirstAncestor("Foundation").Utility.Wrappers.Services).UserInputService
local constantsModule = require(script.Parent.constants)

local function _()
	-- upvalues: userInputService (ref)
	local lastInputType = userInputService:GetLastInputType()
	
	return if lastInputType.Name:match("^Gamepad") and table.find(userInputService:GetConnectedGamepads(), lastInputType) ~= nil then lastInputType else nil
end

local _ = function(p1, p2)
	-- upvalues: userInputService (ref)
	if userInputService:IsKeyDown(p1) then
		return true
	end
	local lastInputType = userInputService:GetLastInputType()
	local var1 = if lastInputType.Name:match("^Gamepad") and table.find(userInputService:GetConnectedGamepads(), lastInputType) ~= nil then lastInputType else nil
	lastInputType = var1 ~= nil and userInputService:IsGamepadButtonDown(var1, p2)
	
	return lastInputType
end

local function getThumbstickDirection(p1)
	-- upvalues: userInputService (ref), constantsModule (ref)
	local lastInputType = userInputService:GetLastInputType()
	local var1 = if lastInputType.Name:match("^Gamepad") and table.find(userInputService:GetConnectedGamepads(), lastInputType) ~= nil then lastInputType else nil
	
	if not var1 then
		return 0
	end
	for i, v in userInputService:GetGamepadState(var1) do
		if v.KeyCode == Enum.KeyCode.Thumbstick1 then
			local var2
			local x = v.Position.X
			local y = v.Position.Y
			
			if p1 then
				local var3
				var2 = true
				
				if constantsModule.thumbstickDeadzone > y then
					local _ = constantsModule.thumbstickDeadzone <= x
				end
			else
				var2 = if constantsModule.thumbstickDeadzone > x then y <= -constantsModule.thumbstickDeadzone else true
			end
			if p1 then
				var3 = true
				
				if y > -constantsModule.thumbstickDeadzone then
					local _ = x <= -constantsModule.thumbstickDeadzone
				end
			else
				var3 = if x > -constantsModule.thumbstickDeadzone then constantsModule.thumbstickDeadzone <= y else true
			end
			return if var2 then 1 elseif var3 then -1 else 0
		end
	end
	return 0
end

return function(p2)
	-- upvalues: userInputService (ref), getThumbstickDirection (ref)
	local var4, lastInputType
	if p2 then
		local dPadUp = Enum.KeyCode.DPadUp
		
		if userInputService:IsKeyDown(Enum.KeyCode.Up) then
			var4 = true
		else
			lastInputType = userInputService:GetLastInputType()
			local var5 = if lastInputType.Name:match("^Gamepad") and table.find(userInputService:GetConnectedGamepads(), lastInputType) ~= nil then lastInputType else nil
			var4 = var5 ~= nil and userInputService:IsGamepadButtonDown(var5, dPadUp)
		end
		if not var4 then
			local dPadRight = Enum.KeyCode.DPadRight
			
			if userInputService:IsKeyDown(Enum.KeyCode.Right) then
				var4 = true
			else
				lastInputType = userInputService:GetLastInputType()
				local var6 = if lastInputType.Name:match("^Gamepad") and table.find(userInputService:GetConnectedGamepads(), lastInputType) ~= nil then lastInputType else nil
				var4 = var6 ~= nil and userInputService:IsGamepadButtonDown(var6, dPadRight)
			end
		end
	else
		local dPadRight = Enum.KeyCode.DPadRight
		
		if userInputService:IsKeyDown(Enum.KeyCode.Right) then
			var4 = true
		else
			lastInputType = userInputService:GetLastInputType()
			local var7 = if lastInputType.Name:match("^Gamepad") and table.find(userInputService:GetConnectedGamepads(), lastInputType) ~= nil then lastInputType else nil
			var4 = var7 ~= nil and userInputService:IsGamepadButtonDown(var7, dPadRight)
		end
		local var8
		if not var4 then
			local dPadDown = Enum.KeyCode.DPadDown
			
			if userInputService:IsKeyDown(Enum.KeyCode.Down) then
				var4 = true
			else
				lastInputType = userInputService:GetLastInputType()
				local var9 = if lastInputType.Name:match("^Gamepad") and table.find(userInputService:GetConnectedGamepads(), lastInputType) ~= nil then lastInputType else nil
				var4 = var9 ~= nil and userInputService:IsGamepadButtonDown(var9, dPadDown)
			end
		end
	end
	if p2 then
		local lastInputType
		local dPadDown = Enum.KeyCode.DPadDown
		
		if userInputService:IsKeyDown(Enum.KeyCode.Down) then
			var8 = true
		else
			lastInputType = userInputService:GetLastInputType()
			lastInputType = if lastInputType.Name:match("^Gamepad") and table.find(userInputService:GetConnectedGamepads(), lastInputType) ~= nil then lastInputType else nil
			var8 = lastInputType ~= nil and userInputService:IsGamepadButtonDown(lastInputType, dPadDown)
		end
		if not var8 then
			local dPadLeft = Enum.KeyCode.DPadLeft
			
			if userInputService:IsKeyDown(Enum.KeyCode.Left) then
				var8 = true
			else
				lastInputType = userInputService:GetLastInputType()
				lastInputType = if lastInputType.Name:match("^Gamepad") and table.find(userInputService:GetConnectedGamepads(), lastInputType) ~= nil then lastInputType else nil
				var8 = lastInputType ~= nil and userInputService:IsGamepadButtonDown(lastInputType, dPadLeft)
			end
		end
	else
		local lastInputType
		local dPadLeft = Enum.KeyCode.DPadLeft
		
		if userInputService:IsKeyDown(Enum.KeyCode.Left) then
			var8 = true
		else
			lastInputType = userInputService:GetLastInputType()
			lastInputType = if lastInputType.Name:match("^Gamepad") and table.find(userInputService:GetConnectedGamepads(), lastInputType) ~= nil then lastInputType else nil
			var8 = lastInputType ~= nil and userInputService:IsGamepadButtonDown(lastInputType, dPadLeft)
		end
		if not var8 then
			local dPadUp = Enum.KeyCode.DPadUp
			
			if userInputService:IsKeyDown(Enum.KeyCode.Up) then
				var8 = true
			else
				lastInputType = userInputService:GetLastInputType()
				lastInputType = if lastInputType.Name:match("^Gamepad") and table.find(userInputService:GetConnectedGamepads(), lastInputType) ~= nil then lastInputType else nil
				var8 = lastInputType ~= nil and userInputService:IsGamepadButtonDown(lastInputType, dPadUp)
			end
		end
	end
	return if var4 then 1 elseif var8 then -1 else getThumbstickDirection(p2)
end