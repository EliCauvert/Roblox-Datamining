local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local _ = require(script.Parent.types)
local graphQLModule = require(parent.GraphQL)
local kind = graphQLModule.Kind
local valueFromASTUntyped = graphQLModule.valueFromASTUntyped

local function isTypeWithFields(p1)
	-- upvalues: kind (ref)
	return if p1.kind ~= kind.OBJECT_TYPE_DEFINITION then p1.kind == kind.OBJECT_TYPE_EXTENSION else true
end

function t.getArgumentsWithDirectives(p1)
	-- upvalues: array (ref), isTypeWithFields (ref), boolean (ref), object (ref), valueFromASTUntyped (ref)
	local t = {}
	
	for i, v in array.filter(p1.definitions, isTypeWithFields) do
		if v.fields ~= nil then
			for i_1, v_1 in v.fields do
				local var1 = if typeof(v_1.arguments) == "table" then v_1.arguments else nil
				local var2 = if var1 ~= nil then nil else array.filter(var1, function(p2)
					-- upvalues: boolean (copy)
					return boolean.toJSBoolean(if typeof(p2.directives) == "table" then #p2.directives else nil)
				end)
				
				if boolean.toJSBoolean(if typeof(var2) == "table" then #var2 else nil) then
					t[tostring(("%s.%s"):format(tostring(v.name.value), tostring(v_1.name.value)))] = {}
					local value = t[tostring(("%s.%s"):format(tostring(v.name.value), tostring(v_1.name.value)))]
					
					for i_2, v_2 in var2 do
						value[tostring(v_2.name.value)] = array.map(v_2.directives, function(p2)
							-- upvalues: array (copy), boolean (copy), object (copy), valueFromASTUntyped (copy)
							return {
								name = p2.name.value,
								args = array.reduce(if boolean.toJSBoolean(p2.arguments) then p2.arguments else {}, function(p3, p4)
									-- upvalues: object (copy), valueFromASTUntyped (copy)
									return object.assign({}, p3, { [p4.name.value] = valueFromASTUntyped(p4.value, {}) })
								end, {})
							}
						end)
					end
				end
			end
		end
	end
	return t
end

return t