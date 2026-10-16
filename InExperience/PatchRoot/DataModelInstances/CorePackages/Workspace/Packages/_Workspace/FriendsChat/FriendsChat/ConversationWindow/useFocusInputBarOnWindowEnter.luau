local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local GetFriendsChatNavigationStoreModule = require(FriendsChat.Stores.GetFriendsChatNavigationStore)
local FFlagFriendsChatConversationListFocusNav = require(Parent.SharedFlags).FFlagFriendsChatConversationListFocusNav

return function(p1, p2) --[[ Line: 19 | Named "useFocusInputBarOnWindowEnter" ]]
	-- upvalues: ReactModule (copy), ReactFocusNavigationModule (copy), FFlagFriendsChatConversationListFocusNav (copy), GetFriendsChatNavigationStoreModule (copy)
	local UseContextResult = ReactModule.useContext(ReactFocusNavigationModule.FocusNavigationContext)
	ReactModule.useEffect(function() --[[ Line: 24 ]]
		-- upvalues: FFlagFriendsChatConversationListFocusNav (upval), UseContextResult (copy), GetFriendsChatNavigationStoreModule (upval), p1 (copy), p2 (copy)
		if not FFlagFriendsChatConversationListFocusNav or UseContextResult == nil then return end
		local FriendsChatNavigationStoreModule = GetFriendsChatNavigationStoreModule(false)
		
		local function _(Object) --[[ Line: 29 | Named "isInsideWindow" ]]
			-- upvalues: p1 (upval), p2 (upval)
			if Object == nil then
				return false
			else
				local Current = p1.current
				local Current1 = p2.current
				
				return if Current == nil then Current1 ~= nil and Object:IsDescendantOf(Current1) else Object:IsDescendantOf(Current) or Current1 ~= nil and Object:IsDescendantOf(Current1)
			end
		end
		
		local Value = UseContextResult.focusedGuiObject:getValue()
		local SubscribeResult = UseContextResult.focusedGuiObject:subscribe(function(Object) --[[ Line: 39 ]]
			-- upvalues: p1 (upval), p2 (upval), Value (ref), FriendsChatNavigationStoreModule (copy)
			local IsDescendantOf = nil
			if Object == nil then
				IsDescendantOf = false
			else
				local Current = p1.current
				local Current1 = p2.current
				IsDescendantOf = if Current == nil then Current1 ~= nil and Object:IsDescendantOf(Current1) else Object:IsDescendantOf(Current) or Current1 ~= nil and Object:IsDescendantOf(Current1)
			end
			if IsDescendantOf and Value ~= nil then
				local Object1 = Value
				local IsDescendantOf1 = nil
				
				if Object1 == nil then
					IsDescendantOf1 = false
				else
					local Current = p1.current
					local Current2 = p2.current
					IsDescendantOf1 = if Current == nil then Current2 ~= nil and Object1:IsDescendantOf(Current2) else Object1:IsDescendantOf(Current) or Current2 ~= nil and Object1:IsDescendantOf(Current2)
				end
				if not IsDescendantOf1 then
					FriendsChatNavigationStoreModule.requestFocusInputBar()
				end
			end
			Value = Object
		end)
		
		return function() --[[ Line: 49 ]]
			-- upvalues: SubscribeResult (copy)
			SubscribeResult:unsubscribe()
		end
	end, { UseContextResult })
end