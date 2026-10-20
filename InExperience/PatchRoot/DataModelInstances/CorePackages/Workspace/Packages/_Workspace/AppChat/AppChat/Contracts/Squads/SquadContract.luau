local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local ConversationModule = require(AppChat.Models.Conversation)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local ModerationType = require(AppChat.Models.ConversationChannels).ModerationType
local ExpandToGroupConversationModule = require(AppChat.Conversations.Thunks.expandToGroupConversation)
local FetchLatestConversationDetailsModule = require(AppChat.Conversations.Thunks.fetchLatestConversationDetails)
local GetConversationTitleModule = require(AppChat.Conversations.getConversationTitle)
local UseGetConversationFromIdModule = require(AppChat.Hooks.useGetConversationFromId)
local UseGetConversationHasGroupUpFromIdModule = require(AppChat.Hooks.useGetConversationHasGroupUpFromId)
local UseIsUserPendingModule = require(AppChat.Hooks.useIsUserPending)
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)
local FFlagReadAppChatFetchingVariable = require(Parent.SharedFlags).FFlagReadAppChatFetchingVariable
local FFlagAppChatNavigateBackIfOSAUnacknowledged = require(Parent.SharedFlags).FFlagAppChatNavigateBackIfOSAUnacknowledged
local ShouldShowOSAForConversationModule = require(AppChat.Utils.shouldShowOSAForConversation)
local GetOverlayStoreModule = require(AppChat.Stores.GetOverlayStore)
local OverlayTypesModule = require(AppChat.Stores.GetOverlayStore.OverlayTypes)
local HttpService = game:GetService("HttpService")
local CreateExperienceInviteFunction = require(Parent.Squads.Thunks).CreateExperienceInvite

return {
	fetchParentChannelDetails = function(Callback, p1)
		-- upvalues: FetchLatestConversationDetailsModule (copy)
		return Callback(FetchLatestConversationDetailsModule(p1))
	end,
	inviteToParentChannel = function(Callback, p1, p2)
		-- upvalues: ConversationModule (copy), AppChatNetworkingModule (copy), ExpandToGroupConversationModule (copy)
		return if p1.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION then Callback(AppChatNetworkingModule.rodux.AddUserToConversation.API(p1.id, p2)):andThen(function()
			-- upvalues: p1 (copy)
			return p1.id
		end) else Callback(ExpandToGroupConversationModule(p1.id, p2)):andThen(function(Result)
			return Result.id
		end)
	end,
	navigateIntoSquadLobby = require(AppChat.Conversations.Thunks.NavigateIntoSquadLobby),
	removeUserFromParentChannel = function(Callback, p1, p2)
		-- upvalues: AppChatNetworkingModule (copy)
		return Callback(AppChatNetworkingModule.rodux.RemoveUserFromConversation.API(p1, p2))
	end,
	createConversation = require(AppChat.Conversations.Thunks.createConversation),
	createFriendConversation = require(AppChat.Conversations.Thunks.createFriendConversation),
	createExperienceInvite = if require(Parent.SharedFlags).FFlagEnableSquadRegroupExperimentation then function(p1, p2, p3)
		-- upvalues: CreateExperienceInviteFunction (copy)
		return CreateExperienceInviteFunction(p1, p2, p3)
	end else nil,
	useGetConversationFromId = UseGetConversationFromIdModule,
	useParentChannelHasGroupUp = function(p1)
		-- upvalues: UseGetConversationHasGroupUpFromIdModule (copy)
		return UseGetConversationHasGroupUpFromIdModule(p1)
	end,
	useParentChannelHasSquadAccess = function(p1): boolean
		-- upvalues: UseGetConversationFromIdModule (copy), ConversationChannelsModule (copy), UseIsUserPendingModule (copy)
		assert(p1 ~= nil, "Missing parent channel ID")
		local UseGetConversationFromIdModuleResult = UseGetConversationFromIdModule(p1) or {}
		
		if UseGetConversationFromIdModuleResult.source == "friends" then
			return true
		else
			local IsParticipantPendingStatusMatch = UseGetConversationFromIdModuleResult.participantPendingStatus == ConversationChannelsModule.UserPendingStatus.Pending
			
			return not UseIsUserPendingModule(UseGetConversationFromIdModuleResult) and not IsParticipantPendingStatusMatch
		end
	end,
	useParentChannelIsPartyVoiceEligible = function(p1)
		-- upvalues: UseGetConversationFromIdModule (copy), ModerationType (copy)
		local UseGetConversationFromIdModuleResult = UseGetConversationFromIdModule(p1)
		
		return if UseGetConversationFromIdModuleResult and UseGetConversationFromIdModuleResult.moderationType ~= nil then UseGetConversationFromIdModuleResult.moderationType == ModerationType.TrustedComms else nil
	end,
	useParentChannelTitleSelector = function(p1)
		-- upvalues: UseGetConversationFromIdModule (copy), GetConversationTitleModule (copy)
		return GetConversationTitleModule((UseGetConversationFromIdModule(p1)))
	end,
	useIsChatEnabled = require(AppChat.Hooks.useIsChatEnabled),
	useIsLoadingChatSettings = function()
		-- upvalues: UseSelectorFunction (copy), FFlagReadAppChatFetchingVariable (copy), GetDeepValueModule (copy), RetrievalStatus (copy)
		return UseSelectorFunction(function(p1)
			-- upvalues: FFlagReadAppChatFetchingVariable (upval), GetDeepValueModule (upval), RetrievalStatus (upval)
			return if FFlagReadAppChatFetchingVariable then GetDeepValueModule(p1, "ChatAppReducer.ChatSettings.retrievalStatus") ~= RetrievalStatus.Done else nil
		end)
	end,
	useIsChatUserMessagesEnabled = require(AppChat.Hooks.useIsChatUserMessagesEnabled),
	shouldShowOSAForConversation = if FFlagAppChatNavigateBackIfOSAUnacknowledged then ShouldShowOSAForConversationModule else nil,
	showGroupOSADialog = function(ConversationId, Callback1, Callback)
		-- upvalues: GetOverlayStoreModule (copy), OverlayTypesModule (copy), HttpService (copy)
		local OverlayStoreModule = GetOverlayStoreModule(false)
		OverlayStoreModule.showOverlay(OverlayTypesModule.GroupOSADialog, {
			conversationId = ConversationId,
			impressionId = HttpService:GenerateGUID(false),
			onJoin = function()
				-- upvalues: OverlayStoreModule (copy), Callback1 (copy)
				OverlayStoreModule.dismissOverlay()
				Callback1()
			end,
			onDecline = function()
				-- upvalues: OverlayStoreModule (copy), Callback (copy)
				OverlayStoreModule.dismissOverlay()
				Callback()
			end
		})
	end
}