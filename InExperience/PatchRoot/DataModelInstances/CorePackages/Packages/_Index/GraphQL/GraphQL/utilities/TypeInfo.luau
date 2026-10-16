local Parent = script.Parent.Parent
local Array = require(Parent.Parent.LuauPolyfill).Array
local NullModule = require(Parent.luaUtils.null)
local Language = Parent.language
local Type = Parent.type
local Kind = require(Language.kinds).Kind
local IsNodeFunction = require(Language.ast).isNode
local GetVisitFnFunction = require(Language.visitor).getVisitFn
local _ = require(Type.schema)
local _ = require(Type.directives)
local DefinitionModule = require(Type.definition)
local IsObjectTypeFunction = DefinitionModule.isObjectType
local IsInterfaceTypeFunction = DefinitionModule.isInterfaceType
local IsEnumTypeFunction = DefinitionModule.isEnumType
local IsInputObjectTypeFunction = DefinitionModule.isInputObjectType
local IsListTypeFunction = DefinitionModule.isListType
local IsCompositeTypeFunction = DefinitionModule.isCompositeType
local IsInputTypeFunction = DefinitionModule.isInputType
local IsOutputTypeFunction = DefinitionModule.isOutputType
local GetNullableTypeFunction = DefinitionModule.getNullableType
local GetNamedTypeFunction = DefinitionModule.getNamedType
local IntrospectionModule = require(Type.introspection)
local SchemaMetaFieldDef = IntrospectionModule.SchemaMetaFieldDef
local TypeMetaFieldDef = IntrospectionModule.TypeMetaFieldDef
local TypeNameMetaFieldDef = IntrospectionModule.TypeNameMetaFieldDef
local TypeFromASTFunction = require(Parent.utilities.typeFromAST).typeFromAST

local function _(NullModule1) --[[ Line: 79 | Named "unwrapNull" ]]
	-- upvalues: NullModule (copy)
	return if NullModule1 == NullModule then nil else NullModule1
end

local TypeInfo = {}
local config = { __index = TypeInfo }
local GetFieldDef = nil

function TypeInfo.new(_schema, p1, p2) --[[ Line: 132 ]]
	-- upvalues: config (copy), GetFieldDef (ref), IsInputTypeFunction (copy), IsCompositeTypeFunction (copy), IsOutputTypeFunction (copy)
	local self = setmetatable({}, config)
	self._schema = _schema
	self._typeStack = {}
	self._parentTypeStack = {}
	self._inputTypeStack = {}
	self._fieldDefStack = {}
	self._defaultValueStack = {}
	self._directive = nil
	self._argument = nil
	self._enumValue = nil
	self._getFieldDef = p1 or GetFieldDef
	
	if p2 then
		if IsInputTypeFunction(p2) then
			table.insert(self._inputTypeStack, p2)
		end
		if IsCompositeTypeFunction(p2) then
			table.insert(self._parentTypeStack, p2)
		end
		if IsOutputTypeFunction(p2) then
			table.insert(self._typeStack, p2)
		end
	end
	return self
end

function TypeInfo.getType(p1) --[[ Line: 169 ]]
	-- upvalues: NullModule (copy)
	if #p1._typeStack > 0 then
		local TypeStackEntry = p1._typeStack[#p1._typeStack]
		
		return if TypeStackEntry == NullModule then nil else TypeStackEntry
	else
		return nil
	end
end

function TypeInfo.getParentType(p1) --[[ Line: 176 ]]
	-- upvalues: NullModule (copy)
	if #p1._parentTypeStack > 0 then
		local ParentTypeStackEntry = p1._parentTypeStack[#p1._parentTypeStack]
		
		return if ParentTypeStackEntry == NullModule then nil else ParentTypeStackEntry
	else
		return nil
	end
end

function TypeInfo.getInputType(p1) --[[ Line: 183 ]]
	-- upvalues: NullModule (copy)
	if #p1._inputTypeStack > 0 then
		local InputTypeStackEntry = p1._inputTypeStack[#p1._inputTypeStack]
		
		return if InputTypeStackEntry == NullModule then nil else InputTypeStackEntry
	else
		return nil
	end
end

function TypeInfo.getParentInputType(p1) --[[ Line: 190 ]]
	-- upvalues: NullModule (copy)
	if #p1._inputTypeStack > 1 then
		local InputTypeStackEntry = p1._inputTypeStack[#p1._inputTypeStack - 1]
		
		return if InputTypeStackEntry == NullModule then nil else InputTypeStackEntry
	else
		return nil
	end
end

function TypeInfo.getFieldDef(p1) --[[ Line: 197 ]]
	-- upvalues: NullModule (copy)
	if #p1._fieldDefStack > 0 then
		local FieldDefStackEntry = p1._fieldDefStack[#p1._fieldDefStack]
		
		return if FieldDefStackEntry == NullModule then nil else FieldDefStackEntry
	else
		return nil
	end
end

function TypeInfo.getDefaultValue(p1) --[[ Line: 204 ]]
	-- upvalues: NullModule (copy)
	if #p1._defaultValueStack > 0 then
		local DefaultValueStackEntry = p1._defaultValueStack[#p1._defaultValueStack]
		
		return if DefaultValueStackEntry == NullModule then nil else DefaultValueStackEntry
	else
		return nil
	end
end

function TypeInfo.getDirective(p1) --[[ Line: 211 ]]
	return p1._directive
end

function TypeInfo.getArgument(p1) --[[ Line: 215 ]]
	return p1._argument
end

function TypeInfo.getEnumValue(p1) --[[ Line: 219 ]]
	return p1._enumValue
end

function TypeInfo.enter(p1, p2) --[[ Line: 223 ]]
	-- upvalues: Kind (copy), GetNamedTypeFunction (copy), IsCompositeTypeFunction (copy), NullModule (copy), IsOutputTypeFunction (copy), IsObjectTypeFunction (copy), TypeFromASTFunction (copy), IsInputTypeFunction (copy), Array (copy), GetNullableTypeFunction (copy), IsListTypeFunction (copy), IsInputObjectTypeFunction (copy), IsEnumTypeFunction (copy)
	local Schema = p1._schema
	local Kind1 = p2.kind
	
	if Kind1 == Kind.SELECTION_SET then
		local NamedType = GetNamedTypeFunction(p1:getType())
		table.insert(p1._parentTypeStack, if IsCompositeTypeFunction(NamedType) then NamedType else NullModule)
		
		return
	end
	if Kind1 == Kind.FIELD then
		local ParentType = p1:getParentType()
		local FieldDef = nil
		local Type = nil
		
		if ParentType then
			FieldDef = p1._getFieldDef(Schema, ParentType, p2)
			
			if FieldDef then
				Type = FieldDef.type
			end
		end
		table.insert(p1._fieldDefStack, if FieldDef then FieldDef else NullModule)
		table.insert(p1._typeStack, if IsOutputTypeFunction(Type) then Type else NullModule)
		
		return
	else
		if Kind1 == Kind.DIRECTIVE then
			p1._directive = Schema:getDirective(p2.name.value)
			
			return
		end
		if Kind1 == Kind.OPERATION_DEFINITION then
			local MutationType = nil
			local Operation = p2.operation
			
			if Operation == "query" then
				MutationType = Schema:getQueryType()
			elseif Operation == "mutation" then
				MutationType = Schema:getMutationType()
			elseif Operation == "subscription" then
				MutationType = Schema:getSubscriptionType()
			end
			table.insert(p1._typeStack, if IsObjectTypeFunction(MutationType) then MutationType else NullModule)
			
			return
		else
			if Kind1 == Kind.INLINE_FRAGMENT or Kind1 == Kind.FRAGMENT_DEFINITION then
				local TypeCondition = p2.typeCondition
				local TypeFromASTResult = if TypeCondition then TypeFromASTFunction(Schema, TypeCondition) else GetNamedTypeFunction(p1:getType())
				table.insert(p1._typeStack, if IsOutputTypeFunction(TypeFromASTResult) then TypeFromASTResult else NullModule)
				
				return
			end
			if Kind1 == Kind.VARIABLE_DEFINITION then
				local TypeFromASTResult = TypeFromASTFunction(Schema, p2.type)
				table.insert(p1._inputTypeStack, if IsInputTypeFunction(TypeFromASTResult) then TypeFromASTResult else NullModule)
				
				return
			end
			if Kind1 == Kind.ARGUMENT then
				local FindResult = nil
				local Type = nil
				local Directive = p1:getDirective()
				local Directive1 = if Directive then Directive else p1:getFieldDef()
				
				if Directive1 then
					FindResult = Array.find(Directive1.args, function(p3): boolean --[[ Line: 297 ]]
						-- upvalues: p2 (copy)
						return p3.name == p2.name.value
					end)
					
					if FindResult then
						Type = FindResult.type
					end
				end
				p1._argument = FindResult
				table.insert(p1._defaultValueStack, if FindResult then FindResult.defaultValue else NullModule)
				table.insert(p1._inputTypeStack, if IsInputTypeFunction(Type) then Type else NullModule)
				
				return
			else
				if Kind1 == Kind.LIST then
					local NullableType = GetNullableTypeFunction(p1:getInputType())
					local OfType = if IsListTypeFunction(NullableType) then NullableType.ofType else NullableType
					table.insert(p1._defaultValueStack, NullModule)
					table.insert(p1._inputTypeStack, if IsInputTypeFunction(OfType) then OfType else NullModule)
					
					return
				end
				if Kind1 == Kind.OBJECT_FIELD then
					local NamedType = GetNamedTypeFunction(p1:getInputType())
					local Type = nil
					local GetResult = nil
					
					if IsInputObjectTypeFunction(NamedType) then
						GetResult = NamedType:getFields():get(p2.name.value)
						
						if GetResult then
							Type = GetResult.type
						end
					end
					table.insert(p1._defaultValueStack, if GetResult then GetResult.defaultValue else NullModule)
					table.insert(p1._inputTypeStack, if IsInputTypeFunction(Type) then Type else NullModule)
					
					return
				elseif Kind1 == Kind.ENUM then
					local NamedType = GetNamedTypeFunction(p1:getInputType())
					p1._enumValue = if IsEnumTypeFunction(NamedType) then NamedType:getValue(p2.value) else nil
					
					return
				else
				end
			end
		end
	end
end

function TypeInfo.leave(p1, p2) --[[ Line: 343 ]]
	-- upvalues: Kind (copy)
	local Kind1 = p2.kind
	
	if Kind1 == Kind.SELECTION_SET then
		table.remove(p1._parentTypeStack)
		
		return
	end
	if Kind1 == Kind.FIELD then
		table.remove(p1._fieldDefStack)
		table.remove(p1._typeStack)
		
		return
	end
	if Kind1 == Kind.DIRECTIVE then
		p1._directive = nil
		
		return
	end
	if Kind1 == Kind.OPERATION_DEFINITION or Kind1 == Kind.INLINE_FRAGMENT or Kind1 == Kind.FRAGMENT_DEFINITION then
		table.remove(p1._typeStack)
		
		return
	end
	if Kind1 == Kind.VARIABLE_DEFINITION then
		table.remove(p1._inputTypeStack)
		
		return
	end
	if Kind1 == Kind.ARGUMENT then
		p1._argument = nil
		table.remove(p1._defaultValueStack)
		table.remove(p1._inputTypeStack)
		
		return
	end
	if Kind1 == Kind.LIST or Kind1 == Kind.OBJECT_FIELD then
		table.remove(p1._defaultValueStack)
		table.remove(p1._inputTypeStack)
		
		return
	end
	if Kind1 == Kind.ENUM then
		p1._enumValue = nil
	end
end

GetFieldDef = function(p1, QueryType, p2) --[[ Line: 377 | Named "getFieldDef" ]]
	-- upvalues: SchemaMetaFieldDef (copy), TypeMetaFieldDef (copy), TypeNameMetaFieldDef (copy), IsCompositeTypeFunction (copy), IsObjectTypeFunction (copy), IsInterfaceTypeFunction (copy)
	local Value = p2.name.value
	
	return if Value == SchemaMetaFieldDef.name and p1:getQueryType() == QueryType then SchemaMetaFieldDef elseif Value == TypeMetaFieldDef.name and p1:getQueryType() == QueryType then TypeMetaFieldDef elseif Value == TypeNameMetaFieldDef.name and IsCompositeTypeFunction(QueryType) then TypeNameMetaFieldDef elseif IsObjectTypeFunction(QueryType) or IsInterfaceTypeFunction(QueryType) then QueryType:getFields():get(Value) else nil
end

return {
	TypeInfo = TypeInfo,
	visitWithTypeInfo = function(p1, p2) --[[ Line: 404 ]]
		-- upvalues: GetVisitFnFunction (copy), IsNodeFunction (copy)
		return {
			enter = function(_, p3, ...) --[[ Line: 409 ]]
				-- upvalues: p1 (copy), GetVisitFnFunction (upval), p2 (copy), IsNodeFunction (upval)
				p1:enter(p3)
				local VisitFn = GetVisitFnFunction(p2, p3.kind, false)
				
				if not VisitFn then
					return nil
				end
				local VisitFnResult = VisitFn(p2, p3, ...)
				
				if VisitFnResult ~= nil then
					p1:leave(p3)
					
					if IsNodeFunction(VisitFnResult) then
						p1:enter(VisitFnResult)
					end
				end
				return VisitFnResult
			end,
			leave = function(_, p3, ...) --[[ Line: 428 ]]
				-- upvalues: GetVisitFnFunction (upval), p2 (copy), p1 (copy)
				local VisitFn = GetVisitFnFunction(p2, p3.kind, true)
				local VisitFnResult = if VisitFn then VisitFn(p2, p3, ...) else nil
				p1:leave(p3)
				
				return VisitFnResult
			end
		}
	end
}