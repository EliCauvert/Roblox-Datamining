local friendsChat = script:FindFirstAncestor("FriendsChat")
local parent = friendsChat.Parent
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local getFriendsChatNavigationStoreModule = require(friendsChat.Stores.GetFriendsChatNavigationStore)
local fFlagFriendsChatConversationListFocusNav = require(parent.SharedFlags).FFlagFriendsChatConversationListFocusNav

return function(p1, p2)
	-- upvalues: reactModule (ref), reactFocusNavigationModule (ref), fFlagFriendsChatConversationListFocusNav (ref), getFriendsChatNavigationStoreModule (ref)
	local var1 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	reactModule.useEffect(function()
		-- upvalues: fFlagFriendsChatConversationListFocusNav (copy), var1 (ref), getFriendsChatNavigationStoreModule (copy), p1 (ref), p2 (ref)
		if fFlagFriendsChatConversationListFocusNav and var1 ~= nil then
			local var2 = getFriendsChatNavigationStoreModule(false)
			
			local function _(p3)
				-- upvalues: p1 (copy), p2 (copy)
				if p3 == nil then
					return false
				end
				local var3
				local current = p1.current
				local current_1 = p2.current
				
				if current ~= nil then
					var3 = p3:IsDescendantOf(current)
					
					if not var3 then
						var3 = current_1 ~= nil and p3:IsDescendantOf(current_1)
					end
					return var3
				end
			end
			
			local value = var1.focusedGuiObject:getValue()
			local var3 = var1.focusedGuiObject:subscribe(function(p3)
				-- upvalues: p1 (copy), p2 (copy), value (write), var2 (ref)
				local var4, current
				if p3 == nil then
					var4 = false
				else
					current = p1.current
					local current_1 = p2.current
					
					if current ~= nil then
						var4 = p3:IsDescendantOf(current)
						
						if not var4 then
							var4 = current_1 ~= nil and p3:IsDescendantOf(current_1)
						end
					end
				end
				if var4 and value ~= nil then
					current = value
					
					if current == nil then
						var4 = false
					else
						local current_1 = p1.current
						local current_2 = p2.current
						
						if current_1 ~= nil then
							var4 = current:IsDescendantOf(current_1)
							
							if not var4 then
								var4 = current_2 ~= nil and current:IsDescendantOf(current_2)
							end
						end
					end
					if not var4 then
						var2.requestFocusInputBar()
					end
				end
				value = p3
			end)
			
			return function()
				-- upvalues: var3 (ref)
				var3:unsubscribe()
			end
		end
	end, { var1 })
end