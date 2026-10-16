local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local PlayerViewService = game:GetService("PlayerViewService")
local Timeout = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.GetFIntPlayerViewRemoteEventTimeout)()
local RequestDeviceCameraCFrame = RobloxReplicatedStorage:WaitForChild("RequestDeviceCameraCFrame", Timeout)
local ReplicateDeviceCameraCFrame = RobloxReplicatedStorage:WaitForChild("ReplicateDeviceCameraCFrame", Timeout)
local PlayerViewRemoteEventSupportEngineFeature = game:GetEngineFeature("PlayerViewRemoteEventSupport")

if RequestDeviceCameraCFrame and ReplicateDeviceCameraCFrame then
	ReplicateDeviceCameraCFrame.OnClientEvent:Connect(function(Player, p1, Timestamp) --[[ Line: 19 ]]
		-- upvalues: PlayerViewRemoteEventSupportEngineFeature (copy), PlayerViewService (copy)
		if PlayerViewRemoteEventSupportEngineFeature then
			PlayerViewService:UpdateDeviceCFrame(Player, p1, Timestamp)
		end
	end)
	RequestDeviceCameraCFrame.OnClientEvent:Connect(function() --[[ Line: 24 ]]
		-- upvalues: PlayerViewRemoteEventSupportEngineFeature (copy), PlayerViewService (copy)
		if PlayerViewRemoteEventSupportEngineFeature then
			PlayerViewService:OnCameraCFrameReplicationRequest()
		end
	end)
	
	return
else
	warn("PlayerViewService failed to initialize.")
end