local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Map = LuauPolyfillModule.Map
local Object = LuauPolyfillModule.Object
local InspectFunction = require(Parent.jsutils.inspect).inspect
local InvariantFunction = require(Parent.jsutils.invariant).invariant
local KeyValMapFunction = require(Parent.jsutils.keyValMap).keyValMap
local NaturalCompareFunction = require(Parent.jsutils.naturalCompare).naturalCompare
local GraphQLSchema = require(Parent.type.schema).GraphQLSchema
local GraphQLDirective = require(Parent.type.directives).GraphQLDirective
local DefinitionModule = require(Parent.type.definition)
local _ = require(Parent.language.ast)
local IsIntrospectionTypeFunction = require(Parent.type.introspection).isIntrospectionType
local GraphQLList = DefinitionModule.GraphQLList
local GraphQLNonNull = DefinitionModule.GraphQLNonNull
local GraphQLObjectType = DefinitionModule.GraphQLObjectType
local GraphQLInterfaceType = DefinitionModule.GraphQLInterfaceType
local GraphQLUnionType = DefinitionModule.GraphQLUnionType
local GraphQLEnumType = DefinitionModule.GraphQLEnumType
local GraphQLInputObjectType = DefinitionModule.GraphQLInputObjectType
local IsListTypeFunction = DefinitionModule.isListType
local IsNonNullTypeFunction = DefinitionModule.isNonNullType
local IsScalarTypeFunction = DefinitionModule.isScalarType
local IsObjectTypeFunction = DefinitionModule.isObjectType
local IsInterfaceTypeFunction = DefinitionModule.isInterfaceType
local IsUnionTypeFunction = DefinitionModule.isUnionType
local IsEnumTypeFunction = DefinitionModule.isEnumType
local IsInputObjectTypeFunction = DefinitionModule.isInputObjectType
local Callback2 = nil
local Callback = nil
local Callback1 = nil

local function lexicographicSortSchema(p1)
	-- upvalues: IsListTypeFunction (copy), GraphQLList (copy), IsNonNullTypeFunction (copy), GraphQLNonNull (copy), GraphQLDirective (copy), Object (copy), Callback1 (ref), Callback2 (ref), Array (copy), Callback (ref), IsScalarTypeFunction (copy), IsIntrospectionTypeFunction (copy), IsObjectTypeFunction (copy), GraphQLObjectType (copy), IsInterfaceTypeFunction (copy), GraphQLInterfaceType (copy), IsUnionTypeFunction (copy), GraphQLUnionType (copy), IsEnumTypeFunction (copy), GraphQLEnumType (copy), IsInputObjectTypeFunction (copy), GraphQLInputObjectType (copy), InvariantFunction (copy), InspectFunction (copy), KeyValMapFunction (copy), GraphQLSchema (copy)
	local v1 = nil
	local Callback3 = nil
	local Callback4 = nil
	local sortFields = nil
	local sortInputFields = nil
	local sortTypes = nil
	local Config = p1:toConfig()
	
	local function replaceType(Type)
		-- upvalues: IsListTypeFunction (upval), GraphQLList (upval), replaceType (copy), IsNonNullTypeFunction (upval), GraphQLNonNull (upval), Callback3 (ref)
		return if IsListTypeFunction(Type) then GraphQLList.new(replaceType(Type.ofType)) elseif IsNonNullTypeFunction(Type) then GraphQLNonNull.new(replaceType(Type.ofType)) else Callback3(Type)
	end
	
	Callback3 = function(p2)
		-- upvalues: v1 (ref)
		return v1[p2.name]
	end
	
	local function replaceMaybeType(Mutation)
		-- upvalues: Callback3 (ref)
		return if Mutation then Callback3(Mutation) else nil
	end
	
	local function sortDirective(p2)
		-- upvalues: GraphQLDirective (upval), Object (upval), Callback1 (upval), Callback4 (ref)
		local Config = p2:toConfig()
		
		return GraphQLDirective.new(Object.assign({}, Config, {
			locations = Callback1(Config.locations, function(p3)
				return p3
			end),
			args = Callback4(Config.args)
		}))
	end
	
	Callback4 = function(Args)
		-- upvalues: Callback2 (upval), Object (upval), replaceType (copy)
		return Callback2(Args, function(p2)
			-- upvalues: Object (upval), replaceType (upval)
			return Object.assign({}, p2, { type = replaceType(p2.type) })
		end)
	end
	
	sortFields = function(Fields)
		-- upvalues: Callback2 (upval), Object (upval), replaceType (copy), Callback4 (ref)
		return Callback2(Fields, function(p2)
			-- upvalues: Object (upval), replaceType (upval), Callback4 (upval)
			return Object.assign({}, p2, {
				type = replaceType(p2.type),
				args = if p2.args then Callback4(p2.args) else nil
			})
		end)
	end
	
	sortInputFields = function(Fields)
		-- upvalues: Callback2 (upval), Object (upval), replaceType (copy)
		return Callback2(Fields, function(p2)
			-- upvalues: Object (upval), replaceType (upval)
			return Object.assign({}, p2, { type = replaceType(p2.type) })
		end)
	end
	
	sortTypes = function(Interfaces)
		-- upvalues: Array (upval), Callback (upval), Callback3 (ref)
		return Array.map(Callback(Interfaces), Callback3)
	end
	
	v1 = KeyValMapFunction(Callback(Config.types), function(p2)
		return p2.name
	end, function(p2)
		-- upvalues: IsScalarTypeFunction (upval), IsIntrospectionTypeFunction (upval), IsObjectTypeFunction (upval), GraphQLObjectType (upval), Object (upval), sortTypes (ref), sortFields (ref), IsInterfaceTypeFunction (upval), GraphQLInterfaceType (upval), IsUnionTypeFunction (upval), GraphQLUnionType (upval), IsEnumTypeFunction (upval), GraphQLEnumType (upval), Callback2 (upval), IsInputObjectTypeFunction (upval), GraphQLInputObjectType (upval), sortInputFields (ref), InvariantFunction (upval), InspectFunction (upval)
		if IsScalarTypeFunction(p2) or IsIntrospectionTypeFunction(p2) then
			return p2
		elseif IsObjectTypeFunction(p2) then
			local Config = p2:toConfig()
			
			return GraphQLObjectType.new(Object.assign({}, Config, {
				interfaces = function()
					-- upvalues: sortTypes (upval), Config (copy)
					return sortTypes(Config.interfaces)
				end,
				fields = function()
					-- upvalues: sortFields (upval), Config (copy)
					return sortFields(Config.fields)
				end
			}))
		elseif IsInterfaceTypeFunction(p2) then
			local Config1 = p2:toConfig()
			
			return GraphQLInterfaceType.new(Object.assign({}, Config1, {
				interfaces = function()
					-- upvalues: sortTypes (upval), Config1 (copy)
					return sortTypes(Config1.interfaces)
				end,
				fields = function()
					-- upvalues: sortFields (upval), Config1 (copy)
					return sortFields(Config1.fields)
				end
			}))
		elseif IsUnionTypeFunction(p2) then
			local Config2 = p2:toConfig()
			
			return GraphQLUnionType.new(Object.assign({}, Config2, {
				types = function()
					-- upvalues: sortTypes (upval), Config2 (copy)
					return sortTypes(Config2.types)
				end
			}))
		elseif IsEnumTypeFunction(p2) then
			local Config3 = p2:toConfig()
			
			return GraphQLEnumType.new(Object.assign({}, Config3, {
				values = Callback2(Config3.values, function(p3)
					return p3
				end)
			}))
		elseif IsInputObjectTypeFunction(p2) then
			local Config4 = p2:toConfig()
			
			return GraphQLInputObjectType.new(Object.assign({}, Config4, {
				fields = function()
					-- upvalues: sortInputFields (upval), Config4 (copy)
					return sortInputFields(Config4.fields)
				end
			}))
		else
			InvariantFunction(false, "Unexpected type: " .. InspectFunction(p2))
			error("Unexpected type: " .. InspectFunction(p2))
		end
	end)
	
	return GraphQLSchema.new(Object.assign({}, Config, {
		types = v1:values(),
		directives = Array.map(Callback(Config.directives), sortDirective),
		query = replaceMaybeType(Config.query),
		mutation = replaceMaybeType(Config.mutation),
		subscription = replaceMaybeType(Config.subscription)
	}))
end

Callback2 = function(Values, Callback)
	-- upvalues: Map (copy), Callback1 (ref)
	local NewMap = Map.new()
	
	for _, value in ipairs((Callback1(Values:keys(), function(p1)
		return p1
	end))) do
		NewMap[value] = Callback(Values[value])
	end
	return NewMap
end

Callback = function(Directives)
	-- upvalues: Callback1 (ref)
	return Callback1(Directives, function(p1)
		return p1.name
	end)
end

Callback1 = function(KeysResult, Callback)
	-- upvalues: Array (copy), NaturalCompareFunction (copy)
	return Array.sort(Array.slice(KeysResult), function(p1, p2)
		-- upvalues: Callback (copy), NaturalCompareFunction (upval)
		return NaturalCompareFunction(Callback(p1), (Callback(p2)))
	end)
end

return { lexicographicSortSchema = lexicographicSortSchema }