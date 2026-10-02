local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local useStableSignal = require(parent.ChatUIPrimitives).Hooks.useStableSignal
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local useFocusGuiObject = reactFocusNavigationModule.useFocusGuiObject
local useContainerFocusBehavior = reactFocusNavigationModule.useContainerFocusBehavior
local fFlagFriendsChatConversationListFocusNav = require(parent.SharedFlags).FFlagFriendsChatConversationListFocusNav
local useConsumeFocusConversationListRequestModule = require(script.Parent.useConsumeFocusConversationListRequest)

return function(p1)
	-- upvalues: fFlagFriendsChatConversationListFocusNav (ref), useFocusGuiObject (ref), useStableSignal (ref), reactModule (ref), useConsumeFocusConversationListRequestModule (ref), useContainerFocusBehavior (ref)
	local var1 = nil
	local var2 = nil
	
	if fFlagFriendsChatConversationListFocusNav then
		local var3 = useFocusGuiObject()
		local var4, var5 = useStableSignal(nil)
		var2 = var5
		useConsumeFocusConversationListRequestModule(var4, reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref), var3 (ref)
			p1(false).resetAllTransparency()
			var3(p2)
		end, { p1, var3 }))
		var1 = useContainerFocusBehavior(reactModule.useMemo(function()
			-- upvalues: var4 (ref)
			return {
				getTargets = function()
					-- upvalues: var4 (copy)
					local var6 = var4(false)
					
					return if var6 == nil then {} else { var6 }
				end
			}
		end, { var4 }), nil)
	end
	return var1, var2
end