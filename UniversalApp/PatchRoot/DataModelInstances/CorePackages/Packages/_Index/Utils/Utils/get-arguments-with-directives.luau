local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local _ = require(script.Parent.types)
local GraphQLModule = require(Parent.GraphQL)
local Kind = GraphQLModule.Kind
local ValueFromASTUntypedFunction = GraphQLModule.valueFromASTUntyped

local function isTypeWithFields(p1): boolean --[[ Line: 31 ]]
	-- upvalues: Kind (copy)
	return p1.kind == Kind.OBJECT_TYPE_DEFINITION or p1.kind == Kind.OBJECT_TYPE_EXTENSION
end

return {
	getArgumentsWithDirectives = function(p1) --[[ Line: 38 ]]
		-- upvalues: Array (copy), isTypeWithFields (copy), Boolean (copy), Object (copy), ValueFromASTUntypedFunction (copy)
		local t = {}
		
		for _, value in Array.filter(p1.definitions, isTypeWithFields) do
			if value.fields ~= nil then
				for _, field in value.fields do
					local Arguments = if typeof(field.arguments) == "table" then field.arguments else nil
					local FilterResult = if Arguments == nil then nil else Array.filter(Arguments, function(p2) --[[ Line: 62 ]]
						-- upvalues: Boolean (upval)
						return Boolean.toJSBoolean(if typeof(p2.directives) == "table" then #p2.directives else nil)
					end)
					
					if Boolean.toJSBoolean(if typeof(FilterResult) == "table" then #FilterResult else nil) then
						t[tostring(("%s.%s"):format(tostring(value.name.value), (tostring(field.name.value))))] = {}
						local Entry = t[tostring(("%s.%s"):format(tostring(value.name.value), (tostring(field.name.value))))]
						
						for _, value1 in FilterResult do
							Entry[tostring(value1.name.value)] = Array.map(value1.directives, function(p2) --[[ Line: 84 ]]
								-- upvalues: Array (upval), Boolean (upval), Object (upval), ValueFromASTUntypedFunction (upval)
								return {
									name = p2.name.value,
									args = Array.reduce(Boolean.toJSBoolean(p2.arguments) and p2.arguments or {}, function(p3, p4) --[[ Line: 91 ]]
										-- upvalues: Object (upval), ValueFromASTUntypedFunction (upval)
										return Object.assign({}, p3, {
											[p4.name.value] = ValueFromASTUntypedFunction(p4.value, {})
										})
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
}