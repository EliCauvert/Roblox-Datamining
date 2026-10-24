local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local ChatUIPrimitivesModule = require(Parent.ChatUIPrimitives)
local UseFocusGuiObjectFunction = require(Parent.ReactFocusNavigation).useFocusGuiObject
local GetFirstFocusableDescendantFunction = require(Parent.FocusNavigationUtils).getFirstFocusableDescendant
local FFlagFriendsChatConversationListFocusNav = require(Parent.SharedFlags).FFlagFriendsChatConversationListFocusNav

return function(p1, p2, p3)
	-- upvalues: ChatUIPrimitivesModule (copy), FFlagFriendsChatConversationListFocusNav (copy), UseFocusGuiObjectFunction (copy), ReactModule (copy), GetFirstFocusableDescendantFunction (copy)
	local UseFocusInputBarResult = ChatUIPrimitivesModule.Hooks.useFocusInputBar()
	local Focus = UseFocusInputBarResult.focus
	
	if FFlagFriendsChatConversationListFocusNav then
		local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
		Focus = ReactModule.useCallback(function()
			-- upvalues: p2 (copy), p3 (copy), p1 (copy), GetFirstFocusableDescendantFunction (upval), UseFocusGuiObjectResult (copy), UseFocusInputBarResult (copy)
			if p2 then
				UseFocusInputBarResult.focus()
				
				return
			end
			local Current = if p3 == nil then nil else p3.current
			local Current1 = if p1 == nil then nil else p1.current
			
			if Current == nil and Current1 ~= nil then
				Current = GetFirstFocusableDescendantFunction(Current1)
			end
			if Current ~= nil then
				UseFocusGuiObjectResult(Current)
			end
		end, {
			p2,
			UseFocusInputBarResult.focus,
			UseFocusGuiObjectResult,
			p1,
			p3
		})
	end
	return { ref = UseFocusInputBarResult.ref, focus = Focus }
end