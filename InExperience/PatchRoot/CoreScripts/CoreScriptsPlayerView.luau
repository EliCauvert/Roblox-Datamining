local coreGuiService = game:GetService("CoreGui")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local playerViewService = game:GetService("PlayerViewService")
local var1 = require(coreGuiService:WaitForChild("RobloxGui").Modules.Flags.GetFIntPlayerViewRemoteEventTimeout)()
local requestDeviceCameraCFrame = robloxReplicatedStorageService:WaitForChild("RequestDeviceCameraCFrame", var1)
local replicateDeviceCameraCFrame = robloxReplicatedStorageService:WaitForChild("ReplicateDeviceCameraCFrame", var1)
local playerViewRemoteEventSupportEngineFeature = game:GetEngineFeature("PlayerViewRemoteEventSupport")

if requestDeviceCameraCFrame and replicateDeviceCameraCFrame then
	replicateDeviceCameraCFrame.OnClientEvent:Connect(function(p1, p2, p3)
		-- upvalues: playerViewRemoteEventSupportEngineFeature (ref), playerViewService (ref)
		if playerViewRemoteEventSupportEngineFeature then
			playerViewService:UpdateDeviceCFrame(p1, p2, p3)
		end
	end)
	requestDeviceCameraCFrame.OnClientEvent:Connect(function()
		-- upvalues: playerViewRemoteEventSupportEngineFeature (ref), playerViewService (ref)
		if playerViewRemoteEventSupportEngineFeature then
			playerViewService:OnCameraCFrameReplicationRequest()
		end
	end)
	
	return
end
warn("PlayerViewService failed to initialize.")