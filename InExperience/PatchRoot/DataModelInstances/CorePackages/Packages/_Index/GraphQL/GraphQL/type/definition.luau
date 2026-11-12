local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Error1 = LuauPolyfillModule.Error
local Map = LuauPolyfillModule.Map
local CoerceToMapFunction = LuauPolyfillModule.coerceToMap
local NullModule = require(Parent.luaUtils.null)
local FreezeResult = LuauPolyfillModule.Object.freeze({})
local IsNillishFunction = require(Parent.luaUtils.isNillish).isNillish
local Jsutils = Parent.jsutils
local _ = require(Jsutils.ObjMap)
local InspectFunction = require(Jsutils.inspect).inspect
local KeyMapFunction = require(Jsutils.keyMap).keyMap
local ToObjMapFunction = require(Jsutils.toObjMap).toObjMap
local KeyValMapFunction = require(Jsutils.keyValMap).keyValMap
local DevAssertFunction = require(Jsutils.devAssert).devAssert
local InstanceOfModule = require(Jsutils.instanceOf)
local DidYouMeanFunction = require(Jsutils.didYouMean).didYouMean
local IsObjectLikeFunction = require(Jsutils.isObjectLike).isObjectLike
local IdentityFunc = require(Jsutils.identityFunc).identityFunc
local SuggestionListFunction = require(Jsutils.suggestionList).suggestionList
local _ = require(Jsutils.PromiseOrValue)
local _ = require(Jsutils.Path)
local MapValueOrderedFunction = require(Parent.luaUtils.mapValueOrdered).mapValueOrdered
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local Language = Parent.language
local Kind = require(Language.kinds).Kind
local PrintFunction = require(Language.printer).print
local _ = require(Parent.language.ast)
local ValueFromASTUntypedFunction = require(Parent.utilities.valueFromASTUntyped).valueFromASTUntyped
local isType = nil
local Callback = nil
local Callback1 = nil
local Callback3 = nil
local Callback5 = nil
local Callback6 = nil
local Callback7 = nil
local Callback2 = nil
local Callback4 = nil
local _ = nil
local _ = nil
local isLeafType = nil
local isCompositeType = nil
local isAbstractType = nil
local Callback8 = nil
local Callback9 = nil
local isNamedType = nil
local Callback10 = nil
local Callback18 = nil
local Callback15 = nil
local Callback14 = nil
local Callback17 = nil
local Callback16 = nil
local Callback13 = nil
local Callback12 = nil
local Callback11 = nil
local Module = nil
local Module1 = nil
local Module2 = {}
local Module3 = {}
local Module4 = {}
local Module5 = {}
local Module6 = {}
local Module7 = {}

isType = function(OfType)
	-- upvalues: Callback (ref), Callback1 (ref), Callback3 (ref), Callback5 (ref), Callback6 (ref), Callback7 (ref), Callback2 (ref), Callback4 (ref)
	return Callback(OfType) or (Callback1(OfType) or (Callback3(OfType) or (Callback5(OfType) or (Callback6(OfType) or (Callback7(OfType) or (Callback2(OfType) or Callback4(OfType)))))))
end

local function assertType(p1)
	-- upvalues: isType (ref), Error1 (copy), InspectFunction (copy)
	if not isType(p1) then
		error(Error1.new(("Expected %s to be a GraphQL type."):format(InspectFunction(p1))))
	end
	return p1
end

Callback = function(p1)
	-- upvalues: InstanceOfModule (copy), Module2 (copy)
	return InstanceOfModule(p1, Module2)
end

local function assertScalarType(p1)
	-- upvalues: Callback (ref), Error1 (copy), InspectFunction (copy)
	if not Callback(p1) then
		error(Error1.new(("Expected %s to be a GraphQL Scalar type."):format(InspectFunction(p1))))
	end
	return p1
end

Callback1 = function(p1)
	-- upvalues: InstanceOfModule (copy), Module3 (copy)
	return InstanceOfModule(p1, Module3)
end

local function assertObjectType(p1)
	-- upvalues: Callback1 (ref), Error1 (copy), InspectFunction (copy)
	if not Callback1(p1) then
		error(Error1.new(("Expected %s to be a GraphQL Object type."):format(InspectFunction(p1))))
	end
	return p1
end

Callback3 = function(p1)
	-- upvalues: InstanceOfModule (copy), Module4 (copy)
	return InstanceOfModule(p1, Module4)
end

local function assertInterfaceType(p1)
	-- upvalues: Callback3 (ref), Error1 (copy), InspectFunction (copy)
	if not Callback3(p1) then
		error(Error1.new(("Expected %s to be a GraphQL Interface type."):format(InspectFunction(p1))))
	end
	return p1
end

Callback5 = function(p1)
	-- upvalues: InstanceOfModule (copy), Module5 (copy)
	return InstanceOfModule(p1, Module5)
end

local function assertUnionType(p1)
	-- upvalues: Callback5 (ref), Error1 (copy), InspectFunction (copy)
	if not Callback5(p1) then
		error(Error1.new(("Expected %s to be a GraphQL Union type."):format(InspectFunction(p1))))
	end
	return p1
end

Callback6 = function(p1)
	-- upvalues: InstanceOfModule (copy), Module6 (copy)
	return InstanceOfModule(p1, Module6)
end

local function assertEnumType(p1)
	-- upvalues: Callback6 (ref), Error1 (copy), InspectFunction (copy)
	if not Callback6(p1) then
		error(Error1.new(("Expected %s to be a GraphQL Enum type."):format(InspectFunction(p1))))
	end
	return p1
end

Callback7 = function(p1)
	-- upvalues: InstanceOfModule (copy), Module7 (copy)
	return InstanceOfModule(p1, Module7)
end

local function assertInputObjectType(p1)
	-- upvalues: Callback7 (ref), Error1 (copy), InspectFunction (copy)
	if not Callback7(p1) then
		error(Error1.new(("Expected %s to be a GraphQL Input Object type."):format(InspectFunction(p1))))
	end
	return p1
end

Callback2 = function(p1)
	-- upvalues: InstanceOfModule (copy), Module (ref)
	return InstanceOfModule(p1, Module)
end

local function assertListType(p1)
	-- upvalues: Callback2 (ref), Error1 (copy), InspectFunction (copy)
	if not Callback2(p1) then
		error(Error1.new(("Expected %s to be a GraphQL List type."):format(InspectFunction(p1))))
	end
	return p1
end

Callback4 = function(Type)
	-- upvalues: InstanceOfModule (copy), Module1 (ref)
	return InstanceOfModule(Type, Module1)
end

local function assertNonNullType(p1)
	-- upvalues: Callback4 (ref), Error1 (copy), InspectFunction (copy)
	if not Callback4(p1) then
		error(Error1.new(("Expected %s to be a GraphQL Non-Null type."):format(InspectFunction(p1))))
	end
	return p1
end

local function isInputType(OfType)
	-- upvalues: Callback (ref), Callback6 (ref), Callback7 (ref), Callback8 (ref), isInputType (ref)
	return Callback(OfType) or (Callback6(OfType) or (Callback7(OfType) or Callback8(OfType) and isInputType(OfType.ofType)))
end

local function assertInputType(p1)
	-- upvalues: isInputType (ref), Error1 (copy), InspectFunction (copy)
	if not isInputType(p1) then
		error(Error1.new(("Expected %s to be a GraphQL input type."):format(InspectFunction(p1))))
	end
	return p1
end

local function isOutputType(OfType)
	-- upvalues: Callback (ref), Callback1 (ref), Callback3 (ref), Callback5 (ref), Callback6 (ref), Callback8 (ref), isOutputType (ref)
	return Callback(OfType) or (Callback1(OfType) or (Callback3(OfType) or (Callback5(OfType) or (Callback6(OfType) or Callback8(OfType) and isOutputType(OfType.ofType)))))
end

local function assertOutputType(p1)
	-- upvalues: isOutputType (ref), Error1 (copy), InspectFunction (copy)
	if not isOutputType(p1) then
		error(Error1.new(("Expected %s to be a GraphQL output type."):format(InspectFunction(p1))))
	end
	return p1
end

isLeafType = function(p1)
	-- upvalues: Callback (ref), Callback6 (ref)
	return Callback(p1) or Callback6(p1)
end

local function assertLeafType(p1)
	-- upvalues: isLeafType (ref), Error1 (copy), InspectFunction (copy)
	if not isLeafType(p1) then
		error(Error1.new(("Expected %s to be a GraphQL leaf type."):format(InspectFunction(p1))))
	end
	return p1
end

isCompositeType = function(p1)
	-- upvalues: Callback1 (ref), Callback3 (ref), Callback5 (ref)
	return Callback1(p1) or (Callback3(p1) or Callback5(p1))
end

local function assertCompositeType(p1)
	-- upvalues: isCompositeType (ref), Error1 (copy), InspectFunction (copy)
	if not isCompositeType(p1) then
		error(Error1.new(("Expected %s to be a GraphQL composite type."):format(InspectFunction(p1))))
	end
	return p1
end

isAbstractType = function(p1)
	-- upvalues: Callback3 (ref), Callback5 (ref)
	return Callback3(p1) or Callback5(p1)
end

local function assertAbstractType(p1)
	-- upvalues: isAbstractType (ref), Error1 (copy), InspectFunction (copy)
	if not isAbstractType(p1) then
		error(Error1.new(("Expected %s to be a GraphQL abstract type."):format(InspectFunction(p1))))
	end
	return p1
end

Module = {}
Module.__index = Module

function Module.new(OfType)
	-- upvalues: DevAssertFunction (copy), isType (ref), InspectFunction (copy), Module (ref)
	local t = {}
	DevAssertFunction(isType(OfType), ("Expected %s to be a GraphQL type."):format(InspectFunction(OfType)))
	t.ofType = OfType
	
	return (setmetatable(t, Module))
end

function Module:__tostring()
	return self:toString()
end

function Module:toString(): string
	return "[" .. tostring(self.ofType) .. "]"
end

function Module:toJSON()
	return self:toString()
end

Module1 = {}
Module1.__index = Module1

function Module1.new(OfType)
	-- upvalues: DevAssertFunction (copy), Callback9 (ref), InspectFunction (copy), Module1 (ref)
	local t = {}
	DevAssertFunction(Callback9(OfType), ("Expected %s to be a GraphQL nullable type."):format(InspectFunction(OfType)))
	t.ofType = OfType
	
	return (setmetatable(t, Module1))
end

function Module1:__tostring()
	return self:toString()
end

function Module1:toString(): string
	return tostring(self.ofType) .. "!"
end

function Module1:toJSON()
	return self:toString()
end

Callback8 = function(OfType)
	-- upvalues: Callback2 (ref), Callback4 (ref)
	return Callback2(OfType) or Callback4(OfType)
end

local function assertWrappingType(p1)
	-- upvalues: Callback8 (ref), Error1 (copy), InspectFunction (copy)
	if not Callback8(p1) then
		error(Error1.new(("Expected %s to be a GraphQL wrapping type."):format(InspectFunction(p1))))
	end
	return p1
end

Callback9 = function(OfType): boolean
	-- upvalues: isType (ref), Callback4 (ref)
	return isType(OfType) and not Callback4(OfType)
end

local function assertNullableType(p1)
	-- upvalues: Callback9 (ref), Error1 (copy), InspectFunction (copy)
	if not Callback9(p1) then
		error(Error1.new(("Expected %s to be a GraphQL nullable type."):format(InspectFunction(p1))))
	end
	return p1
end

local function getNullableType(p1)
	-- upvalues: Callback4 (ref)
	return if p1 then if Callback4(p1) then p1.ofType else p1 else nil
end

isNamedType = function(p1)
	-- upvalues: Callback (ref), Callback1 (ref), Callback3 (ref), Callback5 (ref), Callback6 (ref), Callback7 (ref)
	return Callback(p1) or (Callback1(p1) or (Callback3(p1) or (Callback5(p1) or (Callback6(p1) or Callback7(p1)))))
end

local function assertNamedType(p1)
	-- upvalues: isNamedType (ref), Error1 (copy), InspectFunction (copy)
	if not isNamedType(p1) then
		error(Error1.new(("Expected %s to be a GraphQL named type."):format(InspectFunction(p1))))
	end
	return p1
end

local function getNamedType(OfType)
	-- upvalues: Callback8 (ref)
	if not OfType then
		return nil
	end
	local OfType1 = OfType
	while Callback8(OfType1) do
		OfType1 = OfType1.ofType
	end
	return OfType1
end

local function _(Callback)
	return if typeof(Callback) == "function" then Callback() else Callback
end

local _ = function(p1)
	return if p1 and #p1 > 0 then p1 else nil
end

Module2.__index = Module2

function Module2.new(p1)
	-- upvalues: IdentityFunc (copy), ValueFromASTUntypedFunction (copy), ToObjMapFunction (copy), DevAssertFunction (copy), IsNillishFunction (copy), InspectFunction (copy), Module2 (copy)
	local ParseValue = if p1.parseValue then p1.parseValue else IdentityFunc
	local Serialize = if p1.serialize then p1.serialize else IdentityFunc
	local ParseLiteral = if p1.parseLiteral then p1.parseLiteral else function(p2, p3)
		-- upvalues: ParseValue (copy), ValueFromASTUntypedFunction (upval)
		return ParseValue(ValueFromASTUntypedFunction(p2, p3))
	end
	local ExtensionASTNodes = p1.extensionASTNodes
	local config = {
		name = p1.name,
		description = p1.description,
		specifiedByUrl = p1.specifiedByUrl,
		serialize = function(_, ...)
			-- upvalues: Serialize (copy)
			return Serialize(...)
		end,
		parseValue = function(_, ...)
			-- upvalues: ParseValue (copy)
			return ParseValue(...)
		end,
		parseLiteral = function(_, ...)
			-- upvalues: ParseLiteral (copy)
			return ParseLiteral(...)
		end,
		extensions = if p1.extensions then ToObjMapFunction(p1.extensions) else nil,
		astNode = p1.astNode,
		extensionASTNodes = if ExtensionASTNodes and #ExtensionASTNodes > 0 then ExtensionASTNodes else nil
	}
	DevAssertFunction(typeof(p1.name) == "string", "Must provide name.")
	DevAssertFunction(IsNillishFunction(p1.specifiedByUrl) or typeof(p1.specifiedByUrl) == "string", ("%s must provide \"specifiedByUrl\" as a string, "):format(config.name) .. ("but got: %s."):format(InspectFunction(p1.specifiedByUrl)))
	DevAssertFunction(p1.serialize == nil or typeof(p1.serialize) == "function", ("%s must provide \"serialize\" function. If this custom Scalar is also used as an input type, ensure \"parseValue\" and \"parseLiteral\" functions are also provided."):format(config.name))
	
	if p1.parseLiteral then
		DevAssertFunction(typeof(p1.parseValue) == "function" and typeof(p1.parseLiteral) == "function", ("%s must provide both \"parseValue\" and \"parseLiteral\" functions."):format(config.name))
	end
	return (setmetatable(config, Module2))
end

function Module2:toConfig()
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

function Module2:__tostring()
	return self:toString()
end

function Module2:toString()
	return self.name
end

function Module2:toJSON()
	return self:toString()
end

Module3.__index = Module3

function Module3.new(p1)
	-- upvalues: ToObjMapFunction (copy), Callback11 (ref), Callback12 (ref), DevAssertFunction (copy), InspectFunction (copy), Module3 (copy)
	local ExtensionASTNodes = p1.extensionASTNodes
	local config = {
		name = p1.name,
		description = p1.description,
		isTypeOf = p1.isTypeOf,
		extensions = if p1.extensions then ToObjMapFunction(p1.extensions) else nil,
		astNode = p1.astNode,
		extensionASTNodes = if ExtensionASTNodes and #ExtensionASTNodes > 0 then ExtensionASTNodes else nil,
		_fields = function()
			-- upvalues: Callback11 (upval), p1 (copy)
			return Callback11(p1)
		end,
		_interfaces = function()
			-- upvalues: Callback12 (upval), p1 (copy)
			return Callback12(p1)
		end
	}
	DevAssertFunction(typeof(p1.name) == "string", "Must provide name.")
	DevAssertFunction(p1.isTypeOf == nil or typeof(p1.isTypeOf) == "function", ("%s must provide \"isTypeOf\" as a function, but got: %s."):format(config.name, InspectFunction(p1.isTypeOf)))
	
	return (setmetatable(config, Module3))
end

function Module3:getFields()
	if typeof(self._fields) == "function" then
		self._fields = self._fields()
	end
	return self._fields
end

function Module3:getInterfaces()
	if typeof(self._interfaces) == "function" then
		self._interfaces = self._interfaces()
	end
	return self._interfaces
end

function Module3:toConfig()
	-- upvalues: Callback13 (ref)
	return {
		name = self.name,
		description = self.description,
		interfaces = self:getInterfaces(),
		fields = Callback13(self:getFields()),
		isTypeOf = self.isTypeOf,
		extensions = self.extensions,
		astNode = self.astNode,
		extensionASTNodes = self.extensionASTNodes or {}
	}
end

function Module3:__tostring()
	return self:toString()
end

function Module3:toString()
	return self.name
end

function Module3:toJSON()
	return self:toString()
end

Callback12 = function(p1)
	-- upvalues: DevAssertFunction (copy), Array (copy)
	local InterfacesFunction = p1.interfaces
	local InterfacesResult = if typeof(InterfacesFunction) == "function" then InterfacesFunction() else InterfacesFunction
	local InterfacesResult1 = if InterfacesResult then InterfacesResult else {}
	DevAssertFunction(Array.isArray(InterfacesResult1), ("%s interfaces must be an Array or a function which returns an Array."):format(p1.name))
	
	return InterfacesResult1
end

Callback11 = function(p1)
	-- upvalues: DevAssertFunction (copy), Callback14 (ref), InstanceOfModule (copy), Map (copy), CoerceToMapFunction (copy), MapValueOrderedFunction (copy), InspectFunction (copy), Array (copy), ToObjMapFunction (copy)
	local FieldsFunction = p1.fields
	local FieldsResult = if typeof(FieldsFunction) == "function" then FieldsFunction() else FieldsFunction
	DevAssertFunction(Callback14(FieldsResult) or InstanceOfModule(FieldsResult, Map), ("%s fields must be an object with field names as keys or a function which returns such an object."):format(p1.name))
	
	return MapValueOrderedFunction(CoerceToMapFunction(FieldsResult), function(p2, Name)
		-- upvalues: DevAssertFunction (upval), Callback14 (upval), p1 (copy), InspectFunction (upval), InstanceOfModule (upval), Map (upval), Array (upval), CoerceToMapFunction (upval), ToObjMapFunction (upval)
		DevAssertFunction(Callback14(p2), ("%s.%s field config must be an object."):format(p1.name, Name))
		DevAssertFunction(p2.resolve == nil or typeof(p2.resolve) == "function", ("%s.%s field resolver must be a function if "):format(p1.name, Name) .. ("provided, but got: %s."):format(InspectFunction(p2.resolve)))
		local Args = if p2.args then p2.args else {}
		DevAssertFunction(Callback14(Args) or InstanceOfModule(Args, Map), ("%s.%s args must be an object with argument names as keys."):format(p1.name, Name))
		
		return {
			name = Name,
			description = p2.description,
			type = p2.type,
			args = Array.map(CoerceToMapFunction(Args):entries(), function(Entry)
				-- upvalues: ToObjMapFunction (upval)
				local Entry1 = Entry[2]
				
				return {
					name = Entry[1],
					description = Entry1.description,
					type = Entry1.type,
					defaultValue = Entry1.defaultValue,
					deprecationReason = Entry1.deprecationReason,
					extensions = if Entry1.extensions then ToObjMapFunction(Entry1.extensions) else nil,
					astNode = Entry1.astNode
				}
			end),
			resolve = p2.resolve,
			subscribe = p2.subscribe,
			deprecationReason = p2.deprecationReason,
			extensions = if p2.extensions then ToObjMapFunction(p2.extensions) else nil,
			astNode = p2.astNode
		}
	end)
end

Callback14 = function(Args): boolean
	-- upvalues: NullModule (copy), IsObjectLikeFunction (copy), Array (copy)
	return Args ~= NullModule and (IsObjectLikeFunction(Args) and (not Array.isArray(Args) or next(Args) == nil))
end

Callback13 = function(Fields)
	-- upvalues: MapValueOrderedFunction (copy), Callback10 (ref)
	return MapValueOrderedFunction(Fields, function(p1)
		-- upvalues: Callback10 (upval)
		return {
			description = p1.description,
			type = p1.type,
			args = Callback10(p1.args),
			resolve = p1.resolve,
			subscribe = p1.subscribe,
			deprecationReason = p1.deprecationReason,
			extensions = p1.extensions,
			astNode = p1.astNode
		}
	end)
end

Callback10 = function(Args)
	-- upvalues: KeyValMapFunction (copy)
	return KeyValMapFunction(Args, function(p1)
		return p1.name
	end, function(p1)
		return {
			description = p1.description,
			type = p1.type,
			defaultValue = p1.defaultValue,
			deprecationReason = p1.deprecationReason,
			extensions = p1.extensions,
			astNode = p1.astNode
		}
	end)
end

local function isRequiredArgument(p1): boolean
	-- upvalues: Callback4 (ref)
	return Callback4(p1.type) and p1.defaultValue == nil
end

Module4.__index = Module4

function Module4.new(p1)
	-- upvalues: ToObjMapFunction (copy), Callback11 (ref), Callback12 (ref), DevAssertFunction (copy), InspectFunction (copy), Module4 (copy)
	local ExtensionASTNodes = p1.extensionASTNodes
	local config = {
		name = p1.name,
		description = p1.description,
		resolveType = p1.resolveType,
		extensions = if p1.extensions then ToObjMapFunction(p1.extensions) else nil,
		astNode = p1.astNode,
		extensionASTNodes = if ExtensionASTNodes and #ExtensionASTNodes > 0 then ExtensionASTNodes else nil,
		_fields = function()
			-- upvalues: Callback11 (upval), p1 (copy)
			return Callback11(p1)
		end,
		_interfaces = function()
			-- upvalues: Callback12 (upval), p1 (copy)
			return Callback12(p1)
		end
	}
	DevAssertFunction(typeof(p1.name) == "string", "Must provide name.")
	DevAssertFunction(p1.resolveType == nil or typeof(p1.resolveType) == "function", ("%s must provide \"resolveType\" as a function, but got: %s."):format(config.name, InspectFunction(p1.resolveType)))
	
	return (setmetatable(config, Module4))
end

function Module4:getFields()
	if typeof(self._fields) == "function" then
		self._fields = self._fields()
	end
	return self._fields
end

function Module4:getInterfaces()
	if typeof(self._interfaces) == "function" then
		self._interfaces = self._interfaces()
	end
	return self._interfaces
end

function Module4:toConfig()
	-- upvalues: Callback13 (ref)
	return {
		name = self.name,
		description = self.description,
		interfaces = self:getInterfaces(),
		fields = Callback13(self:getFields()),
		resolveType = self.resolveType,
		extensions = self.extensions,
		astNode = self.astNode,
		extensionASTNodes = self.extensionASTNodes or {}
	}
end

function Module4:__tostring()
	return self:toString()
end

function Module4:toString()
	return self.name
end

function Module4:toJSON()
	return self:toString()
end

Module5.__index = Module5

function Module5.new(p1)
	-- upvalues: ToObjMapFunction (copy), Callback15 (ref), DevAssertFunction (copy), InspectFunction (copy), Module5 (copy)
	local ExtensionASTNodes = p1.extensionASTNodes
	local config = {
		name = p1.name,
		description = p1.description,
		resolveType = p1.resolveType,
		extensions = if p1.extensions then ToObjMapFunction(p1.extensions) else nil,
		astNode = p1.astNode,
		extensionASTNodes = if ExtensionASTNodes and #ExtensionASTNodes > 0 then ExtensionASTNodes else nil,
		_types = function()
			-- upvalues: Callback15 (upval), p1 (copy)
			return Callback15(p1)
		end
	}
	DevAssertFunction(typeof(p1.name) == "string", "Must provide name.")
	DevAssertFunction(p1.resolveType == nil or typeof(p1.resolveType) == "function", ("%s must provide \"resolveType\" as a function, but got: %s."):format(config.name, InspectFunction(p1.resolveType)))
	
	return (setmetatable(config, Module5))
end

function Module5:getTypes()
	if typeof(self._types) == "function" then
		self._types = self._types()
	end
	return self._types
end

function Module5:toConfig()
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

function Module5:__tostring()
	return self:toString()
end

function Module5:toString()
	return self.name
end

function Module5:toJSON()
	return self:toString()
end

Callback15 = function(p1)
	-- upvalues: DevAssertFunction (copy), Array (copy)
	local TypesFunction = p1.types
	local TypesResult = if typeof(TypesFunction) == "function" then TypesFunction() else TypesFunction
	DevAssertFunction(Array.isArray(TypesResult), ("Must provide Array of types or a function which returns such an array for Union %s."):format(p1.name))
	
	return TypesResult
end

Module6.__index = Module6

function Module6.new(p1)
	-- upvalues: ToObjMapFunction (copy), Callback16 (ref), Array (copy), FreezeResult (copy), KeyMapFunction (copy), DevAssertFunction (copy), Module6 (copy)
	local ExtensionASTNodes = p1.extensionASTNodes
	local config = {
		name = p1.name,
		description = p1.description,
		extensions = if p1.extensions then ToObjMapFunction(p1.extensions) else nil,
		astNode = p1.astNode,
		extensionASTNodes = if ExtensionASTNodes and #ExtensionASTNodes > 0 then ExtensionASTNodes else nil
	}
	config._values = Callback16(config.name, p1.values)
	config._valueLookup = {}
	Array.forEach(config._values, function(p2)
		-- upvalues: config (copy), FreezeResult (upval)
		if p2.value == p2.value then
			config._valueLookup[p2.value] = p2
			
			return
		else
			config._valueLookup[FreezeResult] = p2
		end
	end)
	config._nameLookup = KeyMapFunction(config._values, function(p2)
		return p2.name
	end)
	DevAssertFunction(typeof(p1.name) == "string", "Must provide name.")
	
	return (setmetatable(config, Module6))
end

function Module6:getValues()
	return self._values
end

function Module6:getValue(p1)
	return self._nameLookup[p1]
end

function Module6:serialize(p1)
	-- upvalues: FreezeResult (copy), GraphQLError (copy), InspectFunction (copy)
	local Value = if p1 == p1 then self._valueLookup[p1] else self._valueLookup[FreezeResult]
	
	if Value == nil then
		error(GraphQLError.new(("Enum \"%s\" cannot represent value: %s"):format(self.name, InspectFunction(p1))))
	end
	return Value.name
end

function Module6:parseValue(p1: string)
	-- upvalues: InspectFunction (copy), GraphQLError (copy), Callback17 (ref)
	if typeof(p1) ~= "string" then
		local InspectResult = InspectFunction(p1)
		error(GraphQLError.new(("Enum \"%s\" cannot represent non-string value: %s." .. Callback17(self, InspectResult)):format(self.name, InspectResult)))
	end
	local Value = self:getValue(p1)
	
	if Value == nil then
		error(GraphQLError.new(("Value \"%s\" does not exist in \"%s\" enum."):format(p1, self.name) .. Callback17(self, p1)))
	end
	return Value.value
end

function Module6:parseLiteral(p1, _)
	-- upvalues: Kind (copy), PrintFunction (copy), GraphQLError (copy), Callback17 (ref)
	if p1.kind ~= Kind.ENUM then
		local PrintResult = PrintFunction(p1)
		error(GraphQLError.new(("Enum \"%s\" cannot represent non-enum value: %s."):format(self.name, PrintResult) .. Callback17(self, PrintResult), p1))
	end
	local Value = self:getValue(p1.value)
	
	if Value == nil then
		local PrintResult = PrintFunction(p1)
		error(GraphQLError.new(("Value \"%s\" does not exist in \"%s\" enum."):format(PrintResult, self.name) .. Callback17(self, PrintResult), p1))
	end
	return Value.value
end

function Module6:toConfig()
	-- upvalues: KeyValMapFunction (copy)
	return {
		name = self.name,
		description = self.description,
		values = KeyValMapFunction(self:getValues(), function(p1)
			return p1.name
		end, function(p1)
			return {
				description = p1.description,
				value = p1.value,
				deprecationReason = p1.deprecationReason,
				extensions = p1.extensions,
				astNode = p1.astNode
			}
		end),
		extensions = self.extensions,
		astNode = self.astNode,
		extensionASTNodes = self.extensionASTNodes or {}
	}
end

function Module6:__tostring()
	return self:toString()
end

function Module6:toString()
	return self.name
end

function Module6:toJSON()
	return self:toString()
end

Callback17 = function(p1, p2)
	-- upvalues: Array (copy), SuggestionListFunction (copy), DidYouMeanFunction (copy)
	return DidYouMeanFunction("the enum value", (SuggestionListFunction(p2, (Array.map(p1:getValues(), function(p3)
		return p3.name
	end)))))
end

Callback16 = function(Name, Values)
	-- upvalues: DevAssertFunction (copy), Callback14 (ref), InstanceOfModule (copy), Map (copy), CoerceToMapFunction (copy), Array (copy), InspectFunction (copy), ToObjMapFunction (copy)
	DevAssertFunction(Callback14(Values) or InstanceOfModule(Values, Map), ("%s values must be an object with value names as keys."):format((tostring(Name))))
	
	return Array.map(CoerceToMapFunction(Values):entries(), function(Entry)
		-- upvalues: DevAssertFunction (upval), Callback14 (upval), Name (copy), InspectFunction (upval), ToObjMapFunction (upval)
		local Entry1 = Entry[1]
		local Entry2 = Entry[2]
		DevAssertFunction(Callback14(Entry2), ("%s.%s must refer to an object with a \"value\" key "):format(tostring(Name), (tostring(Entry1))) .. ("representing an internal value but got: %s."):format(InspectFunction(Entry2)))
		
		return {
			name = tostring(Entry1),
			description = Entry2.description,
			value = if Entry2.value == nil then Entry1 else Entry2.value,
			deprecationReason = Entry2.deprecationReason,
			extensions = if Entry2.extensions then ToObjMapFunction(Entry2.extensions) else nil,
			astNode = Entry2.astNode
		}
	end)
end

Module7.__index = Module7

function Module7.new(p1)
	-- upvalues: ToObjMapFunction (copy), Callback18 (ref), DevAssertFunction (copy), Module7 (copy)
	local ExtensionASTNodes = p1.extensionASTNodes
	local config = {
		name = p1.name,
		description = p1.description,
		extensions = if p1.extensions then ToObjMapFunction(p1.extensions) else nil,
		astNode = p1.astNode,
		extensionASTNodes = if ExtensionASTNodes and #ExtensionASTNodes > 0 then ExtensionASTNodes else nil,
		_fields = function()
			-- upvalues: Callback18 (upval), p1 (copy)
			return Callback18(p1)
		end
	}
	DevAssertFunction(typeof(p1.name) == "string", "Must provide name.")
	
	return (setmetatable(config, Module7))
end

function Module7:getFields()
	if typeof(self._fields) == "function" then
		self._fields = self._fields()
	end
	return self._fields
end

function Module7:toConfig()
	-- upvalues: MapValueOrderedFunction (copy)
	return {
		name = self.name,
		description = self.description,
		fields = MapValueOrderedFunction(self:getFields(), function(p1)
			return {
				description = p1.description,
				type = p1.type,
				defaultValue = p1.defaultValue,
				extensions = p1.extensions,
				astNode = p1.astNode
			}
		end),
		extensions = self.extensions,
		astNode = self.astNode,
		extensionASTNodes = self.extensionASTNodes or {}
	}
end

function Module7:__tostring()
	return self:toString()
end

function Module7:toString()
	return self.name
end

function Module7:toJSON()
	return self:toString()
end

Callback18 = function(p1)
	-- upvalues: DevAssertFunction (copy), Callback14 (ref), InstanceOfModule (copy), Map (copy), CoerceToMapFunction (copy), MapValueOrderedFunction (copy), ToObjMapFunction (copy)
	local FieldsFunction = p1.fields
	local FieldsResult = if typeof(FieldsFunction) == "function" then FieldsFunction() else FieldsFunction
	DevAssertFunction(Callback14(FieldsResult) or InstanceOfModule(FieldsResult, Map), ("%s fields must be an object with field names as keys or a function which returns such an object."):format(p1.name))
	
	return MapValueOrderedFunction(CoerceToMapFunction(FieldsResult), function(p2, Name)
		-- upvalues: DevAssertFunction (upval), p1 (copy), ToObjMapFunction (upval)
		DevAssertFunction(p2.resolve == nil, ("%s.%s field has a resolve property, but Input Types cannot define resolvers."):format(p1.name, Name))
		
		return {
			name = Name,
			description = p2.description,
			type = p2.type,
			defaultValue = p2.defaultValue,
			deprecationReason = p2.deprecationReason,
			extensions = if p2.extensions then ToObjMapFunction(p2.extensions) else nil,
			astNode = p2.astNode
		}
	end)
end

local _ = function()
	return {}
end

return {
	GraphQLList = Module,
	GraphQLNonNull = Module1,
	GraphQLScalarType = Module2,
	GraphQLObjectType = Module3,
	GraphQLInterfaceType = Module4,
	GraphQLUnionType = Module5,
	GraphQLEnumType = Module6,
	GraphQLInputObjectType = Module7,
	isType = isType,
	assertType = assertType,
	isScalarType = Callback,
	assertScalarType = assertScalarType,
	isObjectType = Callback1,
	assertObjectType = assertObjectType,
	isInterfaceType = Callback3,
	assertInterfaceType = assertInterfaceType,
	isUnionType = Callback5,
	assertUnionType = assertUnionType,
	isEnumType = Callback6,
	assertEnumType = assertEnumType,
	isInputObjectType = Callback7,
	assertInputObjectType = assertInputObjectType,
	isListType = Callback2,
	assertListType = assertListType,
	isNonNullType = Callback4,
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
	isWrappingType = Callback8,
	assertWrappingType = assertWrappingType,
	isNullableType = Callback9,
	assertNullableType = assertNullableType,
	getNullableType = getNullableType,
	isNamedType = isNamedType,
	assertNamedType = assertNamedType,
	getNamedType = getNamedType,
	argsToArgsConfig = Callback10,
	isRequiredArgument = isRequiredArgument,
	isRequiredInputField = function(p1): boolean
		-- upvalues: Callback4 (ref)
		return Callback4(p1.type) and p1.defaultValue == nil
	end,
	NULL = NullModule
}