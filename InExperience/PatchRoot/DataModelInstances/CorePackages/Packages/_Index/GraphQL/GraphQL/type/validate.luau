local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local isNotNillish = require(parent.luaUtils.isNillish).isNotNillish
local inspect = require(script.Parent.Parent.jsutils.inspect).inspect
local graphQLError = require(script.Parent.Parent.error.GraphQLError).GraphQLError
local locatedError = require(script.Parent.Parent.error).locatedError
local _ = require(parent.language.ast)
local isValidNameError = require(parent.utilities.assertValidName).isValidNameError
local typeComparatorsModule = require(script.Parent.Parent.utilities.typeComparators)
local isEqualType = typeComparatorsModule.isEqualType
local isTypeSubTypeOf = typeComparatorsModule.isTypeSubTypeOf
local assertSchema = require(script.Parent.schema).assertSchema
local definitionModule = require(script.Parent.definition)
local isIntrospectionType = require(script.Parent.introspection).isIntrospectionType
local directivesModule = require(script.Parent.directives)
local isDirective = directivesModule.isDirective
local graphQLDeprecatedDirective = directivesModule.GraphQLDeprecatedDirective
local isObjectType = definitionModule.isObjectType
local isInterfaceType = definitionModule.isInterfaceType
local isUnionType = definitionModule.isUnionType
local isEnumType = definitionModule.isEnumType
local isInputObjectType = definitionModule.isInputObjectType
local isNamedType = definitionModule.isNamedType
local isNonNullType = definitionModule.isNonNullType
local isInputType = definitionModule.isInputType
local isOutputType = definitionModule.isOutputType
local isRequiredArgument = definitionModule.isRequiredArgument
local isRequiredInputField = definitionModule.isRequiredInputField
local t = nil
local validateRootTypes = nil
local validateDirectives = nil
local getOperationTypeNode = nil
local getAllSubNodes = nil
local getAllNodes = nil
local getAllImplementsInterfaceNodes = nil
local getDeprecatedDirectiveNode = nil
local getUnionMemberTypeNodes = nil
local validateEnumValues = nil
local validateName = nil
local validateFields = nil
local validateTypeImplementsAncestors = nil
local validateTypes = nil
local validateTypeImplementsInterface = nil
local validateInterfaces = nil

local var20 = function(p0)
	-- upvalues: assertSchema (ref), t (write), validateRootTypes (write), validateDirectives (write), validateTypes (write)
	assertSchema(p0)
	
	if p0.__validationErrors == nil then
		local var22 = t.new(p0)
		validateRootTypes(var22)
		validateDirectives(var22)
		validateTypes(var22)
		local errors = var22:getErrors()
		p0.__validationErrors = errors
		
		return errors
	end
	return p0.__validationErrors
end

local var21 = function(p1)
	-- upvalues: var20 (ref), error (ref), array (ref)
	local var24 = var20(p1)
	
	if #var24 ~= 0 then
		error(error.new(array.join(array.map(var24, function(p2)
			return p2.message
		end), "\n\n")))
	end
end

t = {}
t.__index = t

function t.new(p3)
	-- upvalues: t (write)
	local tbl = setmetatable({}, t)
	tbl._errors = {}
	tbl.schema = p3
	
	return tbl
end

function t:reportError(p4, p5)
	-- upvalues: array (ref), boolean (ref), graphQLError (ref)
	self:addError(graphQLError.new(p4, if array.isArray(p5) then array.filter(p5, boolean.toJSBoolean) else p5))
end

function t:addError(p6)
	table.insert(self._errors, p6)
end

function t:getErrors()
	return self._errors
end

validateRootTypes = function(p7)
	-- upvalues: isNotNillish (ref), isObjectType (ref), getOperationTypeNode (write), inspect (ref)
	local schema = p7.schema
	local queryType = schema:getQueryType()
	
	if not isNotNillish(queryType) then
		p7:reportError("Query root type must be provided.", schema.astNode)
	elseif not isObjectType(queryType) then
		local var27 = getOperationTypeNode(schema, "query")
		p7:reportError(("Query root type must be Object type, it cannot be %s."):format(inspect(queryType)), var27 or queryType.astNode)
	end
	local mutationType = schema:getMutationType()
	
	if isNotNillish(mutationType) and not isObjectType(mutationType) then
		local var29 = getOperationTypeNode(schema, "mutation")
		p7:reportError("Mutation root type must be Object type if provided, it cannot be " .. ("%s."):format(inspect(mutationType)), var29 or mutationType.astNode)
	end
	local subscriptionType = schema:getSubscriptionType()
	
	if isNotNillish(subscriptionType) and not isObjectType(subscriptionType) then
		local var31 = getOperationTypeNode(schema, "subscription")
		p7:reportError("Subscription root type must be Object type if provided, it cannot be " .. ("%s."):format(inspect(subscriptionType)), var31 or subscriptionType.astNode)
	end
end

getOperationTypeNode = function(p8, p9)
	-- upvalues: getAllSubNodes (write)
	for i, v in ipairs(getAllSubNodes(p8, function(p10)
		return p10.operationTypes
	end)) do
		if v.operation == p9 then
			return v.type
		end
	end
	return nil
end

validateDirectives = function(p11)
	-- upvalues: isDirective (ref), inspect (ref), validateName (write), isInputType (ref), isRequiredArgument (ref), isNotNillish (ref), getDeprecatedDirectiveNode (write)
	for i, v in ipairs(p11.schema:getDirectives()) do
		if isDirective(v) then
			validateName(p11, v)
			
			for i_1, v_1 in ipairs(v.args) do
				validateName(p11, v_1)
				
				if not isInputType(v_1.type) then
					p11:reportError(("The type of @%s(%s:) must be Input Type "):format(v.name, v_1.name) .. ("but got: %s."):format(inspect(v_1.type)), v_1.astNode)
				end
				if isRequiredArgument(v_1) and isNotNillish(v_1.deprecationReason) then
					p11:reportError(("Required argument @%s(%s:) cannot be deprecated."):format(v.name, v_1.name), {
						getDeprecatedDirectiveNode(v_1.astNode),
						if v_1.astNode ~= nil then nil else v_1.astNode.type
					})
				end
			end
		else
			p11:reportError(("Expected directive but got: %s."):format(inspect(v)), if v then v.astNode else nil)
		end
	end
end

validateName = function(p12, p13)
	-- upvalues: isValidNameError (ref), locatedError (ref)
	local name
	local _ = nil
	local astNode = nil
	
	if typeof(p13) == "table" then
		name = p13.name
		astNode = p13.astNode
	else
		name = tostring(p13)
	end
	local var32 = isValidNameError(name)
	
	if var32 then
		p12:addError(locatedError(var32, astNode))
	end
end

validateTypes = function(p14)
	-- upvalues: isNamedType (ref), inspect (ref), isIntrospectionType (ref), validateName (write), isObjectType (ref), validateFields (write), validateInterfaces (write), isInterfaceType (ref), isUnionType (ref), isEnumType (ref), validateEnumValues (write), isInputObjectType (ref)
	local var34
	local var33 = createInputObjectCircularRefsValidator(p14)
	
	for i, v in ipairs(p14.schema:getTypeMap():values()) do
		var34 = if typeof(v) == "table" then v.astNode else nil
		
		if not isNamedType(v) then
			p14:reportError(("Expected GraphQL named type but got: %s."):format(inspect(v)), var34)
			continue
		end
		if not isIntrospectionType(v) then
			validateName(p14, v)
		end
		if isObjectType(v) then
			validateFields(p14, v)
			validateInterfaces(p14, v)
		elseif isInterfaceType(v) then
			validateFields(p14, v)
			validateInterfaces(p14, v)
		elseif isUnionType(v) then
			validateUnionMembers(p14, v)
		elseif isEnumType(v) then
			validateEnumValues(p14, v)
		elseif isInputObjectType(v) then
			validateInputFields(p14, v)
			var33(v)
		end
	end
end

validateFields = function(p15, p16)
	-- upvalues: getAllNodes (write), validateName (write), isOutputType (ref), inspect (ref), isInputType (ref), isRequiredArgument (ref), isNotNillish (ref), getDeprecatedDirectiveNode (write)
	local var35 = p16:getFields():values()
	
	if #var35 == 0 then
		p15:reportError(("Type %s must define one or more fields."):format(p16.name), getAllNodes(p16))
	end
	for i, v in ipairs(var35) do
		validateName(p15, v)
		
		if not isOutputType(v.type) then
			p15:reportError(("The type of %s.%s must be Output Type "):format(p16.name, v.name) .. ("but got: %s."):format(inspect(v.type)), if v.astNode ~= nil then nil else v.astNode.type)
		end
		for i_1, v_1 in ipairs(v.args) do
			local name = v_1.name
			validateName(p15, v_1)
			
			if not isInputType(v_1.type) then
				p15:reportError(("The type of %s.%s(%s:) must be Input "):format(p16.name, v.name, name) .. ("Type but got: %s."):format(inspect(v_1.type)), if v_1.astNode ~= nil then nil else v_1.astNode.type)
			end
			if isRequiredArgument(v_1) and isNotNillish(v_1.deprecationReason) then
				p15:reportError(("Required argument %s.%s(%s:) cannot be deprecated."):format(p16.name, v.name, name), {
					getDeprecatedDirectiveNode(v_1.astNode),
					if v_1.astNode ~= nil then nil else v_1.astNode.type
				})
			end
		end
	end
end

validateInterfaces = function(p17, p18)
	-- upvalues: isInterfaceType (ref), inspect (ref), getAllImplementsInterfaceNodes (write), validateTypeImplementsAncestors (write), validateTypeImplementsInterface (write)
	local t = {}
	
	for i, v in ipairs(p18:getInterfaces()) do
		if not isInterfaceType(v) then
			p17:reportError(("Type %s must only implement Interface types, "):format(inspect(p18)) .. ("it cannot implement %s."):format(inspect(v)), getAllImplementsInterfaceNodes(p18, v))
		elseif p18 == v then
			p17:reportError(("Type %s cannot implement itself because it would create a circular reference."):format(p18.name), getAllImplementsInterfaceNodes(p18, v))
		else
			local var37 = if typeof(nil) == "table" then tostring(v.name) else tostring(v)
			
			if t[var37] then
				p17:reportError(("Type %s can only implement %s once."):format(p18.name, v.name), getAllImplementsInterfaceNodes(p18, v))
			else
				t[var37] = true
				validateTypeImplementsAncestors(p17, p18, v)
				validateTypeImplementsInterface(p17, p18, v)
			end
		end
	end
end

validateTypeImplementsInterface = function(p19, p20, p21)
	-- upvalues: array (ref), getAllNodes (write), isTypeSubTypeOf (ref), inspect (ref), isEqualType (ref), isRequiredArgument (ref)
	local name
	local fields = p20:getFields()
	
	for i, v in ipairs(p21:getFields():values()) do
		name = v.name
		local var39 = fields:get(name)
		
		if not var39 then
			p19:reportError(("Interface field %s.%s expected but %s does not provide it."):format(p21.name, name, p20.name), array.concat({ v.astNode }, getAllNodes(p20)))
			continue
		end
		if not isTypeSubTypeOf(p19.schema, var39.type, v.type) then
			p19:reportError(("Interface field %s.%s expects type "):format(p21.name, name) .. ("%s but %s.%s "):format(inspect(v.type), p20.name, name) .. ("is type %s."):format(inspect(var39.type)), {
				if v.astNode ~= nil then nil else v.astNode.type,
				if var39.astNode ~= nil then nil else var39.astNode.type
			})
		end
		for i_1, v_1 in ipairs(v.args) do
			local name_1 = v_1.name
			local var40 = array.find(var39.args, function(p22)
				-- upvalues: name_1 (ref)
				return p22.name == name_1
			end)
			
			if not var40 then
				p19:reportError(("Interface field argument %s.%s(%s:) expected but %s.%s does not provide it."):format(p21.name, name, name_1, p20.name, name), { v_1.astNode, var39.astNode })
			elseif not isEqualType(v_1.type, var40.type) then
				p19:reportError(("Interface field argument %s.%s(%s:) "):format(p21.name, name, name_1) .. ("expects type %s but "):format(inspect(v_1.type)) .. ("%s.%s(%s:) is type "):format(p20.name, name, name_1) .. ("%s."):format(inspect(var40.type)), {
					if v_1.astNode ~= nil then nil else v_1.astNode.type,
					if var40.astNode ~= nil then nil else var40.astNode.type
				})
			end
		end
		for i_1, v_1 in ipairs(var39.args) do
			local name_1 = v_1.name
			
			if not array.find(v.args, function(p23)
				-- upvalues: name_1 (ref)
				return p23.name == name_1
			end) and isRequiredArgument(v_1) then
				p19:reportError(("Object field %s.%s includes required argument %s that is missing from the Interface field %s.%s."):format(p20.name, name, name_1, p21.name, name), { v_1.astNode, v.astNode })
			end
		end
	end
end

validateTypeImplementsAncestors = function(p24, p25, p26)
	-- upvalues: array (ref), getAllImplementsInterfaceNodes (write)
	local interfaces = p25:getInterfaces()
	
	for i, v in ipairs(p26:getInterfaces()) do
		if array.indexOf(interfaces, v) == -1 then
			p24:reportError(if v == p25 then ("Type %s cannot implement %s because it would create a circular reference."):format(p25.name, p26.name) else ("Type %s must implement %s because it is implemented by %s."):format(p25.name, v.name, p26.name), array.concat(getAllImplementsInterfaceNodes(p26, v), getAllImplementsInterfaceNodes(p25, p26)))
		end
	end
end

function validateUnionMembers(p27, p28)
	-- upvalues: getAllNodes (write), getUnionMemberTypeNodes (write), isObjectType (ref), inspect (ref)
	local types = p28:getTypes()
	
	if #types == 0 then
		p27:reportError(("Union type %s must define one or more member types."):format(p28.name), getAllNodes(p28))
	end
	local t = {}
	
	for i, v in ipairs(types) do
		if t[tostring(v.name)] then
			p27:reportError(("Union type %s can only include type %s once."):format(p28.name, v.name), getUnionMemberTypeNodes(p28, v.name))
		else
			t[tostring(v.name)] = true
			
			if not isObjectType(v) then
				p27:reportError(("Union type %s can only include Object types, "):format(p28.name) .. ("it cannot include %s."):format(inspect(v)), getUnionMemberTypeNodes(p28, tostring(v)))
			end
		end
	end
end

validateEnumValues = function(p29, p30)
	-- upvalues: getAllNodes (write), validateName (write)
	local values = p30:getValues()
	
	if #values == 0 then
		p29:reportError(("Enum type %s must define one or more values."):format(p30.name), getAllNodes(p30))
	end
	for i, v in ipairs(values) do
		local name = v.name
		validateName(p29, v)
		
		if name == "true" or name == "false" or name == "null" then
			p29:reportError(("Enum type %s cannot include value: %s."):format(p30.name, name), v.astNode)
		end
	end
end

function validateInputFields(p31, p32)
	-- upvalues: getAllNodes (write), validateName (write), isInputType (ref), inspect (ref), isRequiredInputField (ref), isNotNillish (ref), getDeprecatedDirectiveNode (write)
	local var45 = p32:getFields():values()
	
	if #var45 == 0 then
		p31:reportError(("Input Object type %s must define one or more fields."):format(p32.name), getAllNodes(p32))
	end
	for i, v in ipairs(var45) do
		validateName(p31, v)
		
		if not isInputType(v.type) then
			p31:reportError(("The type of %s.%s must be Input Type "):format(p32.name, v.name) .. ("but got: %s."):format(inspect(v.type)), if v.astNode ~= nil then nil else v.astNode.type)
		end
		if isRequiredInputField(v) and isNotNillish(v.deprecationReason) then
			p31:reportError(("Required input field %s.%s cannot be deprecated."):format(p32.name, v.name), {
				getDeprecatedDirectiveNode(v.astNode),
				if v.astNode ~= nil then nil else v.astNode.type
			})
		end
	end
end

function createInputObjectCircularRefsValidator(p33)
	-- upvalues: isNonNullType (ref), isInputObjectType (ref), array (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	local function detectCycleRecursive(p34)
		-- upvalues: t (ref), t_2 (ref), t_1 (ref), isNonNullType (copy), isInputObjectType (copy), detectCycleRecursive (ref), array (copy), p33 (ref)
		if t[tostring(p34.name)] then return end
		t[tostring(p34.name)] = true
		t_2[tostring(p34.name)] = #t_1 + 1
		
		for i, v in ipairs(p34:getFields():values()) do
			if isNonNullType(v.type) and isInputObjectType(v.type.ofType) then
				local ofType = v.type.ofType
				local name = t_2[tostring(ofType.name)]
				table.insert(t_1, v)
				
				if name == nil then
					detectCycleRecursive(ofType)
				else
					local _ = nil
					local var50 = array.slice(t_1, name)
					p33:reportError(("Cannot reference Input Object \"%s\" within itself through a series of non-null fields: \"%s\"."):format(ofType.name, array.join(array.map(var50, function(p35)
						return p35.name
					end), ".")), array.map(var50, function(p36)
						return p36.astNode
					end))
				end
				table.remove(t_1)
			end
		end
		t_2[tostring(p34.name)] = nil
	end
	
	return detectCycleRecursive
end

getAllNodes = function(p37)
	-- upvalues: array (ref)
	local astNode = p37.astNode
	local extensionASTNodes = p37.extensionASTNodes
	
	return if astNode then if extensionASTNodes then array.concat({ astNode }, extensionASTNodes) else { astNode } else extensionASTNodes or {}
end

getAllSubNodes = function(p38, p39)
	-- upvalues: getAllNodes (write), array (ref)
	local t = {}
	
	for i, v in ipairs(getAllNodes(p38)) do
		local var52 = p39(v)
		t = array.concat(t, var52 or {})
	end
	return t
end

getAllImplementsInterfaceNodes = function(p40, p41)
	-- upvalues: array (ref), getAllSubNodes (write)
	return array.filter(getAllSubNodes(p40, function(p42)
		return p42.interfaces
	end), function(p43)
		-- upvalues: p41 (ref)
		return p43.name.value == p41.name
	end)
end

getUnionMemberTypeNodes = function(p44, p45)
	-- upvalues: array (ref), getAllSubNodes (write)
	return array.filter(getAllSubNodes(p44, function(p46)
		return p46.types
	end), function(p47)
		-- upvalues: p45 (ref)
		return p47.name.value == p45
	end)
end

getDeprecatedDirectiveNode = function(p48)
	-- upvalues: array (ref), graphQLDeprecatedDirective (ref)
	if p48 == nil or p48.directives == nil then
		return
	end
	return array.find(p48.directives, function(p49)
		-- upvalues: graphQLDeprecatedDirective (copy)
		return p49.name.value == graphQLDeprecatedDirective.name
	end)
end

return { validateSchema = var20, assertValidSchema = var21 }