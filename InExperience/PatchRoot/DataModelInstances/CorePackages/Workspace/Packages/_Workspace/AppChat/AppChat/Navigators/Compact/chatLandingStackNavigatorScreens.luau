local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local squadQuickStartExperimentation = require(parent.SocialExperiments).SquadQuickStartExperimentation
local enumScreensModule = require(appChat.EnumScreens)
local chatLandingScreenModule = require(appChat.Components.ChatLanding.ChatLandingScreen)
local chatConversationScreenModule = require(appChat.Components.ChatConversation.ChatConversationScreen)
local chatDetailsScreenModule = require(appChat.Components.ChatDetails.ChatDetailsScreen)
local chatDetailsNavigationOptionsModule = require(appChat.Components.ChatDetails.ChatDetailsNavigationOptions)
local createNewChatScreenModule = require(appChat.Components.CreateNewChat.CreateNewChatScreen)
local editChatMembersScreenModule = require(appChat.Components.EditChatMembers.EditChatMembersScreen)
local squadInviteFriendsScreenModule = require(appChat.Components.Squads.SquadInviteFriendsScreen)
local squadLobbyScreenModule = require(appChat.Components.Squads.SquadLobbyScreen)
local quickStartSquadInviteFriendsScreenModule = require(appChat.Components.Squads.QuickStartSquadInviteFriendsScreen)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagEnablePartyQuickStartButton = require(parent.SharedFlags).FFlagEnablePartyQuickStartButton
local list = {
	{
		[enumScreensModule.ChatLanding] = {
			screen = chatLandingScreenModule,
			navigationOptions = if require(appChat.Flags.getFFlagAppChatRemoveDynamicRequires)() then function()
				return {
					isRoot = true,
					backButtonEnabled = false,
					tabBarVisible = true
				}
			end else {
				isRoot = true,
				backButtonEnabled = false,
				tabBarVisible = true
			}
		}
	},
	{
		[enumScreensModule.ChatConversation] = {
			screen = chatConversationScreenModule,
			navigationOptions = {
				backButtonEnabled = true,
				tabBarVisible = false,
				lockIconEnabled = true,
				absorbInput = false
			}
		}
	},
	{
		[enumScreensModule.ChatDetails] = {
			screen = chatDetailsScreenModule,
			navigationOptions = if require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)() then function(p1)
				-- upvalues: chatDetailsNavigationOptionsModule (ref)
				return chatDetailsNavigationOptionsModule.getNavigationOptions(p1, { tabBarVisible = false })
			end else { backButtonEnabled = true, tabBarVisible = false }
		}
	},
	{
		[enumScreensModule.CreateNewChat] = {
			screen = createNewChatScreenModule,
			navigationOptions = { backButtonEnabled = true, tabBarVisible = false }
		}
	},
	{
		[enumScreensModule.EditChatMembers] = {
			screen = editChatMembersScreenModule,
			navigationOptions = { backButtonEnabled = true, tabBarVisible = false }
		}
	}
}

if getFFlagIsSquadEnabled() then
	table.insert(list, {
		[enumScreensModule.SquadLobby] = {
			screen = squadLobbyScreenModule.CompactSquadLobbyScreen,
			navigationOptions = { backButtonEnabled = true, tabBarVisible = false }
		}
	})
	
	if squadQuickStartExperimentation.getPartyQuickStartChangesEnabled() and fFlagEnablePartyQuickStartButton then
		table.insert(list, {
			[enumScreensModule.QuickStartSquadInviteFriends] = {
				screen = quickStartSquadInviteFriendsScreenModule,
				navigationOptions = { backButtonEnabled = true, tabBarVisible = false }
			}
		})
	end
	table.insert(list, {
		[enumScreensModule.SquadInviteFriends] = {
			screen = squadInviteFriendsScreenModule,
			navigationOptions = {
				backButtonEnabled = true,
				tabBarVisible = false,
				headerText = if fFlagEnablePartyQuickStartButton then { raw = "Feature.Squads.Action.Add", shouldLocalize = true } else nil
			}
		}
	})
end
return list