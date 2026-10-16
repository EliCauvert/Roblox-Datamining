local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local SetTabBarVisibleFromChatFunction = require(Parent.AppTabBarRodux).Thunks.SetTabBarVisibleFromChat
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local TrustedFriendsModalEntry = require(Parent.TrustedContacts).TrustedFriendsModalEntry

return function(p1) --[[ Line: 40 | Named "TrustedContactsModalScreen" ]]
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), SetTabBarVisibleFromChatFunction (copy), TrustedFriendsModalEntry (copy), CryoModule (copy)
	local Navigation = p1.navigation
	local PropsParam = Navigation.getParam("props")
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function() --[[ Line: 45 ]]
		-- upvalues: Navigation (copy)
		Navigation.pop()
	end, { Navigation })
	ReactModule.useEffect(function() --[[ Line: 49 ]]
		-- upvalues: UseDispatchResult (copy), SetTabBarVisibleFromChatFunction (upval)
		UseDispatchResult(SetTabBarVisibleFromChatFunction(false))
		
		return function() --[[ Line: 51 ]]
			-- upvalues: UseDispatchResult (upval), SetTabBarVisibleFromChatFunction (upval)
			UseDispatchResult(SetTabBarVisibleFromChatFunction(true))
		end
	end, { UseDispatchResult })
	
	return ReactModule.createElement(TrustedFriendsModalEntry, CryoModule.Dictionary.join(PropsParam, { onClosed = UseResult }))
end