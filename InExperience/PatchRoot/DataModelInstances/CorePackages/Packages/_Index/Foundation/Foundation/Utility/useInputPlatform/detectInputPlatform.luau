local foundation = script:FindFirstAncestor("Foundation")
local userInputService = require(foundation.Utility.Wrappers.Services).UserInputService
local inputPlatformModule = require(foundation.Enums.InputPlatform)

local function _()
	-- upvalues: userInputService (ref)
	local ok, status = pcall(function()
		-- upvalues: userInputService (copy)
		return userInputService:GetConnectedGamepads()
	end)
	
	return ok and (typeof(status) == "table" and #status > 0)
end

local list = {
	Enum.KeyCode.ButtonStart,
	Enum.KeyCode.ButtonSelect,
	Enum.KeyCode.ButtonA,
	Enum.KeyCode.ButtonL1,
	Enum.KeyCode.DPadUp
}

local function getPlatformFromImage(p1)
	-- upvalues: userInputService (ref), inputPlatformModule (ref)
	local ok, status = pcall(function()
		-- upvalues: userInputService (copy), p1 (ref)
		return userInputService:GetImageForKeyCode(p1)
	end)
	
	if not ok or typeof(status) ~= "string" or status == "" then
		return nil
	end
	local var1 = status:lower()
	
	return if var1:find("ps5") then inputPlatformModule.PS5 elseif var1:find("ps4") then inputPlatformModule.PS4 elseif var1:find("xbox") then inputPlatformModule.Xbox else nil
end

local _ = function()
	-- upvalues: list (ref), getPlatformFromImage (ref)
	for i, v in list do
		local var1 = getPlatformFromImage(v)
		
		if var1 ~= nil then
			return var1
		end
	end
	return nil
end

local _ = function()
	-- upvalues: userInputService (ref)
	local ok, status = pcall(function()
		-- upvalues: userInputService (copy)
		return userInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA)
	end)
	
	return ok and status == "ButtonCross"
end

return function()
	-- upvalues: userInputService (ref), inputPlatformModule (ref), list (ref), getPlatformFromImage (ref)
	local ok, status = pcall(function()
		-- upvalues: userInputService (copy)
		return userInputService:GetConnectedGamepads()
	end)
	
	if not ok or not (typeof(status) == "table" and #status > 0) then
		return inputPlatformModule.Default
	end
	local var2, var3
	for i, v in list do
		var2 = getPlatformFromImage(v)
		
		if var2 ~= nil then
			var3 = var2
			if var3 ~= nil then
				return var3
			end
			local ok_1, status_1 = pcall(function()
				-- upvalues: userInputService (copy)
				return userInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA)
			end)
			
			return if ok_1 and status_1 == "ButtonCross" then inputPlatformModule.PS5 else inputPlatformModule.Xbox
		end
	end
	var3 = nil
end