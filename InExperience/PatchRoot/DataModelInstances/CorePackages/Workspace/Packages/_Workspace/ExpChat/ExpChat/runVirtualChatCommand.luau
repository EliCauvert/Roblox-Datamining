local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local sharedFlagsModule = require(parent.SharedFlags)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local universeChatSystemMessageAddedModule = require(expChat.Actions.UniverseChatSystemMessageAdded)
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore
local analytics = expChatSharedModule.Analytics
local fFlagExpChatReportVirtualCommandTelemetry = expChatSharedModule.Flags.FFlagExpChatReportVirtualCommandTelemetry
local context = expChatSharedModule.context
local var6 = expChatSharedModule.Logger:new("ExpChat/" .. script.Name)

return function(p0, p1, p2, p3)
	-- upvalues: context (ref), var6 (ref), fFlagExpChatReportVirtualCommandTelemetry (ref), analytics (ref), fFlagExpChatUseMessagesStore (ref), getMessagesStoreModule (ref), fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref), universeChatSystemMessageAddedModule (ref)
	if not context.translator then
		var6:warning("context.translator is nil, cannot execute command")
		
		return false
	end
	for i, v in ipairs(p2) do
		for i_1, v_1 in ipairs(v.alias) do
			if p0 == v_1 or string.find(p0, "^" .. v_1 .. "%s") ~= nil then
				if fFlagExpChatReportVirtualCommandTelemetry then
					analytics:reportTextChatCommandClientSent(v.name)
				end
				task.spawn(function()
					-- upvalues: v (ref), context (copy), p1 (ref), p0 (ref), fFlagExpChatUseMessagesStore (copy), getMessagesStoreModule (copy), p3 (ref), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy), universeChatSystemMessageAddedModule (copy)
					local var7 = v.clientRun(context.store, p1, p0, context)
					
					if var7 ~= nil then
						local key = var7.key
						local joined = nil
						
						if type(key) == "string" and key ~= "" then
							joined = context.translator:FormatByKey(key, var7.args)
						elseif type(key) == "table" and #key > 0 then
							local t = {}
							
							for i, v_1 in key do
								table.insert(t, context.translator:FormatByKey(v_1, var7.args))
							end
							joined = table.concat(t, "\n")
						end
						if joined then
							if fFlagExpChatUseMessagesStore then
								getMessagesStoreModule(false).addSystemMessage(joined, p3, var7.metadata)
								
								if fFlagExpChatUseChannelTabsStore then
									getChannelTabsStoreModule(false).markChannelUnread(p3)
									
									return
								end
							else
								context.store:dispatch(universeChatSystemMessageAddedModule(joined, p3, var7.metadata))
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