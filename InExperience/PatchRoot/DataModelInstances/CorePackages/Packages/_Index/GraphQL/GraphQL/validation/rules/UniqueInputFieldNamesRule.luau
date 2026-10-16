local Parent = script.Parent.Parent.Parent
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local _ = require(Parent.language.visitor)
local _ = require(script.Parent.Parent.ValidationContext)
local _ = require(Parent.language.ast)

return {
	UniqueInputFieldNamesRule = function(p1) --[[ Line: 30 ]]
		-- upvalues: GraphQLError (copy)
		local List = {}
		local Removed = {}
		
		return {
			ObjectValue = {
				enter = function() --[[ Line: 36 ]]
					-- upvalues: List (copy), Removed (ref)
					table.insert(List, Removed)
					Removed = {}
				end,
				leave = function() --[[ Line: 40 ]]
					-- upvalues: Removed (ref), List (copy)
					Removed = table.remove(List)
				end
			},
			ObjectField = function(_, p2) --[[ Line: 45 ]]
				-- upvalues: Removed (ref), p1 (copy), GraphQLError (upval)
				local Value = p2.name.value
				
				if Removed[Value] then
					p1:reportError(GraphQLError.new(("There can be only one input field named \"%s\"."):format(Value), { Removed[Value], p2.name }))
					
					return
				else
					Removed[Value] = p2.name
				end
			end
		}
	end
}