local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local SwitchServer = script:FindFirstAncestor("SwitchServer")
local Parent = SwitchServer.Parent
local SignalsModule = require(Parent.Signals)
local SwitchServerTelemetryModule = require(SwitchServer.Telemetry.SwitchServerTelemetry)
local STANDARDSERVER = require(Parent.CoreScriptsCommon).Constants.STANDARD_SERVER

local function _(p1)
	-- upvalues: RunService (copy), Players (copy), RobloxReplicatedStorage (copy), STANDARDSERVER (copy)
	task.spawn(function()
		-- upvalues: RunService (upval), Players (upval), RobloxReplicatedStorage (upval), STANDARDSERVER (upval), p1 (copy)
		if RunService:IsStudio() or not game:GetEngineFeature("GameIdToExcludeAvailable") or Players.MaxPlayers == 1 then return end
		local GetServerType = RobloxReplicatedStorage:WaitForChild("GetServerType", 2)
		
		if not GetServerType then return end
		local Success, Result = pcall(function()
			-- upvalues: GetServerType (copy)
			return GetServerType:InvokeServer()
		end)
		
		if Success then
			p1(Result == STANDARDSERVER)
		end
	end)
end

return function()
	-- upvalues: SignalsModule (copy), RunService (copy), Players (copy), RobloxReplicatedStorage (copy), STANDARDSERVER (copy), SwitchServerTelemetryModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	task.spawn(function()
		-- upvalues: RunService (upval), Players (upval), RobloxReplicatedStorage (upval), STANDARDSERVER (upval), Signal2 (copy)
		if RunService:IsStudio() or not game:GetEngineFeature("GameIdToExcludeAvailable") or Players.MaxPlayers == 1 then return end
		local GetServerType = RobloxReplicatedStorage:WaitForChild("GetServerType", 2)
		
		if not GetServerType then return end
		local Success, Result = pcall(function()
			-- upvalues: GetServerType (copy)
			return GetServerType:InvokeServer()
		end)
		
		if Success then
			Signal2(Result == STANDARDSERVER)
		end
	end)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	
	return {
		shouldEnableSwitchServer = Signal,
		isConfirmationOpen = Signal1,
		setConfirmationOpen = function(p1)
			-- upvalues: SwitchServerTelemetryModule (upval), Signal2_1 (copy)
			if p1 then
				SwitchServerTelemetryModule.sendSwitchServerButtonActions({ event_type = "click" })
			end
			Signal2_1(p1)
		end
	}
end