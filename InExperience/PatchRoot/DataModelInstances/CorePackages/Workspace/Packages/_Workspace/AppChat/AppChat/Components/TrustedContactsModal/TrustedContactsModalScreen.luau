local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local trustedContactsModule = require(parent.TrustedContacts)
local setTabBarVisibleFromChat = require(parent.AppTabBarRodux).Thunks.SetTabBarVisibleFromChat
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local trustedFriendsModalEntry = trustedContactsModule.TrustedFriendsModalEntry

return function(p0) --[[ line: 40 | named "TrustedContactsModalScreen" ]]
	-- upvalues: useDispatch (ref), reactModule (ref), setTabBarVisibleFromChat (ref), trustedFriendsModalEntry (ref), cryoModule (ref)
	local navigation = p0.navigation
	local props = navigation.getParam("props")
	local var4 = useDispatch()
	local var5 = reactModule.useCallback(function() --[[ line: 45 ]]
		-- upvalues: navigation (ref)
		navigation.pop()
	end, { navigation })
	reactModule.useEffect(function() --[[ line: 49 ]]
		-- upvalues: var4 (ref), setTabBarVisibleFromChat (copy)
		var4(setTabBarVisibleFromChat(false))
		
		return function() --[[ line: 51 ]]
			-- upvalues: var4 (copy), setTabBarVisibleFromChat (copy)
			var4(setTabBarVisibleFromChat(true))
		end
	end, { var4 })
	
	return reactModule.createElement(trustedFriendsModalEntry, cryoModule.Dictionary.join(props, { onClosed = var5 }))
end