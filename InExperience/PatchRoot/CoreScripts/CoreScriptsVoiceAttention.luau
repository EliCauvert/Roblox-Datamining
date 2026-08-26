local playersService = game:GetService("Players")
local _ = game:GetService("CorePackages")
local faceAnimatorService = game:GetService("FaceAnimatorService")
require(game:GetService("CoreGui").RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default.participantsUpdate.Event:Connect(function(p1)
	-- upvalues: playersService (ref)
	for i, v in pairs(p1) do
		local var1 = playersService:GetPlayerByUserId(i)
		
		if var1 then
			var1:SetAttribute("RBXAttentionVoiceIsActive", v.isSignalActive)
		end
	end
end)

local function setLocalPlayerVideoAnimationEnabled()
	-- upvalues: playersService (ref), faceAnimatorService (ref)
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		localPlayer:SetAttribute("RBXAttentionVideoAnimationEnabled", faceAnimatorService.VideoAnimationEnabled)
	end
end

local localPlayer = playersService.LocalPlayer

if localPlayer then
	localPlayer:SetAttribute("RBXAttentionVideoAnimationEnabled", faceAnimatorService.VideoAnimationEnabled)
end
faceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(setLocalPlayerVideoAnimationEnabled)