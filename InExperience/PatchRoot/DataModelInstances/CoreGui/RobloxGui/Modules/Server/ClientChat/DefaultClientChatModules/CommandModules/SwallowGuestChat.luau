local utilModule = require(script.Parent:WaitForChild("Util"))
local runService = game:GetService("RunService")
local t = nil
pcall(function()
	-- upvalues: t (write)
	t = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if t == nil then
	t = {
		Get = function(_, _, p0)
			return p0
		end
	}
end
function ProcessMessage(_, p1, _)
	-- upvalues: runService (ref), utilModule (ref), t (write)
	local localPlayer = game:GetService("Players").LocalPlayer
	
	if not localPlayer or localPlayer.UserId >= 0 or runService:IsStudio() then
		return false
	end
	local currentChannel = p1:GetCurrentChannel()
	
	if currentChannel then
		utilModule:SendSystemMessageToSelf(t:Get("GameChat_SwallowGuestChat_Message", "Create a free account to get access to chat permissions!"), currentChannel, {})
	end
	return true
end

return {
	[utilModule.KEY_COMMAND_PROCESSOR_TYPE] = utilModule.COMPLETED_MESSAGE_PROCESSOR,
	[utilModule.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}