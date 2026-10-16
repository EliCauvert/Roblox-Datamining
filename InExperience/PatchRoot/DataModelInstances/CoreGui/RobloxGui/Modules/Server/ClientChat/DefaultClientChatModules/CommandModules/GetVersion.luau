local UtilModule = require(script.Parent:WaitForChild("Util"))
local ChatConstantsModule = require(script.Parent.Parent:WaitForChild("ChatConstants"))

return {
	[UtilModule.KEY_COMMAND_PROCESSOR_TYPE] = UtilModule.COMPLETED_MESSAGE_PROCESSOR,
	[UtilModule.KEY_PROCESSOR_FUNCTION] = function(Text: string, p1, _): boolean --[[ Line: 9 ]]
		-- upvalues: UtilModule (copy), ChatConstantsModule (copy)
		if string.sub(Text, 1, 8):lower() == "/version" or string.sub(Text, 1, 9):lower() == "/version " then
			UtilModule:SendSystemMessageToSelf(string.format("This experience is running chat version [%d.%d.%s].", ChatConstantsModule.MajorVersion, ChatConstantsModule.MinorVersion, ChatConstantsModule.BuildVersion), p1:GetCurrentChannel(), {})
			
			return true
		else
			return false
		end
	end
}