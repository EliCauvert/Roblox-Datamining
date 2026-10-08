local allowLuobuFreecamGroup = game:DefineFastFlag("AllowLuobuFreecamGroup", false)
local playerScriptStatusProperty = game:DefineFastFlag("FreeCameraToIAS", false) and game:GetEngineFeature("PlayerScriptStatusProperty")
local list = { 4358041 }
local list_1 = { 7842878 }
local playersService = game:GetService("Players")
local policyService = game:GetService("PolicyService")
local runService = game:GetService("RunService")
local starterPlayerService = game:GetService("StarterPlayer")
local serverUtilModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Server.ServerUtil)

return function()
	-- upvalues: playerScriptStatusProperty (ref), starterPlayerService (ref), serverUtilModule (ref), runService (ref), list (ref), allowLuobuFreecamGroup (ref), policyService (ref), list_1 (ref), playersService (ref)
	local function WaitForChildOfClass(p1, p2)
		local var1 = p1:FindFirstChildOfClass(p2)
		while not var1 or var1.ClassName ~= p2 do
			var1 = p1.ChildAdded:Wait()
		end
		return var1
	end
	
	local function AddFreeCamera(p3)
		-- upvalues: WaitForChildOfClass (ref), playerScriptStatusProperty (copy), starterPlayerService (copy), serverUtilModule (copy)
		local var2
		local var3 = WaitForChildOfClass(p3, "PlayerGui")
		local _ = nil
		
		if playerScriptStatusProperty then
			local playerModuleStatus = starterPlayerService.PlayerModuleStatus
			var2 = script.Parent:WaitForChild(if if playerModuleStatus ~= 1 then playerModuleStatus == 2 else true then "FreeCameraIAS" else "FreeCamera")
		else
			var2 = script.Parent:WaitForChild("FreeCamera")
		end
		local freecam = Instance.new("ScreenGui")
		freecam.Name = "Freecam"
		freecam.ResetOnSpawn = false
		local freecamScript = Instance.new("LocalScript")
		freecamScript.Name = "FreecamScript"
		
		if serverUtilModule.getFFlagServerCoreScriptSourceCode() then
			freecamScript.Source = serverUtilModule.getSourceForServerScript(var2)
		else
			freecamScript.Source = var2.Source
		end
		freecamScript.Parent = freecam
		freecam.Parent = var3
	end
	
	local function ShouldAddFreeCam(p3)
		-- upvalues: runService (copy), list (copy), allowLuobuFreecamGroup (copy), policyService (copy), list_1 (copy)
		if runService:IsStudio() then
			return true
		elseif p3.UserId <= 0 then
			return false
		end
		local ok, status = pcall(p3.GetCanManageAsync, p3)
		
		if ok and status then
			return true
		end
		local status_1
		for i, v in ipairs(list) do
			ok_1, status_1 = pcall(p3.IsInGroup, p3, v)
			
			if ok_1 and status_1 then
				return true
			end
		end
		if allowLuobuFreecamGroup and game:GetEngineFeature("LuobuModerationStatus") and policyService.IsLuobuServer == Enum.TriStateBoolean.True then
			for i, v_1 in ipairs(list_1) do
				ok_1, status_1 = pcall(p3.IsInGroup, p3, v_1)
				
				if ok_1 and status_1 then
					return true
				end
			end
		end
		return false
	end
	
	local function PlayerAdded(p4)
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