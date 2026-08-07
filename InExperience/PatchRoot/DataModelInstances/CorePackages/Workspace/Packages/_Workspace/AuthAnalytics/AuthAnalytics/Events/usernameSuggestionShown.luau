local checkAndSendEventModule = require(script.Parent.Parent.Utils.checkAndSendEvent)

return function(p0, p1, p2, p3) --[[ line: 7 ]]
	-- upvalues: checkAndSendEventModule (ref)
	assert(type(p2) == "table", "Expected suggestions to be a table")
	checkAndSendEventModule(p0, "usernameSuggestionShown", {
		state = p1,
		suggestions = `[{table.concat(p2, ",")}]`,
		field = p3
	})
end