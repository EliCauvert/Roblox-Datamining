local _ = require(script:FindFirstAncestor("AppChat").Parent.AppChatNetworking)
local BuildValidMessagesModule = require(script.Parent.buildValidMessages)
local IngestBatchModule = require(script.Parent.ingestBatch)
local IngestOperationModule = require(script.Parent.IngestOperation)

return function(p1, p2) --[[ Line: 22 | Named "ingestNewerMessages" ]]
	-- upvalues: BuildValidMessagesModule (copy), IngestBatchModule (copy), IngestOperationModule (copy)
	return IngestBatchModule(p1, BuildValidMessagesModule(p1, p2), IngestOperationModule.Prepend)
end