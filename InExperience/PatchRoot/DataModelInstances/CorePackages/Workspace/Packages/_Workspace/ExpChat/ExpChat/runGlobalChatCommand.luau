local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local FFlagExpChatUseChannelTabsStore = require(Parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local Context = ExpChatSharedModule.context
local GlobalCommands = ExpChatSharedModule.GlobalCommands
local NewResult = ExpChatSharedModule.Logger:new("ExpChat/" .. script.Name)

return function(Text: string, p1): boolean --[[ Line: 16 ]]
	-- upvalues: Context (copy), NewResult (copy), GlobalCommands (copy), GetMessagesStoreModule (copy), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy)
	if not Context.translator then
		NewResult:warning("context.translator is nil, cannot execute command")
		
		return false
	end
	for _, value in ipairs(GlobalCommands.getGlobalEnabledCommands()) do
		for _, alia in ipairs(value.alias) do
			if Text == alia or string.find(Text, "^" .. alia .. "%s") ~= nil then
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
						GetMessagesStoreModule(false).addSystemMessage(FormatByKeyResult, "RBXGlobal")
						
						if FFlagExpChatUseChannelTabsStore then
							GetChannelTabsStoreModule(false).markChannelUnread("RBXGlobal")
						end
					end
				end
				return true
			end
		end
	end
	return false
end