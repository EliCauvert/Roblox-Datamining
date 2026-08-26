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
	fetchParentChannelDetails = function(p1, p2)
		-- upvalues: fetchLatestConversationDetailsModule (ref)
		return p1(fetchLatestConversationDetailsModule(p2))
	end,
	inviteToParentChannel = function(p1, p2, p3)
		-- upvalues: conversationModule (ref), appChatNetworkingModule (ref), expandToGroupConversationModule (ref)
		return if p2.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION then p1(appChatNetworkingModule.rodux.AddUserToConversation.API(p2.id, p3)):andThen(function()
			-- upvalues: p2 (ref)
			return p2.id
		end) else p1(expandToGroupConversationModule(p2.id, p3)):andThen(function(p4)
			return p4.id
		end)
	end,
	navigateIntoSquadLobby = navigateIntoSquadLobbyModule,
	removeUserFromParentChannel = function(p1, p2, p3)
		-- upvalues: appChatNetworkingModule (ref)
		return p1(appChatNetworkingModule.rodux.RemoveUserFromConversation.API(p2, p3))
	end,
	createConversation = createConversationModule,
	createFriendConversation = createFriendConversationModule,
	createExperienceInvite = if fFlagEnableSquadRegroupExperimentation then function(p1, p2, p3)
		-- upvalues: createExperienceInvite (ref)
		return createExperienceInvite(p1, p2, p3)
	end else nil,
	useGetConversationFromId = useGetConversationFromIdModule,
	useParentChannelHasGroupUp = function(p1)
		-- upvalues: useGetConversationHasGroupUpFromIdModule (ref)
		return useGetConversationHasGroupUpFromIdModule(p1)
	end,
	useParentChannelHasSquadAccess = function(p1)
		-- upvalues: useGetConversationFromIdModule (ref), conversationChannelsModule (ref), useIsUserPendingModule (ref)
		assert(p1 ~= nil, "Missing parent channel ID")
		local var1 = useGetConversationFromIdModule(p1) or {}
		
		return var1.source == "friends" or not useIsUserPendingModule(var1) and not (var1.participantPendingStatus == conversationChannelsModule.UserPendingStatus.Pending)
	end,
	useParentChannelIsPartyVoiceEligible = function(p1)
		-- upvalues: useGetConversationFromIdModule (ref), moderationType (ref)
		local var1 = useGetConversationFromIdModule(p1)
		
		return if var1 and var1.moderationType ~= nil then var1.moderationType == moderationType.TrustedComms else nil
	end,
	useParentChannelTitleSelector = function(p1)
		-- upvalues: useGetConversationFromIdModule (ref), getConversationTitleModule (ref)
		return getConversationTitleModule(useGetConversationFromIdModule(p1))
	end,
	useIsChatEnabled = useIsChatEnabledModule,
	useIsLoadingChatSettings = function()
		-- upvalues: useSelector (ref), fFlagReadAppChatFetchingVariable (ref), getDeepValueModule (ref), retrievalStatus (ref)
		return useSelector(function(p1)
			-- upvalues: fFlagReadAppChatFetchingVariable (copy), getDeepValueModule (copy), retrievalStatus (copy)
			return if fFlagReadAppChatFetchingVariable then getDeepValueModule(p1, "ChatAppReducer.ChatSettings.retrievalStatus") ~= retrievalStatus.Done else nil
		end)
	end,
	useIsChatUserMessagesEnabled = useIsChatUserMessagesEnabledModule,
	shouldShowOSAForConversation = if fFlagAppChatNavigateBackIfOSAUnacknowledged then shouldShowOSAForConversationModule else nil,
	showGroupOSADialog = if fFlagEnableDialogAfterSquadJoin then function(p1, p2, p3)
		-- upvalues: getOverlayStoreModule (ref), overlayTypesModule (ref), httpService (ref)
		local var1 = getOverlayStoreModule(false)
		var1.showOverlay(overlayTypesModule.GroupOSADialog, {
			conversationId = p1,
			impressionId = httpService:GenerateGUID(false),
			onJoin = function()
				-- upvalues: var1 (ref), p2 (ref)
				var1.dismissOverlay()
				p2()
			end,
			onDecline = function()
				-- upvalues: var1 (ref), p3 (ref)
				var1.dismissOverlay()
				p3()
			end
		})
	end else nil
}