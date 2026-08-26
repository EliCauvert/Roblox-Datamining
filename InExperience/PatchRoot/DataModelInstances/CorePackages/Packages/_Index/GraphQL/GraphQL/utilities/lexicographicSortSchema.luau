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

local function lexicographicSortSchema(p1)
	-- upvalues: isListType (ref), graphQLList (ref), isNonNullType (ref), graphQLNonNull (ref), graphQLDirective (ref), object (ref), sortBy (write), sortObjMap (write), array (ref), sortByName (write), isScalarType (ref), isIntrospectionType (ref), isObjectType (ref), graphQLObjectType (ref), isInterfaceType (ref), graphQLInterfaceType (ref), isUnionType (ref), graphQLUnionType (ref), isEnumType (ref), graphQLEnumType (ref), isInputObjectType (ref), graphQLInputObjectType (ref), invariant (ref), inspect (ref), keyValMap (ref), graphQLSchema (ref)
	local var1 = nil
	local replaceNamedType = nil
	local _ = nil
	local _ = nil
	local sortArgs = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var2 = p1:toConfig()
	
	local function replaceType(p2)
		-- upvalues: isListType (copy), graphQLList (copy), replaceType (ref), isNonNullType (copy), graphQLNonNull (copy), replaceNamedType (write)
		return if isListType(p2) then graphQLList.new(replaceType(p2.ofType)) elseif isNonNullType(p2) then graphQLNonNull.new(replaceType(p2.ofType)) else replaceNamedType(p2)
	end
	
	replaceNamedType = function(p2)
		-- upvalues: var1 (write)
		return var1[p2.name]
	end
	
	local function replaceMaybeType(p2)
		-- upvalues: replaceNamedType (write)
		return if p2 then replaceNamedType(p2) else nil
	end
	
	local function sortDirective(p2)
		-- upvalues: graphQLDirective (copy), object (copy), sortBy (copy), sortArgs (write)
		local var3 = p2:toConfig()
		
		return graphQLDirective.new(object.assign({}, var3, {
			locations = sortBy(var3.locations, function(p3)
				return p3
			end),
			args = sortArgs(var3.args)
		}))
	end
	
	sortArgs = function(p2)
		-- upvalues: sortObjMap (copy), object (copy), replaceType (ref)
		return sortObjMap(p2, function(p3)
			-- upvalues: object (copy), replaceType (copy)
			return object.assign({}, p3, { type = replaceType(p3.type) })
		end)
	end
	
	local function sortFields(p2)
		-- upvalues: sortObjMap (copy), object (copy), replaceType (ref), sortArgs (write)
		return sortObjMap(p2, function(p3)
			-- upvalues: object (copy), replaceType (copy), sortArgs (copy)
			return object.assign({}, p3, {
				type = replaceType(p3.type),
				args = if p3.args then sortArgs(p3.args) else nil
			})
		end)
	end
	
	local function sortInputFields(p2)
		-- upvalues: sortObjMap (copy), object (copy), replaceType (ref)
		return sortObjMap(p2, function(p3)
			-- upvalues: object (copy), replaceType (copy)
			return object.assign({}, p3, { type = replaceType(p3.type) })
		end)
	end
	
	local function sortTypes(p2)
		-- upvalues: array (copy), sortByName (copy), replaceNamedType (write)
		return array.map(sortByName(p2), replaceNamedType)
	end
	
	return graphQLSchema.new(object.assign({}, var2, {
		types = keyValMap(sortByName(var2.types), function(p2)
			return p2.name
		end, function(p2)
			-- upvalues: isScalarType (copy), isIntrospectionType (copy), isObjectType (copy), graphQLObjectType (copy), object (copy), sortTypes (write), sortFields (write), isInterfaceType (copy), graphQLInterfaceType (copy), isUnionType (copy), graphQLUnionType (copy), isEnumType (copy), graphQLEnumType (copy), sortObjMap (copy), isInputObjectType (copy), graphQLInputObjectType (copy), sortInputFields (write), invariant (copy), inspect (copy)
			if isScalarType(p2) or isIntrospectionType(p2) then
				return p2
			elseif isObjectType(p2) then
				local var3 = p2:toConfig()
				
				return graphQLObjectType.new(object.assign({}, var3, {
					interfaces = function()
						-- upvalues: sortTypes (copy), var3 (ref)
						return sortTypes(var3.interfaces)
					end,
					fields = function()
						-- upvalues: sortFields (copy), var3 (ref)
						return sortFields(var3.fields)
					end
				}))
			elseif isInterfaceType(p2) then
				local var4 = p2:toConfig()
				
				return graphQLInterfaceType.new(object.assign({}, var4, {
					interfaces = function()
						-- upvalues: sortTypes (copy), var4 (ref)
						return sortTypes(var4.interfaces)
					end,
					fields = function()
						-- upvalues: sortFields (copy), var4 (ref)
						return sortFields(var4.fields)
					end
				}))
			elseif isUnionType(p2) then
				local var5 = p2:toConfig()
				
				return graphQLUnionType.new(object.assign({}, var5, {
					types = function()
						-- upvalues: sortTypes (copy), var5 (ref)
						return sortTypes(var5.types)
					end
				}))
			elseif isEnumType(p2) then
				local var6 = p2:toConfig()
				
				return graphQLEnumType.new(object.assign({}, var6, {
					values = sortObjMap(var6.values, function(p3)
						return p3
					end)
				}))
			elseif isInputObjectType(p2) then
				local var7 = p2:toConfig()
				
				return graphQLInputObjectType.new(object.assign({}, var7, {
					fields = function()
						-- upvalues: sortInputFields (copy), var7 (ref)
						return sortInputFields(var7.fields)
					end
				}))
			end
			invariant(false, "Unexpected type: " .. inspect(p2))
			error("Unexpected type: " .. inspect(p2))
		end):values(),
		directives = array.map(sortByName(var2.directives), sortDirective),
		query = replaceMaybeType(var2.query),
		mutation = replaceMaybeType(var2.mutation),
		subscription = replaceMaybeType(var2.subscription)
	}))
end

sortObjMap = function(p1, p2)
	-- upvalues: map (ref), sortBy (write)
	local var1 = map.new()
	
	for i, v in ipairs(sortBy(p1:keys(), function(p3)
		return p3
	end)) do
		var1[v] = p2(p1[v])
	end
	return var1
end

sortByName = function(p3)
	-- upvalues: sortBy (write)
	return sortBy(p3, function(p4)
		return p4.name
	end)
end

sortBy = function(p3, p4)
	-- upvalues: array (ref), naturalCompare (ref)
	return array.sort(array.slice(p3), function(p5, p6)
		-- upvalues: p4 (ref), naturalCompare (copy)
		return naturalCompare(p4(p5), p4(p6))
	end)
end

return { lexicographicSortSchema = lexicographicSortSchema }