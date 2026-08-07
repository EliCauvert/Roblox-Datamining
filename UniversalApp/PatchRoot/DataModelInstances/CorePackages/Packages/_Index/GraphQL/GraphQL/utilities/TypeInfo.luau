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

local function _(p0) --[[ line: 79 | named "unwrapNull" ]]
	-- upvalues: nullModule (ref)
	return if p0 == nullModule then nil else p0
end

local t = {}
local t_1 = { __index = t }
local getFieldDef = nil

function t.new(p1, p2, p3) --[[ line: 132 ]]
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

function t.getType(p4) --[[ line: 169 ]]
	-- upvalues: nullModule (ref)
	if #p4._typeStack <= 0 then
		return nil
	end
	local var8 = p4._typeStack[#p4._typeStack]
	
	return if var8 == nullModule then nil else var8
end

function t.getParentType(p5) --[[ line: 176 ]]
	-- upvalues: nullModule (ref)
	if #p5._parentTypeStack <= 0 then
		return nil
	end
	local var9 = p5._parentTypeStack[#p5._parentTypeStack]
	
	return if var9 == nullModule then nil else var9
end

function t.getInputType(p6) --[[ line: 183 ]]
	-- upvalues: nullModule (ref)
	if #p6._inputTypeStack <= 0 then
		return nil
	end
	local var10 = p6._inputTypeStack[#p6._inputTypeStack]
	
	return if var10 == nullModule then nil else var10
end

function t.getParentInputType(p7) --[[ line: 190 ]]
	-- upvalues: nullModule (ref)
	if #p7._inputTypeStack <= 1 then
		return nil
	end
	local var11 = p7._inputTypeStack[#p7._inputTypeStack - 1]
	
	return if var11 == nullModule then nil else var11
end

function t.getFieldDef(p8) --[[ line: 197 ]]
	-- upvalues: nullModule (ref)
	if #p8._fieldDefStack <= 0 then
		return nil
	end
	local var12 = p8._fieldDefStack[#p8._fieldDefStack]
	
	return if var12 == nullModule then nil else var12
end

function t.getDefaultValue(p9) --[[ line: 204 ]]
	-- upvalues: nullModule (ref)
	if #p9._defaultValueStack <= 0 then
		return nil
	end
	local var13 = p9._defaultValueStack[#p9._defaultValueStack]
	
	return if var13 == nullModule then nil else var13
end

function t.getDirective(p10) --[[ line: 211 ]]
	return p10._directive
end

function t.getArgument(p11) --[[ line: 215 ]]
	return p11._argument
end

function t.getEnumValue(p12) --[[ line: 219 ]]
	return p12._enumValue
end

function t.enter(p13, p14) --[[ line: 223 ]]
	-- upvalues: kind (ref), getNamedType (ref), isCompositeType (ref), nullModule (ref), isOutputType (ref), isObjectType (ref), typeFromAST (ref), isInputType (ref), array (ref), getNullableType (ref), isListType (ref), isInputObjectType (ref), isEnumType (ref)
	local schema = p13._schema
	local kind_1 = p14.kind
	
	if kind_1 == kind.SELECTION_SET then
		local var14 = getNamedType(p13:getType())
		table.insert(p13._parentTypeStack, if isCompositeType(var14) then var14 else nullModule)
		
		return
	elseif kind_1 == kind.FIELD then
		local parentType = p13:getParentType()
		local fieldDef = nil
		local type = nil
		
		if parentType then
			fieldDef = p13._getFieldDef(schema, parentType, p14)
			
			if fieldDef then
				type = fieldDef.type
			end
		end
		table.insert(p13._fieldDefStack, fieldDef or nullModule)
		table.insert(p13._typeStack, if isOutputType(type) then type else nullModule)
		
		return
	elseif kind_1 == kind.DIRECTIVE then
		p13._directive = schema:getDirective(p14.name.value)
		
		return
	elseif kind_1 == kind.OPERATION_DEFINITION then
		local subscriptionType = nil
		local operation = p14.operation
		
		if operation == "query" then
			subscriptionType = schema:getQueryType()
		elseif operation == "mutation" then
			subscriptionType = schema:getMutationType()
		elseif operation == "subscription" then
			subscriptionType = schema:getSubscriptionType()
		end
		table.insert(p13._typeStack, if isObjectType(subscriptionType) then subscriptionType else nullModule)
		
		return
	elseif kind_1 == kind.INLINE_FRAGMENT or kind_1 == kind.FRAGMENT_DEFINITION then
		local typeCondition = p14.typeCondition
		local var18 = if typeCondition then typeFromAST(schema, typeCondition) else getNamedType(p13:getType())
		table.insert(p13._typeStack, if isOutputType(var18) then var18 else nullModule)
		
		return
	elseif kind_1 == kind.VARIABLE_DEFINITION then
		local var19 = typeFromAST(schema, p14.type)
		table.insert(p13._inputTypeStack, if isInputType(var19) then var19 else nullModule)
		
		return
	elseif kind_1 == kind.ARGUMENT then
		local var20 = nil
		local type = nil
		local directive = p13:getDirective()
		local var22 = directive or p13:getFieldDef()
		
		if var22 then
			var20 = array.find(var22.args, function(p15) --[[ line: 297 ]]
				-- upvalues: p14 (ref)
				return p15.name == p14.name.value
			end)
			
			if var20 then
				type = var20.type
			end
		end
		p13._argument = var20
		table.insert(p13._defaultValueStack, if var20 then var20.defaultValue else nullModule)
		table.insert(p13._inputTypeStack, if isInputType(type) then type else nullModule)
		
		return
	elseif kind_1 == kind.LIST then
		local var23 = getNullableType(p13:getInputType())
		local var24 = if isListType(var23) then var23.ofType else var23
		table.insert(p13._defaultValueStack, nullModule)
		table.insert(p13._inputTypeStack, if isInputType(var24) then var24 else nullModule)
		
		return
	elseif kind_1 == kind.OBJECT_FIELD then
		local var25 = getNamedType(p13:getInputType())
		local type = nil
		local value = nil
		
		if isInputObjectType(var25) then
			value = var25:getFields():get(p14.name.value)
			
			if value then
				type = value.type
			end
		end
		table.insert(p13._defaultValueStack, if value then value.defaultValue else nullModule)
		table.insert(p13._inputTypeStack, if isInputType(type) then type else nullModule)
		
		return
	elseif kind_1 == kind.ENUM then
		local var27 = getNamedType(p13:getInputType())
		p13._enumValue = if isEnumType(var27) then var27:getValue(p14.value) else nil
		
		return
	end
end

function t.leave(p16, p17) --[[ line: 343 ]]
	-- upvalues: kind (ref)
	local kind_1 = p17.kind
	
	if kind_1 == kind.SELECTION_SET then
		table.remove(p16._parentTypeStack)
		
		return
	elseif kind_1 == kind.FIELD then
		table.remove(p16._fieldDefStack)
		table.remove(p16._typeStack)
		
		return
	elseif kind_1 == kind.DIRECTIVE then
		p16._directive = nil
		
		return
	elseif kind_1 == kind.OPERATION_DEFINITION or kind_1 == kind.INLINE_FRAGMENT or kind_1 == kind.FRAGMENT_DEFINITION then
		table.remove(p16._typeStack)
		
		return
	elseif kind_1 == kind.VARIABLE_DEFINITION then
		table.remove(p16._inputTypeStack)
		
		return
	elseif kind_1 == kind.ARGUMENT then
		p16._argument = nil
		table.remove(p16._defaultValueStack)
		table.remove(p16._inputTypeStack)
		
		return
	elseif kind_1 == kind.LIST or kind_1 == kind.OBJECT_FIELD then
		table.remove(p16._defaultValueStack)
		table.remove(p16._inputTypeStack)
		
		return
	elseif kind_1 == kind.ENUM then
		p16._enumValue = nil
	end
end

getFieldDef = function(p18, p19, p20) --[[ line: 377 | named "getFieldDef" ]]
	-- upvalues: schemaMetaFieldDef (ref), typeMetaFieldDef (ref), typeNameMetaFieldDef (ref), isCompositeType (ref), isObjectType (ref), isInterfaceType (ref)
	local value = p20.name.value
	
	return if value == schemaMetaFieldDef.name and p18:getQueryType() == p19 then schemaMetaFieldDef elseif value == typeMetaFieldDef.name and p18:getQueryType() == p19 then typeMetaFieldDef elseif value == typeNameMetaFieldDef.name and isCompositeType(p19) then typeNameMetaFieldDef elseif isObjectType(p19) or isInterfaceType(p19) then p19:getFields():get(value) else nil
end

return {
	TypeInfo = t,
	visitWithTypeInfo = function(p21, p22) --[[ line: 404 ]]
		-- upvalues: getVisitFn (ref), isNode (ref)
		return {
			enter = function(_, p23, ...) --[[ line: 409 ]]
				-- upvalues: p21 (ref), getVisitFn (copy), p22 (ref), isNode (copy)
				p21:enter(p23)
				local var28 = getVisitFn(p22, p23.kind, false)
				
				if not var28 then
					return nil
				end
				local var29 = var28(p22, p23, ...)
				
				if var29 ~= nil then
					p21:leave(p23)
					
					if isNode(var29) then
						p21:enter(var29)
					end
				end
				return var29
			end,
			leave = function(_, p24, ...) --[[ line: 428 ]]
				-- upvalues: getVisitFn (copy), p22 (ref), p21 (ref)
				local var30 = getVisitFn(p22, p24.kind, true)
				local var31 = if var30 then var30(p22, p24, ...) else nil
				p21:leave(p24)
				
				return var31
			end
		}
	end
}