local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roactNavigationModule = require(parent.RoactNavigation)
local cryoModule = require(parent.Cryo)
local autoFocusNavigationModule = require(script.Parent.Parent.autoFocusNavigation)
local enumScreensModule = require(appChat.EnumScreens)
local chatConversationScreenModule = require(appChat.Components.ChatConversation.ChatConversationScreen)
local chatDetailsScreenModule = require(appChat.Components.ChatDetails.ChatDetailsScreen)
local squadInviteFriendsScreenModule = require(appChat.Components.Squads.SquadInviteFriendsScreen)
local squadLobbyScreenModule = require(appChat.Components.Squads.SquadLobbyScreen)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagAppChatDisableAbsorbInputSelectableModule = require(appChat.Flags.FFlagAppChatDisableAbsorbInputSelectable)

local function instantTransitionConfig()
	return {
		transitionSpec = { frequency = 1000000, dampingRatio = 1 }
	}
end

return function(p1, p2)
	-- upvalues: enumScreensModule (ref), chatConversationScreenModule (ref), cryoModule (ref), autoFocusNavigationModule (ref), chatDetailsScreenModule (ref), getFFlagIsSquadEnabled (ref), squadLobbyScreenModule (ref), squadInviteFriendsScreenModule (ref), fFlagAppChatDisableAbsorbInputSelectableModule (ref), roactNavigationModule (ref), instantTransitionConfig (ref)
	local list = {
		{
			[enumScreensModule.ChatConversation] = {
				screen = chatConversationScreenModule,
				navigationOptions = cryoModule.Dictionary.join({
					backButtonEnabled = false,
					isRoot = true,
					lockIconEnabled = true,
					tabBarVisible = true
				}, p1 or {})
			}
		},
		{
			[enumScreensModule.ChatDetails] = {
				screen = autoFocusNavigationModule(chatDetailsScreenModule),
				navigationOptions = p1 or {}
			}
		}
	}
	
	if getFFlagIsSquadEnabled() then
		table.insert(list, {
			[enumScreensModule.SquadLobby] = {
				screen = autoFocusNavigationModule(squadLobbyScreenModule.WideSquadLobbyScreen),
				navigationOptions = p1 or {}
			}
		})
		table.insert(list, {
			[enumScreensModule.SquadInviteFriends] = {
				screen = autoFocusNavigationModule(squadInviteFriendsScreenModule),
				navigationOptions = p1 or {}
			}
		})
	end
	local t = { tabBarVisible = true }
	
	if fFlagAppChatDisableAbsorbInputSelectableModule then
		t.absorbInputSelectable = false
	end
	return roactNavigationModule.createRobloxStackNavigator(list, {
		defaultNavigationOptions = t,
		transitionConfig = if p2 then instantTransitionConfig else nil
	})
end