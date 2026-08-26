local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local _ = require(script.Parent.Types)
local smartSuggestionsChipRowModule = require(script.Parent.SmartSuggestionsChipRow)
local useSmartSuggestionsModule = require(script.Parent.useSmartSuggestions)

return reactModule.memo(function(p1)
	-- upvalues: useSmartSuggestionsModule (ref), reactModule (ref), smartSuggestionsChipRowModule (ref)
	local var1 = useSmartSuggestionsModule(p1.conversationId, p1.sendMessage, p1.sendGameLinkChatMessage)
	local suggestions = p1.suggestions or var1.suggestions
	
	return if #suggestions == 0 or var1.areSuggestionsDismissed then nil else reactModule.createElement(smartSuggestionsChipRowModule, {
		LayoutOrder = p1.LayoutOrder,
		suggestions = suggestions,
		onActivated = var1.onActivated
	})
end)