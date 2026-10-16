local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local FFlagExpChatUseChannelTabsStore = require(Parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local Analytics = ExpChatSharedModule.Analytics
local FFlagExpChatReportVirtualCommandTelemetry = ExpChatSharedModule.Flags.FFlagExpChatReportVirtualCommandTelemetry
local Context = ExpChatSharedModule.context
local NewResult = ExpChatSharedModule.Logger:new("ExpChat/" .. script.Name)

return function(Text: string, p1, List, p2): boolean --[[ Line: 21 ]]
	-- upvalues: Context (copy), NewResult (copy), FFlagExpChatReportVirtualCommandTelemetry (copy), Analytics (copy), GetMessagesStoreModule (copy), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy)
	if not Context.translator then
		NewResult:warning("context.translator is nil, cannot execute command")
		
		return false
	end
	for _, value in ipairs(List) do
		for _, alia in ipairs(value.alias) do
			if Text == alia or string.find(Text, "^" .. alia .. "%s") ~= nil then
				if FFlagExpChatReportVirtualCommandTelemetry then
					Analytics:reportTextChatCommandClientSent(value.name)
				end
				task.spawn(function() --[[ Line: 38 ]]
					-- upvalues: value (copy), Context (upval), p1 (copy), Text (copy), GetMessagesStoreModule (upval), p2 (copy), FFlagExpChatUseChannelTabsStore (upval), GetChannelTabsStoreModule (upval)
					local ClientRunResult = value.clientRun(Context.store, p1, Text, Context)
					
					if ClientRunResult ~= nil then
						local Key = ClientRunResult.key
						local FormatByKeyResult = nil
						
						if type(Key) == "string" and Key ~= "" then
							FormatByKeyResult = Context.translator:FormatByKey(Key, ClientRunResult.args)
						elseif type(Key) == "table" and #Key > 0 then
							local List = {}
							
							for _, value1 in Key do
								table.insert(List, Context.translator:FormatByKey(value1, ClientRunResult.args))
							end
							FormatByKeyResult = table.concat(List, "\n")
						end
						if FormatByKeyResult then
							GetMessagesStoreModule(false).addSystemMessage(FormatByKeyResult, p2, ClientRunResult.metadata)
							
							if FFlagExpChatUseChannelTabsStore then
								GetChannelTabsStoreModule(false).markChannelUnread(p2)
							end
						end
					end
				end)
				
				return true
			end
		end
	end
	return false
end