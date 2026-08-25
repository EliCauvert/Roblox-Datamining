local playersService = game:GetService("Players")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local constants = require(game:GetService("CorePackages").Workspace.Packages.VoiceChat).Constants
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local var2 = require(robloxGui.Modules.SelfView.Analytics).new()

return function(p0, p1, p2)
	-- upvalues: playersService (ref), constants (ref), default (ref), var2 (ref)
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		if p0 == tostring(localPlayer.UserId) then
			if p1 == constants.VOICE_STATE.ERROR then
				default:RejoinPreviousChannel()
				
				return
			elseif p1 == constants.VOICE_STATE.CONNECTING then
				default:ShowVoiceChatLoadingMessage()
				
				return
			end
			var2:setLastCtx("bubbleChatToggle")
			default:ToggleMic(p2)
			
			return
		else
			default:ToggleMutePlayer(tonumber(p0), p2)
		end
	end
end