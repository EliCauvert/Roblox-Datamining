local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Error1 = LuauPolyfillModule.Error
local _ = require(script.Parent["merge-typedefs_types"])
local _ = require(Parent.GraphQL)
local UtilsModule = require(script.Parent.utils)
local ExtractTypeFunction = UtilsModule.extractType
local IsWrappingTypeNodeFunction = UtilsModule.isWrappingTypeNode
local IsListTypeNodeFunction = UtilsModule.isListTypeNode
local IsNonNullTypeNodeFunction = UtilsModule.isNonNullTypeNode
local PrintTypeNodeFunction = UtilsModule.printTypeNode
local MergeDirectivesFunction = require(script.Parent.directives).mergeDirectives
local CompareNodes = require(Parent.Utils).compareNodes
local MergeArgumentsFunction = require(script.Parent.arguments).mergeArguments
local Callback = nil
local Callback1 = nil

local function fieldAlreadyExists(ConcatResult, p1, p2): boolean --[[ Line: 48 ]]
	-- upvalues: Array (copy), Boolean (copy), ExtractTypeFunction (copy), Error1 (copy)
	local FindResult = Array.find(ConcatResult, function(p3): boolean --[[ Line: 51 ]]
		-- upvalues: p1 (copy)
		return p3.name.value == p1.name.value
	end)
	
	if FindResult and (not p2 or not Boolean.toJSBoolean(p2.ignoreFieldConflicts)) then
		local ExtractTypeResult = ExtractTypeFunction(FindResult.type)
		local ExtractTypeResult1 = ExtractTypeFunction(p1.type)
		
		if ExtractTypeResult.name.value ~= ExtractTypeResult1.name.value then
			error(Error1.new(("Field \"%s\" already defined with a different type. Declared as \"%s\", but you tried to override with \"%s\""):format(tostring(p1.name.value), tostring(ExtractTypeResult.name.value), (tostring(ExtractTypeResult1.name.value)))))
		end
	end
	return not not Boolean.toJSBoolean(FindResult)
end

local FieldsModule = {
	mergeFields = function(p1, List, p2, p3) --[[ Line: 83 ]]
		-- upvalues: Array (copy), Boolean (copy), fieldAlreadyExists (copy), Callback (ref), IsNonNullTypeNodeFunction (copy), MergeArgumentsFunction (copy), MergeDirectivesFunction (copy), CompareNodes (copy)
		local ConcatResult = {}
		
		if p2 ~= nil then
			ConcatResult = Array.concat(ConcatResult, p2)
		end
		if List ~= nil then
			for _, value in List do
				if not Boolean.toJSBoolean((fieldAlreadyExists(ConcatResult, value, p3))) then
					table.insert(ConcatResult, value)
					continue
				end
				local FindResult = Array.find(ConcatResult, function(p4): boolean --[[ Line: 115 ]]
					-- upvalues: value (copy)
					return p4.name.value == value.name.value
				end)
				
				if not p3 or not Boolean.toJSBoolean(p3.ignoreFieldConflicts) then
					if p3 and Boolean.toJSBoolean(p3.throwOnConflict) then
						Callback(p1, FindResult, value, false)
					else
						Callback(p1, FindResult, value, true)
					end
					local ToJSBooleanFunction = Boolean.toJSBoolean
					local IsNonNullTypeNode = IsNonNullTypeNodeFunction(value.type)
					
					if ToJSBooleanFunction(if Boolean.toJSBoolean(IsNonNullTypeNode) then not Boolean.toJSBoolean(IsNonNullTypeNodeFunction(FindResult.type)) else IsNonNullTypeNode) then
						FindResult.type = value.type
					end
				end
				FindResult.arguments = MergeArgumentsFunction(if Boolean.toJSBoolean(value.arguments) then value.arguments else {}, if Boolean.toJSBoolean(FindResult.arguments) then FindResult.arguments else {}, p3)
				FindResult.directives = MergeDirectivesFunction(value.directives, FindResult.directives, p3)
				FindResult.description = if Boolean.toJSBoolean(value.description) then value.description else FindResult.description
			end
		end
		if p3 and Boolean.toJSBoolean(p3.sort) then
			Array.sort(ConcatResult, CompareNodes)
		end
		if p3 and p3.exclusions then
			local Exclusions = p3.exclusions
			
			return Array.filter(ConcatResult, function(p4): boolean --[[ Line: 183 ]]
				-- upvalues: Boolean (upval), Array (upval), Exclusions (copy), p1 (copy)
				return not Boolean.toJSBoolean(Array.includes(Exclusions, ("%s.%s"):format(tostring(p1.name.value), (tostring(p4.name.value)))))
			end)
		else
			return ConcatResult
		end
	end
}

Callback = function(p4, FindResult, p5, p6) --[[ Line: 194 | Named "preventConflicts" ]]
	-- upvalues: PrintTypeNodeFunction (copy), Boolean (copy), Callback1 (ref), Error1 (copy)
	local P13 = p6 ~= nil and p6
	local PrintTypeNodeResult = PrintTypeNodeFunction(FindResult.type)
	local PrintTypeNodeResult1 = PrintTypeNodeFunction(p5.type)
	
	if PrintTypeNodeResult ~= PrintTypeNodeResult1 and not Boolean.toJSBoolean(Callback1(FindResult.type, p5.type, P13)) then
		error(Error1.new(("Field '%s.%s' changed type from '%s' to '%s'"):format(tostring(p4.name.value), tostring(FindResult.name.value), tostring(PrintTypeNodeResult), (tostring(PrintTypeNodeResult1)))))
	end
end

Callback1 = function(Type, Type1, p4) --[[ Line: 223 | Named "safeChangeForFieldType" ]]
	-- upvalues: Boolean (copy), IsWrappingTypeNodeFunction (copy), IsNonNullTypeNodeFunction (copy), Callback1 (ref), IsListTypeNodeFunction (copy)
	local P16 = p4 ~= nil and p4
	
	return if Boolean.toJSBoolean(IsWrappingTypeNodeFunction(Type)) or Boolean.toJSBoolean(IsWrappingTypeNodeFunction(Type1)) then if Boolean.toJSBoolean(IsNonNullTypeNodeFunction(Type1)) then Callback1(if Boolean.toJSBoolean(IsNonNullTypeNodeFunction(Type)) then Type.type else Type, Type1.type) elseif Boolean.toJSBoolean(IsNonNullTypeNodeFunction(Type)) then Callback1(Type1, Type, P16) elseif Boolean.toJSBoolean(IsListTypeNodeFunction(Type)) then IsListTypeNodeFunction(Type1) and Callback1(Type.type, Type1.type) or IsNonNullTypeNodeFunction(Type1) and Callback1(Type, Type1.type) else false else typeof(Type) == "table" and #Type == 0 and typeof(Type1) == "table" and #Type1 == 0 or tostring(Type) == tostring(Type1)
end

return FieldsModule