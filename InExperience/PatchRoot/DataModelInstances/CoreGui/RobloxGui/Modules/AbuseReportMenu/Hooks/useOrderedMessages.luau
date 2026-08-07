local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local expChatSharedModule = require(corePackagesService.Workspace.Packages.ExpChatShared)
local reactModule = require(corePackagesService.Packages.React)
local fFlagExpChatUseMessagesStore = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagExpChatUseMessagesStore
local useExpChatMessagesReducerSlice = expChatModule.Hooks.useExpChatMessagesReducerSlice

return function() --[[ line: 13 | named "useOrderedMessages" ]]
	-- upvalues: fFlagExpChatUseMessagesStore (ref), expChatSharedModule (ref), useExpChatMessagesReducerSlice (ref), reactModule (ref), cryoModule (ref)
	local var5, var6
	local _ = nil
	local _ = nil
	
	if fFlagExpChatUseMessagesStore then
		local messagesStore = expChatSharedModule.context.messagesStore
		
		if not messagesStore then
			return {}
		end
		var5 = messagesStore.getByMessageId(false) or {}
		var6 = messagesStore.getWindowMessagesInOrder(false) or {}
	else
		local var7 = useExpChatMessagesReducerSlice()
		
		if not var7 then
			return {}
		end
		var5 = var7.byMessageId
		var6 = var7.windowMessagesInOrder
	end
	return reactModule.useMemo(function() --[[ line: 33 ]]
		-- upvalues: cryoModule (copy), var6 (write), var5 (write)
		return cryoModule.List.map(var6, function(p0) --[[ line: 34 ]]
			-- upvalues: var5 (copy)
			return var5[p0]
		end)
	end, { var5, var6 })
end