-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:33 2026 Pacific Standard Time.

local graphQLError = require(script.Parent.GraphQLError).GraphQLError

return {
	syntaxError = function(p0, p1, p2) --[[ line: 16 ]]
		-- upvalues: graphQLError (ref)
		return graphQLError.new("Syntax Error: " .. p2, nil, p0, { p1 })
	end
}