local utilModule = require(script.Parent:WaitForChild("Util"))

function ProcessMessage(p0, p1, _) --[[ line: 8 ]]
	if string.sub(p0, 1, 4):lower() ~= "/cls" and string.sub(p0, 1, 6):lower() ~= "/clear" then
		return false
	end
	local currentChannel = p1:GetCurrentChannel()
	
	if currentChannel then
		currentChannel:ClearMessageLog()
	end
	return true
end

return {
	[utilModule.KEY_COMMAND_PROCESSOR_TYPE] = utilModule.COMPLETED_MESSAGE_PROCESSOR,
	[utilModule.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}