local chatConstantsModule = require(script.Parent.Parent:WaitForChild("ChatConstants"))
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.SendSystemMessageToSelf(_, p1, p2, p3)
	-- upvalues: chatConstantsModule (ref)
	p2:AddMessageToChannel({
		ID = -1,
		FromSpeaker = nil,
		SpeakerUserId = 0,
		IsFiltered = true,
		OriginalChannel = p2.Name,
		MessageLength = string.len(p1),
		MessageLengthUtf8 = utf8.len(utf8.nfcnormalize(p1)),
		Message = p1,
		MessageType = chatConstantsModule.MessageTypeSystem,
		Time = os.time(),
		ExtraData = p3
	})
end

function t.new()
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.COMMAND_MODULES_VERSION = 1
	tbl.KEY_COMMAND_PROCESSOR_TYPE = "ProcessorType"
	tbl.KEY_PROCESSOR_FUNCTION = "ProcessorFunction"
	tbl.IN_PROGRESS_MESSAGE_PROCESSOR = 0
	tbl.COMPLETED_MESSAGE_PROCESSOR = 1
	
	return tbl
end

return t.new()