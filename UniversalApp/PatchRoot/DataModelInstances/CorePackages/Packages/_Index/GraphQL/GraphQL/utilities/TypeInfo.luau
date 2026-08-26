local parent = script.Parent.Parent
local array = require(parent.Parent.LuauPolyfill).Array
local nullModule = require(parent.luaUtils.null)
local language = parent.language
local type = parent.type
local visitorModule = require(language.visitor)
local kind = require(language.kinds).Kind
local isNode = require(language.ast).isNode
local getVisitFn = visitorModule.getVisitFn
local _ = require(type.schema)
local _ = require(type.directives)
local definitionModule = require(type.definition)
local isObjectType = definitionModule.isObjectType
local isInterfaceType = definitionModule.isInterfaceType
local isEnumType = definitionModule.isEnumType
local isInputObjectType = definitionModule.isInputObjectType
local isListType = definitionModule.isListType
local isCompositeType = definitionModule.isCompositeType
local isInputType = definitionModule.isInputType
local isOutputType = definitionModule.isOutputType
local getNullableType = definitionModule.getNullableType
local getNamedType = definitionModule.getNamedType
local introspectionModule = require(type.introspection)
local schemaMetaFieldDef = introspectionModule.SchemaMetaFieldDef
local typeMetaFieldDef = introspectionModule.TypeMetaFieldDef
local typeNameMetaFieldDef = introspectionModule.TypeNameMetaFieldDef
local typeFromAST = require(parent.utilities.typeFromAST).typeFromAST

local function _(p1)
	-- upvalues: nullModule (ref)
	return if p1 == nullModule then nil else p1
end

local t = {}
local t_1 = { __index = t }
local getFieldDef = nil

function t.new(p1, p2, p3)
	-- upvalues: t_1 (ref), getFieldDef (write), isInputType (ref), isCompositeType (ref), isOutputType (ref)
	local tbl = setmetatable({}, t_1)
	tbl._schema = p1
	tbl._typeStack = {}
	tbl._parentTypeStack = {}
	tbl._inputTypeStack = {}
	tbl._fieldDefStack = {}
	tbl._defaultValueStack = {}
	tbl._directive = nil
	tbl._argument = nil
	tbl._enumValue = nil
	tbl._getFieldDef = p2 or getFieldDef
	
	if p3 then
		if isInputType(p3) then
			table.insert(tbl._inputTypeStack, p3)
		end
		if isCompositeType(p3) then
			table.insert(tbl._parentTypeStack, p3)
		end
		if isOutputType(p3) then
			table.insert(tbl._typeStack, p3)
		end
	end
	return tbl
end

function t.getType(p1)
	-- upvalues: nullModule (ref)
	if #p1._typeStack <= 0 then
		return nil
	end
	local var1 = p1._typeStack[#p1._typeStack]
	
	return if var1 == nullModule then nil else var1
end

function t.getParentType(p1)
	-- upvalues: nullModule (ref)
	if #p1._parentTypeStack <= 0 then
		return nil
	end
	local var1 = p1._parentTypeStack[#p1._parentTypeStack]
	
	return if var1 == nullModule then nil else var1
end

function t.getInputType(p1)
	-- upvalues: nullModule (ref)
	if #p1._inputTypeStack <= 0 then
		return nil
	end
	local var1 = p1._inputTypeStack[#p1._inputTypeStack]
	
	return if var1 == nullModule then nil else var1
end

function t.getParentInputType(p1)
	-- upvalues: nullModule (ref)
	if #p1._inputTypeStack <= 1 then
		return nil
	end
	local var1 = p1._inputTypeStack[#p1._inputTypeStack - 1]
	
	return if var1 == nullModule then nil else var1
end

function t.getFieldDef(p1)
	-- upvalues: nullModule (ref)
	if #p1._fieldDefStack <= 0 then
		return nil
	end
	local var1 = p1._fieldDefStack[#p1._fieldDefStack]
	
	return if var1 == nullModule then nil else var1
end

function t.getDefaultValue(p1)
	-- upvalues: nullModule (ref)
	if #p1._defaultValueStack <= 0 then
		return nil
	end
	local var1 = p1._defaultValueStack[#p1._defaultValueStack]
	
	return if var1 == nullModule then nil else var1
end

function t.getDirective(p1)
	return p1._directive
end

function t.getArgument(p1)
	return p1._argument
end

function t.getEnumValue(p1)
	return p1._enumValue
end

function t.enter(p1, p2)
	-- upvalues: kind (ref), getNamedType (ref), isCompositeType (ref), nullModule (ref), isOutputType (ref), isObjectType (ref), typeFromAST (ref), isInputType (ref), array (ref), getNullableType (ref), isListType (ref), isInputObjectType (ref), isEnumType (ref)
	local schema = p1._schema
	local kind_1 = p2.kind
	
	if kind_1 == kind.SELECTION_SET then
		local var1 = getNamedType(p1:getType())
		table.insert(p1._parentTypeStack, if isCompositeType(var1) then var1 else nullModule)
		
		return
	elseif kind_1 == kind.FIELD then
		local parentType = p1:getParentType()
		local fieldDef = nil
		local type = nil
		
		if parentType then
			fieldDef = p1._getFieldDef(schema, parentType, p2)
			
			if fieldDef then
				type = fieldDef.type
			end
		end
		table.insert(p1._fieldDefStack, fieldDef or nullModule)
		table.insert(p1._typeStack, if isOutputType(type) then type else nullModule)
		
		return
	elseif kind_1 == kind.DIRECTIVE then
		p1._directive = schema:getDirective(p2.name.value)
		
		return
	elseif kind_1 == kind.OPERATION_DEFINITION then
		local subscriptionType = nil
		local operation = p2.operation
		
		if operation == "query" then
			subscriptionType = schema:getQueryType()
		elseif operation == "mutation" then
			subscriptionType = schema:getMutationType()
		elseif operation == "subscription" then
			subscriptionType = schema:getSubscriptionType()
		end
		table.insert(p1._typeStack, if isObjectType(subscriptionType) then subscriptionType else nullModule)
		
		return
	elseif kind_1 == kind.INLINE_FRAGMENT or kind_1 == kind.FRAGMENT_DEFINITION then
		local typeCondition = p2.typeCondition
		local var2 = if typeCondition then typeFromAST(schema, typeCondition) else getNamedType(p1:getType())
		table.insert(p1._typeStack, if isOutputType(var2) then var2 else nullModule)
		
		return
	elseif kind_1 == kind.VARIABLE_DEFINITION then
		local var3 = typeFromAST(schema, p2.type)
		table.insert(p1._inputTypeStack, if isInputType(var3) then var3 else nullModule)
		
		return
	elseif kind_1 == kind.ARGUMENT then
		local var4 = nil
		local type = nil
		local directive = p1:getDirective()
		local var5 = directive or p1:getFieldDef()
		
		if var5 then
			var4 = array.find(var5.args, function(p3)
				-- upvalues: p2 (ref)
				return p3.name == p2.name.value
			end)
			
			if var4 then
				type = var4.type
			end
		end
		p1._argument = var4
		table.insert(p1._defaultValueStack, if var4 then var4.defaultValue else nullModule)
		table.insert(p1._inputTypeStack, if isInputType(type) then type else nullModule)
		
		return
	elseif kind_1 == kind.LIST then
		local var6 = getNullableType(p1:getInputType())
		local var7 = if isListType(var6) then var6.ofType else var6
		table.insert(p1._defaultValueStack, nullModule)
		table.insert(p1._inputTypeStack, if isInputType(var7) then var7 else nullModule)
		
		return
	elseif kind_1 == kind.OBJECT_FIELD then
		local var8 = getNamedType(p1:getInputType())
		local type = nil
		local value = nil
		
		if isInputObjectType(var8) then
			value = var8:getFields():get(p2.name.value)
			
			if value then
				type = value.type
			end
		end
		table.insert(p1._defaultValueStack, if value then value.defaultValue else nullModule)
		table.insert(p1._inputTypeStack, if isInputType(type) then type else nullModule)
		
		return
	elseif kind_1 == kind.ENUM then
		local var9 = getNamedType(p1:getInputType())
		p1._enumValue = if isEnumType(var9) then var9:getValue(p2.value) else nil
		
		return
	end
end

function t.leave(p1, p2)
	-- upvalues: kind (ref)
	local kind_1 = p2.kind
	
	if kind_1 == kind.SELECTION_SET then
		table.remove(p1._parentTypeStack)
		
		return
	elseif kind_1 == kind.FIELD then
		table.remove(p1._fieldDefStack)
		table.remove(p1._typeStack)
		
		return
	elseif kind_1 == kind.DIRECTIVE then
		p1._directive = nil
		
		return
	elseif kind_1 == kind.OPERATION_DEFINITION or kind_1 == kind.INLINE_FRAGMENT or kind_1 == kind.FRAGMENT_DEFINITION then
		table.remove(p1._typeStack)
		
		return
	elseif kind_1 == kind.VARIABLE_DEFINITION then
		table.remove(p1._inputTypeStack)
		
		return
	elseif kind_1 == kind.ARGUMENT then
		p1._argument = nil
		table.remove(p1._defaultValueStack)
		table.remove(p1._inputTypeStack)
		
		return
	elseif kind_1 == kind.LIST or kind_1 == kind.OBJECT_FIELD then
		table.remove(p1._defaultValueStack)
		table.remove(p1._inputTypeStack)
		
		return
	elseif kind_1 == kind.ENUM then
		p1._enumValue = nil
	end
end

getFieldDef = function(p1, p2, p3)
	-- upvalues: schemaMetaFieldDef (ref), typeMetaFieldDef (ref), typeNameMetaFieldDef (ref), isCompositeType (ref), isObjectType (ref), isInterfaceType (ref)
	local value = p3.name.value
	
	return if value == schemaMetaFieldDef.name and p1:getQueryType() == p2 then schemaMetaFieldDef elseif value == typeMetaFieldDef.name and p1:getQueryType() == p2 then typeMetaFieldDef elseif value == typeNameMetaFieldDef.name and isCompositeType(p2) then typeNameMetaFieldDef elseif isObjectType(p2) or isInterfaceType(p2) then p2:getFields():get(value) else nil
end

return {
	TypeInfo = t,
	visitWithTypeInfo = function(p1, p2)
		-- upvalues: getVisitFn (ref), isNode (ref)
		return {
			enter = function(_, p3, ...)
				-- upvalues: p1 (ref), getVisitFn (copy), p2 (ref), isNode (copy)
				p1:enter(p3)
				local var1 = getVisitFn(p2, p3.kind, false)
				
				if not var1 then
					return nil
				end
				local var2 = var1(p2, p3, ...)
				
				if var2 ~= nil then
					p1:leave(p3)
					
					if isNode(var2) then
						p1:enter(var2)
					end
				end
				return var2
			end,
			leave = function(_, p3, ...)
				-- upvalues: getVisitFn (copy), p2 (ref), p1 (ref)
				local var1 = getVisitFn(p2, p3.kind, true)
				local var2 = if var1 then var1(p2, p3, ...) else nil
				p1:leave(p3)
				
				return var2
			end
		}
	end
}