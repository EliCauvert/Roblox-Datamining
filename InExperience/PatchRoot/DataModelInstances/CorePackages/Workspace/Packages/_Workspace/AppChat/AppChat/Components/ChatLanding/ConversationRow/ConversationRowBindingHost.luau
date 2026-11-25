local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local ConversationRowViewModule = require(script.Parent.ConversationRowView)
local UseConversationRowBindingPresentationModule = require(script.Parent.useConversationRowBindingPresentation)
local UseMarkedRowRefModule = require(script.Parent.useMarkedRowRef)

return ReactModule.memo(function(p1)
	-- upvalues: UseConversationRowBindingPresentationModule (copy), UseMarkedRowRefModule (copy), ReactModule (copy), ConversationRowViewModule (copy)
	local UseConversationRowBindingPresentationModuleResult = UseConversationRowBindingPresentationModule({ itemSignal = p1.itemSignal })
	local UseMarkedRowRefModuleResult = UseMarkedRowRefModule(p1.itemSignal, UseConversationRowBindingPresentationModuleResult.rowRef)
	
	return if UseConversationRowBindingPresentationModuleResult.hasConversation then ReactModule.createElement(ConversationRowViewModule, {
		itemSignal = p1.itemSignal,
		entryHeight = UseConversationRowBindingPresentationModuleResult.entryHeight,
		pagePaddingLeft = UseConversationRowBindingPresentationModuleResult.pagePaddingLeft,
		pagePaddingRight = UseConversationRowBindingPresentationModuleResult.pagePaddingRight,
		testId = UseConversationRowBindingPresentationModuleResult.testId,
		locatorTitle = UseConversationRowBindingPresentationModuleResult.locatorTitle,
		title = UseConversationRowBindingPresentationModuleResult.title,
		subtitleText = UseConversationRowBindingPresentationModuleResult.subtitleText,
		timestampText = UseConversationRowBindingPresentationModuleResult.timestampText,
		showSubscriptionBadge = UseConversationRowBindingPresentationModuleResult.showSubscriptionBadge,
		showUnread = UseConversationRowBindingPresentationModuleResult.showUnread,
		showSquadButton = UseConversationRowBindingPresentationModuleResult.showSquadButton,
		showTimestamp = UseConversationRowBindingPresentationModuleResult.showTimestamp,
		squadLocation = UseConversationRowBindingPresentationModuleResult.squadLocation,
		rowRef = UseMarkedRowRefModuleResult or UseConversationRowBindingPresentationModuleResult.rowRef,
		onRowActivated = UseConversationRowBindingPresentationModuleResult.onRowActivated,
		onSquadActivated = UseConversationRowBindingPresentationModuleResult.onSquadActivated,
		showBackground = UseConversationRowBindingPresentationModuleResult.showBackground,
		debugCellValue = UseConversationRowBindingPresentationModuleResult.debugCellValue
	}) else nil
end)