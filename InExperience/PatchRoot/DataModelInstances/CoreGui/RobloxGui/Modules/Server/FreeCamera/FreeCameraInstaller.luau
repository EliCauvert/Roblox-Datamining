local allowLuobuFreecamGroup = game:DefineFastFlag("AllowLuobuFreecamGroup", false)
local luaGetCanManageAsync = game:DefineFastFlag("UseGetCanManageAsync", false) and game:GetEngineFeature("LuaGetCanManageAsync")
local playerScriptStatusProperty = game:DefineFastFlag("FreeCameraToIAS", false) and game:GetEngineFeature("PlayerScriptStatusProperty")
local list = { 4358041 }
local list_1 = { 7842878 }
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local policyService = game:GetService("PolicyService")
local runService = game:GetService("RunService")
local starterPlayerService = game:GetService("StarterPlayer")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local url = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsCommon).Url
local serverUtilModule = require(robloxGui.Modules.Server.ServerUtil)
local fFlagUserPresenceTokenRccCheckPermissionsLuaModule = require(robloxGui.Modules.Common.Flags.FFlagUserPresenceTokenRccCheckPermissionsLua)

return function() --[[ line: 35 | named "Install" ]]
	-- upvalues: playerScriptStatusProperty (ref), starterPlayerService (ref), serverUtilModule (ref), runService (ref), luaGetCanManageAsync (ref), url (ref), httpService (ref), fFlagUserPresenceTokenRccCheckPermissionsLuaModule (ref), httpRbxApiService (ref), list (ref), allowLuobuFreecamGroup (ref), policyService (ref), list_1 (ref), playersService (ref)
	local function WaitForChildOfClass(p0, p1) --[[ line: 36 ]]
		local var18 = p0:FindFirstChildOfClass(p1)
		while not var18 or var18.ClassName ~= p1 do
			var18 = p0.ChildAdded:Wait()
		end
		return var18
	end
	
	local function AddFreeCamera(p2) --[[ line: 44 ]]
		-- upvalues: WaitForChildOfClass (ref), playerScriptStatusProperty (copy), starterPlayerService (copy), serverUtilModule (copy)
		local var20
		local var19 = WaitForChildOfClass(p2, "PlayerGui")
		local _ = nil
		
		if playerScriptStatusProperty then
			local playerModuleStatus = starterPlayerService.PlayerModuleStatus
			var20 = script.Parent:WaitForChild(if if playerModuleStatus ~= 1 then playerModuleStatus == 2 else true then "FreeCameraIAS" else "FreeCamera")
		else
			var20 = script.Parent:WaitForChild("FreeCamera")
		end
		local freecam = Instance.new("ScreenGui")
		freecam.Name = "Freecam"
		freecam.ResetOnSpawn = false
		local freecamScript = Instance.new("LocalScript")
		freecamScript.Name = "FreecamScript"
		
		if serverUtilModule.getFFlagServerCoreScriptSourceCode() then
			freecamScript.Source = serverUtilModule.getSourceForServerScript(var20)
		else
			freecamScript.Source = var20.Source
		end
		freecamScript.Parent = freecam
		freecam.Parent = var19
	end
	
	local function ShouldAddFreeCam(p3) --[[ line: 73 ]]
		-- upvalues: runService (copy), luaGetCanManageAsync (copy), url (copy), httpService (copy), fFlagUserPresenceTokenRccCheckPermissionsLuaModule (copy), httpRbxApiService (copy), list (copy), allowLuobuFreecamGroup (copy), policyService (copy), list_1 (copy)
		if runService:IsStudio() then
			return true
		elseif p3.UserId <= 0 then
			return false
		elseif luaGetCanManageAsync then
			local ok, status = pcall(p3.GetCanManageAsync, p3)
			
			if ok and status then
				return true
			end
		else
			local ok, status = pcall(function() --[[ line: 88 ]]
				-- upvalues: url (copy), httpService (copy), p3 (ref), fFlagUserPresenceTokenRccCheckPermissionsLuaModule (copy), httpRbxApiService (copy)
				local formattedText = string.format(url.APIS_URL .. "asset-permissions-api/v1/rcc/assets/check-permissions")
				local var24 = httpService:JSONEncode({
					requests = {
						{
							action = "Edit",
							subject = { subjectType = "User", subjectId = p3.UserId },
							assetId = game.PlaceId
						}
					}
				})
				
				return httpService:JSONDecode(if fFlagUserPresenceTokenRccCheckPermissionsLuaModule then httpRbxApiService:PostAsyncFullUrlForPlayer(formattedText, var24, p3) else httpRbxApiService:PostAsyncFullUrl(formattedText, var24))
			end)
			
			if ok then
				status = status.results[1]
				
				if status.value and status.value.status == "HasPermission" then
					return true
				end
			end
		end
		local status
		for i, v in ipairs(list) do
			ok, status = pcall(p3.IsInGroup, p3, v)
			
			if ok and status then
				return true
			end
		end
		if allowLuobuFreecamGroup and game:GetEngineFeature("LuobuModerationStatus") and policyService.IsLuobuServer == Enum.TriStateBoolean.True then
			for i, v_1 in ipairs(list_1) do
				ok, status = pcall(p3.IsInGroup, p3, v_1)
				
				if ok and status then
					return true
				end
			end
		end
		return false
	end
	
	local function PlayerAdded(p4) --[[ line: 144 ]]
		-- upvalues: ShouldAddFreeCam (ref), AddFreeCamera (ref)
		if ShouldAddFreeCam(p4) then
			AddFreeCamera(p4)
		end
	end
	
	playersService.PlayerAdded:Connect(PlayerAdded)
	
	for i, v in ipairs(playersService:GetPlayers()) do
		coroutine.wrap(PlayerAdded)(v)
	end
end