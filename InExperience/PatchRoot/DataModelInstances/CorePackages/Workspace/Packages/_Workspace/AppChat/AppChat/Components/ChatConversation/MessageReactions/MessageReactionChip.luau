local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactionsModule = require(Parent.Reactions)
local GetMessageReactionsSheetStoreModule = require(AppChat.Stores.GetMessageReactionsSheetStore)
local UseMessageReactionCountsModule = require(script.Parent.useMessageReactionCounts)

return ReactModule.memo(function(p1)
	-- upvalues: UseMessageReactionCountsModule (copy), ReactModule (copy), GetMessageReactionsSheetStoreModule (copy), FoundationModule (copy), ReactionsModule (copy)
	local UseMessageReactionCountsModuleResult = UseMessageReactionCountsModule(p1.messageId)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: GetMessageReactionsSheetStoreModule (upval), p1 (copy)
		GetMessageReactionsSheetStoreModule(false).openSheet(p1.conversationId, p1.messageId)
	end, { p1.conversationId, p1.messageId })
	
	return if UseMessageReactionCountsModuleResult == nil then nil else ReactModule.createElement(FoundationModule.View, {
		ZIndex = 2,
		testId = "MessageReactionChip",
		tag = {
			["col align-y-bottom size-full-600"] = true,
			["align-x-left"] = p1.isIncoming,
			["align-x-right"] = not p1.isIncoming
		},
		LayoutOrder = p1.layoutOrder
	}, {
		ReactionChip = if p1.isHidden then nil else ReactModule.createElement(ReactionsModule.ReactionChip, {
			reactionCounts = UseMessageReactionCountsModuleResult,
			onActivated = if p1.isDisabled then nil else UseResult
		})
	})
end)