local appChat = script:FindFirstAncestor("AppChat")
local enumScreensModule = require(appChat.EnumScreens)
local parent = appChat.Parent
local constantsModule = require(appChat.Constants)
local reactModule = require(parent.React)
local squadExternalContractProviderModule = require(parent.SquadsCore.SquadExternalContractProvider)
local UIBloxModule = require(parent.UIBlox)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useGetConversationFromIdModule = require(appChat.Hooks.useGetConversationFromId)
local useCurrentSquadParentChannelId = require(parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local images = UIBloxModule.App.ImageSet.Images
local eventNamesModule = require(parent.SquadsCore.EventNames)
local squadExternalContractContext = squadExternalContractProviderModule.SquadExternalContractContext
local squadInvitePageNavSourceEnum = require(parent.Squads.Enums).SquadInvitePageNavSourceEnum

return function(p1)
	-- upvalues: reactModule (ref), squadExternalContractContext (ref), useCurrentSquadParentChannelId (ref), useGetConversationFromIdModule (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), constantsModule (ref), enumScreensModule (ref), eventNamesModule (ref), squadInvitePageNavSourceEnum (ref), iconButton (ref), images (ref), iconSize (ref)
	local var1 = reactModule.useContext(squadExternalContractContext)
	local var2 = useCurrentSquadParentChannelId() or ""
	local var3 = useGetConversationFromIdModule(var2)
	local var4 = if var3 then var3.participants else {}
	local var5 = useLocalization({
		tooManyPeopleText = {
			if fFlagConnectionsToFriendsRename then "Feature.Chat.Message.AddFriendsPartyLimit" else "Feature.Chat.Message.AddConnectionsPartyLimit",
			friendNum = constantsModule.MAX_PARTICIPANT_COUNT,
			connectionsNum = constantsModule.MAX_PARTICIPANT_COUNT
		}
	})
	
	return reactModule.createElement(iconButton, {
		layoutOrder = 0,
		size = UDim2.fromOffset(0, 0),
		icon = images["icons/actions/friends/friendAdd"],
		iconSize = iconSize.Medium,
		onActivated = reactModule.useCallback(function()
			-- upvalues: var4 (ref), constantsModule (copy), p1 (ref), enumScreensModule (copy), var5 (ref), var1 (ref), eventNamesModule (copy), squadInvitePageNavSourceEnum (copy), var2 (ref)
			if constantsModule.MAX_PARTICIPANT_COUNT < #var4 then
				p1.navigation.navigate(enumScreensModule.RoactChatToast, {
					toastProps = { toastContent = { toastTitle = var5.tooManyPeopleText } }
				})
				
				return
			end
			var1.fireSquadAnalytics(eventNamesModule.SquadInvitePageNavSource, {
				inviteNavSource = squadInvitePageNavSourceEnum.SquadLobbyAddFriendsIconButtonClicked,
				parentChannelId = var2
			})
			p1.navigation.navigate(enumScreensModule.SquadInviteFriends, { conversationId = var2 })
		end, { var2, p1.navigation, var4 })
	})
end