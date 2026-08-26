local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local trustedContactsModule = require(parent.TrustedContacts)
local setTabBarVisibleFromChat = require(parent.AppTabBarRodux).Thunks.SetTabBarVisibleFromChat
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local trustedFriendsModalEntry = trustedContactsModule.TrustedFriendsModalEntry

return function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), setTabBarVisibleFromChat (ref), trustedFriendsModalEntry (ref), cryoModule (ref)
	local navigation = p1.navigation
	local props = navigation.getParam("props")
	local var1 = useDispatch()
	local var2 = reactModule.useCallback(function()
		-- upvalues: navigation (ref)
		navigation.pop()
	end, { navigation })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), setTabBarVisibleFromChat (copy)
		var1(setTabBarVisibleFromChat(false))
		
		return function()
			-- upvalues: var1 (copy), setTabBarVisibleFromChat (copy)
			var1(setTabBarVisibleFromChat(true))
		end
	end, { var1 })
	
	return reactModule.createElement(trustedFriendsModalEntry, cryoModule.Dictionary.join(props, { onClosed = var2 }))
end