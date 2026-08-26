local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local UIBloxModule = require(parent.UIBlox)
local replyComposeBarModule = require(script.Parent.ReplyComposeBar)
local replyComposeBarConstantsModule = require(script.Parent.ReplyComposeBarConstants)
local populateUserWithStateModule = require(appChat.Users.populateUserWithState)
local userProfilesModule = require(parent.UserProfiles)
local useSignalState = require(parent.SignalsReact).useSignalState
local getReplyingToStoreModule = require(appChat.Stores.GetReplyingToStore)
local getConversationMessageStoreModule = require(appChat.Stores.GetConversationMessageStore)
local useStyle = UIBloxModule.Core.Style.useStyle
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local chatConversationTelemetryEventsModule = require(script.Parent.ChatConversationTelemetryEvents)
local chatConversationTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local fFlagAppChatReplyComposeBarContainerModule = require(appChat.Flags.FFlagAppChatReplyComposeBarContainer)
local fFlagAppChatSignalsReplyStoreModule = require(appChat.Flags.FFlagAppChatSignalsReplyStore)
local t = {
	LayoutOrder = 3,
	message = nil,
	inputBoxRef = nil,
	unknownUserKey = "Feature.Chat.Label.UnknownUser",
	replyingToYourselfKey = "Feature.Chat.Label.ReplyingToYourself",
	replyingToOthersKey = "Feature.Chat.Label.ReplyingToOthers",
	close = function() end,
	setReplyComposeBarHeight = function(_) end
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
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useLocalUserId (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), getReplyingToStoreModule (ref), getConversationMessageStoreModule (ref), useSignalState (ref), reactModule (ref), fFlagAppChatReplyComposeBarContainerModule (ref), replyComposeBarConstantsModule (ref), chatConversationTelemetryEventsModule (ref), useSelector (ref), populateUserWithStateModule (ref), userProfilesModule (ref), useLocalization (ref), replyComposeBarModule (ref)
	local var1, var2, var3
	local var4 = cryoModule.Dictionary.union(t, p1)
	local var5 = useStyle()
	local var6 = useLocalUserId()
	local var7 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	
	if fFlagAppChatSignalsReplyStoreModule then
		local var8 = getConversationMessageStoreModule(false)
		local var9 = useSignalState(getReplyingToStoreModule(false).getMessageId)
		var1 = reactModule.useMemo(function()
			-- upvalues: var9 (ref), var8 (ref)
			return if var9 == nil then nil else var8.messages(false)[var9]
		end, { var9, var8 })
		local var10 = if var1 and var1.sender_user_id then tostring(var1.sender_user_id) else nil
		local var11 = if var1 then var1.content else nil
		local var12 = if fFlagAppChatReplyComposeBarContainerModule then nil else var5.Tokens.Size.Size_1400 + replyComposeBarConstantsModule.VERTICAL_PADDING * 2 + replyComposeBarConstantsModule.BORDER_HEIGHT
		reactModule.useEffect(function()
			-- upvalues: var7 (ref), chatConversationTelemetryEventsModule (copy), var10 (ref), var9 (ref), var11 (ref), fFlagAppChatReplyComposeBarContainerModule (copy), var4 (ref), var12 (ref)
			var7.emit(chatConversationTelemetryEventsModule.ConversationInputBarReplyComposeRendered, {
				targetMessageSenderId = var10,
				targetMessageId = var9,
				targetMessageLength = if var11 then #var11 else nil
			})
			
			if fFlagAppChatReplyComposeBarContainerModule then
				return function() end
			end
			var4.setReplyComposeBarHeight(var12)
			
			return function()
				-- upvalues: var4 (copy)
				var4.setReplyComposeBarHeight(0)
			end
		end, {})
		var2 = useSelector(function(p2)
			-- upvalues: var10 (ref), populateUserWithStateModule (copy)
			local var13 = if p2 and p2.Users and var10 then p2.Users[var10] else nil
			
			return if var13 then { targetUser = populateUserWithStateModule(p2, var13) } else {}
		end)
		var3 = userProfilesModule.Hooks.useUserProfilesFetch({
			userIds = if var10 then { var10 } else {},
			query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
		})
		local _ = nil
		local var13 = if var2.targetUser and var2.targetUser.displayName and var2.targetUser.displayName ~= "" then var2.targetUser.displayName elseif var3.data and var3.data.userProfiles and (var3.data.userProfiles[1] and var3.data.userProfiles[1].names) then userProfilesModule.Selectors.getCombinedNameFromId(var3.data, var10) else var4.unknownUserKey
		local var14 = var6 == var10
		
		return reactModule.createElement(replyComposeBarModule, {
			LayoutOrder = var4.LayoutOrder,
			totalHeight = if fFlagAppChatReplyComposeBarContainerModule then nil else var12,
			replyingToUserText = useLocalization({
				replyingToUserText = if var14 then var4.replyingToYourselfKey else {
					var4.replyingToOthersKey,
					DISPLAY_NAME = useLocalization(if var13 == var4.unknownUserKey then { replyingToUserName = var13 } else {}).replyingToUserName or var13
				}
			}).replyingToUserText,
			replyingToUserContent = var11,
			replyingToUserId = if var14 or not var2.targetUser then nil else var10,
			onCloseActivated = reactModule.useCallback(function()
				-- upvalues: var7 (ref), chatConversationTelemetryEventsModule (copy), var10 (ref), var9 (ref), var11 (ref), var4 (ref)
				var7.emit(chatConversationTelemetryEventsModule.ConversationInputBarReplyComposeCancelBtnActivated, {
					targetMessageSenderId = var10,
					targetMessageId = var9,
					targetMessageLength = if var11 then #var11 else nil
				})
				var4.close()
			end, {
				var4.close,
				var7,
				var10,
				var9,
				var11
			})
		})
	end
	local var15 = if fFlagAppChatReplyComposeBarContainerModule then nil else var5.Tokens.Size.Size_1400 + replyComposeBarConstantsModule.VERTICAL_PADDING * 2 + replyComposeBarConstantsModule.BORDER_HEIGHT
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), chatConversationTelemetryEventsModule (copy), var4 (ref), fFlagAppChatReplyComposeBarContainerModule (copy), var15 (ref)
		var7.emit(chatConversationTelemetryEventsModule.ConversationInputBarReplyComposeRendered, getTargetMessageInfo(var4.message))
		
		if fFlagAppChatReplyComposeBarContainerModule then
			return function() end
		end
		var4.setReplyComposeBarHeight(var15)
		
		return function()
			-- upvalues: var4 (copy)
			var4.setReplyComposeBarHeight(0)
		end
	end, {})
	local var16 = useSelector(function(p2)
		-- upvalues: var4 (ref), populateUserWithStateModule (copy)
		local var17 = if p2 and p2.Users and var4.message.senderTargetId then p2.Users[var4.message.senderTargetId] else nil
		
		return if var17 then { targetUser = populateUserWithStateModule(p2, var17) } else {}
	end)
	local var17 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { var4.message.senderTargetId },
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	var1 = nil
	var1 = if var16.targetUser and var16.targetUser.displayName and var16.targetUser.displayName ~= "" then var16.targetUser.displayName elseif var17.data and var17.data.userProfiles and (var17.data.userProfiles[1] and var17.data.userProfiles[1].names) then userProfilesModule.Selectors.getCombinedNameFromId(var17.data, var4.message.senderTargetId) else var4.unknownUserKey
	local var18 = var6 == var4.message.senderTargetId
	var2 = useLocalization({
		replyingToUserText = if var18 then var4.replyingToYourselfKey else {
			var4.replyingToOthersKey,
			DISPLAY_NAME = useLocalization(if var1 == var4.unknownUserKey then { replyingToUserName = var1 } else {}).replyingToUserName or var1
		}
	}).replyingToUserText
	var3 = if var18 or not var16.targetUser then nil else var4.message.senderTargetId
	
	return reactModule.createElement(replyComposeBarModule, {
		LayoutOrder = var4.LayoutOrder,
		totalHeight = if fFlagAppChatReplyComposeBarContainerModule then nil else var15,
		replyingToUserText = var2,
		replyingToUserContent = var4.message.content,
		replyingToUserId = var3,
		onCloseActivated = reactModule.useCallback(function()
			-- upvalues: var7 (ref), chatConversationTelemetryEventsModule (copy), var4 (ref)
			var7.emit(chatConversationTelemetryEventsModule.ConversationInputBarReplyComposeCancelBtnActivated, getTargetMessageInfo(var4.message))
			var4.close()
		end, { var4.close, var7, var4.message })
	})
end

return reactModule.memo(ReplyComposeBarContainer)