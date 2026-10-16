local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local ValueFromASTUntypedFunction = require(Parent.GraphQL).valueFromASTUntyped
local _ = require(script.Parent.types)

return {
	getFieldsWithDirectives = function(p1, p2) --[[ Line: 35 ]]
		-- upvalues: Boolean (copy), Array (copy), Object (copy), ValueFromASTUntypedFunction (copy)
		local MapResults = {}
		local ConcatResult = { "ObjectTypeDefinition", "ObjectTypeExtension" }
		
		if Boolean.toJSBoolean((if p2 == nil then {} else p2).includeInputTypes) then
			ConcatResult = Array.concat({}, ConcatResult, { "InputObjectTypeDefinition", "InputObjectTypeExtension" })
		end
		for _, value in Array.filter(p1.definitions, function(p3) --[[ Line: 45 ]]
			-- upvalues: Array (upval), ConcatResult (ref)
			return Array.includes(ConcatResult, p3.kind)
		end) do
			local Value = value.name.value
			
			if value.fields ~= nil then
				for _, field in value.fields do
					if Boolean.toJSBoolean(field.directives) and #field.directives > 0 then
						MapResults[tostring((("%s.%s"):format(tostring(Value), (tostring(field.name.value)))))] = Array.map(field.directives, function(p3) --[[ Line: 70 ]]
							-- upvalues: Array (upval), Boolean (upval), Object (upval), ValueFromASTUntypedFunction (upval)
							return {
								name = p3.name.value,
								args = Array.reduce(Boolean.toJSBoolean(p3.arguments) and p3.arguments or {}, function(p4, p5) --[[ Line: 77 ]]
									-- upvalues: Object (upval), ValueFromASTUntypedFunction (upval)
									return Object.assign({}, p4, {
										[p5.name.value] = ValueFromASTUntypedFunction(p5.value, nil)
									})
								end, {})
							}
						end)
					end
				end
			end
		end
		return MapResults
	end
}