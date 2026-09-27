local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local replyComposeBarModule = require(script.Parent.ReplyComposeBar)
local populateUserWithStateModule = require(appChat.Users.populateUserWithState)
local userProfilesModule = require(parent.UserProfiles)
local useSignalState = require(parent.SignalsReact).useSignalState
local getReplyingToStoreModule = require(appChat.Stores.GetReplyingToStore)
local getConversationMessageStoreModule = require(appChat.Stores.GetConversationMessageStore)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local chatConversationTelemetryEventsModule = require(script.Parent.ChatConversationTelemetryEvents)
local chatConversationTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local fFlagAppChatSignalsReplyStoreModule = require(appChat.Flags.FFlagAppChatSignalsReplyStore)
local t = {
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

local function _(value, p1, p2)
	return {
		targetMessageSenderId = value,
		targetMessageId = p1,
		targetMessageLength = if p2 then #p2 else nil
	}
end

function ReplyComposeBarContainer(p1)
	-- upvalues: cryoModule (ref), t (ref), useLocalUserId (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), getReplyingToStoreModule (ref), getConversationMessageStoreModule (ref), useSignalState (ref), reactModule (ref), chatConversationTelemetryEventsModule (ref), useSelector (ref), populateUserWithStateModule (ref), userProfilesModule (ref), useLocalization (ref), replyComposeBarModule (ref)
	local var1, var2
	local var3 = cryoModule.Dictionary.union(t, p1)
	local var4 = useLocalUserId()
	local var5 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	
	if fFlagAppChatSignalsReplyStoreModule then
		local var6 = getConversationMessageStoreModule(false)
		local var7 = useSignalState(getReplyingToStoreModule(false).getMessageId)
		local var8 = reactModule.useMemo(function()
			-- upvalues: var7 (ref), var6 (ref)
			return if var7 == nil then nil else var6.messages(false)[var7]
		end, { var7, var6 })
		local var9 = if var8 and var8.sender_user_id then tostring(var8.sender_user_id) else nil
		local var10 = if var8 then var8.content else nil
		reactModule.useEffect(function()
			-- upvalues: var5 (ref), chatConversationTelemetryEventsModule (copy), var9 (ref), var7 (ref), var10 (ref)
			var5.emit(chatConversationTelemetryEventsModule.ConversationInputBarReplyComposeRendered, {
				targetMessageSenderId = var9,
				targetMessageId = var7,
				targetMessageLength = if var10 then #var10 else nil
			})
			
			return function() end
		end, {})
		var1 = useSelector(function(p2)
			-- upvalues: var9 (ref), populateUserWithStateModule (copy)
			local var11 = if p2 and p2.Users and var9 then p2.Users[var9] else nil
			
			return if var11 then { targetUser = populateUserWithStateModule(p2, var11) } else {}
		end)
		var2 = userProfilesModule.Hooks.useUserProfilesFetch({
			userIds = if var9 then { var9 } else {},
			query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
		})
		local _ = nil
		local var11 = if var1.targetUser and var1.targetUser.displayName and var1.targetUser.displayName ~= "" then var1.targetUser.displayName elseif var2.data and var2.data.userProfiles and (var2.data.userProfiles[1] and var2.data.userProfiles[1].names) then userProfilesModule.Selectors.getCombinedNameFromId(var2.data, var9) else var3.unknownUserKey
		local var12 = var4 == var9
		
		return reactModule.createElement(replyComposeBarModule, {
			LayoutOrder = var3.LayoutOrder,
			replyingToUserText = useLocalization({
				replyingToUserText = if var12 then var3.replyingToYourselfKey else {
					var3.replyingToOthersKey,
					DISPLAY_NAME = useLocalization(if var11 == var3.unknownUserKey then { replyingToUserName = var11 } else {}).replyingToUserName or var11
				}
			}).replyingToUserText,
			replyingToUserContent = var10,
			replyingToUserId = if var12 or not var1.targetUser then nil else var9,
			onCloseActivated = reactModule.useCallback(function()
				-- upvalues: var5 (ref), chatConversationTelemetryEventsModule (copy), var9 (ref), var7 (ref), var10 (ref), var3 (ref)
				var5.emit(chatConversationTelemetryEventsModule.ConversationInputBarReplyComposeCancelBtnActivated, {
					targetMessageSenderId = var9,
					targetMessageId = var7,
					targetMessageLength = if var10 then #var10 else nil
				})
				var3.close()
			end, {
				var3.close,
				var5,
				var9,
				var7,
				var10
			})
		})
	end
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), chatConversationTelemetryEventsModule (copy), var3 (ref)
		var5.emit(chatConversationTelemetryEventsModule.ConversationInputBarReplyComposeRendered, getTargetMessageInfo(var3.message))
		
		return function() end
	end, {})
	local var13 = useSelector(function(p2)
		-- upvalues: var3 (ref), populateUserWithStateModule (copy)
		local var14 = if p2 and p2.Users and var3.message.senderTargetId then p2.Users[var3.message.senderTargetId] else nil
		
		return if var14 then { targetUser = populateUserWithStateModule(p2, var14) } else {}
	end)
	local var14 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { var3.message.senderTargetId },
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local _ = nil
	local var15 = if var13.targetUser and var13.targetUser.displayName and var13.targetUser.displayName ~= "" then var13.targetUser.displayName elseif var14.data and var14.data.userProfiles and (var14.data.userProfiles[1] and var14.data.userProfiles[1].names) then userProfilesModule.Selectors.getCombinedNameFromId(var14.data, var3.message.senderTargetId) else var3.unknownUserKey
	local var16 = var4 == var3.message.senderTargetId
	var1 = useLocalization({
		replyingToUserText = if var16 then var3.replyingToYourselfKey else {
			var3.replyingToOthersKey,
			DISPLAY_NAME = useLocalization(if var15 == var3.unknownUserKey then { replyingToUserName = var15 } else {}).replyingToUserName or var15
		}
	}).replyingToUserText
	var2 = if var16 or not var13.targetUser then nil else var3.message.senderTargetId
	
	return reactModule.createElement(replyComposeBarModule, {
		LayoutOrder = var3.LayoutOrder,
		replyingToUserText = var1,
		replyingToUserContent = var3.message.content,
		replyingToUserId = var2,
		onCloseActivated = reactModule.useCallback(function()
			-- upvalues: var5 (ref), chatConversationTelemetryEventsModule (copy), var3 (ref)
			var5.emit(chatConversationTelemetryEventsModule.ConversationInputBarReplyComposeCancelBtnActivated, getTargetMessageInfo(var3.message))
			var3.close()
		end, { var3.close, var5, var3.message })
	})
end

return reactModule.memo(ReplyComposeBarContainer)