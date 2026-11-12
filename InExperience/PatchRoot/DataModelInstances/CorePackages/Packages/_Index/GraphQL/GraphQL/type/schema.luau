local Parent = script.Parent.Parent
local LuaUtils = Parent.luaUtils
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Error1 = LuauPolyfillModule.Error
local Map = LuauPolyfillModule.Map
local Set = LuauPolyfillModule.Set
local IsNillishModule = require(LuaUtils.isNillish)
local IsNillishFunction = IsNillishModule.isNillish
local IsNotNillishFunction = IsNillishModule.isNotNillish
local _ = require(LuaUtils.null)
local Jsutils = Parent.jsutils
local InspectFunction = require(Jsutils.inspect).inspect
local ToObjMapFunction = require(Jsutils.toObjMap).toObjMap
local DevAssertFunction = require(Jsutils.devAssert).devAssert
local InstanceOfModule = require(Jsutils.instanceOf)
local IsObjectLikeFunction = require(Jsutils.isObjectLike).isObjectLike
local Schema = require(script.Parent.introspection).__Schema
local _ = require(Parent.language.ast)
local _ = require(Parent.error.GraphQLError)
local DirectivesModule = require(script.Parent.directives)
local IsDirectiveFunction = DirectivesModule.isDirective
local SpecifiedDirectives = DirectivesModule.specifiedDirectives
local _ = require(Jsutils.ObjMap)
local DefinitionModule = require(script.Parent.definition)
local IsObjectTypeFunction = DefinitionModule.isObjectType
local IsInterfaceTypeFunction = DefinitionModule.isInterfaceType
local IsUnionTypeFunction = DefinitionModule.isUnionType
local IsInputObjectTypeFunction = DefinitionModule.isInputObjectType
local GetNamedTypeFunction = DefinitionModule.getNamedType
local Module = nil
local Callback = nil

local function isSchema(p1)
	-- upvalues: InstanceOfModule (copy), Module (ref)
	return InstanceOfModule(p1, Module)
end

local function assertSchema(p1)
	-- upvalues: InstanceOfModule (copy), Module (ref), Error1 (copy), InspectFunction (copy)
	if not InstanceOfModule(p1, Module) then
		error(Error1.new(("Expected %s to be a GraphQL schema."):format(InspectFunction(p1))))
	end
	return p1
end

Module = {}
Module.__index = Module

function Module.new(Message)
	-- upvalues: Module (ref), DevAssertFunction (copy), IsObjectLikeFunction (copy), Array (copy), InspectFunction (copy), ToObjMapFunction (copy), SpecifiedDirectives (copy), Set (copy), Callback (ref), IsNotNillishFunction (copy), IsDirectiveFunction (copy), Schema (copy), Map (copy), IsNillishFunction (copy), Error1 (copy), IsInterfaceTypeFunction (copy), IsObjectTypeFunction (copy)
	local self = setmetatable({}, Module)
	self.__validationErrors = nil
	
	if Message.assumeValid == true then
		self.__validationErrors = {}
	end
	DevAssertFunction(IsObjectLikeFunction(Message), "Must provide configuration object.")
	DevAssertFunction(not Message.types or Array.isArray(Message.types), ("\"types\" must be Array if provided but got: %s."):format(InspectFunction(Message.types)))
	DevAssertFunction(not Message.directives or Array.isArray(Message.directives), "\"directives\" must be Array if provided but got: " .. ("%s."):format(InspectFunction(Message.directives)))
	self.description = Message.description
	self.extensions = if Message.extensions then ToObjMapFunction(Message.extensions) else nil
	self.astNode = Message.astNode
	self.extensionASTNodes = Message.extensionASTNodes
	self._queryType = Message.query
	self._mutationType = Message.mutation
	self._subscriptionType = Message.subscription
	self._directives = Message.directives or SpecifiedDirectives
	local NewSet = Set.new()
	local Iterator = ipairs
	local Types = Message.types or {}
	for _, value in Iterator(Types) do
		NewSet:add(value)
	end
	if Message.types ~= nil then
		for _, _type in ipairs(Message.types) do
			NewSet:delete(_type)
			Callback(_type, NewSet)
		end
	end
	if IsNotNillishFunction(self._queryType) then
		Callback(self._queryType, NewSet)
	end
	if IsNotNillishFunction(self._mutationType) then
		Callback(self._mutationType, NewSet)
	end
	if IsNotNillishFunction(self._subscriptionType) then
		Callback(self._subscriptionType, NewSet)
	end
	for _, directive in ipairs(self._directives) do
		if IsDirectiveFunction(directive) then
			for _, arg in ipairs(directive.args) do
				Callback(arg.type, NewSet)
			end
		end
	end
	Callback(Schema, NewSet)
	self._typeMap = Map.new()
	self._subTypeMap = Map.new()
	self._implementationsMap = Map.new()
	
	for _, value1 in NewSet do
		if not IsNillishFunction(value1) then
			local Name = if typeof(value1) == "table" then value1.name else tostring(value1)
			DevAssertFunction(Name and Name ~= "", "One of the provided types for building the Schema is missing a name.")
			
			if self._typeMap:has(Name) then
				error(Error1.new(("Schema must contain uniquely named types but contains multiple types named \"%s\"."):format(Name)))
			end
			self._typeMap:set(Name, value1)
			
			if IsInterfaceTypeFunction(value1) then
				for _, interface in ipairs(value1:getInterfaces()) do
					if IsInterfaceTypeFunction(interface) then
						local GetResult = self._implementationsMap:get(interface.name)
						
						if GetResult == nil then
							GetResult = { objects = {}, interfaces = {} }
							self._implementationsMap:set(interface.name, GetResult)
						end
						table.insert(GetResult.interfaces, value1)
					end
				end
			elseif IsObjectTypeFunction(value1) then
				for _, interface1 in ipairs(value1:getInterfaces()) do
					if IsInterfaceTypeFunction(interface1) then
						local GetResult = self._implementationsMap:get(interface1.name)
						
						if GetResult == nil then
							GetResult = { objects = {}, interfaces = {} }
							self._implementationsMap:set(interface1.name, GetResult)
						end
						table.insert(GetResult.objects, value1)
					end
				end
			end
		end
	end
	return self
end

function Module:getQueryType()
	return self._queryType
end

function Module:getMutationType()
	return self._mutationType
end

function Module:getSubscriptionType()
	return self._subscriptionType
end

function Module:getTypeMap()
	return self._typeMap
end

function Module:getType(p1)
	return self:getTypeMap()[p1]
end

function Module.getPossibleTypes(p1, p2)
	-- upvalues: IsUnionTypeFunction (copy)
	return if IsUnionTypeFunction(p2) then p2:getTypes() else p1:getImplementations(p2).objects
end

function Module:getImplementations(p1)
	return self._implementationsMap:get(p1.name) or { objects = {}, interfaces = {} }
end

function Module:isSubType(p1, p2): boolean
	-- upvalues: IsUnionTypeFunction (copy)
	local SubType = self._subTypeMap[p1.name]
	
	if SubType == nil then
		SubType = {}
		
		if IsUnionTypeFunction(p1) then
			for _, _type in ipairs(p1:getTypes()) do
				SubType[_type.name] = true
			end
		else
			local Implementations = self:getImplementations(p1)
			
			for _, object in ipairs(Implementations.objects) do
				SubType[object.name] = true
			end
			for _, interface in ipairs(Implementations.interfaces) do
				SubType[interface.name] = true
			end
		end
		self._subTypeMap:set(p1.name, SubType)
	end
	return SubType[p2.name] ~= nil
end

function Module:getDirectives()
	return self._directives
end

function Module:getDirective(Name)
	-- upvalues: Array (copy)
	return Array.find(self:getDirectives(), function(p3): boolean
		-- upvalues: Name (copy)
		return p3.name == Name
	end)
end

function Module:toConfig()
	-- upvalues: Array (copy)
	return {
		description = self.description,
		query = self:getQueryType(),
		mutation = self:getMutationType(),
		subscription = self:getSubscriptionType(),
		types = self:getTypeMap():values(),
		directives = Array.slice(self:getDirectives()),
		extensions = self.extensions,
		astNode = self.astNode,
		extensionASTNodes = self.extensionASTNodes or {},
		assumeValid = self.__validationErrors ~= nil
	}
end

function Module:__tostring(): string
	return "GraphQLSchema"
end

Callback = function(Type, NewResult)
	-- upvalues: GetNamedTypeFunction (copy), IsUnionTypeFunction (copy), Callback (ref), IsObjectTypeFunction (copy), IsInterfaceTypeFunction (copy), IsInputObjectTypeFunction (copy)
	local NamedType = GetNamedTypeFunction(Type)
	
	if not NewResult:has(NamedType) then
		NewResult:add(NamedType)
		
		if IsUnionTypeFunction(NamedType) then
			for _, _type in ipairs(NamedType:getTypes()) do
				Callback(_type, NewResult)
			end
			return NewResult
		elseif IsObjectTypeFunction(NamedType) or IsInterfaceTypeFunction(NamedType) then
			for _, interface in ipairs(NamedType:getInterfaces()) do
				Callback(interface, NewResult)
			end
			for _, value in ipairs(NamedType:getFields():values()) do
				Callback(value.type, NewResult)
				
				for _, arg in ipairs(value.args) do
					Callback(arg.type, NewResult)
				end
			end
			return NewResult
		elseif IsInputObjectTypeFunction(NamedType) then
			for _, value1 in ipairs(NamedType:getFields():values()) do
				Callback(value1.type, NewResult)
			end
		end
	end
	return NewResult
end

return {
	isSchema = isSchema,
	assertSchema = assertSchema,
	GraphQLSchema = Module
}