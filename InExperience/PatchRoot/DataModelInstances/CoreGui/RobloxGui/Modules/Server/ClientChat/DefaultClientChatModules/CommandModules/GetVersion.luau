local utilModule = require(script.Parent:WaitForChild("Util"))
local chatConstantsModule = require(script.Parent.Parent:WaitForChild("ChatConstants"))

return {
	[utilModule.KEY_COMMAND_PROCESSOR_TYPE] = utilModule.COMPLETED_MESSAGE_PROCESSOR,
	[utilModule.KEY_PROCESSOR_FUNCTION] = function(p0, p1, _)
		-- upvalues: utilModule (ref), chatConstantsModule (ref)
		if string.sub(p0, 1, 8):lower() == "/version" or string.sub(p0, 1, 9):lower() == "/version " then
			utilModule:SendSystemMessageToSelf(string.format("This experience is running chat version [%d.%d.%s].", chatConstantsModule.MajorVersion, chatConstantsModule.MinorVersion, chatConstantsModule.BuildVersion), p1:GetCurrentChannel(), {})
			
			return true
		end
		return false
	end
}