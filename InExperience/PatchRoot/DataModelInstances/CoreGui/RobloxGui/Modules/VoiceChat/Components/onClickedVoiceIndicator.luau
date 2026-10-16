local Players = game:GetService("Players")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Constants = require(game:GetService("CorePackages").Workspace.Packages.VoiceChat).Constants
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local NewResult = require(RobloxGui.Modules.SelfView.Analytics).new()

return function(p1, CONNECTING, p2) --[[ Line: 11 ]]
	-- upvalues: Players (copy), Constants (copy), Default (copy), NewResult (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer then
		if p1 ~= tostring(LocalPlayer.UserId) then
			Default:ToggleMutePlayer(tonumber(p1), p2)
		elseif CONNECTING == Constants.VOICE_STATE.ERROR then
			Default:RejoinPreviousChannel()
			
			return
		else
			if CONNECTING == Constants.VOICE_STATE.CONNECTING then
				Default:ShowVoiceChatLoadingMessage()
				
				return
			else
				NewResult:setLastCtx("bubbleChatToggle")
				Default:ToggleMic(p2)
				
				return
			end
		end
	end
end