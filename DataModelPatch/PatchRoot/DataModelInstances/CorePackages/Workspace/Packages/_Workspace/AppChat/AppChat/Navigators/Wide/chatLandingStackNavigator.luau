local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactNavigationModule = require(Parent.RoactNavigation)
local SquadQuickStartExperimentation = require(Parent.SocialExperiments).SquadQuickStartExperimentation
local EnumScreensModule = require(AppChat.EnumScreens)
local QuickStartSquadInviteFriendsScreenModule = require(AppChat.Components.Squads.QuickStartSquadInviteFriendsScreen)
local CreateOverlayTopBarStackNavigatorWithFocusModule = require(AppChat.Navigators.createOverlayTopBarStackNavigatorWithFocus)
local FFlagEnablePartyQuickStartButton = require(Parent.SharedFlags).FFlagEnablePartyQuickStartButton

local function _(p1, p2)
	-- upvalues: CreateOverlayTopBarStackNavigatorWithFocusModule (copy)
	return CreateOverlayTopBarStackNavigatorWithFocusModule({ { [p1] = p2 } })
end

local NavigationOptions = {
	backButtonEnabled = true,
	tabBarVisible = true,
	overlayEnabled = true,
	overlayTransparency = 0.5,
	absorbInput = true
}
local List = {
	{
		[EnumScreensModule.ChatLanding] = {
			screen = require(AppChat.Components.ChatLanding.ChatLandingScreenWithSwitchNavigator),
			navigationOptions = if require(AppChat.Flags.getFFlagAppChatRemoveDynamicRequires)() then function()
				return { backButtonEnabled = false, tabBarVisible = true }
			end else { backButtonEnabled = false, tabBarVisible = true }
		}
	},
	{
		CreateNewChatScreenWrapper = {
			screen = CreateOverlayTopBarStackNavigatorWithFocusModule({
				{
					[EnumScreensModule.CreateNewChat] = require(AppChat.Components.CreateNewChat.CreateNewChatScreen)
				}
			}),
			navigationOptions = NavigationOptions
		}
	},
	{
		EditChatMembersScreenWrapper = {
			screen = CreateOverlayTopBarStackNavigatorWithFocusModule({
				{
					[EnumScreensModule.EditChatMembers] = require(AppChat.Components.EditChatMembers.EditChatMembersScreen)
				}
			}),
			navigationOptions = NavigationOptions
		}
	}
}

if SquadQuickStartExperimentation.getPartyQuickStartChangesEnabled() and FFlagEnablePartyQuickStartButton then
	table.insert(List, {
		CreatePartyQuickStartWrapper = {
			screen = CreateOverlayTopBarStackNavigatorWithFocusModule({
				{
					[EnumScreensModule.QuickStartSquadInviteFriends] = QuickStartSquadInviteFriendsScreenModule
				}
			}),
			navigationOptions = NavigationOptions
		}
	})
end
return RoactNavigationModule.createRobloxStackNavigator(List, {
	mode = RoactNavigationModule.StackPresentationStyle.Overlay
})