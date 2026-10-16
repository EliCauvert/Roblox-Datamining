local TeleportService = game:GetService("TeleportService")
local UseTeleportedPlacesBackHistory2EngineFeature = game:GetEngineFeature("UseTeleportedPlacesBackHistory2")
local IsRunningInStudioFunction = require(script:FindFirstAncestor("CoreScriptsRoactCommon").Parent.AppCommonLib).isRunningInStudio
local FFlagUseLocalTraversalHistory = require(script.Parent.Flags).FFlagUseLocalTraversalHistory
local TeleportBackAttemptLimit = game:DefineFastInt("TeleportBackAttemptLimit", 5)
local TeleportBackRetryDelay = game:DefineFastInt("TeleportBackRetryDelay", 1)

return function(PlaceId) --[[ Line: 17 | Named "TeleportBack" ]]
	-- upvalues: IsRunningInStudioFunction (copy), FFlagUseLocalTraversalHistory (copy), UseTeleportedPlacesBackHistory2EngineFeature (copy), TeleportService (copy), TeleportBackRetryDelay (copy), TeleportBackAttemptLimit (copy)
	if IsRunningInStudioFunction() then
		warn("Teleporting is not supported in Studio")
		
		return
	end
	local Count = 0
	local Success = nil
	local Result = nil
	repeat
		Success, Result = pcall(function() --[[ Line: 27 ]]
			-- upvalues: FFlagUseLocalTraversalHistory (upval), UseTeleportedPlacesBackHistory2EngineFeature (upval), PlaceId (copy), TeleportService (upval)
			return if (FFlagUseLocalTraversalHistory or UseTeleportedPlacesBackHistory2EngineFeature) and PlaceId then TeleportService:TeleportTrustedBackHistory(PlaceId) else TeleportService:TeleportTrustedBackForth(false)
		end)
		Count += 1
		if not Success then
			task.wait(TeleportBackRetryDelay)
		end
	until Success or Count == TeleportBackAttemptLimit
	if not Success then
		warn(Result)
	end
	return Success, Result
end