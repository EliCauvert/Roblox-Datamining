local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactionsUserList)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetEmojiSetsStoreModule = require(AppChat.Stores.GetEmojiSetsStore)
local GetMessageReactionsViewModelStoreModule = require(AppChat.Stores.GetMessageReactionsViewModelStore)
local ToSheetUserReactionsModule = require(script.Parent.toSheetUserReactions)

return function(p1)
	-- upvalues: ReactModule (copy), GetMessageReactionsViewModelStoreModule (copy), SignalsModule (copy), GetEmojiSetsStoreModule (copy), ToSheetUserReactionsModule (copy), SignalsReactModule (copy)
	return (SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: GetMessageReactionsViewModelStoreModule (upval), p1 (copy), SignalsModule (upval), GetEmojiSetsStoreModule (upval), ToSheetUserReactionsModule (upval)
		local MessageReactionsViewModelStoreModule = GetMessageReactionsViewModelStoreModule(false)
		local DisplayReactions = MessageReactionsViewModelStoreModule.getDisplayReactions(p1)
		local ReactionCounts = MessageReactionsViewModelStoreModule.getReactionCounts(p1)
		
		return SignalsModule.createComputed(function(p2)
			-- upvalues: GetEmojiSetsStoreModule (upval), ToSheetUserReactionsModule (upval), DisplayReactions (copy), ReactionCounts (copy)
			local EmojiSetsStoreModule = GetEmojiSetsStoreModule(p2)
			
			return ToSheetUserReactionsModule(DisplayReactions(p2), ReactionCounts(p2) or {}, function(p3)
				-- upvalues: EmojiSetsStoreModule (copy), p2 (copy)
				return EmojiSetsStoreModule.getReactionType(p3, p2)
			end)
		end)
	end, { p1 }))))
end