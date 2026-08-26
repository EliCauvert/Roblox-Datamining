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

local var1 = function(p1)
	-- upvalues: assertSchema (ref), t (write), validateRootTypes (write), validateDirectives (write), validateTypes (write)
	assertSchema(p1)
	
	if p1.__validationErrors == nil then
		local var2 = t.new(p1)
		validateRootTypes(var2)
		validateDirectives(var2)
		validateTypes(var2)
		local errors = var2:getErrors()
		p1.__validationErrors = errors
		
		return errors
	end
	return p1.__validationErrors
end

local var2 = function(p1)
	-- upvalues: var1 (ref), error (ref), array (ref)
	local var3 = var1(p1)
	
	if #var3 ~= 0 then
		error(error.new(array.join(array.map(var3, function(p2)
			return p2.message
		end), "\n\n")))
	end
end

t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (write)
	local tbl = setmetatable({}, t)
	tbl._errors = {}
	tbl.schema = p1
	
	return tbl
end

function t:reportError(p1, p2)
	-- upvalues: array (ref), boolean (ref), graphQLError (ref)
	self:addError(graphQLError.new(p1, if array.isArray(p2) then array.filter(p2, boolean.toJSBoolean) else p2))
end

function t:addError(p1)
	table.insert(self._errors, p1)
end

function t:getErrors()
	return self._errors
end

validateRootTypes = function(p1)
	-- upvalues: isNotNillish (ref), isObjectType (ref), getOperationTypeNode (write), inspect (ref)
	local schema = p1.schema
	local queryType = schema:getQueryType()
	
	if not isNotNillish(queryType) then
		p1:reportError("Query root type must be provided.", schema.astNode)
	elseif not isObjectType(queryType) then
		local var3 = getOperationTypeNode(schema, "query")
		p1:reportError(("Query root type must be Object type, it cannot be %s."):format(inspect(queryType)), var3 or queryType.astNode)
	end
	local mutationType = schema:getMutationType()
	
	if isNotNillish(mutationType) and not isObjectType(mutationType) then
		local var4 = getOperationTypeNode(schema, "mutation")
		p1:reportError("Mutation root type must be Object type if provided, it cannot be " .. ("%s."):format(inspect(mutationType)), var4 or mutationType.astNode)
	end
	local subscriptionType = schema:getSubscriptionType()
	
	if isNotNillish(subscriptionType) and not isObjectType(subscriptionType) then
		local var5 = getOperationTypeNode(schema, "subscription")
		p1:reportError("Subscription root type must be Object type if provided, it cannot be " .. ("%s."):format(inspect(subscriptionType)), var5 or subscriptionType.astNode)
	end
end

getOperationTypeNode = function(p1, p2)
	-- upvalues: getAllSubNodes (write)
	for i, v in ipairs(getAllSubNodes(p1, function(p3)
		return p3.operationTypes
	end)) do
		if v.operation == p2 then
			return v.type
		end
	end
	return nil
end

validateDirectives = function(p3)
	-- upvalues: isDirective (ref), inspect (ref), validateName (write), isInputType (ref), isRequiredArgument (ref), isNotNillish (ref), getDeprecatedDirectiveNode (write)
	for i, v in ipairs(p3.schema:getDirectives()) do
		if isDirective(v) then
			validateName(p3, v)
			
			for i_1, v_1 in ipairs(v.args) do
				validateName(p3, v_1)
				
				if not isInputType(v_1.type) then
					p3:reportError(("The type of @%s(%s:) must be Input Type "):format(v.name, v_1.name) .. ("but got: %s."):format(inspect(v_1.type)), v_1.astNode)
				end
				if isRequiredArgument(v_1) and isNotNillish(v_1.deprecationReason) then
					p3:reportError(("Required argument @%s(%s:) cannot be deprecated."):format(v.name, v_1.name), {
						getDeprecatedDirectiveNode(v_1.astNode),
						if v_1.astNode ~= nil then nil else v_1.astNode.type
					})
				end
			end
		else
			p3:reportError(("Expected directive but got: %s."):format(inspect(v)), if v then v.astNode else nil)
		end
	end
end

validateName = function(p4, p5)
	-- upvalues: isValidNameError (ref), locatedError (ref)
	local name
	local _ = nil
	local astNode = nil
	
	if typeof(p5) == "table" then
		name = p5.name
		astNode = p5.astNode
	else
		name = tostring(p5)
	end
	local var3 = isValidNameError(name)
	
	if var3 then
		p4:addError(locatedError(var3, astNode))
	end
end

validateTypes = function(p4)
	-- upvalues: isNamedType (ref), inspect (ref), isIntrospectionType (ref), validateName (write), isObjectType (ref), validateFields (write), validateInterfaces (write), isInterfaceType (ref), isUnionType (ref), isEnumType (ref), validateEnumValues (write), isInputObjectType (ref)
	local var3
	local var4 = createInputObjectCircularRefsValidator(p4)
	
	for i, v in ipairs(p4.schema:getTypeMap():values()) do
		var3 = if typeof(v) == "table" then v.astNode else nil
		
		if not isNamedType(v) then
			p4:reportError(("Expected GraphQL named type but got: %s."):format(inspect(v)), var3)
			continue
		end
		if not isIntrospectionType(v) then
			validateName(p4, v)
		end
		if isObjectType(v) then
			validateFields(p4, v)
			validateInterfaces(p4, v)
		elseif isInterfaceType(v) then
			validateFields(p4, v)
			validateInterfaces(p4, v)
		elseif isUnionType(v) then
			validateUnionMembers(p4, v)
		elseif isEnumType(v) then
			validateEnumValues(p4, v)
		elseif isInputObjectType(v) then
			validateInputFields(p4, v)
			var4(v)
		end
	end
end

validateFields = function(p5, p6)
	-- upvalues: getAllNodes (write), validateName (write), isOutputType (ref), inspect (ref), isInputType (ref), isRequiredArgument (ref), isNotNillish (ref), getDeprecatedDirectiveNode (write)
	local var5 = p6:getFields():values()
	
	if #var5 == 0 then
		p5:reportError(("Type %s must define one or more fields."):format(p6.name), getAllNodes(p6))
	end
	for i, v in ipairs(var5) do
		validateName(p5, v)
		
		if not isOutputType(v.type) then
			p5:reportError(("The type of %s.%s must be Output Type "):format(p6.name, v.name) .. ("but got: %s."):format(inspect(v.type)), if v.astNode ~= nil then nil else v.astNode.type)
		end
		for i_1, v_1 in ipairs(v.args) do
			local name = v_1.name
			validateName(p5, v_1)
			
			if not isInputType(v_1.type) then
				p5:reportError(("The type of %s.%s(%s:) must be Input "):format(p6.name, v.name, name) .. ("Type but got: %s."):format(inspect(v_1.type)), if v_1.astNode ~= nil then nil else v_1.astNode.type)
			end
			if isRequiredArgument(v_1) and isNotNillish(v_1.deprecationReason) then
				p5:reportError(("Required argument %s.%s(%s:) cannot be deprecated."):format(p6.name, v.name, name), {
					getDeprecatedDirectiveNode(v_1.astNode),
					if v_1.astNode ~= nil then nil else v_1.astNode.type
				})
			end
		end
	end
end

validateInterfaces = function(p7, p8)
	-- upvalues: isInterfaceType (ref), inspect (ref), getAllImplementsInterfaceNodes (write), validateTypeImplementsAncestors (write), validateTypeImplementsInterface (write)
	local t = {}
	
	for i, v in ipairs(p8:getInterfaces()) do
		if not isInterfaceType(v) then
			p7:reportError(("Type %s must only implement Interface types, "):format(inspect(p8)) .. ("it cannot implement %s."):format(inspect(v)), getAllImplementsInterfaceNodes(p8, v))
		elseif p8 == v then
			p7:reportError(("Type %s cannot implement itself because it would create a circular reference."):format(p8.name), getAllImplementsInterfaceNodes(p8, v))
		else
			local var6 = if typeof(nil) == "table" then tostring(v.name) else tostring(v)
			
			if t[var6] then
				p7:reportError(("Type %s can only implement %s once."):format(p8.name, v.name), getAllImplementsInterfaceNodes(p8, v))
			else
				t[var6] = true
				validateTypeImplementsAncestors(p7, p8, v)
				validateTypeImplementsInterface(p7, p8, v)
			end
		end
	end
end

validateTypeImplementsInterface = function(p9, p10, p11)
	-- upvalues: array (ref), getAllNodes (write), isTypeSubTypeOf (ref), inspect (ref), isEqualType (ref), isRequiredArgument (ref)
	local name
	local fields = p10:getFields()
	
	for i, v in ipairs(p11:getFields():values()) do
		name = v.name
		local var7 = fields:get(name)
		
		if not var7 then
			p9:reportError(("Interface field %s.%s expected but %s does not provide it."):format(p11.name, name, p10.name), array.concat({ v.astNode }, getAllNodes(p10)))
			continue
		end
		if not isTypeSubTypeOf(p9.schema, var7.type, v.type) then
			p9:reportError(("Interface field %s.%s expects type "):format(p11.name, name) .. ("%s but %s.%s "):format(inspect(v.type), p10.name, name) .. ("is type %s."):format(inspect(var7.type)), {
				if v.astNode ~= nil then nil else v.astNode.type,
				if var7.astNode ~= nil then nil else var7.astNode.type
			})
		end
		for i_1, v_1 in ipairs(v.args) do
			local name_1 = v_1.name
			local var8 = array.find(var7.args, function(p12)
				-- upvalues: name_1 (ref)
				return p12.name == name_1
			end)
			
			if not var8 then
				p9:reportError(("Interface field argument %s.%s(%s:) expected but %s.%s does not provide it."):format(p11.name, name, name_1, p10.name, name), { v_1.astNode, var7.astNode })
			elseif not isEqualType(v_1.type, var8.type) then
				p9:reportError(("Interface field argument %s.%s(%s:) "):format(p11.name, name, name_1) .. ("expects type %s but "):format(inspect(v_1.type)) .. ("%s.%s(%s:) is type "):format(p10.name, name, name_1) .. ("%s."):format(inspect(var8.type)), {
					if v_1.astNode ~= nil then nil else v_1.astNode.type,
					if var8.astNode ~= nil then nil else var8.astNode.type
				})
			end
		end
		for i_1, v_1 in ipairs(var7.args) do
			local name_1 = v_1.name
			
			if not array.find(v.args, function(p12)
				-- upvalues: name_1 (ref)
				return p12.name == name_1
			end) and isRequiredArgument(v_1) then
				p9:reportError(("Object field %s.%s includes required argument %s that is missing from the Interface field %s.%s."):format(p10.name, name, name_1, p11.name, name), { v_1.astNode, v.astNode })
			end
		end
	end
end

validateTypeImplementsAncestors = function(p12, p13, p14)
	-- upvalues: array (ref), getAllImplementsInterfaceNodes (write)
	local interfaces = p13:getInterfaces()
	
	for i, v in ipairs(p14:getInterfaces()) do
		if array.indexOf(interfaces, v) == -1 then
			p12:reportError(if v == p13 then ("Type %s cannot implement %s because it would create a circular reference."):format(p13.name, p14.name) else ("Type %s must implement %s because it is implemented by %s."):format(p13.name, v.name, p14.name), array.concat(getAllImplementsInterfaceNodes(p14, v), getAllImplementsInterfaceNodes(p13, p14)))
		end
	end
end

function validateUnionMembers(p15, p16)
	-- upvalues: getAllNodes (write), getUnionMemberTypeNodes (write), isObjectType (ref), inspect (ref)
	local types = p16:getTypes()
	
	if #types == 0 then
		p15:reportError(("Union type %s must define one or more member types."):format(p16.name), getAllNodes(p16))
	end
	local t = {}
	
	for i, v in ipairs(types) do
		if t[tostring(v.name)] then
			p15:reportError(("Union type %s can only include type %s once."):format(p16.name, v.name), getUnionMemberTypeNodes(p16, v.name))
		else
			t[tostring(v.name)] = true
			
			if not isObjectType(v) then
				p15:reportError(("Union type %s can only include Object types, "):format(p16.name) .. ("it cannot include %s."):format(inspect(v)), getUnionMemberTypeNodes(p16, tostring(v)))
			end
		end
	end
end

validateEnumValues = function(p17, p18)
	-- upvalues: getAllNodes (write), validateName (write)
	local values = p18:getValues()
	
	if #values == 0 then
		p17:reportError(("Enum type %s must define one or more values."):format(p18.name), getAllNodes(p18))
	end
	for i, v in ipairs(values) do
		local name = v.name
		validateName(p17, v)
		
		if name == "true" or name == "false" or name == "null" then
			p17:reportError(("Enum type %s cannot include value: %s."):format(p18.name, name), v.astNode)
		end
	end
end

function validateInputFields(p19, p20)
	-- upvalues: getAllNodes (write), validateName (write), isInputType (ref), inspect (ref), isRequiredInputField (ref), isNotNillish (ref), getDeprecatedDirectiveNode (write)
	local var9 = p20:getFields():values()
	
	if #var9 == 0 then
		p19:reportError(("Input Object type %s must define one or more fields."):format(p20.name), getAllNodes(p20))
	end
	for i, v in ipairs(var9) do
		validateName(p19, v)
		
		if not isInputType(v.type) then
			p19:reportError(("The type of %s.%s must be Input Type "):format(p20.name, v.name) .. ("but got: %s."):format(inspect(v.type)), if v.astNode ~= nil then nil else v.astNode.type)
		end
		if isRequiredInputField(v) and isNotNillish(v.deprecationReason) then
			p19:reportError(("Required input field %s.%s cannot be deprecated."):format(p20.name, v.name), {
				getDeprecatedDirectiveNode(v.astNode),
				if v.astNode ~= nil then nil else v.astNode.type
			})
		end
	end
end

function createInputObjectCircularRefsValidator(p21)
	-- upvalues: isNonNullType (ref), isInputObjectType (ref), array (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	local function detectCycleRecursive(p22)
		-- upvalues: t (ref), t_2 (ref), t_1 (ref), isNonNullType (copy), isInputObjectType (copy), detectCycleRecursive (ref), array (copy), p21 (ref)
		if t[tostring(p22.name)] then return end
		t[tostring(p22.name)] = true
		t_2[tostring(p22.name)] = #t_1 + 1
		
		for i, v in ipairs(p22:getFields():values()) do
			if isNonNullType(v.type) and isInputObjectType(v.type.ofType) then
				local ofType = v.type.ofType
				local name = t_2[tostring(ofType.name)]
				table.insert(t_1, v)
				
				if name == nil then
					detectCycleRecursive(ofType)
				else
					local _ = nil
					local var10 = array.slice(t_1, name)
					p21:reportError(("Cannot reference Input Object \"%s\" within itself through a series of non-null fields: \"%s\"."):format(ofType.name, array.join(array.map(var10, function(p23)
						return p23.name
					end), ".")), array.map(var10, function(p23)
						return p23.astNode
					end))
				end
				table.remove(t_1)
			end
		end
		t_2[tostring(p22.name)] = nil
	end
	
	return detectCycleRecursive
end

getAllNodes = function(p22)
	-- upvalues: array (ref)
	local astNode = p22.astNode
	local extensionASTNodes = p22.extensionASTNodes
	
	return if astNode then if extensionASTNodes then array.concat({ astNode }, extensionASTNodes) else { astNode } else extensionASTNodes or {}
end

getAllSubNodes = function(p22, p23)
	-- upvalues: getAllNodes (write), array (ref)
	local t = {}
	
	for i, v in ipairs(getAllNodes(p22)) do
		local var10 = p23(v)
		t = array.concat(t, var10 or {})
	end
	return t
end

getAllImplementsInterfaceNodes = function(p24, p25)
	-- upvalues: array (ref), getAllSubNodes (write)
	return array.filter(getAllSubNodes(p24, function(p26)
		return p26.interfaces
	end), function(p26)
		-- upvalues: p25 (ref)
		return p26.name.value == p25.name
	end)
end

getUnionMemberTypeNodes = function(p24, p25)
	-- upvalues: array (ref), getAllSubNodes (write)
	return array.filter(getAllSubNodes(p24, function(p26)
		return p26.types
	end), function(p26)
		-- upvalues: p25 (ref)
		return p26.name.value == p25
	end)
end

getDeprecatedDirectiveNode = function(p24)
	-- upvalues: array (ref), graphQLDeprecatedDirective (ref)
	if p24 == nil or p24.directives == nil then
		return
	end
	return array.find(p24.directives, function(p25)
		-- upvalues: graphQLDeprecatedDirective (copy)
		return p25.name.value == graphQLDeprecatedDirective.name
	end)
end

return { validateSchema = var1, assertValidSchema = var2 }