-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:09 2026 Pacific Standard Time.

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
local var3 = nil
local var4 = nil
local makeDirectiveNode = nil
local getDirectiveNodes = nil
local var7 = nil
local var8 = nil
local var9 = nil
local var10 = nil
local var11 = nil
local var12 = nil
local var13 = nil
local var14 = nil
local var15 = nil
local astFromArg = nil
local var17 = nil
local var18 = nil
local NULL = graphQLModule.NULL

local function getDocumentNodeFromSchema(p0, p1) --[[ line: 160 ]]
	-- upvalues: var3 (write), boolean (ref), isSpecifiedDirective (ref), var4 (write), isSpecifiedScalarType (ref), isIntrospectionType (ref), isObjectType (ref), var7 (write), isInterfaceType (ref), var11 (write), isUnionType (ref), var12 (write), isInputObjectType (ref), var13 (write), isEnumType (ref), var14 (write), isScalarType (ref), var15 (write), error (ref), kind (ref)
	local pathToDirectivesInExtensions = (if p1 ~= nil then {} else p1).pathToDirectivesInExtensions
	local typeMap = p0:getTypeMap()
	local var22 = var3(p0, pathToDirectivesInExtensions)
	local var23 = if var22 ~= nil then {} else { var22 }
	
	for i, v in p0:getDirectives() do
		if not boolean.toJSBoolean(isSpecifiedDirective(v)) then
			table.insert(var23, var4(v, p0, pathToDirectivesInExtensions))
		end
	end
	for i, v_1 in typeMap do
		local var24 = typeMap:get(v_1[1])
		
		if not isSpecifiedScalarType(var24) and not isIntrospectionType(var24) then
			if boolean.toJSBoolean(isObjectType(var24)) then
				table.insert(var23, var7(var24, p0, pathToDirectivesInExtensions))
			elseif boolean.toJSBoolean(isInterfaceType(var24)) then
				table.insert(var23, var11(var24, p0, pathToDirectivesInExtensions))
			elseif boolean.toJSBoolean(isUnionType(var24)) then
				table.insert(var23, var12(var24, p0, pathToDirectivesInExtensions))
			elseif boolean.toJSBoolean(isInputObjectType(var24)) then
				table.insert(var23, var13(var24, p0, pathToDirectivesInExtensions))
			elseif boolean.toJSBoolean(isEnumType(var24)) then
				table.insert(var23, var14(var24, p0, pathToDirectivesInExtensions))
			elseif boolean.toJSBoolean(isScalarType(var24)) then
				table.insert(var23, var15(var24, p0, pathToDirectivesInExtensions))
			else
				error(error.new(("Unknown type %s."):format(tostring(var24))))
			end
		end
	end
	return { kind = kind.DOCUMENT, definitions = var23 }
end

t.getDocumentNodeFromSchema = getDocumentNodeFromSchema

function t.printSchemaWithDirectives(p2, p3) --[[ line: 244 ]]
	-- upvalues: getDocumentNodeFromSchema (ref), print (ref)
	return print(getDocumentNodeFromSchema(p2, if p3 ~= nil then {} else p3))
end

function t.astFromSchema(p4, p5) --[[ line: 252 ]]
	-- upvalues: map (ref), object (ref), boolean (ref), getRootTypeMap (ref), astFromType (ref), kind (ref), array (ref), isSome (ref), getDirectiveNodes (write)
	local var25 = map.new({
		{ "query", object.None },
		{ "mutation", object.None },
		{ "subscription", object.None }
	})
	local t = {}
	
	if p4.astNode ~= nil then
		table.insert(t, p4.astNode)
	end
	if p4.extensionASTNodes ~= nil then
		for i, v in p4.extensionASTNodes do
			table.insert(t, v)
		end
	end
	for i, v in t do
		if boolean.toJSBoolean(v.operationTypes) then
			for i_1, v_1 in v.operationTypes do
				var25:set(v_1.operation, v_1)
			end
		end
	end
	local var31
	local var27 = getRootTypeMap(p4)
	
	for i_1, v_1 in var25 do
		unpacked, var31 = table.unpack(v_1, 1, 2)
		local var33 = var27:get(unpacked)
		
		if var33 ~= nil then
			local var34 = astFromType(var33)
			
			if var31 == nil or var31 == object.None then
				var25:set(unpacked, {
					kind = kind.OPERATION_TYPE_DEFINITION,
					operation = unpacked,
					type = var34
				})
			else
				var31.type = var34
			end
		end
	end
	local var28 = array.filter(array.concat({}, var25:values()), isSome)
	local var29 = getDirectiveNodes(p4, p4, p5)
	
	if boolean.toJSBoolean(#var28) or boolean.toJSBoolean(#var29) then
		local t_1 = {
			kind = if var28 ~= nil then kind.SCHEMA_EXTENSION else kind.SCHEMA_DEFINITION,
			operationTypes = var28,
			directives = var29
		}
		var31 = if typeof(p4.astNode) == "table" then p4.astNode.description else nil
		t_1.description = if boolean.toJSBoolean(if var31 ~= nil then p4.description ~= nil else var31) then { block = true, kind = kind.STRING, value = p4.description } else nil
		
		return t_1
	end
	return nil
end

function t.astFromDirective(p6, p7, p8) --[[ line: 355 ]]
	-- upvalues: kind (ref), boolean (ref), array (ref), astFromArg (write)
	local DIRECTIVE_DEFINITION = kind.DIRECTIVE_DEFINITION
	local var35 = if typeof(p6.astNode) == "table" then p6.astNode.description else nil
	local var36 = if typeof(p6.locations) == "table" then array.map(p6.locations, function(p9) --[[ line: 390 ]]
		-- upvalues: kind (copy)
		return { kind = kind.NAME, value = p9 }
	end) else nil
	
	return {
		kind = DIRECTIVE_DEFINITION,
		description = if var35 ~= nil then if boolean.toJSBoolean(p6.description) then { kind = kind.STRING, value = p6.description } else nil else var35,
		name = { kind = kind.NAME, value = p6.name },
		arguments = if typeof(p6.args) == "table" then array.map(p6.args, function(p10) --[[ line: 379 ]]
			-- upvalues: astFromArg (copy), p7 (ref), p8 (ref)
			return astFromArg(p10, p7, p8)
		end) else nil,
		repeatable = p6.isRepeatable,
		locations = if boolean.toJSBoolean(var36) then var36 else {}
	}
end

getDirectiveNodes = function(p11, p12, p13) --[[ line: 418 | named "getDirectiveNodes" ]]
	-- upvalues: getDirectivesInExtensions (ref), array (ref), object (ref), var8 (write), boolean (ref)
	local var37 = getDirectivesInExtensions(p11, p13)
	local t = {}
	
	if p11.astNode ~= nil then
		table.insert(t, p11.astNode)
	end
	if array.indexOf(object.keys(p11), "extensionASTNodes") ~= -1 and p11.extensionASTNodes ~= nil then
		t = array.concat(t, p11.extensionASTNodes)
	end
	local _ = nil
	
	if var37 ~= nil then
		return var8(p12, var37)
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

local function getDeprecatableDirectiveNodes(p14, p15, p16) --[[ line: 471 ]]
	-- upvalues: getDirectivesInExtensions (ref), var8 (write), array (ref), var10 (write)
	local t = {}
	local var41 = nil
	local var42 = getDirectivesInExtensions(p14, p16)
	local var43 = if var42 ~= nil then if typeof(p14.astNode) == "table" then p14.astNode.directives else nil else var8(p15, var42)
	
	if var43 ~= nil then
		t = array.filter(var43, function(p17) --[[ line: 493 ]]
			return p17.name.value ~= "deprecated"
		end)
		
		if p14.deprecationReason ~= nil then
			var41 = if typeof(array.filter(var43, function(p18) --[[ line: 500 ]]
				return p18.name.value == "deprecated"
			end)) == "table" then array.filter(var43, function(p19) --[[ line: 504 ]]
				return p19.name.value == "deprecated"
			end)[1] else nil
		end
	end
	if p14.deprecationReason ~= nil and var41 == nil then
		var41 = var10(p14.deprecationReason)
	end
	return if var41 == nil then t else array.concat({ var41 }, t)
end

t.getDeprecatableDirectiveNodes = getDeprecatableDirectiveNodes

astFromArg = function(p20, p21, p22) --[[ line: 528 | named "astFromArg" ]]
	-- upvalues: kind (ref), boolean (ref), astFromType (ref), astFromValue (ref), getDeprecatableDirectiveNodes (ref)
	local var44 = if typeof(p20.astNode) == "table" then p20.astNode.description else nil
	
	return {
		kind = kind.INPUT_VALUE_DEFINITION,
		description = if var44 ~= nil then if boolean.toJSBoolean(p20.description) then {
			block = true,
			kind = kind.STRING,
			value = p20.description
		} else nil else var44,
		name = { kind = kind.NAME, value = p20.name },
		type = astFromType(p20.type),
		defaultValue = if p20.defaultValue ~= nil then nil else astFromValue(p20.defaultValue, p20.type),
		directives = getDeprecatableDirectiveNodes(p20, p21, p22)
	}
end

t.astFromArg = astFromArg

function t.astFromObjectType(p23, p24, p25) --[[ line: 566 ]]
	-- upvalues: kind (ref), boolean (ref), array (ref), var17 (write), object (ref), astFromType (ref), getDirectiveNodes (write)
	local var45 = if typeof(p23.astNode) == "table" then p23.astNode.description else nil
	
	return {
		kind = kind.OBJECT_TYPE_DEFINITION,
		description = if var45 ~= nil then if boolean.toJSBoolean(p23.description) then {
			block = true,
			kind = kind.STRING,
			value = p23.description
		} else nil else var45,
		name = { kind = kind.NAME, value = p23.name },
		fields = array.map(p23:getFields():values(), function(p26) --[[ line: 592 ]]
			-- upvalues: var17 (copy), p24 (ref), p25 (ref)
			return var17(p26, p24, p25)
		end),
		interfaces = array.map(object.values(p23:getInterfaces()), function(p27) --[[ line: 596 ]]
			-- upvalues: astFromType (copy)
			return astFromType(p27)
		end),
		directives = getDirectiveNodes(p23, p24, p25)
	}
end

function t.astFromInterfaceType(a, b, p28) --[[ line: 605 ]]
	-- upvalues: kind (ref), boolean (ref), array (ref), var17 (write), getDirectiveNodes (write), object (ref), astFromType (ref)
	local var46 = if typeof(a.astNode) == "table" then a.astNode.description else nil
	local t = {
		kind = kind.INTERFACE_TYPE_DEFINITION,
		description = if var46 ~= nil then if boolean.toJSBoolean(a.description) then { block = true, kind = kind.STRING, value = a.description } else nil else var46,
		name = { kind = kind.NAME, value = a.name },
		fields = array.map(a:getFields():values(), function(p29) --[[ line: 631 ]]
			-- upvalues: var17 (copy), b (ref), p28 (ref)
			return var17(p29, b, p28)
		end),
		directives = getDirectiveNodes(a, b, p28)
	}
	
	if a.getInterfaces ~= nil then
		t.interfaces = array.map(object.values(a:getInterfaces()), function(p30) --[[ line: 643 ]]
			-- upvalues: astFromType (copy)
			return astFromType(p30)
		end)
	end
	return t
end

function t.astFromUnionType(p31, p32, p33) --[[ line: 653 ]]
	-- upvalues: kind (ref), boolean (ref), getDirectiveNodes (write), array (ref), astFromType (ref)
	local var48 = if typeof(p31.astNode) == "table" then p31.astNode.description else nil
	
	return {
		kind = kind.UNION_TYPE_DEFINITION,
		description = if var48 ~= nil then if boolean.toJSBoolean(p31.description) then {
			block = true,
			kind = kind.STRING,
			value = p31.description
		} else nil else var48,
		name = { kind = kind.NAME, value = p31.name },
		directives = getDirectiveNodes(p31, p32, p33),
		types = array.map(p31:getTypes(), function(p34) --[[ line: 680 ]]
			-- upvalues: astFromType (copy)
			return astFromType(p34)
		end)
	}
end

function t.astFromInputObjectType(a, b, p35) --[[ line: 688 ]]
	-- upvalues: kind (ref), boolean (ref), array (ref), var18 (write), getDirectiveNodes (write)
	local var49 = if typeof(a.astNode) == "table" then a.astNode.description else nil
	
	return {
		kind = kind.INPUT_OBJECT_TYPE_DEFINITION,
		description = if var49 ~= nil then if boolean.toJSBoolean(a.description) then { block = true, kind = kind.STRING, value = a.description } else nil else var49,
		name = { kind = kind.NAME, value = a.name },
		fields = array.map(a:getFields():values(), function(p36) --[[ line: 714 ]]
			-- upvalues: var18 (copy), b (ref), p35 (ref)
			return var18(p36, b, p35)
		end),
		directives = getDirectiveNodes(a, b, p35)
	}
end

function t.astFromEnumType(p37, p38, p39) --[[ line: 725 ]]
	-- upvalues: kind (ref), boolean (ref), array (ref), object (ref), var9 (write), getDirectiveNodes (write)
	local var50 = if typeof(p37.astNode) == "table" then p37.astNode.description else nil
	
	return {
		kind = kind.ENUM_TYPE_DEFINITION,
		description = if var50 ~= nil then if boolean.toJSBoolean(p37.description) then {
			block = true,
			kind = kind.STRING,
			value = p37.description
		} else nil else var50,
		name = { kind = kind.NAME, value = p37.name },
		values = array.map(object.values(p37:getValues()), function(p40) --[[ line: 749 ]]
			-- upvalues: var9 (copy), p38 (ref), p39 (ref)
			return var9(p40, p38, p39)
		end),
		directives = getDirectiveNodes(p37, p38, p39)
	}
end

function t.astFromScalarType(p41, p42, p43) --[[ line: 759 ]]
	-- upvalues: getDirectivesInExtensions (ref), boolean (ref), var8 (write), array (ref), makeDirectiveNode (write), kind (ref)
	local var51 = getDirectivesInExtensions(p41, p43)
	local var52 = if boolean.toJSBoolean(var51) then var8(p42, var51) else (if typeof(p41.astNode) == "table" then p41.astNode.directives else nil) or {}
	local var53 = if boolean.toJSBoolean(p41.specifiedByUrl) then p41.specifiedByUrl else p41.specifiedByURL
	
	if boolean.toJSBoolean(if boolean.toJSBoolean(var53) then not boolean.toJSBoolean(array.some(var52, function(p44) --[[ line: 787 ]]
		return p44.name.value == "specifiedBy"
	end)) else var53) then
		table.insert(var52, makeDirectiveNode("specifiedBy", { url = var53 }))
	end
	local var54 = if typeof(p41.astNode) == "table" then p41.astNode.description else nil
	
	return {
		kind = kind.SCALAR_TYPE_DEFINITION,
		description = if var54 ~= nil then if boolean.toJSBoolean(p41.description) then {
			block = true,
			kind = kind.STRING,
			value = p41.description
		} else nil else var54,
		name = { kind = kind.NAME, value = p41.name },
		directives = var52
	}
end

function t.astFromField(p45, p46, p47) --[[ line: 817 ]]
	-- upvalues: kind (ref), boolean (ref), array (ref), astFromArg (write), astFromType (ref), getDeprecatableDirectiveNodes (ref)
	local var55 = if typeof(p45.astNode) == "table" then p45.astNode.description else nil
	
	return {
		kind = kind.FIELD_DEFINITION,
		description = if var55 ~= nil then if boolean.toJSBoolean(p45.description) then {
			block = true,
			kind = kind.STRING,
			value = p45.description
		} else nil else var55,
		name = { kind = kind.NAME, value = p45.name },
		arguments = array.map(p45.args, function(p48) --[[ line: 838 ]]
			-- upvalues: astFromArg (copy), p46 (ref), p47 (ref)
			return astFromArg(p48, p46, p47)
		end),
		type = astFromType(p45.type),
		directives = getDeprecatableDirectiveNodes(p45, p46, p47)
	}
end

function t.astFromInputField(a, b, p49) --[[ line: 849 ]]
	-- upvalues: kind (ref), boolean (ref), astFromType (ref), getDeprecatableDirectiveNodes (ref), astFromValue (ref), NULL (ref)
	local INPUT_VALUE_DEFINITION = kind.INPUT_VALUE_DEFINITION
	local var56 = if typeof(a.astNode) == "table" then a.astNode.description else nil
	local var57 = astFromValue(a.defaultValue, a.type)
	
	return {
		kind = INPUT_VALUE_DEFINITION,
		description = if var56 ~= nil then if boolean.toJSBoolean(a.description) then { block = true, kind = kind.STRING, value = a.description } else nil else var56,
		name = { kind = kind.NAME, value = a.name },
		type = astFromType(a.type),
		directives = getDeprecatableDirectiveNodes(a, b, p49),
		defaultValue = if var57 == nil or var57 == NULL then nil else var57
	}
end

function t.astFromEnumValue(p50, p51, p52) --[[ line: 888 ]]
	-- upvalues: kind (ref), boolean (ref), getDeprecatableDirectiveNodes (ref)
	local var58 = if typeof(p50.astNode) == "table" then p50.astNode.description else nil
	
	return {
		kind = kind.ENUM_VALUE_DEFINITION,
		description = if var58 ~= nil then if boolean.toJSBoolean(p50.description) then {
			block = true,
			kind = kind.STRING,
			value = p50.description
		} else nil else var58,
		name = { kind = kind.NAME, value = p50.name },
		directives = getDeprecatableDirectiveNodes(p50, p51, p52)
	}
end

function t.makeDeprecatedDirective(p53) --[[ line: 916 ]]
	-- upvalues: makeDirectiveNode (write), graphQLDeprecatedDirective (ref)
	return makeDirectiveNode("deprecated", { reason = p53 }, graphQLDeprecatedDirective)
end

makeDirectiveNode = function(p54, p55, p56) --[[ line: 923 | named "makeDirectiveNode" ]]
	-- upvalues: astFromValue (ref), boolean (ref), kind (ref), astFromValueUntyped (ref)
	local t = {}
	
	if p56 == nil then
		for i in p55 do
			local var62 = astFromValueUntyped(p55[tostring(i)])
			
			if boolean.toJSBoolean(var62) then
				table.insert(t, {
					kind = kind.ARGUMENT,
					name = { kind = kind.NAME, value = i },
					value = var62
				})
			end
		end
	else
		for i, v in p56.args do
			local name = v.name
			local var60 = p55[tostring(name)]
			
			if var60 ~= nil then
				local var61 = astFromValue(var60, v.type)
				
				if boolean.toJSBoolean(var61) then
					table.insert(t, {
						kind = kind.ARGUMENT,
						name = { kind = kind.NAME, value = name },
						value = var61
					})
				end
			end
		end
	end
	return {
		kind = kind.DIRECTIVE,
		name = { kind = kind.NAME, value = p54 },
		arguments = t
	}
end

t.makeDirectiveNode = makeDirectiveNode

function t.makeDirectiveNodes(p57, p58) --[[ line: 975 ]]
	-- upvalues: array (ref), makeDirectiveNode (write)
	local var64, var65
	local t = {}
	
	for i in p58 do
		var64 = p58[tostring(i)]
		var65 = if typeof(p57) == "table" then p57:getDirective(i) else nil
		
		if not array.isArray(var64) or #var64 == 0 then
			table.insert(t, makeDirectiveNode(i, var64, var65))
			continue
		end
		for i_1, v in var64 do
			table.insert(t, makeDirectiveNode(i, v, var65))
		end
	end
	return t
end

return t