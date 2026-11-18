local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local UserInputService = game:GetService("UserInputService")
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ReactModule = require(Parent.React)
local ReactionsUserListModule = require(Parent.ReactionsUserList)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local BackHandlerContextModule = require(AppChat.Contexts.BackHandlerContext)
local EnumsModule = require(AppChat.MessageData.Enums)
local GetConversationMessageStoreModule = require(AppChat.Stores.GetConversationMessageStore)
local GetMessageReactionsSheetStoreModule = require(AppChat.Stores.GetMessageReactionsSheetStore)
local SendMessageReactionModule = require(AppChat.Stores.GetMessageReactionsStore.sendMessageReaction)
local UseSheetUserReactionsModule = require(script.Parent.useSheetUserReactions)

local function closeSheet()
	-- upvalues: GetMessageReactionsSheetStoreModule (copy)
	GetMessageReactionsSheetStoreModule(false).closeSheet()
end

local function OpenSheet(p1)
	-- upvalues: UseSheetUserReactionsModule (copy), SignalsReactModule (copy), LocalUserIdStore (copy), UseLocalizationFunction (copy), UserInputService (copy), ReactModule (copy), SignalsModule (copy), GetConversationMessageStoreModule (copy), EnumsModule (copy), BackHandlerContextModule (copy), closeSheet (copy), SendMessageReactionModule (copy), ReactionsUserListModule (copy)
	local UseSheetUserReactionsModuleResult = UseSheetUserReactionsModule(p1.messageId)
	local UseSignalStateResult = SignalsReactModule.useSignalState(LocalUserIdStore.getCurrentUserId)
	local FeatureChatLabelReactions = UseLocalizationFunction({
		title = "Feature.Chat.Label.Reactions",
		removeHint = if UserInputService.TouchEnabled and not UserInputService.MouseEnabled then "Feature.Chat.Label.TapToRemove" else "Feature.Chat.Label.SelectToRemove"
	})
	local UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetConversationMessageStoreModule (upval), p1 (copy), EnumsModule (upval)
		return SignalsModule.createComputed(function(p2): boolean
			-- upvalues: GetConversationMessageStoreModule (upval), p1 (upval), EnumsModule (upval)
			local Message = GetConversationMessageStoreModule(false).getMessage(p1.messageId, p2)
			
			return Message == nil or Message.visibility == EnumsModule.MessageVisibility.Hidden
		end)
	end, { p1.messageId })))
	local UseContextResult = ReactModule.useContext(BackHandlerContextModule)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseContextResult (copy), closeSheet (upval)
		return UseContextResult(closeSheet)
	end, { UseContextResult })
	
	return ReactModule.createElement(ReactionsUserListModule.ReactionsUserListSheet, {
		title = FeatureChatLabelReactions.title,
		userReactions = UseSheetUserReactionsModuleResult,
		localUserId = if UseSignalStateResult1 then nil else UseSignalStateResult,
		tapToRemoveText = FeatureChatLabelReactions.removeHint,
		onRemoveReaction = ReactModule.useCallback(function()
			-- upvalues: SendMessageReactionModule (upval), p1 (copy)
			SendMessageReactionModule(p1.conversationId, p1.messageId, nil)
		end, { p1.conversationId, p1.messageId }),
		onClose = closeSheet
	})
end

return ReactModule.memo(function()
	-- upvalues: SignalsReactModule (copy), GetMessageReactionsSheetStoreModule (copy), ReactModule (copy), OpenSheet (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetMessageReactionsSheetStoreModule(false).getOpenSheet)
	
	return if UseSignalStateResult == nil then nil else ReactModule.createElement(OpenSheet, {
		key = UseSignalStateResult.messageId,
		conversationId = UseSignalStateResult.conversationId,
		messageId = UseSignalStateResult.messageId
	})
end)