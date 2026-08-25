local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local _ = require(script.Parent.Types)
local smartSuggestionsChipRowModule = require(script.Parent.SmartSuggestionsChipRow)
local useSmartSuggestionsModule = require(script.Parent.useSmartSuggestions)

return reactModule.memo(function(p0)
	-- upvalues: useSmartSuggestionsModule (ref), reactModule (ref), smartSuggestionsChipRowModule (ref)
	local var3 = useSmartSuggestionsModule(p0.conversationId, p0.sendMessage, p0.sendGameLinkChatMessage)
	local suggestions = p0.suggestions or var3.suggestions
	
	return if #suggestions == 0 or var3.areSuggestionsDismissed then nil else reactModule.createElement(smartSuggestionsChipRowModule, {
		LayoutOrder = p0.LayoutOrder,
		suggestions = suggestions,
		onActivated = var3.onActivated
	})
end)