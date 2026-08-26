local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local t = {}
local graphQLModule = require(parent.GraphQL)
local print = graphQLModule.print
local kind = graphQLModule.Kind
local isSpecifiedScalarType = graphQLModule.isSpecifiedScalarType
local isIntrospectionType = graphQLModule.isIntrospectionType
local isSpecifiedDirective = graphQLModule.isSpecifiedDirective
local astFromValue = graphQLModule.astFromValue
local graphQLDeprecatedDirective = graphQLModule.GraphQLDeprecatedDirective
local isObjectType = graphQLModule.isObjectType
local isInterfaceType = graphQLModule.isInterfaceType
local isUnionType = graphQLModule.isUnionType
local isInputObjectType = graphQLModule.isInputObjectType
local isEnumType = graphQLModule.isEnumType
local isScalarType = graphQLModule.isScalarType
local _ = require(script.Parent.types)
local astFromType = require(script.Parent.astFromType).astFromType
local getDirectivesInExtensions = require(script.Parent["get-directives"]).getDirectivesInExtensions
local astFromValueUntyped = require(script.Parent.astFromValueUntyped).astFromValueUntyped
local isSome = require(script.Parent.helpers).isSome
local getRootTypeMap = require(script.Parent.rootTypes).getRootTypeMap
local var1 = nil
local var2 = nil
local makeDirectiveNode = nil
local getDirectiveNodes = nil
local var3 = nil
local var4 = nil
local var5 = nil
local var6 = nil
local var7 = nil
local var8 = nil
local var9 = nil
local var10 = nil
local var11 = nil
local astFromArg = nil
local var12 = nil
local var13 = nil
local NULL = graphQLModule.NULL

local function getDocumentNodeFromSchema(p1, p2)
	-- upvalues: var1 (write), boolean (ref), isSpecifiedDirective (ref), var2 (write), isSpecifiedScalarType (ref), isIntrospectionType (ref), isObjectType (ref), var3 (write), isInterfaceType (ref), var7 (write), isUnionType (ref), var8 (write), isInputObjectType (ref), var9 (write), isEnumType (ref), var10 (write), isScalarType (ref), var11 (write), error (ref), kind (ref)
	local pathToDirectivesInExtensions = (if p2 ~= nil then {} else p2).pathToDirectivesInExtensions
	local typeMap = p1:getTypeMap()
	local var14 = var1(p1, pathToDirectivesInExtensions)
	local var15 = if var14 ~= nil then {} else { var14 }
	
	for i, v in p1:getDirectives() do
		if not boolean.toJSBoolean(isSpecifiedDirective(v)) then
			table.insert(var15, var2(v, p1, pathToDirectivesInExtensions))
		end
	end
	for i, v_1 in typeMap do
		local var16 = typeMap:get(v_1[1])
		
		if not isSpecifiedScalarType(var16) and not isIntrospectionType(var16) then
			if boolean.toJSBoolean(isObjectType(var16)) then
				table.insert(var15, var3(var16, p1, pathToDirectivesInExtensions))
			elseif boolean.toJSBoolean(isInterfaceType(var16)) then
				table.insert(var15, var7(var16, p1, pathToDirectivesInExtensions))
			elseif boolean.toJSBoolean(isUnionType(var16)) then
				table.insert(var15, var8(var16, p1, pathToDirectivesInExtensions))
			elseif boolean.toJSBoolean(isInputObjectType(var16)) then
				table.insert(var15, var9(var16, p1, pathToDirectivesInExtensions))
			elseif boolean.toJSBoolean(isEnumType(var16)) then
				table.insert(var15, var10(var16, p1, pathToDirectivesInExtensions))
			elseif boolean.toJSBoolean(isScalarType(var16)) then
				table.insert(var15, var11(var16, p1, pathToDirectivesInExtensions))
			else
				error(error.new(("Unknown type %s."):format(tostring(var16))))
			end
		end
	end
	return { kind = kind.DOCUMENT, definitions = var15 }
end

t.getDocumentNodeFromSchema = getDocumentNodeFromSchema

function t.printSchemaWithDirectives(p3, p4)
	-- upvalues: getDocumentNodeFromSchema (ref), print (ref)
	return print(getDocumentNodeFromSchema(p3, if p4 ~= nil then {} else p4))
end

function t.astFromSchema(p3, p4)
	-- upvalues: map (ref), object (ref), boolean (ref), getRootTypeMap (ref), astFromType (ref), kind (ref), array (ref), isSome (ref), getDirectiveNodes (write)
	local var17 = map.new({
		{ "query", object.None },
		{ "mutation", object.None },
		{ "subscription", object.None }
	})
	local t = {}
	
	if p3.astNode ~= nil then
		table.insert(t, p3.astNode)
	end
	if p3.extensionASTNodes ~= nil then
		for i, v in p3.extensionASTNodes do
			table.insert(t, v)
		end
	end
	for i, v in t do
		if boolean.toJSBoolean(v.operationTypes) then
			for i_1, v_1 in v.operationTypes do
				var17:set(v_1.operation, v_1)
			end
		end
	end
	local var18
	local var19 = getRootTypeMap(p3)
	
	for i_1, v_1 in var17 do
		unpacked, var31 = table.unpack(v_1, 1, 2)
		local var20 = var19:get(unpacked)
		
		if var20 ~= nil then
			local var21 = astFromType(var20)
			
			if var18 == nil or var18 == object.None then
				var17:set(unpacked, {
					kind = kind.OPERATION_TYPE_DEFINITION,
					operation = unpacked,
					type = var21
				})
			else
				var18.type = var21
			end
		end
	end
	local var22 = array.filter(array.concat({}, var17:values()), isSome)
	local var23 = getDirectiveNodes(p3, p3, p4)
	
	if boolean.toJSBoolean(#var22) or boolean.toJSBoolean(#var23) then
		local t_1 = {
			kind = if var22 ~= nil then kind.SCHEMA_EXTENSION else kind.SCHEMA_DEFINITION,
			operationTypes = var22,
			directives = var23
		}
		var18 = if typeof(p3.astNode) == "table" then p3.astNode.description else nil
		t_1.description = if boolean.toJSBoolean(if var18 ~= nil then p3.description ~= nil else var18) then { block = true, kind = kind.STRING, value = p3.description } else nil
		
		return t_1
	end
	return nil
end

function t.astFromDirective(p5, p6, p7)
	-- upvalues: kind (ref), boolean (ref), array (ref), astFromArg (write)
	local DIRECTIVE_DEFINITION = kind.DIRECTIVE_DEFINITION
	local var24 = if typeof(p5.astNode) == "table" then p5.astNode.description else nil
	local var25 = if typeof(p5.locations) == "table" then array.map(p5.locations, function(p8)
		-- upvalues: kind (copy)
		return { kind = kind.NAME, value = p8 }
	end) else nil
	
	return {
		kind = DIRECTIVE_DEFINITION,
		description = if var24 ~= nil then if boolean.toJSBoolean(p5.description) then { kind = kind.STRING, value = p5.description } else nil else var24,
		name = { kind = kind.NAME, value = p5.name },
		arguments = if typeof(p5.args) == "table" then array.map(p5.args, function(p8)
			-- upvalues: astFromArg (copy), p6 (ref), p7 (ref)
			return astFromArg(p8, p6, p7)
		end) else nil,
		repeatable = p5.isRepeatable,
		locations = if boolean.toJSBoolean(var25) then var25 else {}
	}
end

getDirectiveNodes = function(p5, p6, p7)
	-- upvalues: getDirectivesInExtensions (ref), array (ref), object (ref), var4 (write), boolean (ref)
	local var24 = getDirectivesInExtensions(p5, p7)
	local t = {}
	
	if p5.astNode ~= nil then
		table.insert(t, p5.astNode)
	end
	if array.indexOf(object.keys(p5), "extensionASTNodes") ~= -1 and p5.extensionASTNodes ~= nil then
		t = array.concat(t, p5.extensionASTNodes)
	end
	local _ = nil
	
	if var24 ~= nil then
		return var4(p6, var24)
	end
	local t_1 = {}
	
	for i, v in t do
		if boolean.toJSBoolean(v.directives) then
			t_1 = array.concat(t_1, v.directives)
		end
	end
	return t_1
end

t.getDirectiveNodes = getDirectiveNodes

local function getDeprecatableDirectiveNodes(p8, p9, p10)
	-- upvalues: getDirectivesInExtensions (ref), var4 (write), array (ref), var6 (write)
	local t = {}
	local var25 = nil
	local var26 = getDirectivesInExtensions(p8, p10)
	local var27 = if var26 ~= nil then if typeof(p8.astNode) == "table" then p8.astNode.directives else nil else var4(p9, var26)
	
	if var27 ~= nil then
		t = array.filter(var27, function(p11)
			return p11.name.value ~= "deprecated"
		end)
		
		if p8.deprecationReason ~= nil then
			var25 = if typeof(array.filter(var27, function(p11)
				return p11.name.value == "deprecated"
			end)) == "table" then array.filter(var27, function(p11)
				return p11.name.value == "deprecated"
			end)[1] else nil
		end
	end
	if p8.deprecationReason ~= nil and var25 == nil then
		var25 = var6(p8.deprecationReason)
	end
	return if var25 == nil then t else array.concat({ var25 }, t)
end

t.getDeprecatableDirectiveNodes = getDeprecatableDirectiveNodes

astFromArg = function(p8, p9, p10)
	-- upvalues: kind (ref), boolean (ref), astFromType (ref), astFromValue (ref), getDeprecatableDirectiveNodes (ref)
	local var25 = if typeof(p8.astNode) == "table" then p8.astNode.description else nil
	
	return {
		kind = kind.INPUT_VALUE_DEFINITION,
		description = if var25 ~= nil then if boolean.toJSBoolean(p8.description) then {
			block = true,
			kind = kind.STRING,
			value = p8.description
		} else nil else var25,
		name = { kind = kind.NAME, value = p8.name },
		type = astFromType(p8.type),
		defaultValue = if p8.defaultValue ~= nil then nil else astFromValue(p8.defaultValue, p8.type),
		directives = getDeprecatableDirectiveNodes(p8, p9, p10)
	}
end

t.astFromArg = astFromArg

function t.astFromObjectType(p8, p9, p10)
	-- upvalues: kind (ref), boolean (ref), array (ref), var12 (write), object (ref), astFromType (ref), getDirectiveNodes (write)
	local var25 = if typeof(p8.astNode) == "table" then p8.astNode.description else nil
	
	return {
		kind = kind.OBJECT_TYPE_DEFINITION,
		description = if var25 ~= nil then if boolean.toJSBoolean(p8.description) then {
			block = true,
			kind = kind.STRING,
			value = p8.description
		} else nil else var25,
		name = { kind = kind.NAME, value = p8.name },
		fields = array.map(p8:getFields():values(), function(p11)
			-- upvalues: var12 (copy), p9 (ref), p10 (ref)
			return var12(p11, p9, p10)
		end),
		interfaces = array.map(object.values(p8:getInterfaces()), function(p11)
			-- upvalues: astFromType (copy)
			return astFromType(p11)
		end),
		directives = getDirectiveNodes(p8, p9, p10)
	}
end

function t.astFromInterfaceType(a, b, p8)
	-- upvalues: kind (ref), boolean (ref), array (ref), var12 (write), getDirectiveNodes (write), object (ref), astFromType (ref)
	local var25 = if typeof(a.astNode) == "table" then a.astNode.description else nil
	local t = {
		kind = kind.INTERFACE_TYPE_DEFINITION,
		description = if var25 ~= nil then if boolean.toJSBoolean(a.description) then { block = true, kind = kind.STRING, value = a.description } else nil else var25,
		name = { kind = kind.NAME, value = a.name },
		fields = array.map(a:getFields():values(), function(p9)
			-- upvalues: var12 (copy), b (ref), p8 (ref)
			return var12(p9, b, p8)
		end),
		directives = getDirectiveNodes(a, b, p8)
	}
	
	if a.getInterfaces ~= nil then
		t.interfaces = array.map(object.values(a:getInterfaces()), function(p9)
			-- upvalues: astFromType (copy)
			return astFromType(p9)
		end)
	end
	return t
end

function t.astFromUnionType(p8, p9, p10)
	-- upvalues: kind (ref), boolean (ref), getDirectiveNodes (write), array (ref), astFromType (ref)
	local var25 = if typeof(p8.astNode) == "table" then p8.astNode.description else nil
	
	return {
		kind = kind.UNION_TYPE_DEFINITION,
		description = if var25 ~= nil then if boolean.toJSBoolean(p8.description) then {
			block = true,
			kind = kind.STRING,
			value = p8.description
		} else nil else var25,
		name = { kind = kind.NAME, value = p8.name },
		directives = getDirectiveNodes(p8, p9, p10),
		types = array.map(p8:getTypes(), function(p11)
			-- upvalues: astFromType (copy)
			return astFromType(p11)
		end)
	}
end

function t.astFromInputObjectType(a, b, p8)
	-- upvalues: kind (ref), boolean (ref), array (ref), var13 (write), getDirectiveNodes (write)
	local var25 = if typeof(a.astNode) == "table" then a.astNode.description else nil
	
	return {
		kind = kind.INPUT_OBJECT_TYPE_DEFINITION,
		description = if var25 ~= nil then if boolean.toJSBoolean(a.description) then { block = true, kind = kind.STRING, value = a.description } else nil else var25,
		name = { kind = kind.NAME, value = a.name },
		fields = array.map(a:getFields():values(), function(p9)
			-- upvalues: var13 (copy), b (ref), p8 (ref)
			return var13(p9, b, p8)
		end),
		directives = getDirectiveNodes(a, b, p8)
	}
end

function t.astFromEnumType(p8, p9, p10)
	-- upvalues: kind (ref), boolean (ref), array (ref), object (ref), var5 (write), getDirectiveNodes (write)
	local var25 = if typeof(p8.astNode) == "table" then p8.astNode.description else nil
	
	return {
		kind = kind.ENUM_TYPE_DEFINITION,
		description = if var25 ~= nil then if boolean.toJSBoolean(p8.description) then {
			block = true,
			kind = kind.STRING,
			value = p8.description
		} else nil else var25,
		name = { kind = kind.NAME, value = p8.name },
		values = array.map(object.values(p8:getValues()), function(p11)
			-- upvalues: var5 (copy), p9 (ref), p10 (ref)
			return var5(p11, p9, p10)
		end),
		directives = getDirectiveNodes(p8, p9, p10)
	}
end

function t.astFromScalarType(p8, p9, p10)
	-- upvalues: getDirectivesInExtensions (ref), boolean (ref), var4 (write), array (ref), makeDirectiveNode (write), kind (ref)
	local var25 = getDirectivesInExtensions(p8, p10)
	local var26 = if boolean.toJSBoolean(var25) then var4(p9, var25) else (if typeof(p8.astNode) == "table" then p8.astNode.directives else nil) or {}
	local var27 = if boolean.toJSBoolean(p8.specifiedByUrl) then p8.specifiedByUrl else p8.specifiedByURL
	
	if boolean.toJSBoolean(if boolean.toJSBoolean(var27) then not boolean.toJSBoolean(array.some(var26, function(p11)
		return p11.name.value == "specifiedBy"
	end)) else var27) then
		table.insert(var26, makeDirectiveNode("specifiedBy", { url = var27 }))
	end
	local var28 = if typeof(p8.astNode) == "table" then p8.astNode.description else nil
	
	return {
		kind = kind.SCALAR_TYPE_DEFINITION,
		description = if var28 ~= nil then if boolean.toJSBoolean(p8.description) then {
			block = true,
			kind = kind.STRING,
			value = p8.description
		} else nil else var28,
		name = { kind = kind.NAME, value = p8.name },
		directives = var26
	}
end

function t.astFromField(p8, p9, p10)
	-- upvalues: kind (ref), boolean (ref), array (ref), astFromArg (write), astFromType (ref), getDeprecatableDirectiveNodes (ref)
	local var25 = if typeof(p8.astNode) == "table" then p8.astNode.description else nil
	
	return {
		kind = kind.FIELD_DEFINITION,
		description = if var25 ~= nil then if boolean.toJSBoolean(p8.description) then {
			block = true,
			kind = kind.STRING,
			value = p8.description
		} else nil else var25,
		name = { kind = kind.NAME, value = p8.name },
		arguments = array.map(p8.args, function(p11)
			-- upvalues: astFromArg (copy), p9 (ref), p10 (ref)
			return astFromArg(p11, p9, p10)
		end),
		type = astFromType(p8.type),
		directives = getDeprecatableDirectiveNodes(p8, p9, p10)
	}
end

function t.astFromInputField(a, b, p8)
	-- upvalues: kind (ref), boolean (ref), astFromType (ref), getDeprecatableDirectiveNodes (ref), astFromValue (ref), NULL (ref)
	local INPUT_VALUE_DEFINITION = kind.INPUT_VALUE_DEFINITION
	local var25 = if typeof(a.astNode) == "table" then a.astNode.description else nil
	local var26 = astFromValue(a.defaultValue, a.type)
	
	return {
		kind = INPUT_VALUE_DEFINITION,
		description = if var25 ~= nil then if boolean.toJSBoolean(a.description) then { block = true, kind = kind.STRING, value = a.description } else nil else var25,
		name = { kind = kind.NAME, value = a.name },
		type = astFromType(a.type),
		directives = getDeprecatableDirectiveNodes(a, b, p8),
		defaultValue = if var26 == nil or var26 == NULL then nil else var26
	}
end

function t.astFromEnumValue(p8, p9, p10)
	-- upvalues: kind (ref), boolean (ref), getDeprecatableDirectiveNodes (ref)
	local var25 = if typeof(p8.astNode) == "table" then p8.astNode.description else nil
	
	return {
		kind = kind.ENUM_VALUE_DEFINITION,
		description = if var25 ~= nil then if boolean.toJSBoolean(p8.description) then {
			block = true,
			kind = kind.STRING,
			value = p8.description
		} else nil else var25,
		name = { kind = kind.NAME, value = p8.name },
		directives = getDeprecatableDirectiveNodes(p8, p9, p10)
	}
end

function t.makeDeprecatedDirective(p8)
	-- upvalues: makeDirectiveNode (write), graphQLDeprecatedDirective (ref)
	return makeDirectiveNode("deprecated", { reason = p8 }, graphQLDeprecatedDirective)
end

makeDirectiveNode = function(p8, p9, p10)
	-- upvalues: astFromValue (ref), boolean (ref), kind (ref), astFromValueUntyped (ref)
	local t = {}
	
	if p10 == nil then
		for i in p9 do
			local var25 = astFromValueUntyped(p9[tostring(i)])
			
			if boolean.toJSBoolean(var25) then
				table.insert(t, {
					kind = kind.ARGUMENT,
					name = { kind = kind.NAME, value = i },
					value = var25
				})
			end
		end
	else
		for i, v in p10.args do
			local name = v.name
			local var26 = p9[tostring(name)]
			
			if var26 ~= nil then
				local var27 = astFromValue(var26, v.type)
				
				if boolean.toJSBoolean(var27) then
					table.insert(t, {
						kind = kind.ARGUMENT,
						name = { kind = kind.NAME, value = name },
						value = var27
					})
				end
			end
		end
	end
	return {
		kind = kind.DIRECTIVE,
		name = { kind = kind.NAME, value = p8 },
		arguments = t
	}
end

t.makeDirectiveNode = makeDirectiveNode

function t.makeDirectiveNodes(p11, p12)
	-- upvalues: array (ref), makeDirectiveNode (write)
	local var28, var29
	local t = {}
	
	for i in p12 do
		var28 = p12[tostring(i)]
		var29 = if typeof(p11) == "table" then p11:getDirective(i) else nil
		
		if not array.isArray(var28) or #var28 == 0 then
			table.insert(t, makeDirectiveNode(i, var28, var29))
			continue
		end
		for i_1, v in var28 do
			table.insert(t, makeDirectiveNode(i, v, var29))
		end
	end
	return t
end

return t