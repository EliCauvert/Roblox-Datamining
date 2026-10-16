local SuggestionType = require(script.Parent.Types).SuggestionType

return {
	MAX_SUGGESTIONS = 4,
	SUGGESTION_TYPES = {
		SuggestionType.Message,
		SuggestionType.GameCard,
		SuggestionType.StartParty
	}
}