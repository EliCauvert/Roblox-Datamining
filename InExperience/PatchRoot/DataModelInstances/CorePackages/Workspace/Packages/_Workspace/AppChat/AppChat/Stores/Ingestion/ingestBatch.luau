local appChat = script:FindFirstAncestor("AppChat")
local _ = require(appChat.MessageData.Types)
local getConversationMessageStoreModule = require(appChat.Stores.GetConversationMessageStore)
local getConversationMessageListStoreModule = require(appChat.Stores.GetConversationMessageListStore)
local ingestOperationModule = require(script.Parent.IngestOperation)

return function(p1, p2, p3, p4)
	-- upvalues: getConversationMessageStoreModule (ref), getConversationMessageListStoreModule (ref), ingestOperationModule (ref)
	local var1 = getConversationMessageStoreModule(false)
	local var2 = getConversationMessageListStoreModule(false)
	local t = {}
	local t_1 = {}
	
	for i, v in p2 do
		if v and v.id then
			t[v.id] = v
			table.insert(t_1, v.id)
		end
	end
	if next(t) ~= nil then
		var1.upsertMessages(t)
	end
	if p3 == ingestOperationModule.AppendAndAdvanceCursor then
		var2.receivePage(p1, t_1, p4)
		
		return t_1
	elseif p3 == ingestOperationModule.Append then
		if #t_1 > 0 then
			var2.appendMessages(p1, t_1)
			
			return t_1
		end
	elseif #t_1 > 0 then
		var2.prependMessages(p1, t_1)
	end
	return t_1
end