local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local conversationRowViewModule = require(script.Parent.ConversationRowView)
local useConversationRowBindingPresentationModule = require(script.Parent.useConversationRowBindingPresentation)

return reactModule.memo(function(p1)
	-- upvalues: useConversationRowBindingPresentationModule (ref), reactModule (ref), conversationRowViewModule (ref)
	local var1 = useConversationRowBindingPresentationModule({ itemSignal = p1.itemSignal })
	
	return if var1.hasConversation then reactModule.createElement(conversationRowViewModule, {
		itemSignal = p1.itemSignal,
		entryHeight = var1.entryHeight,
		pagePaddingLeft = var1.pagePaddingLeft,
		pagePaddingRight = var1.pagePaddingRight,
		testId = var1.testId,
		locatorTitle = var1.locatorTitle,
		title = var1.title,
		subtitleText = var1.subtitleText,
		timestampText = var1.timestampText,
		showSubscriptionBadge = var1.showSubscriptionBadge,
		showUnread = var1.showUnread,
		showSquadButton = var1.showSquadButton,
		showTimestamp = var1.showTimestamp,
		squadLocation = var1.squadLocation,
		rowRef = var1.rowRef,
		onRowActivated = var1.onRowActivated,
		onSquadActivated = var1.onSquadActivated,
		showBackground = var1.showBackground,
		debugCellValue = var1.debugCellValue
	}) else nil
end)