local _ = require(script:FindFirstAncestor("AppChat").Parent.AppChatNetworking)
local BuildValidMessagesModule = require(script.Parent.buildValidMessages)
local IngestBatchModule = require(script.Parent.ingestBatch)
local IngestOperationModule = require(script.Parent.IngestOperation)

return function(p1, p2, p3) --[[ Line: 23 | Named "ingestOlderMessages" ]]
	-- upvalues: BuildValidMessagesModule (copy), IngestBatchModule (copy), IngestOperationModule (copy)
	return IngestBatchModule(p1, BuildValidMessagesModule(p1, p2), IngestOperationModule.AppendAndAdvanceCursor, p3)
end