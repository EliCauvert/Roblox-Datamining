local playersService = game:GetService("Players")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local constants = require(game:GetService("CorePackages").Workspace.Packages.VoiceChat).Constants
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local var1 = require(robloxGui.Modules.SelfView.Analytics).new()

return function(p1, p2, p3)
	-- upvalues: playersService (ref), constants (ref), default (ref), var1 (ref)
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		if p1 == tostring(localPlayer.UserId) then
			if p2 == constants.VOICE_STATE.ERROR then
				default:RejoinPreviousChannel()
				
				return
			elseif p2 == constants.VOICE_STATE.CONNECTING then
				default:ShowVoiceChatLoadingMessage()
				
				return
			end
			var1:setLastCtx("bubbleChatToggle")
			default:ToggleMic(p3)
			
			return
		else
			default:ToggleMutePlayer(tonumber(p1), p3)
		end
	end
end