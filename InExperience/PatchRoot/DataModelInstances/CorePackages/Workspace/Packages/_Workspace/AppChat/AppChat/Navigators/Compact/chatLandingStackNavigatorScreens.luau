local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local SquadQuickStartExperimentation = require(Parent.SocialExperiments).SquadQuickStartExperimentation
local EnumScreensModule = require(AppChat.EnumScreens)
local ChatDetailsNavigationOptionsModule = require(AppChat.Components.ChatDetails.ChatDetailsNavigationOptions)
local SquadInviteFriendsScreenModule = require(AppChat.Components.Squads.SquadInviteFriendsScreen)
local SquadLobbyScreenModule = require(AppChat.Components.Squads.SquadLobbyScreen)
local QuickStartSquadInviteFriendsScreenModule = require(AppChat.Components.Squads.QuickStartSquadInviteFriendsScreen)
local FFlagEnablePartyQuickStartButton = require(Parent.SharedFlags).FFlagEnablePartyQuickStartButton
local GetFFlagAppChatEnableRootedNavigationModule = require(AppChat.Flags.getFFlagAppChatEnableRootedNavigation)

local function getChatDetailsNavigationOptions(p1) --[[ Line: 23 ]]
	-- upvalues: ChatDetailsNavigationOptionsModule (copy)
	return ChatDetailsNavigationOptionsModule.getNavigationOptions(p1, { tabBarVisible = false })
end

local List = {
	{
		[EnumScreensModule.ChatLanding] = {
			screen = require(AppChat.Components.ChatLanding.ChatLandingScreen),
			navigationOptions = if require(AppChat.Flags.getFFlagAppChatRemoveDynamicRequires)() then function() --[[ Line: 34 ]]
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
			screen = require(AppChat.Components.ChatConversation.ChatConversationScreen),
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
			screen = require(AppChat.Components.ChatDetails.ChatDetailsScreen),
			navigationOptions = if GetFFlagAppChatEnableRootedNavigationModule() then getChatDetailsNavigationOptions else { backButtonEnabled = true, tabBarVisible = false }
		}
	},
	{
		[EnumScreensModule.CreateNewChat] = {
			screen = require(AppChat.Components.CreateNewChat.CreateNewChatScreen),
			navigationOptions = { backButtonEnabled = true, tabBarVisible = false }
		}
	},
	{
		[EnumScreensModule.EditChatMembers] = {
			screen = require(AppChat.Components.EditChatMembers.EditChatMembersScreen),
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