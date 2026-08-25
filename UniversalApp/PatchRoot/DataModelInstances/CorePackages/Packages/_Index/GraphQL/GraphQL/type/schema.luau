local parent = script.Parent.Parent
local luaUtils = parent.luaUtils
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local error = luauPolyfillModule.Error
local map = luauPolyfillModule.Map
local set = luauPolyfillModule.Set
local isNillishModule = require(luaUtils.isNillish)
local isNillish = isNillishModule.isNillish
local isNotNillish = isNillishModule.isNotNillish
local _ = require(luaUtils.null)
local jsutils = parent.jsutils
local inspect = require(jsutils.inspect).inspect
local toObjMap = require(jsutils.toObjMap).toObjMap
local devAssert = require(jsutils.devAssert).devAssert
local instanceOfModule = require(jsutils.instanceOf)
local isObjectLike = require(jsutils.isObjectLike).isObjectLike
local schema = require(script.Parent.introspection).__Schema
local _ = require(parent.language.ast)
local _ = require(parent.error.GraphQLError)
local directivesModule = require(script.Parent.directives)
local isDirective = directivesModule.isDirective
local specifiedDirectives = directivesModule.specifiedDirectives
local _ = require(jsutils.ObjMap)
local definitionModule = require(script.Parent.definition)
local isObjectType = definitionModule.isObjectType
local isInterfaceType = definitionModule.isInterfaceType
local isUnionType = definitionModule.isUnionType
local isInputObjectType = definitionModule.isInputObjectType
local getNamedType = definitionModule.getNamedType
local t = nil
local collectReferencedTypes = nil

local function isSchema(p0)
	-- upvalues: instanceOfModule (ref), t (write)
	return instanceOfModule(p0, t)
end

local function assertSchema(p1)
	-- upvalues: instanceOfModule (ref), t (write), error (ref), inspect (ref)
	if not instanceOfModule(p1, t) then
		error(error.new(("Expected %s to be a GraphQL schema."):format(inspect(p1))))
	end
	return p1
end

t = {}
t.__index = t

function t.new(p2)
	-- upvalues: t (write), devAssert (ref), isObjectLike (ref), array (ref), inspect (ref), toObjMap (ref), specifiedDirectives (ref), set (ref), collectReferencedTypes (write), isNotNillish (ref), isDirective (ref), schema (ref), map (ref), isNillish (ref), error (ref), isInterfaceType (ref), isObjectType (ref)
	local tbl = setmetatable({}, t)
	tbl.__validationErrors = nil
	
	if p2.assumeValid == true then
		tbl.__validationErrors = {}
	end
	devAssert(isObjectLike(p2), "Must provide configuration object.")
	devAssert(not p2.types or array.isArray(p2.types), ("\"types\" must be Array if provided but got: %s."):format(inspect(p2.types)))
	devAssert(not p2.directives or array.isArray(p2.directives), "\"directives\" must be Array if provided but got: " .. ("%s."):format(inspect(p2.directives)))
	tbl.description = p2.description
	tbl.extensions = if p2.extensions then toObjMap(p2.extensions) else nil
	tbl.astNode = p2.astNode
	tbl.extensionASTNodes = p2.extensionASTNodes
	tbl._queryType = p2.query
	tbl._mutationType = p2.mutation
	tbl._subscriptionType = p2.subscription
	tbl._directives = p2.directives or specifiedDirectives
	local var10 = set.new()
	
	for i, v in ipairs(p2.types or {}) do
		var10:add(v)
	end
	if p2.types ~= nil then
		for i, v_1 in ipairs(p2.types) do
			var10:delete(v_1)
			collectReferencedTypes(v_1, var10)
		end
	end
	if isNotNillish(tbl._queryType) then
		collectReferencedTypes(tbl._queryType, var10)
	end
	if isNotNillish(tbl._mutationType) then
		collectReferencedTypes(tbl._mutationType, var10)
	end
	if isNotNillish(tbl._subscriptionType) then
		collectReferencedTypes(tbl._subscriptionType, var10)
	end
	for i, v_1 in ipairs(tbl._directives) do
		if isDirective(v_1) then
			for i_5, v_2 in ipairs(v_1.args) do
				collectReferencedTypes(v_2.type, var10)
			end
		end
	end
	collectReferencedTypes(schema, var10)
	tbl._typeMap = map.new()
	tbl._subTypeMap = map.new()
	tbl._implementationsMap = map.new()
	
	for i, v_2 in var10 do
		if not isNillish(v_2) then
			local var11 = if typeof(v_2) == "table" then v_2.name else tostring(v_2)
			devAssert(var11 and var11 ~= "", "One of the provided types for building the Schema is missing a name.")
			
			if tbl._typeMap:has(var11) then
				error(error.new(("Schema must contain uniquely named types but contains multiple types named \"%s\"."):format(var11)))
			end
			tbl._typeMap:set(var11, v_2)
			
			if isInterfaceType(v_2) then
				for i_4, v_3 in ipairs(v_2:getInterfaces()) do
					if isInterfaceType(v_3) then
						local name = tbl._implementationsMap:get(v_3.name)
						
						if name == nil then
							name = { objects = {}, interfaces = {} }
							tbl._implementationsMap:set(v_3.name, name)
						end
						table.insert(name.interfaces, v_2)
					end
				end
			elseif isObjectType(v_2) then
				for i_4, v_3 in ipairs(v_2:getInterfaces()) do
					if isInterfaceType(v_3) then
						local name = tbl._implementationsMap:get(v_3.name)
						
						if name == nil then
							name = { objects = {}, interfaces = {} }
							tbl._implementationsMap:set(v_3.name, name)
						end
						table.insert(name.objects, v_2)
					end
				end
			end
		end
	end
	return tbl
end

function t:getQueryType()
	return self._queryType
end

function t:getMutationType()
	return self._mutationType
end

function t:getSubscriptionType()
	return self._subscriptionType
end

function t:getTypeMap()
	return self._typeMap
end

function t:getType(p3)
	return self:getTypeMap()[p3]
end

function t:getPossibleTypes(p4)
	-- upvalues: isUnionType (ref)
	return if isUnionType(p4) then p4:getTypes() else self:getImplementations(p4).objects
end

function t:getImplementations(p5)
	return self._implementationsMap:get(p5.name) or { objects = {}, interfaces = {} }
end

function t:isSubType(p6, p7)
	-- upvalues: isUnionType (ref)
	local name = self._subTypeMap[p6.name]
	
	if name == nil then
		name = {}
		
		if isUnionType(p6) then
			for i, v in ipairs(p6:getTypes()) do
				name[v.name] = true
			end
		else
			local var14 = self:getImplementations(p6)
			
			for i, v in ipairs(var14.objects) do
				name[v.name] = true
			end
			for i_1, v_1 in ipairs(var14.interfaces) do
				name[v_1.name] = true
			end
		end
		self._subTypeMap:set(p6.name, name)
	end
	return name[p7.name] ~= nil
end

function t:getDirectives()
	return self._directives
end

function t:getDirective(p8)
	-- upvalues: array (ref)
	return array.find(self:getDirectives(), function(p9)
		-- upvalues: p8 (ref)
		return p9.name == p8
	end)
end

function t:toConfig()
	-- upvalues: array (ref)
	return {
		description = self.description,
		query = self:getQueryType(),
		mutation = self:getMutationType(),
		subscription = self:getSubscriptionType(),
		types = self:getTypeMap():values(),
		directives = array.slice(self:getDirectives()),
		extensions = self.extensions,
		astNode = self.astNode,
		extensionASTNodes = self.extensionASTNodes or {},
		assumeValid = self.__validationErrors ~= nil
	}
end

function t:__tostring()
	return "GraphQLSchema"
end

collectReferencedTypes = function(p10, p11)
	-- upvalues: getNamedType (ref), isUnionType (ref), collectReferencedTypes (write), isObjectType (ref), isInterfaceType (ref), isInputObjectType (ref)
	local var15 = getNamedType(p10)
	
	if not p11:has(var15) then
		p11:add(var15)
		
		if isUnionType(var15) then
			for i, v in ipairs(var15:getTypes()) do
				collectReferencedTypes(v, p11)
			end
			return p11
		elseif isObjectType(var15) or isInterfaceType(var15) then
			for i, v in ipairs(var15:getInterfaces()) do
				collectReferencedTypes(v, p11)
			end
			for i, v_1 in ipairs(var15:getFields():values()) do
				collectReferencedTypes(v_1.type, p11)
				
				for i_2, v_2 in ipairs(v_1.args) do
					collectReferencedTypes(v_2.type, p11)
				end
			end
			return p11
		elseif isInputObjectType(var15) then
			for i, v in ipairs(var15:getFields():values()) do
				collectReferencedTypes(v.type, p11)
			end
		end
	end
	return p11
end

return {
	isSchema = isSchema,
	assertSchema = assertSchema,
	GraphQLSchema = t
}