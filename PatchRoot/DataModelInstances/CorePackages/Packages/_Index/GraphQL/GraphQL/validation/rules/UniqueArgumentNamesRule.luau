-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:39 2026 Pacific Standard Time.

local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueArgumentNamesRule = function(p0) --[[ line: 20 ]]
		-- upvalues: graphQLError (ref)
		local t = {}
		
		return {
			Field = function() --[[ line: 24 ]]
				-- upvalues: t (write)
				t = {}
			end,
			Directive = function() --[[ line: 27 ]]
				-- upvalues: t (write)
				t = {}
			end,
			Argument = function(_, p1) --[[ line: 30 ]]
				-- upvalues: t (write), p0 (ref), graphQLError (copy)
				local value = p1.name.value
				
				if t[value] then
					p0:reportError(graphQLError.new(("There can be only one argument named \"%s\"."):format(value), { t[value], p1.name }))
				else
					t[value] = p1.name
				end
				return false
			end
		}
	end
}