local AllowLuobuFreecamGroup = game:DefineFastFlag("AllowLuobuFreecamGroup", false)
local LuaGetCanManageAsyncEngineFeature = game:DefineFastFlag("UseGetCanManageAsync", false) and game:GetEngineFeature("LuaGetCanManageAsync")
local PlayerScriptStatusPropertyEngineFeature = game:DefineFastFlag("FreeCameraToIAS", false) and game:GetEngineFeature("PlayerScriptStatusProperty")
local list = { 4358041 }
local list1 = { 7842878 }
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local PolicyService = game:GetService("PolicyService")
local RunService = game:GetService("RunService")
local StarterPlayer = game:GetService("StarterPlayer")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Url = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsCommon).Url
local ServerUtilModule = require(RobloxGui.Modules.Server.ServerUtil)
local FFlagUserPresenceTokenRccCheckPermissionsLuaModule = require(RobloxGui.Modules.Common.Flags.FFlagUserPresenceTokenRccCheckPermissionsLua)

return function()
	-- upvalues: PlayerScriptStatusPropertyEngineFeature (copy), StarterPlayer (copy), ServerUtilModule (copy), RunService (copy), LuaGetCanManageAsyncEngineFeature (copy), Url (copy), HttpService (copy), FFlagUserPresenceTokenRccCheckPermissionsLuaModule (copy), HttpRbxApiService (copy), list (copy), AllowLuobuFreecamGroup (copy), PolicyService (copy), list1 (copy), Players (copy)
	local function WaitForChildOfClass(Object, ClassName)
		local ClassName1 = Object:FindFirstChildOfClass(ClassName)
		while not ClassName1 or ClassName1.ClassName ~= ClassName do
			ClassName1 = Object.ChildAdded:Wait()
		end
		return ClassName1
	end
	
	local function AddFreeCamera(Player)
		-- upvalues: WaitForChildOfClass (copy), PlayerScriptStatusPropertyEngineFeature (upval), StarterPlayer (upval), ServerUtilModule (upval)
		local PlayerGui = WaitForChildOfClass(Player, "PlayerGui")
		local Child = nil
		
		if PlayerScriptStatusPropertyEngineFeature then
			local PlayerModuleStatus = StarterPlayer.PlayerModuleStatus
			local IsPlayerModuleStatusMatch: boolean = PlayerModuleStatus == 1 or PlayerModuleStatus == 2
			Child = script.Parent:WaitForChild(if IsPlayerModuleStatusMatch then "FreeCameraIAS" else "FreeCamera")
		else
			Child = script.Parent:WaitForChild("FreeCamera")
		end
		local Freecam = Instance.new("ScreenGui")
		Freecam.Name = "Freecam"
		Freecam.ResetOnSpawn = false
		local FreecamScript = Instance.new("LocalScript")
		FreecamScript.Name = "FreecamScript"
		
		if ServerUtilModule.getFFlagServerCoreScriptSourceCode() then
			FreecamScript.Source = ServerUtilModule.getSourceForServerScript(Child)
		else
			FreecamScript.Source = Child.Source
		end
		FreecamScript.Parent = Freecam
		Freecam.Parent = PlayerGui
	end
	
	local function ShouldAddFreeCam(Player: Player): boolean
		-- upvalues: RunService (upval), LuaGetCanManageAsyncEngineFeature (upval), Url (upval), HttpService (upval), FFlagUserPresenceTokenRccCheckPermissionsLuaModule (upval), HttpRbxApiService (upval), list (upval), AllowLuobuFreecamGroup (upval), PolicyService (upval), list1 (upval)
		if RunService:IsStudio() then
			return true
		end
		if Player.UserId <= 0 then
			return false
		end
		if LuaGetCanManageAsyncEngineFeature then
			local Success, Result = pcall(Player.GetCanManageAsync, Player)
			
			if Success and Result then
				return true
			end
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: Url (upval), HttpService (upval), Player (copy), FFlagUserPresenceTokenRccCheckPermissionsLuaModule (upval), HttpRbxApiService (upval)
				local Formatted = string.format(Url.APIS_URL .. "asset-permissions-api/v1/rcc/assets/check-permissions")
				local Json = HttpService:JSONEncode({
					requests = {
						{
							action = "Edit",
							subject = { subjectType = "User", subjectId = Player.UserId },
							assetId = game.PlaceId
						}
					}
				})
				
				return HttpService:JSONDecode(if FFlagUserPresenceTokenRccCheckPermissionsLuaModule then HttpRbxApiService:PostAsyncFullUrlForPlayer(Formatted, Json, Player) else HttpRbxApiService:PostAsyncFullUrl(Formatted, Json))
			end)
			
			if Success1 then
				local Result2 = Result1.results[1]
				
				if Result2.value and Result2.value.status == "HasPermission" then
					return true
				end
			end
		end
		for _, value in ipairs(list) do
			local Success2, Result3 = pcall(Player.IsInGroup, Player, value)
			
			if Success2 and Result3 then
				return true
			end
		end
		if AllowLuobuFreecamGroup and game:GetEngineFeature("LuobuModerationStatus") and PolicyService.IsLuobuServer == Enum.TriStateBoolean.True then
			for _, value1 in ipairs(list1) do
				local Success3, Result4 = pcall(Player.IsInGroup, Player, value1)
				
				if Success3 and Result4 then
					return true
				end
			end
		end
		return false
	end
	
	local function PlayerAdded(Player)
		-- upvalues: ShouldAddFreeCam (copy), AddFreeCamera (copy)
		if ShouldAddFreeCam(Player) then
			AddFreeCamera(Player)
		end
	end
	
	Players.PlayerAdded:Connect(PlayerAdded)
	
	for _, player in ipairs(Players:GetPlayers()) do
		coroutine.wrap(PlayerAdded)(player)
	end
end