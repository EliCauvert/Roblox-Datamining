local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local sharedFlagsModule = require(parent.SharedFlags)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local universeChatSystemMessageAddedModule = require(expChat.Actions.UniverseChatSystemMessageAdded)
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore
local context = expChatSharedModule.context
local globalCommands = expChatSharedModule.GlobalCommands
local var1 = expChatSharedModule.Logger:new("ExpChat/" .. script.Name)

return function(p1, p2)
	-- upvalues: context (ref), var1 (ref), globalCommands (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref), universeChatSystemMessageAddedModule (ref)
	if not context.translator then
		var1:warning("context.translator is nil, cannot execute command")
		
		return false
	end
	for i, v in ipairs(globalCommands.getGlobalEnabledCommands()) do
		for i_1, v_1 in ipairs(v.alias) do
			if p1 == v_1 or string.find(p1, "^" .. v_1 .. "%s") ~= nil then
				local var2 = v.clientRun(context.store, p2, p1, context)
				
				if var2 ~= nil then
					local key = var2.key
					local joined = nil
					
					if type(key) == "string" and key ~= "" then
						joined = context.translator:FormatByKey(key, var2.args)
					elseif type(key) == "table" and #key > 0 then
						local t = {}
						
						for i_2, v_2 in key do
							table.insert(t, context.translator:FormatByKey(v_2, var2.args))
						end
						joined = table.concat(t, "\n")
					end
					if joined then
						if fFlagExpChatUseMessagesStore then
							getMessagesStoreModule(false).addSystemMessage(joined, "RBXGlobal")
							
							if fFlagExpChatUseChannelTabsStore then
								getChannelTabsStoreModule(false).markChannelUnread("RBXGlobal")
							end
						else
							context.store:dispatch(universeChatSystemMessageAddedModule(joined, "RBXGlobal"))
						end
					end
				end
				return true
			end
		end
	end
	return false
end