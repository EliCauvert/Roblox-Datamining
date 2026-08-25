local graphQLError = require(script.Parent.GraphQLError).GraphQLError

return {
	syntaxError = function(p0, p1, p2)
		-- upvalues: graphQLError (ref)
		return graphQLError.new("Syntax Error: " .. p2, nil, p0, { p1 })
	end
}