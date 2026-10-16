local UtilModule = require(script.Parent:WaitForChild("Util"))

function ProcessMessage(Text: string, p1, _): boolean --[[ Line: 8 ]]
	if string.sub(Text, 1, 4):lower() ~= "/cls" and string.sub(Text, 1, 6):lower() ~= "/clear" then
		return false
	end
	local CurrentChannel = p1:GetCurrentChannel()
	
	if CurrentChannel then
		CurrentChannel:ClearMessageLog()
	end
	return true
end

return {
	[UtilModule.KEY_COMMAND_PROCESSOR_TYPE] = UtilModule.COMPLETED_MESSAGE_PROCESSOR,
	[UtilModule.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}