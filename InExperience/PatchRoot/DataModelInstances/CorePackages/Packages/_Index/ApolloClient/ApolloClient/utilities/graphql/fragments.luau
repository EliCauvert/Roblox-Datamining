local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local _ = require(parent_1.GraphQL)
local invariant = require(parent.jsutils.invariant).invariant
local error = luauPolyfillModule.Error

function t.getFragmentQueryDocument(p0, p1) --[[ line: 49 ]]
	-- upvalues: array (ref), error (ref), boolean (ref), invariant (ref), object (ref)
	local var2 = p1
	local t = {}
	array.forEach(p0.definitions, function(p2) --[[ line: 55 ]]
		-- upvalues: error (copy), boolean (copy), t (ref)
		if p2.kind == "OperationDefinition" then
			error(error.new(("Found a %s operation%s. "):format(tostring(p2.operation), if boolean.toJSBoolean(p2.name) then (" named '%s'"):format(tostring(p2.name.value)) else "") .. "No operations are allowed when using a fragment as a query. Only fragments are allowed."))
		end
		if p2.kind == "FragmentDefinition" then
			table.insert(t, p2)
		end
	end)
	
	if typeof(var2) == "nil" then
		invariant(#t == 1, string.format("Found %s fragments. `fragmentName` must be provided when there is not exactly 1 fragment.", tostring(#t)))
		var2 = t[1].name.value
	end
	return object.assign({}, p0, {
		definitions = array.concat({}, {
			{
				kind = "OperationDefinition",
				operation = "query",
				selectionSet = {
					kind = "SelectionSet",
					selections = {
						{
							kind = "FragmentSpread",
							name = { kind = "Name", value = var2 }
						}
					}
				}
			}
		}, p0.definitions)
	})
end

function t.createFragmentMap(p3) --[[ line: 121 ]]
	-- upvalues: array (ref)
	local t = {}
	array.forEach(if p3 ~= nil then {} else p3, function(p4) --[[ line: 124 ]]
		-- upvalues: t (ref)
		t[p4.name.value] = p4
	end)
	
	return t
end

function t.getFragmentFromSelection(p5, p6) --[[ line: 131 ]]
	-- upvalues: invariant (ref)
	local kind = p5.kind
	
	if kind == "InlineFragment" then
		return p5
	elseif kind == "FragmentSpread" then
		local var5 = p6 and p6[p5.name.value]
		invariant(var5, ("No fragment named %s."):format(p5.name.value))
		
		return var5
	end
	return nil
end

return t