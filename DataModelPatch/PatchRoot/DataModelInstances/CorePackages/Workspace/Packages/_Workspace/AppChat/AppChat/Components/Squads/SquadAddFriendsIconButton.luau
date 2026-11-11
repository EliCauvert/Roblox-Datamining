local AppChat = script:FindFirstAncestor("AppChat")
local EnumScreensModule = require(AppChat.EnumScreens)
local Parent = AppChat.Parent
local ConstantsModule = require(AppChat.Constants)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseGetConversationFromIdModule = require(AppChat.Hooks.useGetConversationFromId)
local UseCurrentSquadParentChannelIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadParentChannelId
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local EventNamesModule = require(Parent.SquadsCore.EventNames)
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local SquadInvitePageNavSourceEnum = require(Parent.Squads.Enums).SquadInvitePageNavSourceEnum

return function(p1)
	-- upvalues: ReactModule (copy), SquadExternalContractContext (copy), UseCurrentSquadParentChannelIdFunction (copy), UseGetConversationFromIdModule (copy), UseLocalizationFunction (copy), FFlagConnectionsToFriendsRename (copy), ConstantsModule (copy), EnumScreensModule (copy), EventNamesModule (copy), SquadInvitePageNavSourceEnum (copy), IconButton (copy), Images (copy), IconSize (copy)
	local UseContextResult = ReactModule.useContext(SquadExternalContractContext)
	local UseCurrentSquadParentChannelIdResult = UseCurrentSquadParentChannelIdFunction() or ""
	local UseGetConversationFromIdModuleResult = UseGetConversationFromIdModule(UseCurrentSquadParentChannelIdResult)
	local Participants = UseGetConversationFromIdModuleResult and UseGetConversationFromIdModuleResult.participants or {}
	local UseLocalizationResult = UseLocalizationFunction({
		tooManyPeopleText = {
			if FFlagConnectionsToFriendsRename then "Feature.Chat.Message.AddFriendsPartyLimit" else "Feature.Chat.Message.AddConnectionsPartyLimit",
			friendNum = ConstantsModule.MAX_PARTICIPANT_COUNT,
			connectionsNum = ConstantsModule.MAX_PARTICIPANT_COUNT
		}
	})
	
	return ReactModule.createElement(IconButton, {
		layoutOrder = 0,
		size = UDim2.fromOffset(0, 0),
		icon = Images["icons/actions/friends/friendAdd"],
		iconSize = IconSize.Medium,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: Participants (copy), ConstantsModule (upval), p1 (copy), EnumScreensModule (upval), UseLocalizationResult (copy), UseContextResult (copy), EventNamesModule (upval), SquadInvitePageNavSourceEnum (upval), UseCurrentSquadParentChannelIdResult (copy)
			if ConstantsModule.MAX_PARTICIPANT_COUNT < #Participants then
				p1.navigation.navigate(EnumScreensModule.RoactChatToast, {
					toastProps = {
						toastContent = { toastTitle = UseLocalizationResult.tooManyPeopleText }
					}
				})
				
				return
			else
				UseContextResult.fireSquadAnalytics(EventNamesModule.SquadInvitePageNavSource, {
					inviteNavSource = SquadInvitePageNavSourceEnum.SquadLobbyAddFriendsIconButtonClicked,
					parentChannelId = UseCurrentSquadParentChannelIdResult
				})
				p1.navigation.navigate(EnumScreensModule.SquadInviteFriends, { conversationId = UseCurrentSquadParentChannelIdResult })
			end
		end, {
			UseCurrentSquadParentChannelIdResult,
			p1.navigation,
			Participants
		})
	})
end