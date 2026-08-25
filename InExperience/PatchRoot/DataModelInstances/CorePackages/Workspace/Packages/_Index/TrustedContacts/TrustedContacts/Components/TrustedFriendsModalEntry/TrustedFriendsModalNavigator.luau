local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local roactNavigationModule = require(parent.RoactNavigation)
local appPage = require(parent.RobloxAppEnums).AppPage

return roactNavigationModule.createRobloxStackNavigator({
	{
		[appPage.TrustedFriendsUserModal] = {
			getScreen = function()
				-- upvalues: trustedContacts (ref)
				return require(trustedContacts.Components.TrustedContactsModal).Screen
			end,
			navigationOptions = {
				renderUnderlyingPage = true,
				disableBackButton = true,
				overlayEnabled = true
			}
		}
	},
	{
		[appPage.TrustedFriendsVPCPrologue] = {
			getScreen = function()
				-- upvalues: trustedContacts (ref)
				return require(trustedContacts.Components.TrustedFriendsVPCPrologue).Screen
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
	initialRouteName = appPage.TrustedFriendsUserModal,
	backBehavior = roactNavigationModule.BackBehavior.History
})