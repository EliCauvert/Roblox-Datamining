local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ExpChatSharedModule = require(CorePackages.Workspace.Packages.ExpChatShared)
local ReactModule = require(CorePackages.Packages.React)
local FFlagExpChatUseMessagesStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagExpChatUseMessagesStore
local UseExpChatMessagesReducerSliceFunction = require(CorePackages.Workspace.Packages.ExpChat).Hooks.useExpChatMessagesReducerSlice

return function()
	-- upvalues: FFlagExpChatUseMessagesStore (copy), ExpChatSharedModule (copy), UseExpChatMessagesReducerSliceFunction (copy), ReactModule (copy), CryoModule (copy)
	local ByMessageId = nil
	local WindowMessagesInOrder = nil
	
	if FFlagExpChatUseMessagesStore then
		local MessagesStore = ExpChatSharedModule.context.messagesStore
		
		if not MessagesStore then
			return {}
		end
		ByMessageId = MessagesStore.getByMessageId(false) or {}
		WindowMessagesInOrder = MessagesStore.getWindowMessagesInOrder(false) or {}
	else
		local UseExpChatMessagesReducerSliceResult = UseExpChatMessagesReducerSliceFunction()
		
		if not UseExpChatMessagesReducerSliceResult then
			return {}
		end
		ByMessageId = UseExpChatMessagesReducerSliceResult.byMessageId
		WindowMessagesInOrder = UseExpChatMessagesReducerSliceResult.windowMessagesInOrder
	end
	return ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), WindowMessagesInOrder (ref), ByMessageId (ref)
		return CryoModule.List.map(WindowMessagesInOrder, function(p1)
			-- upvalues: ByMessageId (upval)
			return ByMessageId[p1]
		end)
	end, { ByMessageId, WindowMessagesInOrder })
end