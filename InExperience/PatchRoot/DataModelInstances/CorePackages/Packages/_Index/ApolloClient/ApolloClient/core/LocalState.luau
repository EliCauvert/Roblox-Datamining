local parent = script.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local boolean = luauPolyfillModule.Boolean
local string = luauPolyfillModule.String
local promiseModule = require(parent_1.Promise)
local NULL = require(parent.utilities.globals.null).NULL
local t = {}
local graphQLModule = require(parent_1.GraphQL)
local visit = graphQLModule.visit
local BREAK = graphQLModule.BREAK
local invariant = require(parent.jsutils.invariant).invariant
local _ = require(script.Parent.Parent.cache)
local utilitiesModule = require(script.Parent.Parent.utilities)
local argumentsObjectFromField = utilitiesModule.argumentsObjectFromField
local buildQueryFromSelectionSet = utilitiesModule.buildQueryFromSelectionSet
local createFragmentMap = utilitiesModule.createFragmentMap
local getFragmentDefinitions = utilitiesModule.getFragmentDefinitions
local getMainDefinition = utilitiesModule.getMainDefinition
local hasDirectives = utilitiesModule.hasDirectives
local isField = utilitiesModule.isField
local isInlineFragment = utilitiesModule.isInlineFragment
local mergeDeep = utilitiesModule.mergeDeep
local mergeDeepArray = utilitiesModule.mergeDeepArray
local removeClientSetsFromDocument = utilitiesModule.removeClientSetsFromDocument
local resultKeyNameFromField = utilitiesModule.resultKeyNameFromField
local shouldInclude = utilitiesModule.shouldInclude
local _ = require(script.Parent.ApolloClient_types)
local _ = require(script.Parent.types)
local _ = require(script.Parent.Parent.link.core)
local cacheSlot = require(script.Parent.Parent.cache).cacheSlot
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	local cache = p1.cache
	local client = p1.client
	local resolvers = p1.resolvers
	local fragmentMatcher = p1.fragmentMatcher
	tbl.cache = cache
	
	if client ~= nil then
		tbl.client = client
	end
	if resolvers ~= nil then
		tbl:addResolvers(resolvers)
	end
	if fragmentMatcher ~= nil then
		tbl:setFragmentMatcher(fragmentMatcher)
	end
	return tbl
end

function t_1:addResolvers(p1)
	-- upvalues: boolean (ref), array (ref), mergeDeep (ref)
	self.resolvers = if boolean.toJSBoolean(self.resolvers) then self.resolvers else {}
	
	if array.isArray(p1) then
		array.forEach(p1, function(p2)
			-- upvalues: self (ref), mergeDeep (copy)
			self.resolvers = mergeDeep(self.resolvers, p2)
		end)
		
		return
	end
	self.resolvers = mergeDeep(self.resolvers, p1)
end

function t_1:setResolvers(p1)
	self.resolvers = {}
	self:addResolvers(p1)
end

function t_1:getResolvers()
	-- upvalues: boolean (ref)
	return if boolean.toJSBoolean(self.resolvers) then self.resolvers else {}
end

function t_1:runResolvers(p1)
	-- upvalues: boolean (ref), object (ref), promiseModule (ref)
	local document = p1.document
	local remoteResult = p1.remoteResult
	
	return if boolean.toJSBoolean(document) then self:resolveDocument(document, remoteResult.data, p1.context, p1.variables, self.fragmentMatcher, if p1.onlyRunForcedResolvers == nil then false else p1.onlyRunForcedResolvers):andThen(function(p2)
		-- upvalues: object (copy), remoteResult (ref)
		return object.assign({}, remoteResult, { data = p2.result })
	end) else promiseModule.resolve(remoteResult)
end

function t_1:setFragmentMatcher(p1)
	self.fragmentMatcher = p1
end

function t_1:getFragmentMatcher()
	return self.fragmentMatcher
end

function t_1:clientQuery(p1)
	-- upvalues: hasDirectives (ref), boolean (ref), NULL (ref)
	return if hasDirectives({ "client" }, p1) and boolean.toJSBoolean(self.resolvers) then p1 else NULL
end

function t_1.serverQuery(_, p1)
	-- upvalues: removeClientSetsFromDocument (ref)
	return removeClientSetsFromDocument(p1)
end

function t_1:prepareContext(p1)
	-- upvalues: object (ref)
	local cache = self.cache
	
	return object.assign({}, p1, {
		cache = cache,
		getCacheKey = function(_, p2)
			-- upvalues: cache (ref)
			return cache:identify(p2)
		end
	})
end

function t_1:addExportedVariables(p1, p2, p3)
	-- upvalues: boolean (ref), object (ref), promiseModule (ref)
	if p2 == nil then
		p2 = {}
	end
	if p3 == nil then
		p3 = {}
	end
	if boolean.toJSBoolean(p1) then
		local var1 = self:buildRootValueFromCache(p1, p2)
		
		return self:resolveDocument(p1, if boolean.toJSBoolean(var1) then var1 else {}, self:prepareContext(p3), p2):andThen(function(p4)
			-- upvalues: object (copy), p2 (write)
			return object.assign({}, p2, p4.exportedVariables)
		end)
	end
	return promiseModule.resolve(object.assign({}, p2))
end

function t_1.shouldForceResolvers(_, p1)
	-- upvalues: visit (ref), boolean (ref), array (ref), BREAK (ref)
	local var1 = false
	visit(p1, {
		Directive = {
			enter = function(_, p2)
				-- upvalues: boolean (copy), var1 (write), array (copy), BREAK (copy)
				if p2.name.value == "client" and boolean.toJSBoolean(p2.arguments) then
					var1 = array.some(p2.arguments, function(p3)
						return p3.name.value == "always" and (p3.value.kind == "BooleanValue" and p3.value.value == true)
					end)
					
					return if var1 then BREAK else nil
				end
			end
		}
	})
	
	return var1
end

function t_1:buildRootValueFromCache(p1, p2)
	-- upvalues: buildQueryFromSelectionSet (ref)
	return self.cache:diff({
		returnPartialData = true,
		optimistic = false,
		query = buildQueryFromSelectionSet(p1),
		variables = p2
	}).result
end

function t_1:resolveDocument(p1, p2, p3, p4, p5, p6)
	-- upvalues: getMainDefinition (ref), getFragmentDefinitions (ref), createFragmentMap (ref), boolean (ref), string (ref), object (ref)
	if p3 == nil then
		p3 = {}
	end
	if p4 == nil then
		p4 = {}
	end
	if p5 == nil then
		p5 = function()
			return true
		end
	end
	if p6 == nil then
		p6 = false
	end
	local var1 = getMainDefinition(p1)
	local operation = var1.operation
	local t = {
		fragmentMap = createFragmentMap(getFragmentDefinitions(p1)),
		context = object.assign({}, p3, { cache = self.cache, client = self.client }),
		variables = p4,
		fragmentMatcher = p5,
		defaultOperationType = if boolean.toJSBoolean(operation) then string.upper(string.sub(operation, 1, 1)) .. string.slice(operation, 2) else "Query",
		exportedVariables = {},
		onlyRunForcedResolvers = p6
	}
	
	return self:resolveSelectionSet(var1.selectionSet, p2, t):andThen(function(p7)
		-- upvalues: t (ref)
		return { result = p7, exportedVariables = t.exportedVariables }
	end)
end

function t_1.resolveSelectionSet(value, p1, p2, p3)
	-- upvalues: boolean (ref), shouldInclude (ref), promiseModule (ref), isField (ref), resultKeyNameFromField (ref), isInlineFragment (ref), invariant (ref), array (ref), mergeDeepArray (ref)
	local fragmentMap = p3.fragmentMap
	local context = p3.context
	local variables = p3.variables
	local list = { p2 }
	
	return promiseModule.all(array.map(p1.selections, function(p4)
		-- upvalues: boolean (copy), shouldInclude (copy), variables (ref), promiseModule (copy), isField (copy), value (ref), p2 (ref), p3 (ref), list (ref), resultKeyNameFromField (copy), isInlineFragment (copy), fragmentMap (ref), invariant (copy), context (ref)
		if not boolean.toJSBoolean(shouldInclude(p4, variables)) then
			return promiseModule.resolve(nil)
		elseif isField(p4) then
			return value:resolveField(p4, p2, p3):andThen(function(p5)
				-- upvalues: list (copy), resultKeyNameFromField (copy), p4 (ref)
				if typeof(p5) ~= "nil" then
					table.insert(list, { [resultKeyNameFromField(p4)] = p5 })
				end
			end)
		end
		local var1
		local _ = nil
		
		if isInlineFragment(p4) then
			var1 = p4
		else
			var1 = fragmentMap[p4.name.value]
			invariant(var1, ("No fragment named %s"):format(p4.name.value))
		end
		return if var1 and var1.typeCondition ~= nil and boolean.toJSBoolean(p3:fragmentMatcher(p2, var1.typeCondition.name.value, context)) then value:resolveSelectionSet(var1.selectionSet, p2, p3):andThen(function(p5)
			-- upvalues: list (copy)
			table.insert(list, p5)
		end) else promiseModule.resolve(nil)
	end)):andThen(function()
		-- upvalues: mergeDeepArray (copy), list (ref)
		return mergeDeepArray(list)
	end)
end

function t_1:resolveField(p1, p2, p3)
	-- upvalues: resultKeyNameFromField (ref), boolean (ref), promiseModule (ref), cacheSlot (ref), argumentsObjectFromField (ref), array (ref), NULL (ref)
	local variables = p3.variables
	local value = p1.name.value
	local var1 = resultKeyNameFromField(p1)
	local var2 = value ~= var1
	local var3 = if boolean.toJSBoolean(p2[var1]) then p2[var1] else p2[value]
	local var4 = promiseModule.resolve(var3)
	
	if not p3.onlyRunForcedResolvers or self:shouldForceResolvers(p1) then
		local var5 = if boolean.toJSBoolean(self.resolvers) then self.resolvers[tostring(if boolean.toJSBoolean(p2.__typename) then p2.__typename else p3.defaultOperationType)] else self.resolvers
		
		if boolean.toJSBoolean(var5) then
			local var6 = var5[if var2 then value else var1]
			
			if boolean.toJSBoolean(var6) then
				var4 = promiseModule.resolve(cacheSlot:withValue(self.cache, var6, {
					p2,
					argumentsObjectFromField(p1, variables),
					p3.context,
					{ field = p1, fragmentMap = p3.fragmentMap }
				}))
			end
		end
	end
	return var4:andThen(function(p4)
		-- upvalues: var3 (ref), p1 (ref), array (copy), boolean (copy), p3 (ref), NULL (copy), self (ref)
		if p4 == nil then
			p4 = var3
		end
		if p1.directives ~= nil then
			array.forEach(p1.directives, function(p5)
				-- upvalues: boolean (copy), array (copy), p3 (copy), p4 (write)
				if p5.name.value == "export" and boolean.toJSBoolean(p5.arguments) then
					array.forEach(p5.arguments, function(p6)
						-- upvalues: p3 (copy), p4 (copy)
						if p6.name.value == "as" and p6.value.kind == "StringValue" then
							p3.exportedVariables[p6.value.value] = p4
						end
					end)
				end
			end)
		end
		return if boolean.toJSBoolean(p1.selectionSet) then if p4 == nil or p4 == NULL then p4 elseif array.isArray(p4) then self:resolveSubSelectedArray(p1, p4, p3) elseif boolean.toJSBoolean(p1.selectionSet) then self:resolveSelectionSet(p1.selectionSet, p4, p3) else nil else p4
	end)
end

function t_1.resolveSubSelectedArray(p4, p5, p6, p7)
	-- upvalues: promiseModule (ref), array (ref), NULL (ref), boolean (ref)
	return promiseModule.all(array.map(p6, function(p8)
		-- upvalues: NULL (copy), array (copy), p4 (ref), p5 (ref), p7 (ref), boolean (copy)
		return if p8 == NULL then NULL elseif array.isArray(p8) then p4:resolveSubSelectedArray(p5, p8, p7) elseif boolean.toJSBoolean(p5.selectionSet) then p4:resolveSelectionSet(p5.selectionSet, p8, p7) else nil
	end))
end

t.LocalState = t_1

return t