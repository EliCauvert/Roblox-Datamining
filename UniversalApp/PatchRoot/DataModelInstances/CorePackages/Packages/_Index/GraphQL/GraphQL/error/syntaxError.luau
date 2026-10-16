local GraphQLError = require(script.Parent.GraphQLError).GraphQLError

return {
	syntaxError = function(p1, p2, Text) --[[ Line: 16 ]]
		-- upvalues: GraphQLError (copy)
		return GraphQLError.new("Syntax Error: " .. Text, nil, p1, { p2 })
	end
}