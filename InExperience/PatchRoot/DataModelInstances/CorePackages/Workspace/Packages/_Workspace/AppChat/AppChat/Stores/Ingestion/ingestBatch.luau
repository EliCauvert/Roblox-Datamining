local appChat = script:FindFirstAncestor("AppChat")
local _ = require(appChat.MessageData.Types)
local getConversationMessageStoreModule = require(appChat.Stores.GetConversationMessageStore)
local getConversationMessageListStoreModule = require(appChat.Stores.GetConversationMessageListStore)
local ingestOperationModule = require(script.Parent.IngestOperation)

return function(p0, p1, p2, p3)
	-- upvalues: getConversationMessageStoreModule (ref), getConversationMessageListStoreModule (ref), ingestOperationModule (ref)
	local var4 = getConversationMessageStoreModule(false)
	local var5 = getConversationMessageListStoreModule(false)
	local t = {}
	local t_1 = {}
	
	for i, v in p1 do
		if v and v.id then
			t[v.id] = v
			table.insert(t_1, v.id)
		end
	end
	if next(t) ~= nil then
		var4.upsertMessages(t)
	end
	if p2 == ingestOperationModule.AppendAndAdvanceCursor then
		var5.receivePage(p0, t_1, p3)
		
		return t_1
	elseif p2 == ingestOperationModule.Append then
		if #t_1 > 0 then
			var5.appendMessages(p0, t_1)
			
			return t_1
		end
	elseif #t_1 > 0 then
		var5.prependMessages(p0, t_1)
	end
	return t_1
end