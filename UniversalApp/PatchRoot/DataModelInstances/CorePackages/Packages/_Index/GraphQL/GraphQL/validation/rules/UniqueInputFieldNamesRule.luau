local parent = script.Parent.Parent.Parent
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local _ = require(parent.language.visitor)
local _ = require(script.Parent.Parent.ValidationContext)
local _ = require(parent.language.ast)

return {
	UniqueInputFieldNamesRule = function(p1)
		-- upvalues: graphQLError (ref)
		local t = {}
		local t_1 = {}
		
		return {
			ObjectValue = {
				enter = function()
					-- upvalues: t (ref), t_1 (write)
					table.insert(t, t_1)
					t_1 = {}
				end,
				leave = function()
					-- upvalues: t_1 (write), t (ref)
					t_1 = table.remove(t)
				end
			},
			ObjectField = function(_, p2)
				-- upvalues: t_1 (write), p1 (ref), graphQLError (copy)
				local value = p2.name.value
				
				if t_1[value] then
					p1:reportError(graphQLError.new(("There can be only one input field named \"%s\"."):format(value), { t_1[value], p2.name }))
					
					return
				end
				t_1[value] = p2.name
			end
		}
	end
}