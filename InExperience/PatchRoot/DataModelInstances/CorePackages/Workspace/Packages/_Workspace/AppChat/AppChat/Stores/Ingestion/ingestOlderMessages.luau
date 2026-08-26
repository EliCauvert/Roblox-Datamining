local _ = require(script:FindFirstAncestor("AppChat").Parent.AppChatNetworking)
local buildValidMessagesModule = require(script.Parent.buildValidMessages)
local ingestBatchModule = require(script.Parent.ingestBatch)
local ingestOperationModule = require(script.Parent.IngestOperation)

return function(p1, p2, p3)
	-- upvalues: buildValidMessagesModule (ref), ingestBatchModule (ref), ingestOperationModule (ref)
	return ingestBatchModule(p1, buildValidMessagesModule(p1, p2), ingestOperationModule.AppendAndAdvanceCursor, p3)
end