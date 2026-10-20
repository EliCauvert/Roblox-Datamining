local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local UseStableSignalFunction = require(Parent.ChatUIPrimitives).Hooks.useStableSignal
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local UseContainerFocusBehaviorFunction = ReactFocusNavigationModule.useContainerFocusBehavior
local FFlagFriendsChatConversationListFocusNav = require(Parent.SharedFlags).FFlagFriendsChatConversationListFocusNav
local UseConsumeFocusConversationListRequestModule = require(script.Parent.useConsumeFocusConversationListRequest)

return function(Callback)
	-- upvalues: FFlagFriendsChatConversationListFocusNav (copy), UseFocusGuiObjectFunction (copy), UseStableSignalFunction (copy), ReactModule (copy), UseConsumeFocusConversationListRequestModule (copy), UseContainerFocusBehaviorFunction (copy)
	local v1 = nil
	local v2 = nil
	
	if FFlagFriendsChatConversationListFocusNav then
		local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
		local UseStableSignalResult, UseStableSignalResult2 = UseStableSignalFunction(nil)
		v2 = UseStableSignalResult2
		UseConsumeFocusConversationListRequestModule(UseStableSignalResult, (ReactModule.useCallback(function(p1)
			-- upvalues: Callback (copy), UseFocusGuiObjectResult (copy)
			Callback(false).resetAllTransparency()
			UseFocusGuiObjectResult(p1)
		end, { Callback, UseFocusGuiObjectResult })))
		v1 = UseContainerFocusBehaviorFunction(ReactModule.useMemo(function()
			-- upvalues: UseStableSignalResult (copy)
			return {
				getTargets = function()
					-- upvalues: UseStableSignalResult (upval)
					local UseStableSignalResultResult = UseStableSignalResult(false)
					
					return if UseStableSignalResultResult == nil then {} else { UseStableSignalResultResult }
				end
			}
		end, { UseStableSignalResult }), nil)
	end
	return v1, v2
end