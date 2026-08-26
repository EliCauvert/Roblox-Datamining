local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local error = luauPolyfillModule.Error
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local coerceToMap = luauPolyfillModule.coerceToMap
local nullModule = require(parent.luaUtils.null)
local var1 = object.freeze({})
local isNillish = require(parent.luaUtils.isNillish).isNillish
local jsutils = parent.jsutils
local _ = require(jsutils.ObjMap)
local inspect = require(jsutils.inspect).inspect
local keyMap = require(jsutils.keyMap).keyMap
local toObjMap = require(jsutils.toObjMap).toObjMap
local keyValMap = require(jsutils.keyValMap).keyValMap
local devAssert = require(jsutils.devAssert).devAssert
local instanceOfModule = require(jsutils.instanceOf)
local didYouMean = require(jsutils.didYouMean).didYouMean
local isObjectLike = require(jsutils.isObjectLike).isObjectLike
local identityFunc = require(jsutils.identityFunc).identityFunc
local suggestionList = require(jsutils.suggestionList).suggestionList
local _ = require(jsutils.PromiseOrValue)
local _ = require(jsutils.Path)
local mapValueOrdered = require(parent.luaUtils.mapValueOrdered).mapValueOrdered
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local language = parent.language
local kind = require(language.kinds).Kind
local print = require(language.printer).print
local _ = require(parent.language.ast)
local valueFromASTUntyped = require(parent.utilities.valueFromASTUntyped).valueFromASTUntyped
local _ = nil
local _ = nil
local isScalarType = nil
local _ = nil
local isObjectType = nil
local _ = nil
local isInterfaceType = nil
local _ = nil
local isUnionType = nil
local _ = nil
local isEnumType = nil
local _ = nil
local isInputObjectType = nil
local _ = nil
local isListType = nil
local _ = nil
local isNonNullType = nil
local _ = nil
local _ = nil
local _ = nil
local _ = nil
local _ = nil
local _ = nil
local _ = nil
local _ = nil
local _ = nil
local _ = nil
local _ = nil
local isWrappingType = nil
local _ = nil
local isNullableType = nil
local _ = nil
local _ = nil
local _ = nil
local _ = nil
local _ = nil
local argsToArgsConfig = nil
local _ = nil
local _ = nil
local defineInputFieldMap = nil
local defineTypes = nil
local isPlainObj = nil
local didYouMeanEnumValue = nil
local defineEnumValues = nil
local fieldsToFieldsConfig = nil
local defineInterfaces = nil
local defineFieldMap = nil
local t = nil
local t_1 = nil
local t_2 = {}
local t_3 = {}
local t_4 = {}
local t_5 = {}
local t_6 = {}
local t_7 = {}

local function isType(p1)
	-- upvalues: isScalarType (write), isObjectType (write), isInterfaceType (write), isUnionType (write), isEnumType (write), isInputObjectType (write), isListType (write), isNonNullType (write)
	return isScalarType(p1) or (isObjectType(p1) or (isInterfaceType(p1) or (isUnionType(p1) or (isEnumType(p1) or (isInputObjectType(p1) or (isListType(p1) or isNonNullType(p1)))))))
end

local function assertType(p1)
	-- upvalues: isType (write), error (ref), inspect (ref)
	if not isType(p1) then
		error(error.new(("Expected %s to be a GraphQL type."):format(inspect(p1))))
	end
	return p1
end

isScalarType = function(p1)
	-- upvalues: instanceOfModule (ref), t_2 (ref)
	return instanceOfModule(p1, t_2)
end

local function assertScalarType(p1)
	-- upvalues: isScalarType (write), error (ref), inspect (ref)
	if not isScalarType(p1) then
		error(error.new(("Expected %s to be a GraphQL Scalar type."):format(inspect(p1))))
	end
	return p1
end

isObjectType = function(p1)
	-- upvalues: instanceOfModule (ref), t_3 (ref)
	return instanceOfModule(p1, t_3)
end

local function assertObjectType(p1)
	-- upvalues: isObjectType (write), error (ref), inspect (ref)
	if not isObjectType(p1) then
		error(error.new(("Expected %s to be a GraphQL Object type."):format(inspect(p1))))
	end
	return p1
end

isInterfaceType = function(p1)
	-- upvalues: instanceOfModule (ref), t_4 (ref)
	return instanceOfModule(p1, t_4)
end

local function assertInterfaceType(p1)
	-- upvalues: isInterfaceType (write), error (ref), inspect (ref)
	if not isInterfaceType(p1) then
		error(error.new(("Expected %s to be a GraphQL Interface type."):format(inspect(p1))))
	end
	return p1
end

isUnionType = function(p1)
	-- upvalues: instanceOfModule (ref), t_5 (ref)
	return instanceOfModule(p1, t_5)
end

local function assertUnionType(p1)
	-- upvalues: isUnionType (write), error (ref), inspect (ref)
	if not isUnionType(p1) then
		error(error.new(("Expected %s to be a GraphQL Union type."):format(inspect(p1))))
	end
	return p1
end

isEnumType = function(p1)
	-- upvalues: instanceOfModule (ref), t_6 (ref)
	return instanceOfModule(p1, t_6)
end

local function assertEnumType(p1)
	-- upvalues: isEnumType (write), error (ref), inspect (ref)
	if not isEnumType(p1) then
		error(error.new(("Expected %s to be a GraphQL Enum type."):format(inspect(p1))))
	end
	return p1
end

isInputObjectType = function(p1)
	-- upvalues: instanceOfModule (ref), t_7 (ref)
	return instanceOfModule(p1, t_7)
end

local function assertInputObjectType(p1)
	-- upvalues: isInputObjectType (write), error (ref), inspect (ref)
	if not isInputObjectType(p1) then
		error(error.new(("Expected %s to be a GraphQL Input Object type."):format(inspect(p1))))
	end
	return p1
end

isListType = function(p1)
	-- upvalues: instanceOfModule (ref), t (write)
	return instanceOfModule(p1, t)
end

local function assertListType(p1)
	-- upvalues: isListType (write), error (ref), inspect (ref)
	if not isListType(p1) then
		error(error.new(("Expected %s to be a GraphQL List type."):format(inspect(p1))))
	end
	return p1
end

isNonNullType = function(p1)
	-- upvalues: instanceOfModule (ref), t_1 (write)
	return instanceOfModule(p1, t_1)
end

local function assertNonNullType(p1)
	-- upvalues: isNonNullType (write), error (ref), inspect (ref)
	if not isNonNullType(p1) then
		error(error.new(("Expected %s to be a GraphQL Non-Null type."):format(inspect(p1))))
	end
	return p1
end

local function isInputType(p1)
	-- upvalues: isScalarType (write), isEnumType (write), isInputObjectType (write), isWrappingType (write), isInputType (write)
	return isScalarType(p1) or (isEnumType(p1) or (isInputObjectType(p1) or isWrappingType(p1) and isInputType(p1.ofType)))
end

local function assertInputType(p1)
	-- upvalues: isInputType (write), error (ref), inspect (ref)
	if not isInputType(p1) then
		error(error.new(("Expected %s to be a GraphQL input type."):format(inspect(p1))))
	end
	return p1
end

local function isOutputType(p1)
	-- upvalues: isScalarType (write), isObjectType (write), isInterfaceType (write), isUnionType (write), isEnumType (write), isWrappingType (write), isOutputType (write)
	return isScalarType(p1) or (isObjectType(p1) or (isInterfaceType(p1) or (isUnionType(p1) or (isEnumType(p1) or isWrappingType(p1) and isOutputType(p1.ofType)))))
end

local function assertOutputType(p1)
	-- upvalues: isOutputType (write), error (ref), inspect (ref)
	if not isOutputType(p1) then
		error(error.new(("Expected %s to be a GraphQL output type."):format(inspect(p1))))
	end
	return p1
end

local function isLeafType(p1)
	-- upvalues: isScalarType (write), isEnumType (write)
	return isScalarType(p1) or isEnumType(p1)
end

local function assertLeafType(p1)
	-- upvalues: isLeafType (write), error (ref), inspect (ref)
	if not isLeafType(p1) then
		error(error.new(("Expected %s to be a GraphQL leaf type."):format(inspect(p1))))
	end
	return p1
end

local function isCompositeType(p1)
	-- upvalues: isObjectType (write), isInterfaceType (write), isUnionType (write)
	return isObjectType(p1) or (isInterfaceType(p1) or isUnionType(p1))
end

local function assertCompositeType(p1)
	-- upvalues: isCompositeType (write), error (ref), inspect (ref)
	if not isCompositeType(p1) then
		error(error.new(("Expected %s to be a GraphQL composite type."):format(inspect(p1))))
	end
	return p1
end

local function isAbstractType(value)
	-- upvalues: isInterfaceType (write), isUnionType (write)
	return isInterfaceType(value) or isUnionType(value)
end

local function assertAbstractType(value)
	-- upvalues: isAbstractType (write), error (ref), inspect (ref)
	if not isAbstractType(value) then
		error(error.new(("Expected %s to be a GraphQL abstract type."):format(inspect(value))))
	end
	return value
end

t = {}
t.__index = t

function t.new(p1)
	-- upvalues: devAssert (ref), isType (write), inspect (ref), t (write)
	local t_1 = {}
	devAssert(isType(p1), ("Expected %s to be a GraphQL type."):format(inspect(p1)))
	t_1.ofType = p1
	
	return setmetatable(t_1, t)
end

function t:__tostring()
	return self:toString()
end

function t:toString()
	return "[" .. tostring(self.ofType) .. "]"
end

function t:toJSON()
	return self:toString()
end

t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: devAssert (ref), isNullableType (write), inspect (ref), t_1 (write)
	local t = {}
	devAssert(isNullableType(p1), ("Expected %s to be a GraphQL nullable type."):format(inspect(p1)))
	t.ofType = p1
	
	return setmetatable(t, t_1)
end

function t_1:__tostring()
	return self:toString()
end

function t_1:toString()
	return tostring(self.ofType) .. "!"
end

function t_1:toJSON()
	return self:toString()
end

isWrappingType = function(p1)
	-- upvalues: isListType (write), isNonNullType (write)
	return isListType(p1) or isNonNullType(p1)
end

local function assertWrappingType(p1)
	-- upvalues: isWrappingType (write), error (ref), inspect (ref)
	if not isWrappingType(p1) then
		error(error.new(("Expected %s to be a GraphQL wrapping type."):format(inspect(p1))))
	end
	return p1
end

isNullableType = function(p1)
	-- upvalues: isType (write), isNonNullType (write)
	return isType(p1) and not isNonNullType(p1)
end

local function assertNullableType(p1)
	-- upvalues: isNullableType (write), error (ref), inspect (ref)
	if not isNullableType(p1) then
		error(error.new(("Expected %s to be a GraphQL nullable type."):format(inspect(p1))))
	end
	return p1
end

local function getNullableType(p1)
	-- upvalues: isNonNullType (write)
	return if p1 then if isNonNullType(p1) then p1.ofType else p1 else nil
end

local function isNamedType(p1)
	-- upvalues: isScalarType (write), isObjectType (write), isInterfaceType (write), isUnionType (write), isEnumType (write), isInputObjectType (write)
	return isScalarType(p1) or (isObjectType(p1) or (isInterfaceType(p1) or (isUnionType(p1) or (isEnumType(p1) or isInputObjectType(p1)))))
end

local function assertNamedType(p1)
	-- upvalues: isNamedType (write), error (ref), inspect (ref)
	if not isNamedType(p1) then
		error(error.new(("Expected %s to be a GraphQL named type."):format(inspect(p1))))
	end
	return p1
end

local function getNamedType(p1)
	-- upvalues: isWrappingType (write)
	if not p1 then
		return nil
	end
	local var2 = p1
	while isWrappingType(var2) do
		var2 = var2.ofType
	end
	return var2
end

local function _(p2)
	return if typeof(p2) == "function" then p2() else p2
end

local _ = function(p2)
	return if p2 and #p2 > 0 then p2 else nil
end

t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: identityFunc (ref), valueFromASTUntyped (ref), toObjMap (ref), devAssert (ref), isNillish (ref), inspect (ref), t_2 (ref)
	local t = {
		name = p2.name,
		description = p2.description,
		specifiedByUrl = p2.specifiedByUrl
	}
	local var3 = if p2.parseValue then p2.parseValue else identityFunc
	local var4 = if p2.serialize then p2.serialize else identityFunc
	
	function t.serialize(_, ...)
		-- upvalues: var4 (ref)
		return var4(...)
	end
	
	function t.parseValue(_, ...)
		-- upvalues: var3 (ref)
		return var3(...)
	end
	
	local var5 = if p2.parseLiteral then p2.parseLiteral else function(p3, p4)
		-- upvalues: var3 (ref), valueFromASTUntyped (copy)
		return var3(valueFromASTUntyped(p3, p4))
	end
	
	function t.parseLiteral(_, ...)
		-- upvalues: var5 (ref)
		return var5(...)
	end
	
	t.extensions = if p2.extensions then toObjMap(p2.extensions) else nil
	t.astNode = p2.astNode
	local extensionASTNodes = p2.extensionASTNodes
	t.extensionASTNodes = if extensionASTNodes and #extensionASTNodes > 0 then extensionASTNodes else nil
	devAssert(typeof(p2.name) == "string", "Must provide name.")
	devAssert(isNillish(p2.specifiedByUrl) or typeof(p2.specifiedByUrl) == "string", ("%s must provide \"specifiedByUrl\" as a string, "):format(t.name) .. ("but got: %s."):format(inspect(p2.specifiedByUrl)))
	extensionASTNodes = if p2.serialize ~= nil then typeof(p2.serialize) == "function" else true
	devAssert(extensionASTNodes, ("%s must provide \"serialize\" function. If this custom Scalar is also used as an input type, ensure \"parseValue\" and \"parseLiteral\" functions are also provided."):format(t.name))
	
	if p2.parseLiteral then
		devAssert(typeof(p2.parseValue) == "function" and typeof(p2.parseLiteral) == "function", ("%s must provide both \"parseValue\" and \"parseLiteral\" functions."):format(t.name))
	end
	return setmetatable(t, t_2)
end

function t_2:toConfig()
	return {
		name = self.name,
		description = self.description,
		specifiedByUrl = self.specifiedByUrl,
		serialize = self.serialize,
		parseValue = self.parseValue,
		parseLiteral = self.parseLiteral,
		extensions = self.extensions,
		astNode = self.astNode,
		extensionASTNodes = if self.extensionASTNodes then self.extensionASTNodes else {}
	}
end

function t_2:__tostring()
	return self:toString()
end

function t_2:toString()
	return self.name
end

function t_2:toJSON()
	return self:toString()
end

t_3.__index = t_3

function t_3.new(p2)
	-- upvalues: toObjMap (ref), defineFieldMap (write), defineInterfaces (write), devAssert (ref), inspect (ref), t_3 (ref)
	local t = {
		name = p2.name,
		description = p2.description,
		isTypeOf = p2.isTypeOf,
		extensions = if p2.extensions then toObjMap(p2.extensions) else nil,
		astNode = p2.astNode
	}
	local extensionASTNodes = p2.extensionASTNodes
	t.extensionASTNodes = if extensionASTNodes and #extensionASTNodes > 0 then extensionASTNodes else nil
	
	function t._fields()
		-- upvalues: defineFieldMap (copy), p2 (ref)
		return defineFieldMap(p2)
	end
	
	function t._interfaces()
		-- upvalues: defineInterfaces (copy), p2 (ref)
		return defineInterfaces(p2)
	end
	
	devAssert(typeof(p2.name) == "string", "Must provide name.")
	extensionASTNodes = if p2.isTypeOf ~= nil then typeof(p2.isTypeOf) == "function" else true
	devAssert(extensionASTNodes, ("%s must provide \"isTypeOf\" as a function, but got: %s."):format(t.name, inspect(p2.isTypeOf)))
	
	return setmetatable(t, t_3)
end

function t_3:getFields()
	if typeof(self._fields) == "function" then
		self._fields = self._fields()
	end
	return self._fields
end

function t_3:getInterfaces()
	if typeof(self._interfaces) == "function" then
		self._interfaces = self._interfaces()
	end
	return self._interfaces
end

function t_3:toConfig()
	-- upvalues: fieldsToFieldsConfig (write)
	return {
		name = self.name,
		description = self.description,
		interfaces = self:getInterfaces(),
		fields = fieldsToFieldsConfig(self:getFields()),
		isTypeOf = self.isTypeOf,
		extensions = self.extensions,
		astNode = self.astNode,
		extensionASTNodes = self.extensionASTNodes or {}
	}
end

function t_3:__tostring()
	return self:toString()
end

function t_3:toString()
	return self.name
end

function t_3:toJSON()
	return self:toString()
end

defineInterfaces = function(p2)
	-- upvalues: devAssert (ref), array (ref)
	local interfaces = p2.interfaces
	local var3 = if typeof(interfaces) == "function" then interfaces() else interfaces
	local var4 = var3 or {}
	devAssert(array.isArray(var4), ("%s interfaces must be an Array or a function which returns an Array."):format(p2.name))
	
	return var4
end

defineFieldMap = function(p2)
	-- upvalues: devAssert (ref), isPlainObj (write), instanceOfModule (ref), map (ref), coerceToMap (ref), mapValueOrdered (ref), inspect (ref), array (ref), toObjMap (ref)
	local fields = p2.fields
	local var3 = if typeof(fields) == "function" then fields() else fields
	devAssert(isPlainObj(var3) or instanceOfModule(var3, map), ("%s fields must be an object with field names as keys or a function which returns such an object."):format(p2.name))
	
	return mapValueOrdered(coerceToMap(var3), function(p3, p4)
		-- upvalues: devAssert (copy), isPlainObj (copy), p2 (ref), inspect (copy), instanceOfModule (copy), map (copy), array (copy), coerceToMap (copy), toObjMap (copy)
		devAssert(isPlainObj(p3), ("%s.%s field config must be an object."):format(p2.name, p4))
		devAssert(if p3.resolve ~= nil then typeof(p3.resolve) == "function" else true, ("%s.%s field resolver must be a function if "):format(p2.name, p4) .. ("provided, but got: %s."):format(inspect(p3.resolve)))
		local var4 = if p3.args then p3.args else {}
		devAssert(isPlainObj(var4) or instanceOfModule(var4, map), ("%s.%s args must be an object with argument names as keys."):format(p2.name, p4))
		
		return {
			name = p4,
			description = p3.description,
			type = p3.type,
			args = array.map(coerceToMap(var4):entries(), function(p5)
				-- upvalues: toObjMap (copy)
				local var5 = p5[2]
				
				return {
					name = p5[1],
					description = var5.description,
					type = var5.type,
					defaultValue = var5.defaultValue,
					deprecationReason = var5.deprecationReason,
					extensions = if var5.extensions then toObjMap(var5.extensions) else nil,
					astNode = var5.astNode
				}
			end),
			resolve = p3.resolve,
			subscribe = p3.subscribe,
			deprecationReason = p3.deprecationReason,
			extensions = if p3.extensions then toObjMap(p3.extensions) else nil,
			astNode = p3.astNode
		}
	end)
end

isPlainObj = function(p2)
	-- upvalues: nullModule (ref), isObjectLike (ref), array (ref)
	return p2 ~= nullModule and (isObjectLike(p2) and (not array.isArray(p2) or next(p2) == nil))
end

fieldsToFieldsConfig = function(p2)
	-- upvalues: mapValueOrdered (ref), argsToArgsConfig (write)
	return mapValueOrdered(p2, function(p3)
		-- upvalues: argsToArgsConfig (copy)
		return {
			description = p3.description,
			type = p3.type,
			args = argsToArgsConfig(p3.args),
			resolve = p3.resolve,
			subscribe = p3.subscribe,
			deprecationReason = p3.deprecationReason,
			extensions = p3.extensions,
			astNode = p3.astNode
		}
	end)
end

argsToArgsConfig = function(p2)
	-- upvalues: keyValMap (ref)
	return keyValMap(p2, function(p3)
		return p3.name
	end, function(p3)
		return {
			description = p3.description,
			type = p3.type,
			defaultValue = p3.defaultValue,
			deprecationReason = p3.deprecationReason,
			extensions = p3.extensions,
			astNode = p3.astNode
		}
	end)
end

local function isRequiredArgument(p2)
	-- upvalues: isNonNullType (write)
	return isNonNullType(p2.type) and p2.defaultValue == nil
end

t_4.__index = t_4

function t_4.new(p2)
	-- upvalues: toObjMap (ref), defineFieldMap (write), defineInterfaces (write), devAssert (ref), inspect (ref), t_4 (ref)
	local t = {
		name = p2.name,
		description = p2.description,
		resolveType = p2.resolveType,
		extensions = if p2.extensions then toObjMap(p2.extensions) else nil,
		astNode = p2.astNode
	}
	local extensionASTNodes = p2.extensionASTNodes
	t.extensionASTNodes = if extensionASTNodes and #extensionASTNodes > 0 then extensionASTNodes else nil
	
	function t._fields()
		-- upvalues: defineFieldMap (copy), p2 (ref)
		return defineFieldMap(p2)
	end
	
	function t._interfaces()
		-- upvalues: defineInterfaces (copy), p2 (ref)
		return defineInterfaces(p2)
	end
	
	devAssert(typeof(p2.name) == "string", "Must provide name.")
	extensionASTNodes = if p2.resolveType ~= nil then typeof(p2.resolveType) == "function" else true
	devAssert(extensionASTNodes, ("%s must provide \"resolveType\" as a function, but got: %s."):format(t.name, inspect(p2.resolveType)))
	
	return setmetatable(t, t_4)
end

function t_4:getFields()
	if typeof(self._fields) == "function" then
		self._fields = self._fields()
	end
	return self._fields
end

function t_4:getInterfaces()
	if typeof(self._interfaces) == "function" then
		self._interfaces = self._interfaces()
	end
	return self._interfaces
end

function t_4:toConfig()
	-- upvalues: fieldsToFieldsConfig (write)
	return {
		name = self.name,
		description = self.description,
		interfaces = self:getInterfaces(),
		fields = fieldsToFieldsConfig(self:getFields()),
		resolveType = self.resolveType,
		extensions = self.extensions,
		astNode = self.astNode,
		extensionASTNodes = self.extensionASTNodes or {}
	}
end

function t_4:__tostring()
	return self:toString()
end

function t_4:toString()
	return self.name
end

function t_4:toJSON()
	return self:toString()
end

t_5.__index = t_5

function t_5.new(p2)
	-- upvalues: toObjMap (ref), defineTypes (write), devAssert (ref), inspect (ref), t_5 (ref)
	local t = {
		name = p2.name,
		description = p2.description,
		resolveType = p2.resolveType,
		extensions = if p2.extensions then toObjMap(p2.extensions) else nil,
		astNode = p2.astNode
	}
	local extensionASTNodes = p2.extensionASTNodes
	t.extensionASTNodes = if extensionASTNodes and #extensionASTNodes > 0 then extensionASTNodes else nil
	
	function t._types()
		-- upvalues: defineTypes (copy), p2 (ref)
		return defineTypes(p2)
	end
	
	devAssert(typeof(p2.name) == "string", "Must provide name.")
	extensionASTNodes = if p2.resolveType ~= nil then typeof(p2.resolveType) == "function" else true
	devAssert(extensionASTNodes, ("%s must provide \"resolveType\" as a function, but got: %s."):format(t.name, inspect(p2.resolveType)))
	
	return setmetatable(t, t_5)
end

function t_5:getTypes()
	if typeof(self._types) == "function" then
		self._types = self._types()
	end
	return self._types
end

function t_5:toConfig()
	return {
		name = self.name,
		description = self.description,
		types = self:getTypes(),
		resolveType = self.resolveType,
		extensions = self.extensions,
		astNode = self.astNode,
		extensionASTNodes = self.extensionASTNodes or {}
	}
end

function t_5:__tostring()
	return self:toString()
end

function t_5:toString()
	return self.name
end

function t_5:toJSON()
	return self:toString()
end

defineTypes = function(p2)
	-- upvalues: devAssert (ref), array (ref)
	local types = p2.types
	local var3 = if typeof(types) == "function" then types() else types
	devAssert(array.isArray(var3), ("Must provide Array of types or a function which returns such an array for Union %s."):format(p2.name))
	
	return var3
end

t_6.__index = t_6

function t_6.new(p2)
	-- upvalues: toObjMap (ref), defineEnumValues (write), array (ref), var1 (ref), keyMap (ref), devAssert (ref), t_6 (ref)
	local t = {
		name = p2.name,
		description = p2.description,
		extensions = if p2.extensions then toObjMap(p2.extensions) else nil,
		astNode = p2.astNode
	}
	local extensionASTNodes = p2.extensionASTNodes
	t.extensionASTNodes = if extensionASTNodes and #extensionASTNodes > 0 then extensionASTNodes else nil
	t._values = defineEnumValues(t.name, p2.values)
	t._valueLookup = {}
	array.forEach(t._values, function(p3)
		-- upvalues: t (ref), var1 (copy)
		if p3.value == p3.value then
			t._valueLookup[p3.value] = p3
			
			return
		end
		t._valueLookup[var1] = p3
	end)
	t._nameLookup = keyMap(t._values, function(p3)
		return p3.name
	end)
	devAssert(typeof(p2.name) == "string", "Must provide name.")
	
	return setmetatable(t, t_6)
end

function t_6:getValues()
	return self._values
end

function t_6:getValue(p2)
	return self._nameLookup[p2]
end

function t_6:serialize(p2)
	-- upvalues: var1 (ref), graphQLError (ref), inspect (ref)
	local var3 = if p2 == p2 then self._valueLookup[p2] else self._valueLookup[var1]
	
	if var3 == nil then
		error(graphQLError.new(("Enum \"%s\" cannot represent value: %s"):format(self.name, inspect(p2))))
	end
	return var3.name
end

function t_6:parseValue(p2)
	-- upvalues: inspect (ref), graphQLError (ref), didYouMeanEnumValue (write)
	if typeof(p2) ~= "string" then
		local var3 = inspect(p2)
		error(graphQLError.new(("Enum \"%s\" cannot represent non-string value: %s." .. didYouMeanEnumValue(self, var3)):format(self.name, var3)))
	end
	local var4 = self:getValue(p2)
	
	if var4 == nil then
		error(graphQLError.new(("Value \"%s\" does not exist in \"%s\" enum."):format(p2, self.name) .. didYouMeanEnumValue(self, p2)))
	end
	return var4.value
end

function t_6:parseLiteral(p2, _)
	-- upvalues: kind (ref), print (ref), graphQLError (ref), didYouMeanEnumValue (write)
	if p2.kind ~= kind.ENUM then
		local var3 = print(p2)
		error(graphQLError.new(("Enum \"%s\" cannot represent non-enum value: %s."):format(self.name, var3) .. didYouMeanEnumValue(self, var3), p2))
	end
	local value = self:getValue(p2.value)
	
	if value == nil then
		local var4 = print(p2)
		error(graphQLError.new(("Value \"%s\" does not exist in \"%s\" enum."):format(var4, self.name) .. didYouMeanEnumValue(self, var4), p2))
	end
	return value.value
end

function t_6:toConfig()
	-- upvalues: keyValMap (ref)
	return {
		name = self.name,
		description = self.description,
		values = keyValMap(self:getValues(), function(p2)
			return p2.name
		end, function(p2)
			return {
				description = p2.description,
				value = p2.value,
				deprecationReason = p2.deprecationReason,
				extensions = p2.extensions,
				astNode = p2.astNode
			}
		end),
		extensions = self.extensions,
		astNode = self.astNode,
		extensionASTNodes = self.extensionASTNodes or {}
	}
end

function t_6:__tostring()
	return self:toString()
end

function t_6:toString()
	return self.name
end

function t_6:toJSON()
	return self:toString()
end

didYouMeanEnumValue = function(p2, p3)
	-- upvalues: array (ref), suggestionList (ref), didYouMean (ref)
	return didYouMean("the enum value", suggestionList(p3, array.map(p2:getValues(), function(p4)
		return p4.name
	end)))
end

defineEnumValues = function(p2, p3)
	-- upvalues: devAssert (ref), isPlainObj (write), instanceOfModule (ref), map (ref), coerceToMap (ref), array (ref), inspect (ref), toObjMap (ref)
	devAssert(isPlainObj(p3) or instanceOfModule(p3, map), ("%s values must be an object with value names as keys."):format(tostring(p2)))
	
	return array.map(coerceToMap(p3):entries(), function(p4)
		-- upvalues: devAssert (copy), isPlainObj (copy), p2 (ref), inspect (copy), toObjMap (copy)
		local var3 = p4[1]
		local var4 = p4[2]
		devAssert(isPlainObj(var4), ("%s.%s must refer to an object with a \"value\" key "):format(tostring(p2), tostring(var3)) .. ("representing an internal value but got: %s."):format(inspect(var4)))
		
		return {
			name = tostring(var3),
			description = var4.description,
			value = if var4.value ~= nil then var3 else var4.value,
			deprecationReason = var4.deprecationReason,
			extensions = if var4.extensions then toObjMap(var4.extensions) else nil,
			astNode = var4.astNode
		}
	end)
end

t_7.__index = t_7

function t_7.new(p2)
	-- upvalues: toObjMap (ref), defineInputFieldMap (write), devAssert (ref), t_7 (ref)
	local t = {
		name = p2.name,
		description = p2.description,
		extensions = if p2.extensions then toObjMap(p2.extensions) else nil,
		astNode = p2.astNode
	}
	local extensionASTNodes = p2.extensionASTNodes
	t.extensionASTNodes = if extensionASTNodes and #extensionASTNodes > 0 then extensionASTNodes else nil
	
	function t._fields()
		-- upvalues: defineInputFieldMap (copy), p2 (ref)
		return defineInputFieldMap(p2)
	end
	
	devAssert(typeof(p2.name) == "string", "Must provide name.")
	
	return setmetatable(t, t_7)
end

function t_7:getFields()
	if typeof(self._fields) == "function" then
		self._fields = self._fields()
	end
	return self._fields
end

function t_7:toConfig()
	-- upvalues: mapValueOrdered (ref)
	return {
		name = self.name,
		description = self.description,
		fields = mapValueOrdered(self:getFields(), function(p2)
			return {
				description = p2.description,
				type = p2.type,
				defaultValue = p2.defaultValue,
				extensions = p2.extensions,
				astNode = p2.astNode
			}
		end),
		extensions = self.extensions,
		astNode = self.astNode,
		extensionASTNodes = self.extensionASTNodes or {}
	}
end

function t_7:__tostring()
	return self:toString()
end

function t_7:toString()
	return self.name
end

function t_7:toJSON()
	return self:toString()
end

defineInputFieldMap = function(p2)
	-- upvalues: devAssert (ref), isPlainObj (write), instanceOfModule (ref), map (ref), coerceToMap (ref), mapValueOrdered (ref), toObjMap (ref)
	local fields = p2.fields
	local var3 = if typeof(fields) == "function" then fields() else fields
	devAssert(isPlainObj(var3) or instanceOfModule(var3, map), ("%s fields must be an object with field names as keys or a function which returns such an object."):format(p2.name))
	
	return mapValueOrdered(coerceToMap(var3), function(p3, p4)
		-- upvalues: devAssert (copy), p2 (ref), toObjMap (copy)
		devAssert(p3.resolve == nil, ("%s.%s field has a resolve property, but Input Types cannot define resolvers."):format(p2.name, p4))
		
		return {
			name = p4,
			description = p3.description,
			type = p3.type,
			defaultValue = p3.defaultValue,
			deprecationReason = p3.deprecationReason,
			extensions = if p3.extensions then toObjMap(p3.extensions) else nil,
			astNode = p3.astNode
		}
	end)
end

local function isRequiredInputField(p2)
	-- upvalues: isNonNullType (write)
	return isNonNullType(p2.type) and p2.defaultValue == nil
end

({}).new = function()
	return {}
end

return {
	GraphQLList = t,
	GraphQLNonNull = t_1,
	GraphQLScalarType = t_2,
	GraphQLObjectType = t_3,
	GraphQLInterfaceType = t_4,
	GraphQLUnionType = t_5,
	GraphQLEnumType = t_6,
	GraphQLInputObjectType = t_7,
	isType = isType,
	assertType = assertType,
	isScalarType = isScalarType,
	assertScalarType = assertScalarType,
	isObjectType = isObjectType,
	assertObjectType = assertObjectType,
	isInterfaceType = isInterfaceType,
	assertInterfaceType = assertInterfaceType,
	isUnionType = isUnionType,
	assertUnionType = assertUnionType,
	isEnumType = isEnumType,
	assertEnumType = assertEnumType,
	isInputObjectType = isInputObjectType,
	assertInputObjectType = assertInputObjectType,
	isListType = isListType,
	assertListType = assertListType,
	isNonNullType = isNonNullType,
	assertNonNullType = assertNonNullType,
	isInputType = isInputType,
	assertInputType = assertInputType,
	isOutputType = isOutputType,
	assertOutputType = assertOutputType,
	isLeafType = isLeafType,
	assertLeafType = assertLeafType,
	isCompositeType = isCompositeType,
	assertCompositeType = assertCompositeType,
	isAbstractType = isAbstractType,
	assertAbstractType = assertAbstractType,
	isWrappingType = isWrappingType,
	assertWrappingType = assertWrappingType,
	isNullableType = isNullableType,
	assertNullableType = assertNullableType,
	getNullableType = getNullableType,
	isNamedType = isNamedType,
	assertNamedType = assertNamedType,
	getNamedType = getNamedType,
	argsToArgsConfig = argsToArgsConfig,
	isRequiredArgument = isRequiredArgument,
	isRequiredInputField = isRequiredInputField,
	NULL = nullModule
}