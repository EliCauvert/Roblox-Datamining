local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local enableTeamTestLuaVersionCheck = game:DefineFastFlag("EnableTeamTestLuaVersionCheck", false)
local enableTeamTestLua = game:DefineFastFlag("EnableTeamTestLua", false)
local buildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local enableClientTeamTestTeleportEngineFeature = game:GetEngineFeature("EnableClientTeamTestTeleport")

local function _()
	-- upvalues: userInputService (ref), runService (ref)
	local var1 = tonumber(string.match(runService:GetRobloxVersion(), "^%d+%.(%d+)%."))
	
	return var1 ~= nil and (if userInputService:GetPlatform() == Enum.Platform.IOS then 731 else 730) <= var1
end

local var1 = enableTeamTestLua

if var1 then
	if enableTeamTestLuaVersionCheck then
		local var2 = tonumber(string.match(runService:GetRobloxVersion(), "^%d+%.(%d+)%."))
		local var3 = if userInputService:GetPlatform() == Enum.Platform.IOS then 731 else 730
		var1 = false
		
		if var2 ~= nil then
			var1 = var3 <= var2
			var1 = nil
		end
	else
		var1 = enableClientTeamTestTeleportEngineFeature
	end
	var1 = var1 and buildAppStorageKeyEngineFeature
end
return var1