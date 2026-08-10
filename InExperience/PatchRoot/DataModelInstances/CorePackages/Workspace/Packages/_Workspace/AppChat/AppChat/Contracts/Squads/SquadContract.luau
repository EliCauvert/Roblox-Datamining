local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local conversationModule = require(appChat.Models.Conversation)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local createConversationModule = require(appChat.Conversations.Thunks.createConversation)
local createFriendConversationModule = require(appChat.Conversations.Thunks.createFriendConversation)
local moderationType = require(appChat.Models.ConversationChannels).ModerationType
local expandToGroupConversationModule = require(appChat.Conversations.Thunks.expandToGroupConversation)
local fetchLatestConversationDetailsModule = require(appChat.Conversations.Thunks.fetchLatestConversationDetails)
local getConversationTitleModule = require(appChat.Conversations.getConversationTitle)
local navigateIntoSquadLobbyModule = require(appChat.Conversations.Thunks.NavigateIntoSquadLobby)
local useGetConversationFromIdModule = require(appChat.Hooks.useGetConversationFromId)
local useGetConversationHasGroupUpFromIdModule = require(appChat.Hooks.useGetConversationHasGroupUpFromId)
local useIsUserPendingModule = require(appChat.Hooks.useIsUserPending)
local useIsChatEnabledModule = require(appChat.Hooks.useIsChatEnabled)
local useIsChatUserMessagesEnabledModule = require(appChat.Hooks.useIsChatUserMessagesEnabled)
local getDeepValueModule = require(appChat.Utils.getDeepValue)
local fFlagReadAppChatFetchingVariable = require(parent.SharedFlags).FFlagReadAppChatFetchingVariable
local fFlagAppChatNavigateBackIfOSAUnacknowledged = require(parent.SharedFlags).FFlagAppChatNavigateBackIfOSAUnacknowledged
local fFlagEnableSquadRegroupExperimentation = require(parent.SharedFlags).FFlagEnableSquadRegroupExperimentation
local fFlagEnableDialogAfterSquadJoin = require(parent.SharedFlags).FFlagEnableDialogAfterSquadJoin
local shouldShowOSAForConversationModule = require(appChat.Utils.shouldShowOSAForConversation)
local getOverlayStoreModule = require(appChat.Stores.GetOverlayStore)
local overlayTypesModule = require(appChat.Stores.GetOverlayStore.OverlayTypes)
local httpService = game:GetService("HttpService")
local createExperienceInvite = require(parent.Squads.Thunks).CreateExperienceInvite

return {
	fetchParentChannelDetails = function(p0, p1) --[[ line: 36 ]]
		-- upvalues: fetchLatestConversationDetailsModule (ref)
		return p0(fetchLatestConversationDetailsModule(p1))
	end,
	inviteToParentChannel = function(p2, p3, p4) --[[ line: 40 ]]
		-- upvalues: conversationModule (ref), appChatNetworkingModule (ref), expandToGroupConversationModule (ref)
		return if p3.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION then p2(appChatNetworkingModule.rodux.AddUserToConversation.API(p3.id, p4)):andThen(function() --[[ line: 44 ]]
			-- upvalues: p3 (ref)
			return p3.id
		end) else p2(expandToGroupConversationModule(p3.id, p4)):andThen(function(p5) --[[ line: 50 ]]
			return p5.id
		end)
	end,
	navigateIntoSquadLobby = navigateIntoSquadLobbyModule,
	removeUserFromParentChannel = function(p6, p7, p8) --[[ line: 56 ]]
		-- upvalues: appChatNetworkingModule (ref)
		return p6(appChatNetworkingModule.rodux.RemoveUserFromConversation.API(p7, p8))
	end,
	createConversation = createConversationModule,
	createFriendConversation = createFriendConversationModule,
	createExperienceInvite = if fFlagEnableSquadRegroupExperimentation then function(p9, p10, p11) --[[ line: 132 ]]
		-- upvalues: createExperienceInvite (ref)
		return createExperienceInvite(p9, p10, p11)
	end else nil,
	useGetConversationFromId = useGetConversationFromIdModule,
	useParentChannelHasGroupUp = function(p12) --[[ line: 60 ]]
		-- upvalues: useGetConversationHasGroupUpFromIdModule (ref)
		return useGetConversationHasGroupUpFromIdModule(p12)
	end,
	useParentChannelHasSquadAccess = function(p13) --[[ line: 64 ]]
		-- upvalues: useGetConversationFromIdModule (ref), conversationChannelsModule (ref), useIsUserPendingModule (ref)
		assert(p13 ~= nil, "Missing parent channel ID")
		local var20 = useGetConversationFromIdModule(p13) or {}
		
		return var20.source == "friends" or not useIsUserPendingModule(var20) and not (var20.participantPendingStatus == conversationChannelsModule.UserPendingStatus.Pending)
	end,
	useParentChannelIsPartyVoiceEligible = function(p14) --[[ line: 82 ]]
		-- upvalues: useGetConversationFromIdModule (ref), moderationType (ref)
		local var21 = useGetConversationFromIdModule(p14)
		
		return if var21 and var21.moderationType ~= nil then var21.moderationType == moderationType.TrustedComms else nil
	end,
	useParentChannelTitleSelector = function(p15) --[[ line: 90 ]]
		-- upvalues: useGetConversationFromIdModule (ref), getConversationTitleModule (ref)
		return getConversationTitleModule(useGetConversationFromIdModule(p15))
	end,
	useIsChatEnabled = useIsChatEnabledModule,
	useIsLoadingChatSettings = function() --[[ line: 95 ]]
		-- upvalues: useSelector (ref), fFlagReadAppChatFetchingVariable (ref), getDeepValueModule (ref), retrievalStatus (ref)
		return useSelector(function(p16) --[[ line: 96 ]]
			-- upvalues: fFlagReadAppChatFetchingVariable (copy), getDeepValueModule (copy), retrievalStatus (copy)
			return if fFlagReadAppChatFetchingVariable then getDeepValueModule(p16, "ChatAppReducer.ChatSettings.retrievalStatus") ~= retrievalStatus.Done else nil
		end)
	end,
	useIsChatUserMessagesEnabled = useIsChatUserMessagesEnabledModule,
	shouldShowOSAForConversation = if fFlagAppChatNavigateBackIfOSAUnacknowledged then shouldShowOSAForConversationModule else nil,
	showGroupOSADialog = if fFlagEnableDialogAfterSquadJoin then function(p17, p18, p19) --[[ line: 107 ]]
		-- upvalues: getOverlayStoreModule (ref), overlayTypesModule (ref), httpService (ref)
		local var22 = getOverlayStoreModule(false)
		var22.showOverlay(overlayTypesModule.GroupOSADialog, {
			conversationId = p17,
			impressionId = httpService:GenerateGUID(false),
			onJoin = function() --[[ line: 112 ]]
				-- upvalues: var22 (ref), p18 (ref)
				var22.dismissOverlay()
				p18()
			end,
			onDecline = function() --[[ line: 116 ]]
				-- upvalues: var22 (ref), p19 (ref)
				var22.dismissOverlay()
				p19()
			end
		})
	end else nil
}