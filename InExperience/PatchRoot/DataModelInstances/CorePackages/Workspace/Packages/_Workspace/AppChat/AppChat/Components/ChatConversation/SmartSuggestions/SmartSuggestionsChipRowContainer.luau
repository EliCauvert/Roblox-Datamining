local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local _ = require(script.Parent.Types)
local SmartSuggestionsChipRowModule = require(script.Parent.SmartSuggestionsChipRow)
local UseSmartSuggestionsModule = require(script.Parent.useSmartSuggestions)

return ReactModule.memo(function(Frame) --[[ Line: 27 | Named "SmartSuggestionsChipRowContainer" ]]
	-- upvalues: UseSmartSuggestionsModule (copy), ReactModule (copy), SmartSuggestionsChipRowModule (copy)
	local UseSmartSuggestionsModuleResult = UseSmartSuggestionsModule(Frame.conversationId, Frame.sendMessage, Frame.sendGameLinkChatMessage)
	local Suggestions = Frame.suggestions or UseSmartSuggestionsModuleResult.suggestions
	
	return if #Suggestions == 0 or UseSmartSuggestionsModuleResult.areSuggestionsDismissed then nil else ReactModule.createElement(SmartSuggestionsChipRowModule, {
		LayoutOrder = Frame.LayoutOrder,
		suggestions = Suggestions,
		onActivated = UseSmartSuggestionsModuleResult.onActivated
	})
end)