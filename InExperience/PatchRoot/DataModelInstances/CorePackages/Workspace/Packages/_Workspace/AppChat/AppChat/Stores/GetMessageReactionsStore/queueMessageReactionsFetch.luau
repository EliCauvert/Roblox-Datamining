local AppChat = script:FindFirstAncestor("AppChat")
local PromiseModule = require(AppChat.Parent.Promise)
local FIntAppChatReactionsRefetchDebounceMsModule = require(AppChat.Flags.FIntAppChatReactionsRefetchDebounceMs)
local FetchMessageReactionsModule = require(script.Parent.fetchMessageReactions)
local t = {}

local function fetchBatch(Key, MessageIds)
	-- upvalues: t (copy), FetchMessageReactionsModule (copy), PromiseModule (copy)
	t[Key] = nil
	local List = {}
	
	for i = 1, #MessageIds, 20 do
		table.insert(List, FetchMessageReactionsModule(Key, table.move(MessageIds, i, math.min(i + 20 - 1, #MessageIds), 1, {})))
	end
	return PromiseModule.all(List)
end

return function(Key, Value)
	-- upvalues: t (copy), PromiseModule (copy), FIntAppChatReactionsRefetchDebounceMsModule (copy), fetchBatch (copy)
	local Entry = t[Key]
	
	if Entry == nil then
		local MessageIds = {}
		local config = {
			messageIds = MessageIds,
			promise = PromiseModule.new(function(p1)
				-- upvalues: FIntAppChatReactionsRefetchDebounceMsModule (upval)
				task.delay(FIntAppChatReactionsRefetchDebounceMsModule / 1000, p1)
			end):andThen(function()
				-- upvalues: fetchBatch (upval), Key (copy), MessageIds (copy)
				return fetchBatch(Key, MessageIds)
			end)
		}
		t[Key] = config
		Entry = config
	end
	if not table.find(Entry.messageIds, Value) then
		table.insert(Entry.messageIds, Value)
	end
	return Entry.promise
end