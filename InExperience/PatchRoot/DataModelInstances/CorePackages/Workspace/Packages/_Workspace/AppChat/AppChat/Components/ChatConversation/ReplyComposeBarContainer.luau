local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ReplyComposeBarModule = require(script.Parent.ReplyComposeBar)
local PopulateUserWithStateModule = require(AppChat.Users.populateUserWithState)
local UserProfilesModule = require(Parent.UserProfiles)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetReplyingToStoreModule = require(AppChat.Stores.GetReplyingToStore)
local GetConversationMessageStoreModule = require(AppChat.Stores.GetConversationMessageStore)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ChatConversationTelemetryEventsModule = require(script.Parent.ChatConversationTelemetryEvents)
local ChatConversationTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local FFlagAppChatSignalsReplyStoreModule = require(AppChat.Flags.FFlagAppChatSignalsReplyStore)
local FFlagAppChatUseUserProfileHydrationModule = require(AppChat.Flags.FFlagAppChatUseUserProfileHydration)
local UseProfileNameModule = require(AppChat.Hooks.useProfileName)
local config = {
	LayoutOrder = 3,
	message = nil,
	inputBoxRef = nil,
	unknownUserKey = "Feature.Chat.Label.UnknownUser",
	replyingToYourselfKey = "Feature.Chat.Label.ReplyingToYourself",
	replyingToOthersKey = "Feature.Chat.Label.ReplyingToOthers",
	close = function() end
}

function getTargetMessageInfo(p1)
	return if p1 then {
		targetMessageSenderId = p1.senderTargetId,
		targetMessageId = p1.id,
		targetMessageSentAt = if p1.sent then p1.sent.dateTime else nil,
		targetMessageLength = if p1.content then #p1.content else nil
	} else {}
end

local function _(TargetMessageSenderId, TargetMessageId, p1)
	return {
		targetMessageSenderId = TargetMessageSenderId,
		targetMessageId = TargetMessageId,
		targetMessageLength = if p1 then #p1 else nil
	}
end

function ReplyComposeBarContainer(p1)
	-- upvalues: CryoModule (copy), config (copy), UseLocalUserIdFunction (copy), UseTelemetryModule (copy), ChatConversationTelemetryLayerModule (copy), FFlagAppChatSignalsReplyStoreModule (copy), GetReplyingToStoreModule (copy), GetConversationMessageStoreModule (copy), UseSignalStateFunction (copy), ReactModule (copy), ChatConversationTelemetryEventsModule (copy), UseSelectorFunction (copy), PopulateUserWithStateModule (copy), FFlagAppChatUseUserProfileHydrationModule (copy), UseProfileNameModule (copy), UserProfilesModule (copy), UseLocalizationFunction (copy), ReplyComposeBarModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseTelemetryModuleResult = UseTelemetryModule(ChatConversationTelemetryLayerModule.Context)
	
	if FFlagAppChatSignalsReplyStoreModule then
		local ReplyingToStoreModule = GetReplyingToStoreModule(false)
		local ConversationMessageStoreModule = GetConversationMessageStoreModule(false)
		local UseSignalStateResult = UseSignalStateFunction(ReplyingToStoreModule.getMessageId)
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: UseSignalStateResult (copy), ConversationMessageStoreModule (copy)
			return if UseSignalStateResult == nil then nil else ConversationMessageStoreModule.messages(false)[UseSignalStateResult]
		end, { UseSignalStateResult, ConversationMessageStoreModule })
		local Text = if UseMemoResult and UseMemoResult.sender_user_id then tostring(UseMemoResult.sender_user_id) else nil
		local Content = if UseMemoResult then UseMemoResult.content else nil
		ReactModule.useEffect(function()
			-- upvalues: UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), Text (copy), UseSignalStateResult (copy), Content (copy)
			UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ConversationInputBarReplyComposeRendered, {
				targetMessageSenderId = Text,
				targetMessageId = UseSignalStateResult,
				targetMessageLength = if Content then #Content else nil
			})
			
			return function() end
		end, {})
		local UseSelectorResult = UseSelectorFunction(function(p2)
			-- upvalues: Text (copy), PopulateUserWithStateModule (upval)
			local User = if p2 and p2.Users and Text then p2.Users[Text] else nil
			
			return if User then { targetUser = PopulateUserWithStateModule(p2, User) } else {}
		end)
		local UseUserProfilesFetchResult = nil
		local v1 = nil
		
		if FFlagAppChatUseUserProfileHydrationModule then
			v1 = UseProfileNameModule(Text)
		else
			UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
				userIds = if Text then { Text } else {},
				query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
			})
		end
		local DisplayName = if UseSelectorResult.targetUser and UseSelectorResult.targetUser.displayName and UseSelectorResult.targetUser.displayName ~= "" then UseSelectorResult.targetUser.displayName elseif FFlagAppChatUseUserProfileHydrationModule then v1.combinedName or UnionResult.unknownUserKey elseif UseUserProfilesFetchResult.data and UseUserProfilesFetchResult.data.userProfiles and UseUserProfilesFetchResult.data.userProfiles[1] and UseUserProfilesFetchResult.data.userProfiles[1].names then UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, Text) else UnionResult.unknownUserKey
		local ReplyingToUserName = UseLocalizationFunction(if DisplayName == UnionResult.unknownUserKey then { replyingToUserName = DisplayName } else {}).replyingToUserName or DisplayName
		local IsUseLocalUserIdResultMatch = UseLocalUserIdResult == Text
		
		return ReactModule.createElement(ReplyComposeBarModule, {
			LayoutOrder = UnionResult.LayoutOrder,
			replyingToUserText = UseLocalizationFunction({
				replyingToUserText = if IsUseLocalUserIdResultMatch then UnionResult.replyingToYourselfKey else {
					UnionResult.replyingToOthersKey,
					DISPLAY_NAME = ReplyingToUserName
				}
			}).replyingToUserText,
			replyingToUserContent = Content,
			replyingToUserId = if IsUseLocalUserIdResultMatch or not UseSelectorResult.targetUser then nil else Text,
			onCloseActivated = ReactModule.useCallback(function()
				-- upvalues: UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), Text (copy), UseSignalStateResult (copy), Content (copy), UnionResult (copy)
				UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ConversationInputBarReplyComposeCancelBtnActivated, {
					targetMessageSenderId = Text,
					targetMessageId = UseSignalStateResult,
					targetMessageLength = if Content then #Content else nil
				})
				UnionResult.close()
			end, {
				UnionResult.close,
				UseTelemetryModuleResult,
				Text,
				UseSignalStateResult,
				Content
			})
		})
	else
		ReactModule.useEffect(function()
			-- upvalues: UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), UnionResult (copy)
			UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ConversationInputBarReplyComposeRendered, getTargetMessageInfo(UnionResult.message))
			
			return function() end
		end, {})
		local UseSelectorResult1 = UseSelectorFunction(function(p2)
			-- upvalues: UnionResult (copy), PopulateUserWithStateModule (upval)
			local User = if p2 and p2.Users and UnionResult.message.senderTargetId then p2.Users[UnionResult.message.senderTargetId] else nil
			
			return if User then { targetUser = PopulateUserWithStateModule(p2, User) } else {}
		end)
		local UseUserProfilesFetchResult1 = nil
		local v2 = nil
		
		if FFlagAppChatUseUserProfileHydrationModule then
			v2 = UseProfileNameModule(UnionResult.message.senderTargetId)
		else
			UseUserProfilesFetchResult1 = UserProfilesModule.Hooks.useUserProfilesFetch({
				userIds = { UnionResult.message.senderTargetId },
				query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
			})
		end
		local DisplayName = if UseSelectorResult1.targetUser and UseSelectorResult1.targetUser.displayName and UseSelectorResult1.targetUser.displayName ~= "" then UseSelectorResult1.targetUser.displayName elseif FFlagAppChatUseUserProfileHydrationModule then v2.combinedName or UnionResult.unknownUserKey elseif UseUserProfilesFetchResult1.data and UseUserProfilesFetchResult1.data.userProfiles and UseUserProfilesFetchResult1.data.userProfiles[1] and UseUserProfilesFetchResult1.data.userProfiles[1].names then UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult1.data, UnionResult.message.senderTargetId) else UnionResult.unknownUserKey
		local ReplyingToUserName = UseLocalizationFunction(if DisplayName == UnionResult.unknownUserKey then { replyingToUserName = DisplayName } else {}).replyingToUserName or DisplayName
		local IsUseLocalUserIdResultMatch = UseLocalUserIdResult == UnionResult.message.senderTargetId
		
		return ReactModule.createElement(ReplyComposeBarModule, {
			LayoutOrder = UnionResult.LayoutOrder,
			replyingToUserText = UseLocalizationFunction({
				replyingToUserText = if IsUseLocalUserIdResultMatch then UnionResult.replyingToYourselfKey else {
					UnionResult.replyingToOthersKey,
					DISPLAY_NAME = ReplyingToUserName
				}
			}).replyingToUserText,
			replyingToUserContent = UnionResult.message.content,
			replyingToUserId = if IsUseLocalUserIdResultMatch or not UseSelectorResult1.targetUser then nil else UnionResult.message.senderTargetId,
			onCloseActivated = ReactModule.useCallback(function()
				-- upvalues: UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), UnionResult (copy)
				UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ConversationInputBarReplyComposeCancelBtnActivated, getTargetMessageInfo(UnionResult.message))
				UnionResult.close()
			end, {
				UnionResult.close,
				UseTelemetryModuleResult,
				UnionResult.message
			})
		})
	end
end

return ReactModule.memo(ReplyComposeBarContainer)