-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:39 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local _ = require(parent.language.visitor)
local _ = require(script.Parent.Parent.ValidationContext)
local _ = require(parent.language.ast)

return {
	UniqueInputFieldNamesRule = function(p0) --[[ line: 30 ]]
		-- upvalues: graphQLError (ref)
		local t = {}
		local t_1 = {}
		
		return {
			ObjectValue = {
				enter = function() --[[ line: 36 ]]
					-- upvalues: t (ref), t_1 (write)
					table.insert(t, t_1)
					t_1 = {}
				end,
				leave = function() --[[ line: 40 ]]
					-- upvalues: t_1 (write), t (ref)
					t_1 = table.remove(t)
				end
			},
			ObjectField = function(_, p1) --[[ line: 45 ]]
				-- upvalues: t_1 (write), p0 (ref), graphQLError (copy)
				local value = p1.name.value
				
				if t_1[value] then
					p0:reportError(graphQLError.new(("There can be only one input field named \"%s\"."):format(value), { t_1[value], p1.name }))
					
					return
				end
				t_1[value] = p1.name
			end
		}
	end
}