local UtilModule = require(script.Parent:WaitForChild("Util"))
local RunService = game:GetService("RunService")
local ChatLocalizationModule = nil
pcall(function() --[[ Line: 12 ]]
	-- upvalues: ChatLocalizationModule (ref)
	ChatLocalizationModule = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if ChatLocalizationModule == nil then
	ChatLocalizationModule = {
		Get = function(_, _, p1) --[[ Line: 13 ]]
			return p1
		end
	}
end
function ProcessMessage(_, p1, _): boolean --[[ Line: 15 ]]
	-- upvalues: RunService (copy), UtilModule (copy), ChatLocalizationModule (ref)
	local LocalPlayer = game:GetService("Players").LocalPlayer
	
	if not LocalPlayer or LocalPlayer.UserId >= 0 or RunService:IsStudio() then
		return false
	end
	local CurrentChannel = p1:GetCurrentChannel()
	
	if CurrentChannel then
		UtilModule:SendSystemMessageToSelf(ChatLocalizationModule:Get("GameChat_SwallowGuestChat_Message", "Create a free account to get access to chat permissions!"), CurrentChannel, {})
	end
	return true
end

return {
	[UtilModule.KEY_COMMAND_PROCESSOR_TYPE] = UtilModule.COMPLETED_MESSAGE_PROCESSOR,
	[UtilModule.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}