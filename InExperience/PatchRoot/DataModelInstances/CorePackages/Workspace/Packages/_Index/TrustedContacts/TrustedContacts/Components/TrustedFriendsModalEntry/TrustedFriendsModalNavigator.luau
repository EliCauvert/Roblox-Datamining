local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local RoactNavigationModule = require(Parent.RoactNavigation)
local AppPage = require(Parent.RobloxAppEnums).AppPage

return (RoactNavigationModule.createRobloxStackNavigator({
	{
		[AppPage.TrustedFriendsUserModal] = {
			getScreen = function() --[[ Line: 15 ]]
				-- upvalues: TrustedContacts (copy)
				return require(TrustedContacts.Components.TrustedContactsModal).Screen
			end,
			navigationOptions = {
				renderUnderlyingPage = true,
				disableBackButton = true,
				overlayEnabled = true
			}
		}
	},
	{
		[AppPage.TrustedFriendsVPCPrologue] = {
			getScreen = function() --[[ Line: 27 ]]
				-- upvalues: TrustedContacts (copy)
				return require(TrustedContacts.Components.TrustedFriendsVPCPrologue).Screen
			end,
			navigationOptions = {
				renderUnderlyingPage = true,
				disableBackButton = true,
				overlayEnabled = true
			}
		}
	}
}, {
	keepVisitedScreensMounted = false,
	initialRouteName = AppPage.TrustedFriendsUserModal,
	backBehavior = RoactNavigationModule.BackBehavior.History
}))