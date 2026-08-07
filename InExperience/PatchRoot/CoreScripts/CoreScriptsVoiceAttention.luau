local playersService = game:GetService("Players")
local _ = game:GetService("CorePackages")
local faceAnimatorService = game:GetService("FaceAnimatorService")
require(game:GetService("CoreGui").RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default.participantsUpdate.Event:Connect(function(p0) --[[ line: 14 ]]
	-- upvalues: playersService (ref)
	for i, v in pairs(p0) do
		local var3 = playersService:GetPlayerByUserId(i)
		
		if var3 then
			var3:SetAttribute("RBXAttentionVoiceIsActive", v.isSignalActive)
		end
	end
end)

local function setLocalPlayerVideoAnimationEnabled() --[[ line: 23 ]]
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