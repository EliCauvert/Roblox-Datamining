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

function t.getFragmentQueryDocument(p1, p2)
	-- upvalues: array (ref), error (ref), boolean (ref), invariant (ref), object (ref)
	local var1 = p2
	local t = {}
	array.forEach(p1.definitions, function(p3)
		-- upvalues: error (copy), boolean (copy), t (ref)
		if p3.kind == "OperationDefinition" then
			error(error.new(("Found a %s operation%s. "):format(tostring(p3.operation), if boolean.toJSBoolean(p3.name) then (" named '%s'"):format(tostring(p3.name.value)) else "") .. "No operations are allowed when using a fragment as a query. Only fragments are allowed."))
		end
		if p3.kind == "FragmentDefinition" then
			table.insert(t, p3)
		end
	end)
	
	if typeof(var1) == "nil" then
		invariant(#t == 1, string.format("Found %s fragments. `fragmentName` must be provided when there is not exactly 1 fragment.", tostring(#t)))
		var1 = t[1].name.value
	end
	return object.assign({}, p1, {
		definitions = array.concat({}, {
			{
				kind = "OperationDefinition",
				operation = "query",
				selectionSet = {
					kind = "SelectionSet",
					selections = {
						{
							kind = "FragmentSpread",
							name = { kind = "Name", value = var1 }
						}
					}
				}
			}
		}, p1.definitions)
	})
end

function t.createFragmentMap(p1)
	-- upvalues: array (ref)
	local t = {}
	array.forEach(if p1 ~= nil then {} else p1, function(p2)
		-- upvalues: t (ref)
		t[p2.name.value] = p2
	end)
	
	return t
end

function t.getFragmentFromSelection(p1, p2)
	-- upvalues: invariant (ref)
	local kind = p1.kind
	
	if kind == "InlineFragment" then
		return p1
	elseif kind == "FragmentSpread" then
		local var1 = p2 and p2[p1.name.value]
		invariant(var1, ("No fragment named %s."):format(p1.name.value))
		
		return var1
	end
	return nil
end

return t