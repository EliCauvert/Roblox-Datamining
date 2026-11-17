local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local UseStableSignalFunction = require(Parent.ChatUIPrimitives).Hooks.useStableSignal
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local UseContainerFocusBehaviorFunction = ReactFocusNavigationModule.useContainerFocusBehavior
local FFlagFriendsChatConversationListFocusNav = require(Parent.SharedFlags).FFlagFriendsChatConversationListFocusNav
local FFlagFriendsChatUseViewRecyclerConversationListModule = require(FriendsChat.Flags.FFlagFriendsChatUseViewRecyclerConversationList)
local UseConsumeFocusConversationListRequestModule = require(script.Parent.useConsumeFocusConversationListRequest)
local UseFocusRecycledConversationListModule = require(script.Parent.useFocusRecycledConversationList)

return function(Callback1, p1)
	-- upvalues: FFlagFriendsChatConversationListFocusNav (copy), UseFocusGuiObjectFunction (copy), UseStableSignalFunction (copy), ReactModule (copy), UseConsumeFocusConversationListRequestModule (copy), FFlagFriendsChatUseViewRecyclerConversationListModule (copy), UseFocusRecycledConversationListModule (copy), UseContainerFocusBehaviorFunction (copy)
	local v1 = nil
	local v2 = nil
	local v3 = nil
	
	if FFlagFriendsChatConversationListFocusNav then
		local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
		local UseStableSignalResult, UseStableSignalResult2 = UseStableSignalFunction(nil)
		v2 = UseStableSignalResult2
		local UseResult = ReactModule.useCallback(function(p2)
			-- upvalues: Callback1 (copy), UseFocusGuiObjectResult (copy)
			Callback1(false).resetAllTransparency()
			UseFocusGuiObjectResult(p2)
		end, { Callback1, UseFocusGuiObjectResult })
		UseConsumeFocusConversationListRequestModule(UseStableSignalResult, UseResult)
		local Callback = nil
		
		if FFlagFriendsChatUseViewRecyclerConversationListModule then
			v3, Callback = UseFocusRecycledConversationListModule(p1, UseResult)
		end
		v1 = UseContainerFocusBehaviorFunction(ReactModule.useMemo(function()
			-- upvalues: Callback (ref), UseStableSignalResult (copy)
			return {
				getTargets = function()
					-- upvalues: Callback (upval), UseStableSignalResult (upval)
					if Callback == nil then
						local UseStableSignalResultResult = UseStableSignalResult(false)
						
						return if UseStableSignalResultResult == nil then {} else { UseStableSignalResultResult }
					else
						return Callback()
					end
				end
			}
		end, { UseStableSignalResult, Callback }), nil)
	end
	return v1, v2, v3
end