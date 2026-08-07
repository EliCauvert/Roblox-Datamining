local coreGuiService = game:GetService("CoreGui")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local playerViewService = game:GetService("PlayerViewService")
local var3 = require(coreGuiService:WaitForChild("RobloxGui").Modules.Flags.GetFIntPlayerViewRemoteEventTimeout)()
local requestDeviceCameraCFrame = robloxReplicatedStorageService:WaitForChild("RequestDeviceCameraCFrame", var3)
local replicateDeviceCameraCFrame = robloxReplicatedStorageService:WaitForChild("ReplicateDeviceCameraCFrame", var3)
local playerViewRemoteEventSupportEngineFeature = game:GetEngineFeature("PlayerViewRemoteEventSupport")

if requestDeviceCameraCFrame and replicateDeviceCameraCFrame then
	replicateDeviceCameraCFrame.OnClientEvent:Connect(function(p0, p1, p2) --[[ line: 19 ]]
		-- upvalues: playerViewRemoteEventSupportEngineFeature (ref), playerViewService (ref)
		if playerViewRemoteEventSupportEngineFeature then
			playerViewService:UpdateDeviceCFrame(p0, p1, p2)
		end
	end)
	requestDeviceCameraCFrame.OnClientEvent:Connect(function() --[[ line: 24 ]]
		-- upvalues: playerViewRemoteEventSupportEngineFeature (ref), playerViewService (ref)
		if playerViewRemoteEventSupportEngineFeature then
			playerViewService:OnCameraCFrameReplicationRequest()
		end
	end)
	
	return
end
warn("PlayerViewService failed to initialize.")