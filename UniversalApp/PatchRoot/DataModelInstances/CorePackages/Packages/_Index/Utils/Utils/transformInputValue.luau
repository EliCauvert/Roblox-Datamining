local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local GraphQLModule = require(Parent.GraphQL)
local GetNullableTypeFunction = GraphQLModule.getNullableType
local IsLeafTypeFunction = GraphQLModule.isLeafType
local IsListTypeFunction = GraphQLModule.isListType
local IsInputObjectTypeFunction = GraphQLModule.isInputObjectType
local _ = require(script.Parent.types)

local function transformInputValue(OfType, List, p1, p2)
	-- upvalues: GetNullableTypeFunction (copy), Boolean (copy), IsLeafTypeFunction (copy), IsListTypeFunction (copy), Array (copy), transformInputValue (copy), IsInputObjectTypeFunction (copy)
	local Callback = if p1 == nil then nil else p1
	local Callback1 = if p2 == nil then nil else p2
	
	if List == nil then
		return List
	end
	local NullableType = GetNullableTypeFunction(OfType)
	
	if Boolean.toJSBoolean(IsLeafTypeFunction(NullableType)) then
		return if Callback == nil then List else Callback(NullableType, List)
	end
	if Boolean.toJSBoolean(IsListTypeFunction(NullableType)) then
		return Array.map(List, function(p3)
			-- upvalues: transformInputValue (upval), NullableType (copy), Callback (copy), Callback1 (copy)
			return transformInputValue(NullableType.ofType, p3, Callback, Callback1)
		end)
	end
	if not Boolean.toJSBoolean(IsInputObjectTypeFunction(NullableType)) then
		return nil
	end
	local Fields = NullableType:getFields()
	local t = {}
	
	for i in List do
		local Field = Fields[tostring(i)]
		
		if Field ~= nil then
			t[tostring(i)] = transformInputValue(Field.type, List[tostring(i)], Callback, Callback1)
		end
	end
	return if Callback1 == nil then t else Callback1(NullableType, t)
end

return {
	transformInputValue = transformInputValue,
	serializeInputValue = function(p3, p4)
		-- upvalues: transformInputValue (copy)
		return transformInputValue(p3, p4, function(p5, p6)
			local Success, Result = pcall(p5.serialize, p5, p6)
			
			return if Success then Result else p6
		end)
	end,
	parseInputValue = function(p3, p4)
		-- upvalues: transformInputValue (copy)
		return transformInputValue(p3, p4, function(p5, p6)
			local Success, Result = pcall(p5.parseValue, p5, p6)
			
			return if Success then Result else p6
		end)
	end,
	parseInputValueLiteral = function(p3, p4)
		-- upvalues: transformInputValue (copy)
		return transformInputValue(p3, p4, function(p5, p6)
			return p5:parseLiteral(p6, {})
		end)
	end
}