local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local SquadQuickStartExperimentation = require(Parent.SocialExperiments).SquadQuickStartExperimentation
local EnumScreensModule = require(AppChat.EnumScreens)
local ChatLandingScreenModule = require(AppChat.Components.ChatLanding.ChatLandingScreen)
local ChatConversationScreenModule = require(AppChat.Components.ChatConversation.ChatConversationScreen)
local ChatDetailsScreenModule = require(AppChat.Components.ChatDetails.ChatDetailsScreen)
local ChatDetailsNavigationOptionsModule = require(AppChat.Components.ChatDetails.ChatDetailsNavigationOptions)
local CreateNewChatScreenModule = require(AppChat.Components.CreateNewChat.CreateNewChatScreen)
local EditChatMembersScreenModule = require(AppChat.Components.EditChatMembers.EditChatMembersScreen)
local SquadInviteFriendsScreenModule = require(AppChat.Components.Squads.SquadInviteFriendsScreen)
local SquadLobbyScreenModule = require(AppChat.Components.Squads.SquadLobbyScreen)
local QuickStartSquadInviteFriendsScreenModule = require(AppChat.Components.Squads.QuickStartSquadInviteFriendsScreen)
local GetFFlagAppChatRemoveDynamicRequiresModule = require(AppChat.Flags.getFFlagAppChatRemoveDynamicRequires)
local FFlagEnablePartyQuickStartButton = require(Parent.SharedFlags).FFlagEnablePartyQuickStartButton
local List = {
	{
		[EnumScreensModule.ChatLanding] = {
			screen = ChatLandingScreenModule,
			navigationOptions = if GetFFlagAppChatRemoveDynamicRequiresModule() then function()
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
		[EnumScreensModule.ChatConversation] = {
			screen = ChatConversationScreenModule,
			navigationOptions = {
				backButtonEnabled = true,
				tabBarVisible = false,
				lockIconEnabled = true,
				absorbInput = false
			}
		}
	},
	{
		[EnumScreensModule.ChatDetails] = {
			screen = ChatDetailsScreenModule,
			navigationOptions = function(p1)
				-- upvalues: ChatDetailsNavigationOptionsModule (copy)
				return ChatDetailsNavigationOptionsModule.getNavigationOptions(p1, { tabBarVisible = false })
			end
		}
	},
	{
		[EnumScreensModule.CreateNewChat] = {
			screen = CreateNewChatScreenModule,
			navigationOptions = { backButtonEnabled = true, tabBarVisible = false }
		}
	},
	{
		[EnumScreensModule.EditChatMembers] = {
			screen = EditChatMembersScreenModule,
			navigationOptions = { backButtonEnabled = true, tabBarVisible = false }
		}
	}
}

if require(Parent.SharedFlags).GetFFlagIsSquadEnabled() then
	table.insert(List, {
		[EnumScreensModule.SquadLobby] = {
			screen = SquadLobbyScreenModule.CompactSquadLobbyScreen,
			navigationOptions = { backButtonEnabled = true, tabBarVisible = false }
		}
	})
	
	if SquadQuickStartExperimentation.getPartyQuickStartChangesEnabled() and FFlagEnablePartyQuickStartButton then
		table.insert(List, {
			[EnumScreensModule.QuickStartSquadInviteFriends] = {
				screen = QuickStartSquadInviteFriendsScreenModule,
				navigationOptions = { backButtonEnabled = true, tabBarVisible = false }
			}
		})
	end
	table.insert(List, {
		[EnumScreensModule.SquadInviteFriends] = {
			screen = SquadInviteFriendsScreenModule,
			navigationOptions = {
				backButtonEnabled = true,
				tabBarVisible = false,
				headerText = if FFlagEnablePartyQuickStartButton then { raw = "Feature.Squads.Action.Add", shouldLocalize = true } else nil
			}
		}
	})
end
return List