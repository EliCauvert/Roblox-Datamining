local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactNavigationModule = require(Parent.RoactNavigation)
local SquadQuickStartExperimentation = require(Parent.SocialExperiments).SquadQuickStartExperimentation
local EnumScreensModule = require(AppChat.EnumScreens)
local ChatLandingScreenWithSwitchNavigatorModule = require(AppChat.Components.ChatLanding.ChatLandingScreenWithSwitchNavigator)
local CreateNewChatScreenModule = require(AppChat.Components.CreateNewChat.CreateNewChatScreen)
local EditChatMembersScreenModule = require(AppChat.Components.EditChatMembers.EditChatMembersScreen)
local QuickStartSquadInviteFriendsScreenModule = require(AppChat.Components.Squads.QuickStartSquadInviteFriendsScreen)
local CreateOverlayTopBarStackNavigatorWithFocusModule = require(AppChat.Navigators.createOverlayTopBarStackNavigatorWithFocus)
local GetFFlagAppChatRemoveDynamicRequiresModule = require(AppChat.Flags.getFFlagAppChatRemoveDynamicRequires)
local FFlagEnablePartyQuickStartButton = require(Parent.SharedFlags).FFlagEnablePartyQuickStartButton
local FFlagAppChatDisableAbsorbInputSelectableModule = require(AppChat.Flags.FFlagAppChatDisableAbsorbInputSelectable)

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
			screen = ChatLandingScreenWithSwitchNavigatorModule,
			navigationOptions = if GetFFlagAppChatRemoveDynamicRequiresModule() then function()
				return { backButtonEnabled = false, tabBarVisible = true }
			end else { backButtonEnabled = false, tabBarVisible = true }
		}
	},
	{
		CreateNewChatScreenWrapper = {
			screen = CreateOverlayTopBarStackNavigatorWithFocusModule({
				{
					[EnumScreensModule.CreateNewChat] = CreateNewChatScreenModule
				}
			}),
			navigationOptions = NavigationOptions
		}
	},
	{
		EditChatMembersScreenWrapper = {
			screen = CreateOverlayTopBarStackNavigatorWithFocusModule({
				{
					[EnumScreensModule.EditChatMembers] = EditChatMembersScreenModule
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
	defaultNavigationOptions = if FFlagAppChatDisableAbsorbInputSelectableModule then { absorbInputSelectable = false } else nil,
	mode = RoactNavigationModule.StackPresentationStyle.Overlay
})