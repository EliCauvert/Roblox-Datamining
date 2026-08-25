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

function getTargetMessageInfo(p0)
	return if p0 then {
		targetMessageSenderId = p0.senderTargetId,
		targetMessageId = p0.id,
		targetMessageSentAt = if p0.sent then p0.sent.dateTime else nil,
		targetMessageLength = if p0.content then #p0.content else nil
	} else {}
end

local function _(value, p1, p2)
	return {
		targetMessageSenderId = value,
		targetMessageId = p1,
		targetMessageLength = if p2 then #p2 else nil
	}
end

function ReplyComposeBarContainer(p3)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useLocalUserId (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), getReplyingToStoreModule (ref), getConversationMessageStoreModule (ref), useSignalState (ref), reactModule (ref), fFlagAppChatReplyComposeBarContainerModule (ref), replyComposeBarConstantsModule (ref), chatConversationTelemetryEventsModule (ref), useSelector (ref), populateUserWithStateModule (ref), userProfilesModule (ref), useLocalization (ref), replyComposeBarModule (ref)
	local var22, var26, var27
	local var16 = cryoModule.Dictionary.union(t, p3)
	local var17 = useStyle()
	local var18 = useLocalUserId()
	local var19 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	
	if fFlagAppChatSignalsReplyStoreModule then
		local var20 = getConversationMessageStoreModule(false)
		local var21 = useSignalState(getReplyingToStoreModule(false).getMessageId)
		var22 = reactModule.useMemo(function()
			-- upvalues: var21 (ref), var20 (ref)
			return if var21 == nil then nil else var20.messages(false)[var21]
		end, { var21, var20 })
		local var23 = if var22 and var22.sender_user_id then tostring(var22.sender_user_id) else nil
		local var24 = if var22 then var22.content else nil
		local var25 = if fFlagAppChatReplyComposeBarContainerModule then nil else var17.Tokens.Size.Size_1400 + replyComposeBarConstantsModule.VERTICAL_PADDING * 2 + replyComposeBarConstantsModule.BORDER_HEIGHT
		reactModule.useEffect(function()
			-- upvalues: var19 (ref), chatConversationTelemetryEventsModule (copy), var23 (ref), var21 (ref), var24 (ref), fFlagAppChatReplyComposeBarContainerModule (copy), var16 (ref), var25 (ref)
			var19.emit(chatConversationTelemetryEventsModule.ConversationInputBarReplyComposeRendered, {
				targetMessageSenderId = var23,
				targetMessageId = var21,
				targetMessageLength = if var24 then #var24 else nil
			})
			
			if fFlagAppChatReplyComposeBarContainerModule then
				return function() end
			end
			var16.setReplyComposeBarHeight(var25)
			
			return function()
				-- upvalues: var16 (copy)
				var16.setReplyComposeBarHeight(0)
			end
		end, {})
		var26 = useSelector(function(p4)
			-- upvalues: var23 (ref), populateUserWithStateModule (copy)
			local var34 = if p4 and p4.Users and var23 then p4.Users[var23] else nil
			
			return if var34 then { targetUser = populateUserWithStateModule(p4, var34) } else {}
		end)
		var27 = userProfilesModule.Hooks.useUserProfilesFetch({
			userIds = if var23 then { var23 } else {},
			query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
		})
		local _ = nil
		local var28 = if var26.targetUser and var26.targetUser.displayName and var26.targetUser.displayName ~= "" then var26.targetUser.displayName elseif var27.data and var27.data.userProfiles and (var27.data.userProfiles[1] and var27.data.userProfiles[1].names) then userProfilesModule.Selectors.getCombinedNameFromId(var27.data, var23) else var16.unknownUserKey
		local var29 = var18 == var23
		
		return reactModule.createElement(replyComposeBarModule, {
			LayoutOrder = var16.LayoutOrder,
			totalHeight = if fFlagAppChatReplyComposeBarContainerModule then nil else var25,
			replyingToUserText = useLocalization({
				replyingToUserText = if var29 then var16.replyingToYourselfKey else {
					var16.replyingToOthersKey,
					DISPLAY_NAME = useLocalization(if var28 == var16.unknownUserKey then { replyingToUserName = var28 } else {}).replyingToUserName or var28
				}
			}).replyingToUserText,
			replyingToUserContent = var24,
			replyingToUserId = if var29 or not var26.targetUser then nil else var23,
			onCloseActivated = reactModule.useCallback(function()
				-- upvalues: var19 (ref), chatConversationTelemetryEventsModule (copy), var23 (ref), var21 (ref), var24 (ref), var16 (ref)
				var19.emit(chatConversationTelemetryEventsModule.ConversationInputBarReplyComposeCancelBtnActivated, {
					targetMessageSenderId = var23,
					targetMessageId = var21,
					targetMessageLength = if var24 then #var24 else nil
				})
				var16.close()
			end, {
				var16.close,
				var19,
				var23,
				var21,
				var24
			})
		})
	end
	local var30 = if fFlagAppChatReplyComposeBarContainerModule then nil else var17.Tokens.Size.Size_1400 + replyComposeBarConstantsModule.VERTICAL_PADDING * 2 + replyComposeBarConstantsModule.BORDER_HEIGHT
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), chatConversationTelemetryEventsModule (copy), var16 (ref), fFlagAppChatReplyComposeBarContainerModule (copy), var30 (ref)
		var19.emit(chatConversationTelemetryEventsModule.ConversationInputBarReplyComposeRendered, getTargetMessageInfo(var16.message))
		
		if fFlagAppChatReplyComposeBarContainerModule then
			return function() end
		end
		var16.setReplyComposeBarHeight(var30)
		
		return function()
			-- upvalues: var16 (copy)
			var16.setReplyComposeBarHeight(0)
		end
	end, {})
	local var31 = useSelector(function(p5)
		-- upvalues: var16 (ref), populateUserWithStateModule (copy)
		local var35 = if p5 and p5.Users and var16.message.senderTargetId then p5.Users[var16.message.senderTargetId] else nil
		
		return if var35 then { targetUser = populateUserWithStateModule(p5, var35) } else {}
	end)
	local var32 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { var16.message.senderTargetId },
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	var22 = nil
	var22 = if var31.targetUser and var31.targetUser.displayName and var31.targetUser.displayName ~= "" then var31.targetUser.displayName elseif var32.data and var32.data.userProfiles and (var32.data.userProfiles[1] and var32.data.userProfiles[1].names) then userProfilesModule.Selectors.getCombinedNameFromId(var32.data, var16.message.senderTargetId) else var16.unknownUserKey
	local var33 = var18 == var16.message.senderTargetId
	var26 = useLocalization({
		replyingToUserText = if var33 then var16.replyingToYourselfKey else {
			var16.replyingToOthersKey,
			DISPLAY_NAME = useLocalization(if var22 == var16.unknownUserKey then { replyingToUserName = var22 } else {}).replyingToUserName or var22
		}
	}).replyingToUserText
	var27 = if var33 or not var31.targetUser then nil else var16.message.senderTargetId
	
	return reactModule.createElement(replyComposeBarModule, {
		LayoutOrder = var16.LayoutOrder,
		totalHeight = if fFlagAppChatReplyComposeBarContainerModule then nil else var30,
		replyingToUserText = var26,
		replyingToUserContent = var16.message.content,
		replyingToUserId = var27,
		onCloseActivated = reactModule.useCallback(function()
			-- upvalues: var19 (ref), chatConversationTelemetryEventsModule (copy), var16 (ref)
			var19.emit(chatConversationTelemetryEventsModule.ConversationInputBarReplyComposeCancelBtnActivated, getTargetMessageInfo(var16.message))
			var16.close()
		end, { var16.close, var19, var16.message })
	})
end

return reactModule.memo(ReplyComposeBarContainer)