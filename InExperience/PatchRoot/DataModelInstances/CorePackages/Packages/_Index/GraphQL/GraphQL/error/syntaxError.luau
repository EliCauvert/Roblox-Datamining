local graphQLError = require(script.Parent.GraphQLError).GraphQLError

return {
	syntaxError = function(p1, p2, p3)
		-- upvalues: graphQLError (ref)
		return graphQLError.new("Syntax Error: " .. p2, nil, p1, { p2 })
	end
}