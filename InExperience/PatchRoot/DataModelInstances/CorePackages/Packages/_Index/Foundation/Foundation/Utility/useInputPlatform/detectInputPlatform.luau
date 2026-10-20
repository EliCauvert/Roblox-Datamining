local Foundation = script:FindFirstAncestor("Foundation")
local UserInputService = require(Foundation.Utility.Wrappers.Services).UserInputService
local InputPlatformModule = require(Foundation.Enums.InputPlatform)

local function _(): boolean
	-- upvalues: UserInputService (copy)
	local Success, Result = pcall(function()
		-- upvalues: UserInputService (upval)
		return UserInputService:GetConnectedGamepads()
	end)
	
	return Success and (typeof(Result) == "table" and #Result > 0)
end

local list = {
	Enum.KeyCode.ButtonStart,
	Enum.KeyCode.ButtonSelect,
	Enum.KeyCode.ButtonA,
	Enum.KeyCode.ButtonL1,
	Enum.KeyCode.DPadUp
}

local function getPlatformFromImage(KeyCode)
	-- upvalues: UserInputService (copy), InputPlatformModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: UserInputService (upval), KeyCode (copy)
		return UserInputService:GetImageForKeyCode(KeyCode)
	end)
	
	if Success and typeof(Result) == "string" and Result ~= "" then
		local Lowered: string = Result:lower()
		
		return if Lowered:find("ps5") then InputPlatformModule.PS5 elseif Lowered:find("ps4") then InputPlatformModule.PS4 elseif Lowered:find("xbox") then InputPlatformModule.Xbox else nil
	else
		return nil
	end
end

local _ = function()
	-- upvalues: list (copy), getPlatformFromImage (copy)
	local PlatformFromImage = nil
	for _, value in list do
		PlatformFromImage = getPlatformFromImage(value)
		
		if PlatformFromImage ~= nil then
			return PlatformFromImage
		end
	end
	return nil
end

local _ = function(): boolean
	-- upvalues: UserInputService (copy)
	local Success, Result = pcall(function()
		-- upvalues: UserInputService (upval)
		return UserInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA)
	end)
	
	return Success and Result == "ButtonCross"
end

return function()
	-- upvalues: UserInputService (copy), InputPlatformModule (copy), list (copy), getPlatformFromImage (copy)
	local Success, Result = pcall(function()
		-- upvalues: UserInputService (upval)
		return UserInputService:GetConnectedGamepads()
	end)
	
	if Success then
		Success = typeof(Result) == "table" and #Result > 0
	end
	if not Success then
		return InputPlatformModule.Default
	end
	local v1 = nil
	local PlatformFromImage = nil
	
	for _, value in list do
		PlatformFromImage = getPlatformFromImage(value)
		
		if PlatformFromImage ~= nil then
			v1 = PlatformFromImage
			break
		end
	end
	if v1 ~= nil then
		return v1
	end
	local Success1, Result1 = pcall(function()
		-- upvalues: UserInputService (upval)
		return UserInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA)
	end)
	
	if Success1 then
		Success1 = Result1 == "ButtonCross"
	end
	return if Success1 then InputPlatformModule.PS5 else InputPlatformModule.Xbox
end