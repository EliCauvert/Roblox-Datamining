local ChatConstantsModule = require(script.Parent.Parent:WaitForChild("ChatConstants"))
local Module = {}
Module.__index = Module

function Module:SendSystemMessageToSelf(Text: string, p1, ExtraData)
	-- upvalues: ChatConstantsModule (copy)
	p1:AddMessageToChannel({
		ID = -1,
		FromSpeaker = nil,
		SpeakerUserId = 0,
		IsFiltered = true,
		OriginalChannel = p1.Name,
		MessageLength = string.len(Text),
		MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(Text)),
		Message = Text,
		MessageType = ChatConstantsModule.MessageTypeSystem,
		Time = os.time(),
		ExtraData = ExtraData
	})
end

return ({
	new = function()
		-- upvalues: Module (copy)
		local self = setmetatable({}, Module)
		self.COMMAND_MODULES_VERSION = 1
		self.KEY_COMMAND_PROCESSOR_TYPE = "ProcessorType"
		self.KEY_PROCESSOR_FUNCTION = "ProcessorFunction"
		self.IN_PROGRESS_MESSAGE_PROCESSOR = 0
		self.COMPLETED_MESSAGE_PROCESSOR = 1
		
		return self
	end
}).new()