local Parent = script.Parent.Parent
local _ = require(Parent.jsutils.ObjMap)
local KeyMapFunction = require(Parent.jsutils.keyMap).keyMap
local InspectFunction = require(Parent.jsutils.inspect).inspect
local Invariant = require(Parent.jsutils.invariant).invariant
local _ = require(Parent.language.ast)
local Kind = require(Parent.language.kinds).Kind
local DefinitionModule = require(Parent.type.definition)
local IsLeafTypeFunction = DefinitionModule.isLeafType
local IsInputObjectTypeFunction = DefinitionModule.isInputObjectType
local IsListTypeFunction = DefinitionModule.isListType
local IsNonNullTypeFunction = DefinitionModule.isNonNullType
local NullModule = require(Parent.luaUtils.null)
local Callback = nil

local function valueFromAST(p1, OfType, p2)
	-- upvalues: Kind (copy), NullModule (copy), IsNonNullTypeFunction (copy), valueFromAST (copy), IsListTypeFunction (copy), Callback (ref), IsInputObjectTypeFunction (copy), KeyMapFunction (copy), IsLeafTypeFunction (copy), Invariant (copy), InspectFunction (copy)
	if not p1 then return end
	if p1.kind == Kind.VARIABLE then
		local Value = p1.name.value
		
		if p2 == nil or p2[Value] == nil then return end
		local NullModule1 = p2[Value]
		
		if NullModule1 == NullModule and IsNonNullTypeFunction(OfType) then return end
		return NullModule1
	elseif not IsNonNullTypeFunction(OfType) then
		if p1.kind == Kind.NULL then
			return NullModule
		end
		if IsListTypeFunction(OfType) then
			local OfType1 = OfType.ofType
			
			if p1.kind == Kind.LIST then
				local List = {}
				
				for _, value in ipairs(p1.values) do
					if not Callback(value, p2) then
						local ValueFromASTResult1 = valueFromAST(value, OfType1, p2)
						
						if ValueFromASTResult1 == nil then return end
						table.insert(List, ValueFromASTResult1)
					elseif not IsNonNullTypeFunction(OfType1) then
						table.insert(List, NullModule)
						continue
					else
						return
					end
				end
				return List
			else
				local ValueFromASTResult = valueFromAST(p1, OfType1, p2)
				
				if ValueFromASTResult == nil then return end
				return { ValueFromASTResult }
			end
		elseif IsInputObjectTypeFunction(OfType) then
			if p1.kind ~= Kind.OBJECT then return end
			local DefaultValues = {}
			local KeyMapResult = KeyMapFunction(p1.fields, function(p3)
				return p3.name.value
			end)
			
			for _, value1 in ipairs(OfType:getFields():values()) do
				local KeyMapResultEntry = KeyMapResult[value1.name]
				
				if KeyMapResultEntry and not Callback(KeyMapResultEntry.value, p2) then
					local ValueFromASTResult = valueFromAST(KeyMapResultEntry.value, value1.type, p2)
					
					if ValueFromASTResult == nil then return end
					DefaultValues[value1.name] = ValueFromASTResult
				elseif value1.defaultValue ~= nil then
					DefaultValues[value1.name] = value1.defaultValue
				elseif IsNonNullTypeFunction(value1.type) then return end
			end
			return DefaultValues
		elseif not IsLeafTypeFunction(OfType) then
			local ParseLiteralResult: (any, any) -> () = Invariant
			ParseLiteralResult(false, "Unexpected input type: " .. InspectFunction(OfType))
			
			return
		else
			local ParseLiteralResult = nil
			
			if not pcall(function()
				-- upvalues: ParseLiteralResult (ref), OfType (copy), p1 (copy), p2 (copy)
				ParseLiteralResult = OfType:parseLiteral(p1, p2)
			end) then return end
			if ParseLiteralResult == nil then return end
			return ParseLiteralResult
		end
	elseif p1.kind == Kind.NULL then return end
	return valueFromAST(p1, OfType.ofType, p2)
end

Callback = function(p3, p4): boolean
	-- upvalues: Kind (copy)
	return p3.kind == Kind.VARIABLE and (p4 == nil or p4[p3.name.value] == nil)
end

return { valueFromAST = valueFromAST }