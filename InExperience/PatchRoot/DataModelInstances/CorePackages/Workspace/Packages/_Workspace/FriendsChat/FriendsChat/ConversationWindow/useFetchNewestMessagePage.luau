local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local FetchMessagePageModule = require(Parent.AppChat.fetchMessagePage)
local FetchOlderMessagesModule = require(Parent.AppChat.fetchOlderMessages)
local GetConversationMessageListStoreModule = require(Parent.AppChat.GetConversationMessageListStore)
local FFlagFriendsChatPaginateOlderMessagesModule = require(FriendsChat.Flags.FFlagFriendsChatPaginateOlderMessages)
local NewResult = ExpChatSharedModule.Logger:new(script.Name)

local function _(p1)
	-- upvalues: GetConversationMessageListStoreModule (copy)
	local Metadata = GetConversationMessageListStoreModule(false).getMetadata(p1, false)
	
	return Metadata ~= nil and (Metadata.isLoading or (Metadata.nextPageCursor ~= nil or Metadata.fetchedOldest))
end

return function(p1, p2, p3): boolean
	-- upvalues: ReactModule (copy), FFlagFriendsChatPaginateOlderMessagesModule (copy), GetConversationMessageListStoreModule (copy), FetchOlderMessagesModule (copy), FetchMessagePageModule (copy), NewResult (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), FFlagFriendsChatPaginateOlderMessagesModule (upval), p1 (copy), GetConversationMessageListStoreModule (upval), FetchOlderMessagesModule (upval), FetchMessagePageModule (upval), NewResult (upval), p3 (copy), UseStateResult2 (copy)
		if not p2 then return end
		local Flag = false
		local MessagePageModule = nil
		repeat
			if FFlagFriendsChatPaginateOlderMessagesModule then
				local Metadata = GetConversationMessageListStoreModule(false).getMetadata(p1, false)
				
				if Metadata == nil or not Metadata.isLoading and (Metadata.nextPageCursor == nil and not Metadata.fetchedOldest) then
					MessagePageModule = FetchOlderMessagesModule(p1)
					break
				end
			end
			MessagePageModule = FetchMessagePageModule(p1, nil)
		until true
		MessagePageModule:catch(function(Err)
			-- upvalues: Flag (ref), NewResult (upval), p1 (upval)
			if not Flag then
				NewResult:warning(`Failed to fetch conversation messages for {p1}: {tostring(Err)}`)
			end
		end):finally(function()
			-- upvalues: Flag (ref), p3 (upval), UseStateResult2 (upval), p1 (upval)
			if not Flag and p3 then
				UseStateResult2(p1)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { p1, p2, p3 })
	
	return not p2 or (not p3 or UseStateResult == p1)
end