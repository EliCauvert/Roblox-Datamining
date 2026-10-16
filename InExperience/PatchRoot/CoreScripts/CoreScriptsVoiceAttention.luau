local Players = game:GetService("Players")
local _ = game:GetService("CorePackages")
local FaceAnimatorService = game:GetService("FaceAnimatorService")
require(game:GetService("CoreGui").RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default.participantsUpdate.Event:Connect(function(List) --[[ Line: 14 ]]
	-- upvalues: Players (copy)
	for UserId, value in pairs(List) do
		local Player = Players:GetPlayerByUserId(UserId)
		
		if Player then
			Player:SetAttribute("RBXAttentionVoiceIsActive", value.isSignalActive)
		end
	end
end)

local function setLocalPlayerVideoAnimationEnabled() --[[ Line: 23 ]]
	-- upvalues: Players (copy), FaceAnimatorService (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer then
		LocalPlayer:SetAttribute("RBXAttentionVideoAnimationEnabled", FaceAnimatorService.VideoAnimationEnabled)
	end
end

local LocalPlayer = Players.LocalPlayer

if LocalPlayer then
	LocalPlayer:SetAttribute("RBXAttentionVideoAnimationEnabled", FaceAnimatorService.VideoAnimationEnabled)
end
FaceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(setLocalPlayerVideoAnimationEnabled)