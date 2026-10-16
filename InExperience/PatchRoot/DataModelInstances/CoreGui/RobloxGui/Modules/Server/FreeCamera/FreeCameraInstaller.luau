local AllowLuobuFreecamGroup = game:DefineFastFlag("AllowLuobuFreecamGroup", false)
local PlayerScriptStatusPropertyEngineFeature = game:DefineFastFlag("FreeCameraToIAS", false) and game:GetEngineFeature("PlayerScriptStatusProperty")
local list = { 4358041 }
local list1 = { 7842878 }
local Players = game:GetService("Players")
local PolicyService = game:GetService("PolicyService")
local RunService = game:GetService("RunService")
local StarterPlayer = game:GetService("StarterPlayer")
local ServerUtilModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Server.ServerUtil)

return function() --[[ Line: 28 | Named "Install" ]]
	-- upvalues: PlayerScriptStatusPropertyEngineFeature (copy), StarterPlayer (copy), ServerUtilModule (copy), RunService (copy), list (copy), AllowLuobuFreecamGroup (copy), PolicyService (copy), list1 (copy), Players (copy)
	local function WaitForChildOfClass(Object, ClassName) --[[ Line: 29 ]]
		local ClassName1 = Object:FindFirstChildOfClass(ClassName)
		while not ClassName1 or ClassName1.ClassName ~= ClassName do
			ClassName1 = Object.ChildAdded:Wait()
		end
		return ClassName1
	end
	
	local function AddFreeCamera(Player) --[[ Line: 37 ]]
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
	
	local function ShouldAddFreeCam(Player): boolean --[[ Line: 66 ]]
		-- upvalues: RunService (upval), list (upval), AllowLuobuFreecamGroup (upval), PolicyService (upval), list1 (upval)
		if RunService:IsStudio() then
			return true
		end
		if Player.UserId <= 0 then
			return false
		end
		local Success, Result = pcall(Player.GetCanManageAsync, Player)
		
		if Success and Result then
			return true
		end
		for _, value in ipairs(list) do
			local Success1, Result1 = pcall(Player.IsInGroup, Player, value)
			
			if Success1 and Result1 then
				return true
			end
		end
		if AllowLuobuFreecamGroup and game:GetEngineFeature("LuobuModerationStatus") and PolicyService.IsLuobuServer == Enum.TriStateBoolean.True then
			for _, value1 in ipairs(list1) do
				local Success2, Result2 = pcall(Player.IsInGroup, Player, value1)
				
				if Success2 and Result2 then
					return true
				end
			end
		end
		return false
	end
	
	local function PlayerAdded(Player) --[[ Line: 101 ]]
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