local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local inspect = require(parent.jsutils.inspect).inspect
local invariant = require(parent.jsutils.invariant).invariant
local keyValMap = require(parent.jsutils.keyValMap).keyValMap
local naturalCompare = require(parent.jsutils.naturalCompare).naturalCompare
local graphQLSchema = require(parent.type.schema).GraphQLSchema
local graphQLDirective = require(parent.type.directives).GraphQLDirective
local definitionModule = require(parent.type.definition)
local _ = require(parent.language.ast)
local isIntrospectionType = require(parent.type.introspection).isIntrospectionType
local graphQLList = definitionModule.GraphQLList
local graphQLNonNull = definitionModule.GraphQLNonNull
local graphQLObjectType = definitionModule.GraphQLObjectType
local graphQLInterfaceType = definitionModule.GraphQLInterfaceType
local graphQLUnionType = definitionModule.GraphQLUnionType
local graphQLEnumType = definitionModule.GraphQLEnumType
local graphQLInputObjectType = definitionModule.GraphQLInputObjectType
local isListType = definitionModule.isListType
local isNonNullType = definitionModule.isNonNullType
local isScalarType = definitionModule.isScalarType
local isObjectType = definitionModule.isObjectType
local isInterfaceType = definitionModule.isInterfaceType
local isUnionType = definitionModule.isUnionType
local isEnumType = definitionModule.isEnumType
local isInputObjectType = definitionModule.isInputObjectType
local sortObjMap = nil
local sortByName = nil
local sortBy = nil

local function lexicographicSortSchema(p0)
	-- upvalues: isListType (ref), graphQLList (ref), isNonNullType (ref), graphQLNonNull (ref), graphQLDirective (ref), object (ref), sortBy (write), sortObjMap (write), array (ref), sortByName (write), isScalarType (ref), isIntrospectionType (ref), isObjectType (ref), graphQLObjectType (ref), isInterfaceType (ref), graphQLInterfaceType (ref), isUnionType (ref), graphQLUnionType (ref), isEnumType (ref), graphQLEnumType (ref), isInputObjectType (ref), graphQLInputObjectType (ref), invariant (ref), inspect (ref), keyValMap (ref), graphQLSchema (ref)
	local var6 = nil
	local replaceNamedType = nil
	local _ = nil
	local _ = nil
	local sortArgs = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var9 = p0:toConfig()
	
	local function replaceType(p1)
		-- upvalues: isListType (copy), graphQLList (copy), replaceType (ref), isNonNullType (copy), graphQLNonNull (copy), replaceNamedType (write)
		return if isListType(p1) then graphQLList.new(replaceType(p1.ofType)) elseif isNonNullType(p1) then graphQLNonNull.new(replaceType(p1.ofType)) else replaceNamedType(p1)
	end
	
	replaceNamedType = function(p2)
		-- upvalues: var6 (write)
		return var6[p2.name]
	end
	
	local function replaceMaybeType(p3)
		-- upvalues: replaceNamedType (write)
		return if p3 then replaceNamedType(p3) else nil
	end
	
	local function sortDirective(p4)
		-- upvalues: graphQLDirective (copy), object (copy), sortBy (copy), sortArgs (write)
		local var16 = p4:toConfig()
		
		return graphQLDirective.new(object.assign({}, var16, {
			locations = sortBy(var16.locations, function(p5)
				return p5
			end),
			args = sortArgs(var16.args)
		}))
	end
	
	sortArgs = function(p6)
		-- upvalues: sortObjMap (copy), object (copy), replaceType (ref)
		return sortObjMap(p6, function(p7)
			-- upvalues: object (copy), replaceType (copy)
			return object.assign({}, p7, { type = replaceType(p7.type) })
		end)
	end
	
	local function sortFields(p8)
		-- upvalues: sortObjMap (copy), object (copy), replaceType (ref), sortArgs (write)
		return sortObjMap(p8, function(p9)
			-- upvalues: object (copy), replaceType (copy), sortArgs (copy)
			return object.assign({}, p9, {
				type = replaceType(p9.type),
				args = if p9.args then sortArgs(p9.args) else nil
			})
		end)
	end
	
	local function sortInputFields(p10)
		-- upvalues: sortObjMap (copy), object (copy), replaceType (ref)
		return sortObjMap(p10, function(p11)
			-- upvalues: object (copy), replaceType (copy)
			return object.assign({}, p11, { type = replaceType(p11.type) })
		end)
	end
	
	local function sortTypes(p12)
		-- upvalues: array (copy), sortByName (copy), replaceNamedType (write)
		return array.map(sortByName(p12), replaceNamedType)
	end
	
	return graphQLSchema.new(object.assign({}, var9, {
		types = keyValMap(sortByName(var9.types), function(p13)
			return p13.name
		end, function(p14)
			-- upvalues: isScalarType (copy), isIntrospectionType (copy), isObjectType (copy), graphQLObjectType (copy), object (copy), sortTypes (write), sortFields (write), isInterfaceType (copy), graphQLInterfaceType (copy), isUnionType (copy), graphQLUnionType (copy), isEnumType (copy), graphQLEnumType (copy), sortObjMap (copy), isInputObjectType (copy), graphQLInputObjectType (copy), sortInputFields (write), invariant (copy), inspect (copy)
			if isScalarType(p14) or isIntrospectionType(p14) then
				return p14
			elseif isObjectType(p14) then
				local var17 = p14:toConfig()
				
				return graphQLObjectType.new(object.assign({}, var17, {
					interfaces = function()
						-- upvalues: sortTypes (copy), var17 (ref)
						return sortTypes(var17.interfaces)
					end,
					fields = function()
						-- upvalues: sortFields (copy), var17 (ref)
						return sortFields(var17.fields)
					end
				}))
			elseif isInterfaceType(p14) then
				local var18 = p14:toConfig()
				
				return graphQLInterfaceType.new(object.assign({}, var18, {
					interfaces = function()
						-- upvalues: sortTypes (copy), var18 (ref)
						return sortTypes(var18.interfaces)
					end,
					fields = function()
						-- upvalues: sortFields (copy), var18 (ref)
						return sortFields(var18.fields)
					end
				}))
			elseif isUnionType(p14) then
				local var19 = p14:toConfig()
				
				return graphQLUnionType.new(object.assign({}, var19, {
					types = function()
						-- upvalues: sortTypes (copy), var19 (ref)
						return sortTypes(var19.types)
					end
				}))
			elseif isEnumType(p14) then
				local var20 = p14:toConfig()
				
				return graphQLEnumType.new(object.assign({}, var20, {
					values = sortObjMap(var20.values, function(p15)
						return p15
					end)
				}))
			elseif isInputObjectType(p14) then
				local var21 = p14:toConfig()
				
				return graphQLInputObjectType.new(object.assign({}, var21, {
					fields = function()
						-- upvalues: sortInputFields (copy), var21 (ref)
						return sortInputFields(var21.fields)
					end
				}))
			end
			invariant(false, "Unexpected type: " .. inspect(p14))
			error("Unexpected type: " .. inspect(p14))
		end):values(),
		directives = array.map(sortByName(var9.directives), sortDirective),
		query = replaceMaybeType(var9.query),
		mutation = replaceMaybeType(var9.mutation),
		subscription = replaceMaybeType(var9.subscription)
	}))
end

sortObjMap = function(p16, p17)
	-- upvalues: map (ref), sortBy (write)
	local var22 = map.new()
	
	for i, v in ipairs(sortBy(p16:keys(), function(p18)
		return p18
	end)) do
		var22[v] = p17(p16[v])
	end
	return var22
end

sortByName = function(p19)
	-- upvalues: sortBy (write)
	return sortBy(p19, function(p20)
		return p20.name
	end)
end

sortBy = function(p21, p22)
	-- upvalues: array (ref), naturalCompare (ref)
	return array.sort(array.slice(p21), function(p23, p24)
		-- upvalues: p22 (ref), naturalCompare (copy)
		return naturalCompare(p22(p23), p22(p24))
	end)
end

return { lexicographicSortSchema = lexicographicSortSchema }