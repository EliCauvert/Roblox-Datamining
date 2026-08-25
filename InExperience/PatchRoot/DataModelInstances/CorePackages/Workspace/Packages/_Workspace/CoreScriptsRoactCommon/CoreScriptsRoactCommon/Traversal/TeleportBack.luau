local teleportService = game:GetService("TeleportService")
local useTeleportedPlacesBackHistory2EngineFeature = game:GetEngineFeature("UseTeleportedPlacesBackHistory2")
local isRunningInStudio = require(script:FindFirstAncestor("CoreScriptsRoactCommon").Parent.AppCommonLib).isRunningInStudio
local fFlagUseLocalTraversalHistory = require(script.Parent.Flags).FFlagUseLocalTraversalHistory
local teleportBackAttemptLimit = game:DefineFastInt("TeleportBackAttemptLimit", 5)
local teleportBackRetryDelay = game:DefineFastInt("TeleportBackRetryDelay", 1)

return function(p0)
	-- upvalues: isRunningInStudio (ref), fFlagUseLocalTraversalHistory (ref), useTeleportedPlacesBackHistory2EngineFeature (ref), teleportService (ref), teleportBackRetryDelay (ref), teleportBackAttemptLimit (ref)
	if isRunningInStudio() then
		warn("Teleporting is not supported in Studio")
		
		return
	end
	local var5, var6
	local var4 = 0
	local _ = nil
	local _ = nil
	repeat
		local ok, status = pcall(function()
			-- upvalues: fFlagUseLocalTraversalHistory (copy), useTeleportedPlacesBackHistory2EngineFeature (copy), p0 (ref), teleportService (copy)
			return if (fFlagUseLocalTraversalHistory or useTeleportedPlacesBackHistory2EngineFeature) and p0 then teleportService:TeleportTrustedBackHistory(p0) else teleportService:TeleportTrustedBackForth(false)
		end)
		var5 = ok
		var6 = status
		var4 += 1
		if not var5 then
			task.wait(teleportBackRetryDelay)
		end
	until var5 or var4 == teleportBackAttemptLimit
	if not var5 then
		warn(var6)
	end
	return var5, var6
end