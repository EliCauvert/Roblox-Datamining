local checkAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p1, p2, p3, p4)
	-- upvalues: checkAndSendEventModule (ref)
	assert(type(p3) == "table", "Expected suggestions to be a table")
	checkAndSendEventModule(p1, "usernameSuggestionShown", {
		state = p2,
		suggestions = `[{table.concat(p3, ",")}]`,
		field = p4
	})
end