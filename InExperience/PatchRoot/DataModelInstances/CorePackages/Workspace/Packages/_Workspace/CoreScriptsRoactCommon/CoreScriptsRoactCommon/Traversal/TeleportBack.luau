local teleportService = game:GetService("TeleportService")
local useTeleportedPlacesBackHistory2EngineFeature = game:GetEngineFeature("UseTeleportedPlacesBackHistory2")
local isRunningInStudio = require(script:FindFirstAncestor("CoreScriptsRoactCommon").Parent.AppCommonLib).isRunningInStudio
local fFlagUseLocalTraversalHistory = require(script.Parent.Flags).FFlagUseLocalTraversalHistory
local teleportBackAttemptLimit = game:DefineFastInt("TeleportBackAttemptLimit", 5)
local teleportBackRetryDelay = game:DefineFastInt("TeleportBackRetryDelay", 1)

return function(p1)
	-- upvalues: isRunningInStudio (ref), fFlagUseLocalTraversalHistory (ref), useTeleportedPlacesBackHistory2EngineFeature (ref), teleportService (ref), teleportBackRetryDelay (ref), teleportBackAttemptLimit (ref)
	if isRunningInStudio() then
		warn("Teleporting is not supported in Studio")
		
		return
	end
	local var1, var2
	local var3 = 0
	local _ = nil
	local _ = nil
	repeat
		local ok, status = pcall(function()
			-- upvalues: fFlagUseLocalTraversalHistory (copy), useTeleportedPlacesBackHistory2EngineFeature (copy), p1 (ref), teleportService (copy)
			return if (fFlagUseLocalTraversalHistory or useTeleportedPlacesBackHistory2EngineFeature) and p1 then teleportService:TeleportTrustedBackHistory(p1) else teleportService:TeleportTrustedBackForth(false)
		end)
		var1 = ok
		var2 = status
		var3 += 1
		if not var1 then
			task.wait(teleportBackRetryDelay)
		end
	until var1 or var3 == teleportBackAttemptLimit
	if not var1 then
		warn(var2)
	end
	return var1, var2
end