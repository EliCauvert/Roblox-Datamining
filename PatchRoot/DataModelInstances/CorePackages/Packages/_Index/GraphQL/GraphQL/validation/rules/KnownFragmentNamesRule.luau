-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:39 2026 Pacific Standard Time.

local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	KnownFragmentNamesRule = function(p0) --[[ line: 19 ]]
		-- upvalues: graphQLError (ref)
		return {
			FragmentSpread = function(_, p1) --[[ line: 21 ]]
				-- upvalues: p0 (ref), graphQLError (copy)
				local value = p1.name.value
				
				if not p0:getFragment(value) then
					p0:reportError(graphQLError.new(("Unknown fragment \"%s\"."):format(value), p1.name))
				end
			end
		}
	end
}