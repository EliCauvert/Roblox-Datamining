local Foundation = script:FindFirstAncestor("Foundation")
local UserInputService = require(Foundation.Utility.Wrappers.Services).UserInputService
local InputPlatformModule = require(Foundation.Enums.InputPlatform)

local function _(): boolean --[[ Line: 22 | Named "hasConnectedGamepad" ]]
	-- upvalues: UserInputService (copy)
	local Success, Result = pcall(function() --[[ Line: 23 ]]
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

local function getPlatformFromImage(KeyCode) --[[ Line: 39 ]]
	-- upvalues: UserInputService (copy), InputPlatformModule (copy)
	local Success, Result = pcall(function() --[[ Line: 40 ]]
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

local _ = function() --[[ Line: 62 | Named "getPlatformFromGamepadAssets" ]]
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

local _ = function(): boolean --[[ Line: 73 | Named "isPlaystation" ]]
	-- upvalues: UserInputService (copy)
	local Success, Result = pcall(function() --[[ Line: 74 ]]
		-- upvalues: UserInputService (upval)
		return UserInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA)
	end)
	
	return Success and Result == "ButtonCross"
end

return function() --[[ Line: 80 | Named "detectInputPlatform" ]]
	-- upvalues: UserInputService (copy), InputPlatformModule (copy), list (copy), getPlatformFromImage (copy)
	local Success, Result = pcall(function() --[[ Line: 23 ]]
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
	local Success1, Result1 = pcall(function() --[[ Line: 74 ]]
		-- upvalues: UserInputService (upval)
		return UserInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA)
	end)
	
	if Success1 then
		Success1 = Result1 == "ButtonCross"
	end
	return if Success1 then InputPlatformModule.PS5 else InputPlatformModule.Xbox
end