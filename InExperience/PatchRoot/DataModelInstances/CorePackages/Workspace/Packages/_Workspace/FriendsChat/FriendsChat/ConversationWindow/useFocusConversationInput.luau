local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local chatUIPrimitivesModule = require(parent.ChatUIPrimitives)
local useFocusGuiObject = require(parent.ReactFocusNavigation).useFocusGuiObject
local getFirstFocusableDescendant = require(parent.FocusNavigationUtils).getFirstFocusableDescendant
local fFlagFriendsChatConversationListFocusNav = require(parent.SharedFlags).FFlagFriendsChatConversationListFocusNav

return function(p1, p2)
	-- upvalues: chatUIPrimitivesModule (ref), fFlagFriendsChatConversationListFocusNav (ref), useFocusGuiObject (ref), reactModule (ref), getFirstFocusableDescendant (ref)
	local var1 = chatUIPrimitivesModule.Hooks.useFocusInputBar()
	local focus = var1.focus
	
	if fFlagFriendsChatConversationListFocusNav then
		local var2 = useFocusGuiObject()
		focus = reactModule.useCallback(function()
			-- upvalues: p2 (ref), p1 (ref), getFirstFocusableDescendant (copy), var2 (ref), var1 (ref)
			if p2 then
				var1.focus()
				
				return
			end
			local var3 = if p1 ~= nil then nil else p1.current
			
			if var3 ~= nil then
				local var4 = getFirstFocusableDescendant(var3)
				
				if var4 ~= nil then
					var2(var4)
				end
			end
		end, { p2, var1.focus, var2, p1 })
	end
	return { ref = var1.ref, focus = focus }
end