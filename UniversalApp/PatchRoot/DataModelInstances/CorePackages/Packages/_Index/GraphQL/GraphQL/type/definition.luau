local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local error = luauPolyfillModule.Error
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local coerceToMap = luauPolyfillModule.coerceToMap
local nullModule = require(parent.luaUtils.null)
local var2 = object.freeze({})
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

local function isType(p0)
	-- upvalues: isScalarType (write), isObjectType (write), isInterfaceType (write), isUnionType (write), isEnumType (write), isInputObjectType (write), isListType (write), isNonNullType (write)
	return isScalarType(p0) or (isObjectType(p0) or (isInterfaceType(p0) or (isUnionType(p0) or (isEnumType(p0) or (isInputObjectType(p0) or (isListType(p0) or isNonNullType(p0)))))))
end

local function assertType(p1)
	-- upvalues: isType (write), error (ref), inspect (ref)
	if not isType(p1) then
		error(error.new(("Expected %s to be a GraphQL type."):format(inspect(p1))))
	end
	return p1
end

isScalarType = function(p2)
	-- upvalues: instanceOfModule (ref), t_2 (ref)
	return instanceOfModule(p2, t_2)
end

local function assertScalarType(p3)
	-- upvalues: isScalarType (write), error (ref), inspect (ref)
	if not isScalarType(p3) then
		error(error.new(("Expected %s to be a GraphQL Scalar type."):format(inspect(p3))))
	end
	return p3
end

isObjectType = function(p4)
	-- upvalues: instanceOfModule (ref), t_3 (ref)
	return instanceOfModule(p4, t_3)
end

local function assertObjectType(p5)
	-- upvalues: isObjectType (write), error (ref), inspect (ref)
	if not isObjectType(p5) then
		error(error.new(("Expected %s to be a GraphQL Object type."):format(inspect(p5))))
	end
	return p5
end

isInterfaceType = function(p6)
	-- upvalues: instanceOfModule (ref), t_4 (ref)
	return instanceOfModule(p6, t_4)
end

local function assertInterfaceType(p7)
	-- upvalues: isInterfaceType (write), error (ref), inspect (ref)
	if not isInterfaceType(p7) then
		error(error.new(("Expected %s to be a GraphQL Interface type."):format(inspect(p7))))
	end
	return p7
end

isUnionType = function(p8)
	-- upvalues: instanceOfModule (ref), t_5 (ref)
	return instanceOfModule(p8, t_5)
end

local function assertUnionType(p9)
	-- upvalues: isUnionType (write), error (ref), inspect (ref)
	if not isUnionType(p9) then
		error(error.new(("Expected %s to be a GraphQL Union type."):format(inspect(p9))))
	end
	return p9
end

isEnumType = function(p10)
	-- upvalues: instanceOfModule (ref), t_6 (ref)
	return instanceOfModule(p10, t_6)
end

local function assertEnumType(p11)
	-- upvalues: isEnumType (write), error (ref), inspect (ref)
	if not isEnumType(p11) then
		error(error.new(("Expected %s to be a GraphQL Enum type."):format(inspect(p11))))
	end
	return p11
end

isInputObjectType = function(p12)
	-- upvalues: instanceOfModule (ref), t_7 (ref)
	return instanceOfModule(p12, t_7)
end

local function assertInputObjectType(p13)
	-- upvalues: isInputObjectType (write), error (ref), inspect (ref)
	if not isInputObjectType(p13) then
		error(error.new(("Expected %s to be a GraphQL Input Object type."):format(inspect(p13))))
	end
	return p13
end

isListType = function(p14)
	-- upvalues: instanceOfModule (ref), t (write)
	return instanceOfModule(p14, t)
end

local function assertListType(p15)
	-- upvalues: isListType (write), error (ref), inspect (ref)
	if not isListType(p15) then
		error(error.new(("Expected %s to be a GraphQL List type."):format(inspect(p15))))
	end
	return p15
end

isNonNullType = function(p16)
	-- upvalues: instanceOfModule (ref), t_1 (write)
	return instanceOfModule(p16, t_1)
end

local function assertNonNullType(p17)
	-- upvalues: isNonNullType (write), error (ref), inspect (ref)
	if not isNonNullType(p17) then
		error(error.new(("Expected %s to be a GraphQL Non-Null type."):format(inspect(p17))))
	end
	return p17
end

local function isInputType(p18)
	-- upvalues: isScalarType (write), isEnumType (write), isInputObjectType (write), isWrappingType (write), isInputType (write)
	return isScalarType(p18) or (isEnumType(p18) or (isInputObjectType(p18) or isWrappingType(p18) and isInputType(p18.ofType)))
end

local function assertInputType(p19)
	-- upvalues: isInputType (write), error (ref), inspect (ref)
	if not isInputType(p19) then
		error(error.new(("Expected %s to be a GraphQL input type."):format(inspect(p19))))
	end
	return p19
end

local function isOutputType(p20)
	-- upvalues: isScalarType (write), isObjectType (write), isInterfaceType (write), isUnionType (write), isEnumType (write), isWrappingType (write), isOutputType (write)
	return isScalarType(p20) or (isObjectType(p20) or (isInterfaceType(p20) or (isUnionType(p20) or (isEnumType(p20) or isWrappingType(p20) and isOutputType(p20.ofType)))))
end

local function assertOutputType(p21)
	-- upvalues: isOutputType (write), error (ref), inspect (ref)
	if not isOutputType(p21) then
		error(error.new(("Expected %s to be a GraphQL output type."):format(inspect(p21))))
	end
	return p21
end

local function isLeafType(p22)
	-- upvalues: isScalarType (write), isEnumType (write)
	return isScalarType(p22) or isEnumType(p22)
end

local function assertLeafType(p23)
	-- upvalues: isLeafType (write), error (ref), inspect (ref)
	if not isLeafType(p23) then
		error(error.new(("Expected %s to be a GraphQL leaf type."):format(inspect(p23))))
	end
	return p23
end

local function isCompositeType(p24)
	-- upvalues: isObjectType (write), isInterfaceType (write), isUnionType (write)
	return isObjectType(p24) or (isInterfaceType(p24) or isUnionType(p24))
end

local function assertCompositeType(p25)
	-- upvalues: isCompositeType (write), error (ref), inspect (ref)
	if not isCompositeType(p25) then
		error(error.new(("Expected %s to be a GraphQL composite type."):format(inspect(p25))))
	end
	return p25
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

function t.new(p26)
	-- upvalues: devAssert (ref), isType (write), inspect (ref), t (write)
	local t_1 = {}
	devAssert(isType(p26), ("Expected %s to be a GraphQL type."):format(inspect(p26)))
	t_1.ofType = p26
	
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

function t_1.new(p27)
	-- upvalues: devAssert (ref), isNullableType (write), inspect (ref), t_1 (write)
	local t = {}
	devAssert(isNullableType(p27), ("Expected %s to be a GraphQL nullable type."):format(inspect(p27)))
	t.ofType = p27
	
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

isWrappingType = function(p28)
	-- upvalues: isListType (write), isNonNullType (write)
	return isListType(p28) or isNonNullType(p28)
end

local function assertWrappingType(p29)
	-- upvalues: isWrappingType (write), error (ref), inspect (ref)
	if not isWrappingType(p29) then
		error(error.new(("Expected %s to be a GraphQL wrapping type."):format(inspect(p29))))
	end
	return p29
end

isNullableType = function(p30)
	-- upvalues: isType (write), isNonNullType (write)
	return isType(p30) and not isNonNullType(p30)
end

local function assertNullableType(p31)
	-- upvalues: isNullableType (write), error (ref), inspect (ref)
	if not isNullableType(p31) then
		error(error.new(("Expected %s to be a GraphQL nullable type."):format(inspect(p31))))
	end
	return p31
end

local function getNullableType(p32)
	-- upvalues: isNonNullType (write)
	return if p32 then if isNonNullType(p32) then p32.ofType else p32 else nil
end

local function isNamedType(p33)
	-- upvalues: isScalarType (write), isObjectType (write), isInterfaceType (write), isUnionType (write), isEnumType (write), isInputObjectType (write)
	return isScalarType(p33) or (isObjectType(p33) or (isInterfaceType(p33) or (isUnionType(p33) or (isEnumType(p33) or isInputObjectType(p33)))))
end

local function assertNamedType(p34)
	-- upvalues: isNamedType (write), error (ref), inspect (ref)
	if not isNamedType(p34) then
		error(error.new(("Expected %s to be a GraphQL named type."):format(inspect(p34))))
	end
	return p34
end

local function getNamedType(p35)
	-- upvalues: isWrappingType (write)
	if not p35 then
		return nil
	end
	local var61 = p35
	while isWrappingType(var61) do
		var61 = var61.ofType
	end
	return var61
end

local function _(p36)
	return if typeof(p36) == "function" then p36() else p36
end

local _ = function(p37)
	return if p37 and #p37 > 0 then p37 else nil
end

t_2.__index = t_2

function t_2.new(p38)
	-- upvalues: identityFunc (ref), valueFromASTUntyped (ref), toObjMap (ref), devAssert (ref), isNillish (ref), inspect (ref), t_2 (ref)
	local t = {
		name = p38.name,
		description = p38.description,
		specifiedByUrl = p38.specifiedByUrl
	}
	local var63 = if p38.parseValue then p38.parseValue else identityFunc
	local var64 = if p38.serialize then p38.serialize else identityFunc
	
	function t.serialize(_, ...)
		-- upvalues: var64 (ref)
		return var64(...)
	end
	
	function t.parseValue(_, ...)
		-- upvalues: var63 (ref)
		return var63(...)
	end
	
	local var65 = if p38.parseLiteral then p38.parseLiteral else function(p39, p40)
		-- upvalues: var63 (ref), valueFromASTUntyped (copy)
		return var63(valueFromASTUntyped(p39, p40))
	end
	
	function t.parseLiteral(_, ...)
		-- upvalues: var65 (ref)
		return var65(...)
	end
	
	t.extensions = if p38.extensions then toObjMap(p38.extensions) else nil
	t.astNode = p38.astNode
	local extensionASTNodes = p38.extensionASTNodes
	t.extensionASTNodes = if extensionASTNodes and #extensionASTNodes > 0 then extensionASTNodes else nil
	devAssert(typeof(p38.name) == "string", "Must provide name.")
	devAssert(isNillish(p38.specifiedByUrl) or typeof(p38.specifiedByUrl) == "string", ("%s must provide \"specifiedByUrl\" as a string, "):format(t.name) .. ("but got: %s."):format(inspect(p38.specifiedByUrl)))
	extensionASTNodes = if p38.serialize ~= nil then typeof(p38.serialize) == "function" else true
	devAssert(extensionASTNodes, ("%s must provide \"serialize\" function. If this custom Scalar is also used as an input type, ensure \"parseValue\" and \"parseLiteral\" functions are also provided."):format(t.name))
	
	if p38.parseLiteral then
		devAssert(typeof(p38.parseValue) == "function" and typeof(p38.parseLiteral) == "function", ("%s must provide both \"parseValue\" and \"parseLiteral\" functions."):format(t.name))
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

function t_3.new(p41)
	-- upvalues: toObjMap (ref), defineFieldMap (write), defineInterfaces (write), devAssert (ref), inspect (ref), t_3 (ref)
	local t = {
		name = p41.name,
		description = p41.description,
		isTypeOf = p41.isTypeOf,
		extensions = if p41.extensions then toObjMap(p41.extensions) else nil,
		astNode = p41.astNode
	}
	local extensionASTNodes = p41.extensionASTNodes
	t.extensionASTNodes = if extensionASTNodes and #extensionASTNodes > 0 then extensionASTNodes else nil
	
	function t._fields()
		-- upvalues: defineFieldMap (copy), p41 (ref)
		return defineFieldMap(p41)
	end
	
	function t._interfaces()
		-- upvalues: defineInterfaces (copy), p41 (ref)
		return defineInterfaces(p41)
	end
	
	devAssert(typeof(p41.name) == "string", "Must provide name.")
	extensionASTNodes = if p41.isTypeOf ~= nil then typeof(p41.isTypeOf) == "function" else true
	devAssert(extensionASTNodes, ("%s must provide \"isTypeOf\" as a function, but got: %s."):format(t.name, inspect(p41.isTypeOf)))
	
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

defineInterfaces = function(p42)
	-- upvalues: devAssert (ref), array (ref)
	local interfaces = p42.interfaces
	local var67 = if typeof(interfaces) == "function" then interfaces() else interfaces
	local var68 = var67 or {}
	devAssert(array.isArray(var68), ("%s interfaces must be an Array or a function which returns an Array."):format(p42.name))
	
	return var68
end

defineFieldMap = function(p43)
	-- upvalues: devAssert (ref), isPlainObj (write), instanceOfModule (ref), map (ref), coerceToMap (ref), mapValueOrdered (ref), inspect (ref), array (ref), toObjMap (ref)
	local fields = p43.fields
	local var69 = if typeof(fields) == "function" then fields() else fields
	devAssert(isPlainObj(var69) or instanceOfModule(var69, map), ("%s fields must be an object with field names as keys or a function which returns such an object."):format(p43.name))
	
	return mapValueOrdered(coerceToMap(var69), function(p44, p45)
		-- upvalues: devAssert (copy), isPlainObj (copy), p43 (ref), inspect (copy), instanceOfModule (copy), map (copy), array (copy), coerceToMap (copy), toObjMap (copy)
		devAssert(isPlainObj(p44), ("%s.%s field config must be an object."):format(p43.name, p45))
		devAssert(if p44.resolve ~= nil then typeof(p44.resolve) == "function" else true, ("%s.%s field resolver must be a function if "):format(p43.name, p45) .. ("provided, but got: %s."):format(inspect(p44.resolve)))
		local var70 = if p44.args then p44.args else {}
		devAssert(isPlainObj(var70) or instanceOfModule(var70, map), ("%s.%s args must be an object with argument names as keys."):format(p43.name, p45))
		
		return {
			name = p45,
			description = p44.description,
			type = p44.type,
			args = array.map(coerceToMap(var70):entries(), function(p46)
				-- upvalues: toObjMap (copy)
				local var71 = p46[2]
				
				return {
					name = p46[1],
					description = var71.description,
					type = var71.type,
					defaultValue = var71.defaultValue,
					deprecationReason = var71.deprecationReason,
					extensions = if var71.extensions then toObjMap(var71.extensions) else nil,
					astNode = var71.astNode
				}
			end),
			resolve = p44.resolve,
			subscribe = p44.subscribe,
			deprecationReason = p44.deprecationReason,
			extensions = if p44.extensions then toObjMap(p44.extensions) else nil,
			astNode = p44.astNode
		}
	end)
end

isPlainObj = function(p47)
	-- upvalues: nullModule (ref), isObjectLike (ref), array (ref)
	return p47 ~= nullModule and (isObjectLike(p47) and (not array.isArray(p47) or next(p47) == nil))
end

fieldsToFieldsConfig = function(p48)
	-- upvalues: mapValueOrdered (ref), argsToArgsConfig (write)
	return mapValueOrdered(p48, function(p49)
		-- upvalues: argsToArgsConfig (copy)
		return {
			description = p49.description,
			type = p49.type,
			args = argsToArgsConfig(p49.args),
			resolve = p49.resolve,
			subscribe = p49.subscribe,
			deprecationReason = p49.deprecationReason,
			extensions = p49.extensions,
			astNode = p49.astNode
		}
	end)
end

argsToArgsConfig = function(p50)
	-- upvalues: keyValMap (ref)
	return keyValMap(p50, function(p51)
		return p51.name
	end, function(p52)
		return {
			description = p52.description,
			type = p52.type,
			defaultValue = p52.defaultValue,
			deprecationReason = p52.deprecationReason,
			extensions = p52.extensions,
			astNode = p52.astNode
		}
	end)
end

local function isRequiredArgument(p53)
	-- upvalues: isNonNullType (write)
	return isNonNullType(p53.type) and p53.defaultValue == nil
end

t_4.__index = t_4

function t_4.new(p54)
	-- upvalues: toObjMap (ref), defineFieldMap (write), defineInterfaces (write), devAssert (ref), inspect (ref), t_4 (ref)
	local t = {
		name = p54.name,
		description = p54.description,
		resolveType = p54.resolveType,
		extensions = if p54.extensions then toObjMap(p54.extensions) else nil,
		astNode = p54.astNode
	}
	local extensionASTNodes = p54.extensionASTNodes
	t.extensionASTNodes = if extensionASTNodes and #extensionASTNodes > 0 then extensionASTNodes else nil
	
	function t._fields()
		-- upvalues: defineFieldMap (copy), p54 (ref)
		return defineFieldMap(p54)
	end
	
	function t._interfaces()
		-- upvalues: defineInterfaces (copy), p54 (ref)
		return defineInterfaces(p54)
	end
	
	devAssert(typeof(p54.name) == "string", "Must provide name.")
	extensionASTNodes = if p54.resolveType ~= nil then typeof(p54.resolveType) == "function" else true
	devAssert(extensionASTNodes, ("%s must provide \"resolveType\" as a function, but got: %s."):format(t.name, inspect(p54.resolveType)))
	
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

function t_5.new(p55)
	-- upvalues: toObjMap (ref), defineTypes (write), devAssert (ref), inspect (ref), t_5 (ref)
	local t = {
		name = p55.name,
		description = p55.description,
		resolveType = p55.resolveType,
		extensions = if p55.extensions then toObjMap(p55.extensions) else nil,
		astNode = p55.astNode
	}
	local extensionASTNodes = p55.extensionASTNodes
	t.extensionASTNodes = if extensionASTNodes and #extensionASTNodes > 0 then extensionASTNodes else nil
	
	function t._types()
		-- upvalues: defineTypes (copy), p55 (ref)
		return defineTypes(p55)
	end
	
	devAssert(typeof(p55.name) == "string", "Must provide name.")
	extensionASTNodes = if p55.resolveType ~= nil then typeof(p55.resolveType) == "function" else true
	devAssert(extensionASTNodes, ("%s must provide \"resolveType\" as a function, but got: %s."):format(t.name, inspect(p55.resolveType)))
	
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

defineTypes = function(p56)
	-- upvalues: devAssert (ref), array (ref)
	local types = p56.types
	local var74 = if typeof(types) == "function" then types() else types
	devAssert(array.isArray(var74), ("Must provide Array of types or a function which returns such an array for Union %s."):format(p56.name))
	
	return var74
end

t_6.__index = t_6

function t_6.new(p57)
	-- upvalues: toObjMap (ref), defineEnumValues (write), array (ref), var2 (ref), keyMap (ref), devAssert (ref), t_6 (ref)
	local t = {
		name = p57.name,
		description = p57.description,
		extensions = if p57.extensions then toObjMap(p57.extensions) else nil,
		astNode = p57.astNode
	}
	local extensionASTNodes = p57.extensionASTNodes
	t.extensionASTNodes = if extensionASTNodes and #extensionASTNodes > 0 then extensionASTNodes else nil
	t._values = defineEnumValues(t.name, p57.values)
	t._valueLookup = {}
	array.forEach(t._values, function(p58)
		-- upvalues: t (ref), var2 (copy)
		if p58.value == p58.value then
			t._valueLookup[p58.value] = p58
			
			return
		end
		t._valueLookup[var2] = p58
	end)
	t._nameLookup = keyMap(t._values, function(p59)
		return p59.name
	end)
	devAssert(typeof(p57.name) == "string", "Must provide name.")
	
	return setmetatable(t, t_6)
end

function t_6:getValues()
	return self._values
end

function t_6:getValue(p60)
	return self._nameLookup[p60]
end

function t_6:serialize(p61)
	-- upvalues: var2 (ref), graphQLError (ref), inspect (ref)
	local var76 = if p61 == p61 then self._valueLookup[p61] else self._valueLookup[var2]
	
	if var76 == nil then
		error(graphQLError.new(("Enum \"%s\" cannot represent value: %s"):format(self.name, inspect(p61))))
	end
	return var76.name
end

function t_6:parseValue(p62)
	-- upvalues: inspect (ref), graphQLError (ref), didYouMeanEnumValue (write)
	if typeof(p62) ~= "string" then
		local var77 = inspect(p62)
		error(graphQLError.new(("Enum \"%s\" cannot represent non-string value: %s." .. didYouMeanEnumValue(self, var77)):format(self.name, var77)))
	end
	local var78 = self:getValue(p62)
	
	if var78 == nil then
		error(graphQLError.new(("Value \"%s\" does not exist in \"%s\" enum."):format(p62, self.name) .. didYouMeanEnumValue(self, p62)))
	end
	return var78.value
end

function t_6:parseLiteral(p63, _)
	-- upvalues: kind (ref), print (ref), graphQLError (ref), didYouMeanEnumValue (write)
	if p63.kind ~= kind.ENUM then
		local var79 = print(p63)
		error(graphQLError.new(("Enum \"%s\" cannot represent non-enum value: %s."):format(self.name, var79) .. didYouMeanEnumValue(self, var79), p63))
	end
	local value = self:getValue(p63.value)
	
	if value == nil then
		local var81 = print(p63)
		error(graphQLError.new(("Value \"%s\" does not exist in \"%s\" enum."):format(var81, self.name) .. didYouMeanEnumValue(self, var81), p63))
	end
	return value.value
end

function t_6:toConfig()
	-- upvalues: keyValMap (ref)
	return {
		name = self.name,
		description = self.description,
		values = keyValMap(self:getValues(), function(p64)
			return p64.name
		end, function(p65)
			return {
				description = p65.description,
				value = p65.value,
				deprecationReason = p65.deprecationReason,
				extensions = p65.extensions,
				astNode = p65.astNode
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

didYouMeanEnumValue = function(p66, p67)
	-- upvalues: array (ref), suggestionList (ref), didYouMean (ref)
	return didYouMean("the enum value", suggestionList(p67, array.map(p66:getValues(), function(p68)
		return p68.name
	end)))
end

defineEnumValues = function(p69, p70)
	-- upvalues: devAssert (ref), isPlainObj (write), instanceOfModule (ref), map (ref), coerceToMap (ref), array (ref), inspect (ref), toObjMap (ref)
	devAssert(isPlainObj(p70) or instanceOfModule(p70, map), ("%s values must be an object with value names as keys."):format(tostring(p69)))
	
	return array.map(coerceToMap(p70):entries(), function(p71)
		-- upvalues: devAssert (copy), isPlainObj (copy), p69 (ref), inspect (copy), toObjMap (copy)
		local var82 = p71[1]
		local var83 = p71[2]
		devAssert(isPlainObj(var83), ("%s.%s must refer to an object with a \"value\" key "):format(tostring(p69), tostring(var82)) .. ("representing an internal value but got: %s."):format(inspect(var83)))
		
		return {
			name = tostring(var82),
			description = var83.description,
			value = if var83.value ~= nil then var82 else var83.value,
			deprecationReason = var83.deprecationReason,
			extensions = if var83.extensions then toObjMap(var83.extensions) else nil,
			astNode = var83.astNode
		}
	end)
end

t_7.__index = t_7

function t_7.new(p72)
	-- upvalues: toObjMap (ref), defineInputFieldMap (write), devAssert (ref), t_7 (ref)
	local t = {
		name = p72.name,
		description = p72.description,
		extensions = if p72.extensions then toObjMap(p72.extensions) else nil,
		astNode = p72.astNode
	}
	local extensionASTNodes = p72.extensionASTNodes
	t.extensionASTNodes = if extensionASTNodes and #extensionASTNodes > 0 then extensionASTNodes else nil
	
	function t._fields()
		-- upvalues: defineInputFieldMap (copy), p72 (ref)
		return defineInputFieldMap(p72)
	end
	
	devAssert(typeof(p72.name) == "string", "Must provide name.")
	
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
		fields = mapValueOrdered(self:getFields(), function(p73)
			return {
				description = p73.description,
				type = p73.type,
				defaultValue = p73.defaultValue,
				extensions = p73.extensions,
				astNode = p73.astNode
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

defineInputFieldMap = function(p74)
	-- upvalues: devAssert (ref), isPlainObj (write), instanceOfModule (ref), map (ref), coerceToMap (ref), mapValueOrdered (ref), toObjMap (ref)
	local fields = p74.fields
	local var85 = if typeof(fields) == "function" then fields() else fields
	devAssert(isPlainObj(var85) or instanceOfModule(var85, map), ("%s fields must be an object with field names as keys or a function which returns such an object."):format(p74.name))
	
	return mapValueOrdered(coerceToMap(var85), function(p75, p76)
		-- upvalues: devAssert (copy), p74 (ref), toObjMap (copy)
		devAssert(p75.resolve == nil, ("%s.%s field has a resolve property, but Input Types cannot define resolvers."):format(p74.name, p76))
		
		return {
			name = p76,
			description = p75.description,
			type = p75.type,
			defaultValue = p75.defaultValue,
			deprecationReason = p75.deprecationReason,
			extensions = if p75.extensions then toObjMap(p75.extensions) else nil,
			astNode = p75.astNode
		}
	end)
end

local function isRequiredInputField(p77)
	-- upvalues: isNonNullType (write)
	return isNonNullType(p77.type) and p77.defaultValue == nil
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