local utilModule = require(script.Parent:WaitForChild("Util"))
local t = nil
pcall(function() --[[ line: 10 ]]
	-- upvalues: t (write)
	t = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)

if t == nil then
	t = {
		Get = function(_, _, p0) --[[ line: 11 ]]
			return p0
		end
	}
end
function ProcessMessage(p1, p2, p3) --[[ line: 13 ]]
	-- upvalues: utilModule (ref), t (write)
	if string.sub(p1, 1, 3):lower() ~= "/c " then
		return false
	end
	local substring = string.sub(p1, 4)
	local var3 = p2:GetChannel(substring)
	
	if var3 then
		p2:SwitchCurrentChannel(substring)
		
		if not p3.ShowChannelsBar and p2:GetCurrentChannel() then
			utilModule:SendSystemMessageToSelf(string.gsub(t:Get("GameChat_SwitchChannel_NowInChannel", string.format("You are now chatting in channel: '%s'", substring), { RBX_NAME = substring }), "{RBX_NAME}", substring), var3, {})
		end
	else
		local currentChannel = p2:GetCurrentChannel()
		
		if currentChannel then
			utilModule:SendSystemMessageToSelf(string.gsub(t:Get("GameChat_SwitchChannel_NotInChannel", string.format("You are not in channel: '%s'", substring), { RBX_NAME = substring }), "{RBX_NAME}", substring), currentChannel, { ChatColor = Color3.fromRGB(245, 50, 50) })
		end
	end
	return true
end

return {
	[utilModule.KEY_COMMAND_PROCESSOR_TYPE] = utilModule.COMPLETED_MESSAGE_PROCESSOR,
	[utilModule.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}