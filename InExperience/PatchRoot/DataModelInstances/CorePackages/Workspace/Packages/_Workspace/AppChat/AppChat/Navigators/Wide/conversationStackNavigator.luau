local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactNavigationModule = require(Parent.RoactNavigation)
local CryoModule = require(Parent.Cryo)
local AutoFocusNavigationModule = require(script.Parent.Parent.autoFocusNavigation)
local EnumScreensModule = require(AppChat.EnumScreens)
local ChatConversationScreenModule = require(AppChat.Components.ChatConversation.ChatConversationScreen)
local ChatDetailsScreenModule = require(AppChat.Components.ChatDetails.ChatDetailsScreen)
local SquadInviteFriendsScreenModule = require(AppChat.Components.Squads.SquadInviteFriendsScreen)
local SquadLobbyScreenModule = require(AppChat.Components.Squads.SquadLobbyScreen)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagAppChatDisableAbsorbInputSelectableModule = require(AppChat.Flags.FFlagAppChatDisableAbsorbInputSelectable)

local function instantTransitionConfig()
	return {
		transitionSpec = { frequency = 1000000, dampingRatio = 1 }
	}
end

return function(p1, p2)
	-- upvalues: EnumScreensModule (copy), ChatConversationScreenModule (copy), CryoModule (copy), AutoFocusNavigationModule (copy), ChatDetailsScreenModule (copy), GetFFlagIsSquadEnabledFunction (copy), SquadLobbyScreenModule (copy), SquadInviteFriendsScreenModule (copy), FFlagAppChatDisableAbsorbInputSelectableModule (copy), RoactNavigationModule (copy), instantTransitionConfig (copy)
	local List = {
		{
			[EnumScreensModule.ChatConversation] = {
				screen = ChatConversationScreenModule,
				navigationOptions = CryoModule.Dictionary.join({
					backButtonEnabled = false,
					isRoot = true,
					lockIconEnabled = true,
					tabBarVisible = true
				}, p1 or {})
			}
		},
		{
			[EnumScreensModule.ChatDetails] = {
				screen = AutoFocusNavigationModule(ChatDetailsScreenModule),
				navigationOptions = p1 or {}
			}
		}
	}
	
	if GetFFlagIsSquadEnabledFunction() then
		table.insert(List, {
			[EnumScreensModule.SquadLobby] = {
				screen = AutoFocusNavigationModule(SquadLobbyScreenModule.WideSquadLobbyScreen),
				navigationOptions = p1 or {}
			}
		})
		table.insert(List, {
			[EnumScreensModule.SquadInviteFriends] = {
				screen = AutoFocusNavigationModule(SquadInviteFriendsScreenModule),
				navigationOptions = p1 or {}
			}
		})
	end
	local DefaultNavigationOptions = { tabBarVisible = true }
	
	if FFlagAppChatDisableAbsorbInputSelectableModule then
		DefaultNavigationOptions.absorbInputSelectable = false
	end
	return RoactNavigationModule.createRobloxStackNavigator(List, {
		defaultNavigationOptions = DefaultNavigationOptions,
		transitionConfig = if p2 then instantTransitionConfig else nil
	})
end