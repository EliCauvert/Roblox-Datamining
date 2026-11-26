local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactionsModule = require(Parent.Reactions)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local ConstantsModule = require(AppChat.Stores.GetEmojiSetsStore.Constants)
local GetEmojiSetsStoreModule = require(AppChat.Stores.GetEmojiSetsStore)
local GetMessageReactionPickerStoreModule = require(AppChat.Stores.GetMessageReactionPickerStore)
local GetMessageReactionsViewModelStoreModule = require(AppChat.Stores.GetMessageReactionsViewModelStore)
local SendMessageReactionModule = require(AppChat.Stores.GetMessageReactionsStore.sendMessageReaction)
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide

local function useViewerReactionType(MessageId)
	-- upvalues: ReactModule (copy), GetMessageReactionsViewModelStoreModule (copy), SignalsModule (copy), GetEmojiSetsStoreModule (copy), SignalsReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetMessageReactionsViewModelStoreModule (upval), MessageId (copy), SignalsModule (upval), GetEmojiSetsStoreModule (upval)
		local DisplayReactions = GetMessageReactionsViewModelStoreModule(false).getDisplayReactions(MessageId)
		
		return (SignalsModule.createComputed(function(p1)
			-- upvalues: DisplayReactions (copy), GetEmojiSetsStoreModule (upval)
			for _, value in DisplayReactions(p1) do
				if value.has_user_reacted then
					return GetEmojiSetsStoreModule(p1).getReactionType(value.emote_id, p1)
				end
			end
			return nil
		end))
	end, { MessageId })
	SignalsReactModule.useSignalState(UseMemoResult)
	
	return UseMemoResult(false)
end

return function(p1, IsOpen, AnchorRef)
	-- upvalues: FoundationModule (copy), GetMessageReactionPickerStoreModule (copy), useViewerReactionType (copy), ReactModule (copy), GetEmojiSetsStoreModule (copy), SendMessageReactionModule (copy), ConstantsModule (copy), ReactionsModule (copy), PopoverSide (copy), PopoverAlign (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local MessageReactionPickerStoreModule = GetMessageReactionPickerStoreModule(false)
	local ConversationId = p1.conversationId
	local MessageId = p1.messageId
	local UseViewerReactionTypeResult = useViewerReactionType(MessageId)
	
	return {
		isOpen = IsOpen,
		anchorRef = AnchorRef,
		onReactionSelected = ReactModule.useCallback(function(p2, _)
			-- upvalues: MessageReactionPickerStoreModule (copy), UseViewerReactionTypeResult (copy), GetEmojiSetsStoreModule (upval), SendMessageReactionModule (upval), ConversationId (copy), MessageId (copy)
			MessageReactionPickerStoreModule.closePicker()
			local IsUseViewerReactionTypeResultMatch = p2 == UseViewerReactionTypeResult
			local EmoteId = if IsUseViewerReactionTypeResultMatch then nil else GetEmojiSetsStoreModule(false).getEmoteId(p2, false)
			
			if IsUseViewerReactionTypeResultMatch or EmoteId ~= nil then
				SendMessageReactionModule(ConversationId, MessageId, EmoteId)
				
				return
			end
		end, {
			MessageReactionPickerStoreModule,
			ConversationId,
			MessageId,
			UseViewerReactionTypeResult
		}),
		onDismiss = MessageReactionPickerStoreModule.closePicker,
		reactions = ConstantsModule.PICKER_REACTION_ORDER,
		reactionSize = ReactionsModule.Enums.ReactionSize.Medium,
		selectedReactions = ReactModule.useMemo(function()
			-- upvalues: UseViewerReactionTypeResult (copy)
			return if UseViewerReactionTypeResult == nil then nil else { [UseViewerReactionTypeResult] = true }
		end, { UseViewerReactionTypeResult }),
		side = {
			position = PopoverSide.Top,
			offset = UseTokensResult.Size.Size_300
		},
		align = if p1.isIncoming then PopoverAlign.Start else PopoverAlign.End
	}
end