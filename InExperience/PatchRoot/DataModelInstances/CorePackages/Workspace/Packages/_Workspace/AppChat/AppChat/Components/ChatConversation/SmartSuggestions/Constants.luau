local suggestionType = require(script.Parent.Types).SuggestionType

return {
	MAX_SUGGESTIONS = 4,
	SUGGESTION_TYPES = {
		suggestionType.Message,
		suggestionType.GameCard,
		suggestionType.StartParty
	}
}