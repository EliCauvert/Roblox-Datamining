local utilModule = require(script.Parent:WaitForChild("Util"))

function ProcessMessage(p1, p2, _)
	if string.sub(p1, 1, 4):lower() ~= "/cls" and string.sub(p1, 1, 6):lower() ~= "/clear" then
		return false
	end
	local currentChannel = p2:GetCurrentChannel()
	
	if currentChannel then
		currentChannel:ClearMessageLog()
	end
	return true
end

return {
	[utilModule.KEY_COMMAND_PROCESSOR_TYPE] = utilModule.COMPLETED_MESSAGE_PROCESSOR,
	[utilModule.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}