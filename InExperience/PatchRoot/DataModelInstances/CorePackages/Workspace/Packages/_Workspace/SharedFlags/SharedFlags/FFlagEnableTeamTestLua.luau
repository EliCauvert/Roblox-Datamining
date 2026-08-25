local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local enableTeamTestLuaVersionCheck = game:DefineFastFlag("EnableTeamTestLuaVersionCheck", false)
local enableTeamTestLua = game:DefineFastFlag("EnableTeamTestLua", false)
local buildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local enableClientTeamTestTeleportEngineFeature = game:GetEngineFeature("EnableClientTeamTestTeleport")

local function _()
	-- upvalues: userInputService (ref), runService (ref)
	local var9 = tonumber(string.match(runService:GetRobloxVersion(), "^%d+%.(%d+)%."))
	
	return var9 ~= nil and (if userInputService:GetPlatform() == Enum.Platform.IOS then 731 else 730) <= var9
end

local var6 = enableTeamTestLua

if var6 then
	if enableTeamTestLuaVersionCheck then
		local var7 = tonumber(string.match(runService:GetRobloxVersion(), "^%d+%.(%d+)%."))
		local var8 = if userInputService:GetPlatform() == Enum.Platform.IOS then 731 else 730
		var6 = false
		
		if var7 ~= nil then
			var6 = var8 <= var7
			var6 = nil
		end
	else
		var6 = enableClientTeamTestTeleportEngineFeature
	end
	var6 = var6 and buildAppStorageKeyEngineFeature
end
return var6