local _ = require(script:FindFirstAncestor("AppChat").Parent.AppChatNetworking)
local buildValidMessagesModule = require(script.Parent.buildValidMessages)
local ingestBatchModule = require(script.Parent.ingestBatch)
local ingestOperationModule = require(script.Parent.IngestOperation)

return function(p0, p1, p2) --[[ line: 23 | named "ingestOlderMessages" ]]
	-- upvalues: buildValidMessagesModule (ref), ingestBatchModule (ref), ingestOperationModule (ref)
	return ingestBatchModule(p0, buildValidMessagesModule(p0, p1), ingestOperationModule.AppendAndAdvanceCursor, p2)
end