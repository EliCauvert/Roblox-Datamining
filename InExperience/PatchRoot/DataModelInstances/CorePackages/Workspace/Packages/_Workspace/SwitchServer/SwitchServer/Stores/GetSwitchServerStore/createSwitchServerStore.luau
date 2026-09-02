local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local switchServer = script:FindFirstAncestor("SwitchServer")
local parent = switchServer.Parent
local coreScriptsCommonModule = require(parent.CoreScriptsCommon)
local signalsModule = require(parent.Signals)
local switchServerTelemetryModule = require(switchServer.Telemetry.SwitchServerTelemetry)
local STANDARD_SERVER = coreScriptsCommonModule.Constants.STANDARD_SERVER

local function _(p1)
	-- upvalues: runService (ref), playersService (ref), robloxReplicatedStorageService (ref), STANDARD_SERVER (ref)
	task.spawn(function()
		-- upvalues: runService (copy), playersService (copy), robloxReplicatedStorageService (copy), STANDARD_SERVER (copy), p1 (ref)
		if runService:IsStudio() or not game:GetEngineFeature("GameIdToExcludeAvailable") or playersService.MaxPlayers == 1 then return end
		local getServerType = robloxReplicatedStorageService:WaitForChild("GetServerType", 2)
		
		if not getServerType then return end
		local ok, status = pcall(function()
			-- upvalues: getServerType (ref)
			return getServerType:InvokeServer()
		end)
		
		if ok then
			p1(status == STANDARD_SERVER)
		end
	end)
end

return function()
	-- upvalues: signalsModule (ref), runService (ref), playersService (ref), robloxReplicatedStorageService (ref), STANDARD_SERVER (ref), switchServerTelemetryModule (ref)
	local var1, var2 = signalsModule.createSignal(false)
	task.spawn(function()
		-- upvalues: runService (copy), playersService (copy), robloxReplicatedStorageService (copy), STANDARD_SERVER (copy), var2 (ref)
		if runService:IsStudio() or not game:GetEngineFeature("GameIdToExcludeAvailable") or playersService.MaxPlayers == 1 then return end
		local getServerType = robloxReplicatedStorageService:WaitForChild("GetServerType", 2)
		
		if not getServerType then return end
		local ok, status = pcall(function()
			-- upvalues: getServerType (ref)
			return getServerType:InvokeServer()
		end)
		
		if ok then
			var2(status == STANDARD_SERVER)
		end
	end)
	local var3, var4 = signalsModule.createSignal(false)
	
	return {
		shouldEnableSwitchServer = var1,
		isConfirmationOpen = var3,
		setConfirmationOpen = function(p1)
			-- upvalues: switchServerTelemetryModule (copy), var4 (ref)
			if p1 then
				switchServerTelemetryModule.sendSwitchServerButtonActions({ event_type = "click" })
			end
			var4(p1)
		end
	}
end