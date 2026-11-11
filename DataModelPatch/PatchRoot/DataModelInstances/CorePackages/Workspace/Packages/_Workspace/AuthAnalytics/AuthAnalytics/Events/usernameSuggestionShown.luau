local CheckAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, State, List, Field)
	-- upvalues: CheckAndSendEventModule (copy)
	assert(type(List) == "table", "Expected suggestions to be a table")
	CheckAndSendEventModule(p1, "usernameSuggestionShown", {
		state = State,
		suggestions = `[{table.concat(List, ",")}]`,
		field = Field
	})
end