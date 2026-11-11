local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local _ = require(Parent1.GraphQL)
local InvariantFunction = require(Parent.jsutils.invariant).invariant
local Error1 = LuauPolyfillModule.Error

return {
	getFragmentQueryDocument = function(p1, p2)
		-- upvalues: Array (copy), Error1 (copy), Boolean (copy), InvariantFunction (copy), Object (copy)
		local Value = p2
		local List = {}
		Array.forEach(p1.definitions, function(p3)
			-- upvalues: Error1 (upval), Boolean (upval), List (copy)
			if p3.kind == "OperationDefinition" then
				error(Error1.new(("Found a %s operation%s. "):format(tostring(p3.operation), if Boolean.toJSBoolean(p3.name) then (" named '%s'"):format((tostring(p3.name.value))) else "") .. "No operations are allowed when using a fragment as a query. Only fragments are allowed."))
			end
			if p3.kind == "FragmentDefinition" then
				table.insert(List, p3)
			end
		end)
		
		if typeof(Value) == "nil" then
			InvariantFunction(#List == 1, string.format("Found %s fragments. `fragmentName` must be provided when there is not exactly 1 fragment.", (tostring(#List))))
			Value = List[1].name.value
		end
		return (Object.assign({}, p1, {
			definitions = Array.concat({}, {
				{
					kind = "OperationDefinition",
					operation = "query",
					selectionSet = {
						kind = "SelectionSet",
						selections = {
							{
								kind = "FragmentSpread",
								name = { kind = "Name", value = Value }
							}
						}
					}
				}
			}, p1.definitions)
		}))
	end,
	createFragmentMap = function(p1)
		-- upvalues: Array (copy)
		local t = {}
		Array.forEach(if p1 == nil then {} else p1, function(p2)
			-- upvalues: t (copy)
			t[p2.name.value] = p2
		end)
		
		return t
	end,
	getFragmentFromSelection = function(p1, p2)
		-- upvalues: InvariantFunction (copy)
		local Kind = p1.kind
		
		if Kind == "InlineFragment" then
			return p1
		elseif Kind == "FragmentSpread" then
			local v1 = if p2 then p2[p1.name.value] else p2
			InvariantFunction(v1, ("No fragment named %s."):format(p1.name.value))
			
			return v1
		else
			return nil
		end
	end
}