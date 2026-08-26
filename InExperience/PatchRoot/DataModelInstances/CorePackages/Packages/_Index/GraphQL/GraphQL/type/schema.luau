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

local function isSchema(p1)
	-- upvalues: instanceOfModule (ref), t (write)
	return instanceOfModule(p1, t)
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

function t.new(p1)
	-- upvalues: t (write), devAssert (ref), isObjectLike (ref), array (ref), inspect (ref), toObjMap (ref), specifiedDirectives (ref), set (ref), collectReferencedTypes (write), isNotNillish (ref), isDirective (ref), schema (ref), map (ref), isNillish (ref), error (ref), isInterfaceType (ref), isObjectType (ref)
	local tbl = setmetatable({}, t)
	tbl.__validationErrors = nil
	
	if p1.assumeValid == true then
		tbl.__validationErrors = {}
	end
	devAssert(isObjectLike(p1), "Must provide configuration object.")
	devAssert(not p1.types or array.isArray(p1.types), ("\"types\" must be Array if provided but got: %s."):format(inspect(p1.types)))
	devAssert(not p1.directives or array.isArray(p1.directives), "\"directives\" must be Array if provided but got: " .. ("%s."):format(inspect(p1.directives)))
	tbl.description = p1.description
	tbl.extensions = if p1.extensions then toObjMap(p1.extensions) else nil
	tbl.astNode = p1.astNode
	tbl.extensionASTNodes = p1.extensionASTNodes
	tbl._queryType = p1.query
	tbl._mutationType = p1.mutation
	tbl._subscriptionType = p1.subscription
	tbl._directives = p1.directives or specifiedDirectives
	local var1 = set.new()
	
	for i, v in ipairs(p1.types or {}) do
		var1:add(v)
	end
	if p1.types ~= nil then
		for i, v_1 in ipairs(p1.types) do
			var1:delete(v_1)
			collectReferencedTypes(v_1, var1)
		end
	end
	if isNotNillish(tbl._queryType) then
		collectReferencedTypes(tbl._queryType, var1)
	end
	if isNotNillish(tbl._mutationType) then
		collectReferencedTypes(tbl._mutationType, var1)
	end
	if isNotNillish(tbl._subscriptionType) then
		collectReferencedTypes(tbl._subscriptionType, var1)
	end
	for i, v_1 in ipairs(tbl._directives) do
		if isDirective(v_1) then
			for i_5, v_2 in ipairs(v_1.args) do
				collectReferencedTypes(v_2.type, var1)
			end
		end
	end
	collectReferencedTypes(schema, var1)
	tbl._typeMap = map.new()
	tbl._subTypeMap = map.new()
	tbl._implementationsMap = map.new()
	
	for i, v_2 in var1 do
		if not isNillish(v_2) then
			local var2 = if typeof(v_2) == "table" then v_2.name else tostring(v_2)
			devAssert(var2 and var2 ~= "", "One of the provided types for building the Schema is missing a name.")
			
			if tbl._typeMap:has(var2) then
				error(error.new(("Schema must contain uniquely named types but contains multiple types named \"%s\"."):format(var2)))
			end
			tbl._typeMap:set(var2, v_2)
			
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

function t:getType(p2)
	return self:getTypeMap()[p2]
end

function t:getPossibleTypes(p2)
	-- upvalues: isUnionType (ref)
	return if isUnionType(p2) then p2:getTypes() else self:getImplementations(p2).objects
end

function t:getImplementations(p2)
	return self._implementationsMap:get(p2.name) or { objects = {}, interfaces = {} }
end

function t:isSubType(p2, p3)
	-- upvalues: isUnionType (ref)
	local name = self._subTypeMap[p2.name]
	
	if name == nil then
		name = {}
		
		if isUnionType(p2) then
			for i, v in ipairs(p2:getTypes()) do
				name[v.name] = true
			end
		else
			local var3 = self:getImplementations(p2)
			
			for i, v in ipairs(var3.objects) do
				name[v.name] = true
			end
			for i_1, v_1 in ipairs(var3.interfaces) do
				name[v_1.name] = true
			end
		end
		self._subTypeMap:set(p2.name, name)
	end
	return name[p3.name] ~= nil
end

function t:getDirectives()
	return self._directives
end

function t:getDirective(p4)
	-- upvalues: array (ref)
	return array.find(self:getDirectives(), function(p5)
		-- upvalues: p4 (ref)
		return p5.name == p4
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

collectReferencedTypes = function(p4, p5)
	-- upvalues: getNamedType (ref), isUnionType (ref), collectReferencedTypes (write), isObjectType (ref), isInterfaceType (ref), isInputObjectType (ref)
	local var4 = getNamedType(p4)
	
	if not p5:has(var4) then
		p5:add(var4)
		
		if isUnionType(var4) then
			for i, v in ipairs(var4:getTypes()) do
				collectReferencedTypes(v, p5)
			end
			return p5
		elseif isObjectType(var4) or isInterfaceType(var4) then
			for i, v in ipairs(var4:getInterfaces()) do
				collectReferencedTypes(v, p5)
			end
			for i, v_1 in ipairs(var4:getFields():values()) do
				collectReferencedTypes(v_1.type, p5)
				
				for i_2, v_2 in ipairs(v_1.args) do
					collectReferencedTypes(v_2.type, p5)
				end
			end
			return p5
		elseif isInputObjectType(var4) then
			for i, v in ipairs(var4:getFields():values()) do
				collectReferencedTypes(v.type, p5)
			end
		end
	end
	return p5
end

return {
	isSchema = isSchema,
	assertSchema = assertSchema,
	GraphQLSchema = t
}