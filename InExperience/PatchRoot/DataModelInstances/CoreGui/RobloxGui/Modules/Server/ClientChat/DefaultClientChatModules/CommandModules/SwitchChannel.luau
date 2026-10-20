local UtilModule = require(script.Parent:WaitForChild("Util"))
local ChatLocalizationModule = nil
pcall(function()
	-- upvalues: ChatLocalizationModule (ref)
	ChatLocalizationModule = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if ChatLocalizationModule == nil then
	ChatLocalizationModule = {
		Get = function(_, _, Formatted)
			return Formatted
		end
	}
end
function ProcessMessage(Text: string, p1, p2): boolean
	-- upvalues: UtilModule (copy), ChatLocalizationModule (ref)
	if string.sub(Text, 1, 3):lower() ~= "/c " then
		return false
	end
	local Segment = string.sub(Text, 4)
	local Channel = p1:GetChannel(Segment)
	
	if Channel then
		p1:SwitchCurrentChannel(Segment)
		
		if not p2.ShowChannelsBar and p1:GetCurrentChannel() then
			UtilModule:SendSystemMessageToSelf(string.gsub(ChatLocalizationModule:Get("GameChat_SwitchChannel_NowInChannel", string.format("You are now chatting in channel: '%s'", Segment), { RBX_NAME = Segment }), "{RBX_NAME}", Segment), Channel, {})
		end
	else
		local CurrentChannel = p1:GetCurrentChannel()
		
		if CurrentChannel then
			UtilModule:SendSystemMessageToSelf(string.gsub(ChatLocalizationModule:Get("GameChat_SwitchChannel_NotInChannel", string.format("You are not in channel: '%s'", Segment), { RBX_NAME = Segment }), "{RBX_NAME}", Segment), CurrentChannel, { ChatColor = Color3.fromRGB(245, 50, 50) })
		end
	end
	return true
end

return {
	[UtilModule.KEY_COMMAND_PROCESSOR_TYPE] = UtilModule.COMPLETED_MESSAGE_PROCESSOR,
	[UtilModule.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}