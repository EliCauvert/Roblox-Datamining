local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roactNavigationModule = require(parent.RoactNavigation)
local squadQuickStartExperimentation = require(parent.SocialExperiments).SquadQuickStartExperimentation
local enumScreensModule = require(appChat.EnumScreens)
local chatLandingScreenWithSwitchNavigatorModule = require(appChat.Components.ChatLanding.ChatLandingScreenWithSwitchNavigator)
local createNewChatScreenModule = require(appChat.Components.CreateNewChat.CreateNewChatScreen)
local editChatMembersScreenModule = require(appChat.Components.EditChatMembers.EditChatMembersScreen)
local quickStartSquadInviteFriendsScreenModule = require(appChat.Components.Squads.QuickStartSquadInviteFriendsScreen)
local createOverlayTopBarStackNavigatorWithFocusModule = require(appChat.Navigators.createOverlayTopBarStackNavigatorWithFocus)
local getFFlagAppChatRemoveDynamicRequiresModule = require(appChat.Flags.getFFlagAppChatRemoveDynamicRequires)
local fFlagEnablePartyQuickStartButton = require(parent.SharedFlags).FFlagEnablePartyQuickStartButton
local fFlagAppChatDisableAbsorbInputSelectableModule = require(appChat.Flags.FFlagAppChatDisableAbsorbInputSelectable)

local function _(p0, p1)
	-- upvalues: createOverlayTopBarStackNavigatorWithFocusModule (ref)
	return createOverlayTopBarStackNavigatorWithFocusModule({ { [p0] = p1 } })
end

local t = {
	backButtonEnabled = true,
	tabBarVisible = true,
	overlayEnabled = true,
	overlayTransparency = 0.5,
	absorbInput = true
}
local list = {
	{
		[enumScreensModule.ChatLanding] = {
			screen = chatLandingScreenWithSwitchNavigatorModule,
			navigationOptions = if getFFlagAppChatRemoveDynamicRequiresModule() then function()
				return { backButtonEnabled = false, tabBarVisible = true }
			end else { backButtonEnabled = false, tabBarVisible = true }
		}
	},
	{
		CreateNewChatScreenWrapper = {
			screen = createOverlayTopBarStackNavigatorWithFocusModule({
				{
					[enumScreensModule.CreateNewChat] = createNewChatScreenModule
				}
			}),
			navigationOptions = t
		}
	},
	{
		EditChatMembersScreenWrapper = {
			screen = createOverlayTopBarStackNavigatorWithFocusModule({
				{
					[enumScreensModule.EditChatMembers] = editChatMembersScreenModule
				}
			}),
			navigationOptions = t
		}
	}
}

if squadQuickStartExperimentation.getPartyQuickStartChangesEnabled() and fFlagEnablePartyQuickStartButton then
	table.insert(list, {
		CreatePartyQuickStartWrapper = {
			screen = createOverlayTopBarStackNavigatorWithFocusModule({
				{
					[enumScreensModule.QuickStartSquadInviteFriends] = quickStartSquadInviteFriendsScreenModule
				}
			}),
			navigationOptions = t
		}
	})
end
return roactNavigationModule.createRobloxStackNavigator(list, {
	defaultNavigationOptions = if fFlagAppChatDisableAbsorbInputSelectableModule then { absorbInputSelectable = false } else nil,
	mode = roactNavigationModule.StackPresentationStyle.Overlay
})