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

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	local cache = p0.cache
	local client = p0.client
	local resolvers = p0.resolvers
	local fragmentMatcher = p0.fragmentMatcher
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

function t_1:setResolvers(p3)
	self.resolvers = {}
	self:addResolvers(p3)
end

function t_1:getResolvers()
	-- upvalues: boolean (ref)
	return if boolean.toJSBoolean(self.resolvers) then self.resolvers else {}
end

function t_1:runResolvers(p4)
	-- upvalues: boolean (ref), object (ref), promiseModule (ref)
	local document = p4.document
	local remoteResult = p4.remoteResult
	
	return if boolean.toJSBoolean(document) then self:resolveDocument(document, remoteResult.data, p4.context, p4.variables, self.fragmentMatcher, if p4.onlyRunForcedResolvers == nil then false else p4.onlyRunForcedResolvers):andThen(function(p5)
		-- upvalues: object (copy), remoteResult (ref)
		return object.assign({}, remoteResult, { data = p5.result })
	end) else promiseModule.resolve(remoteResult)
end

function t_1:setFragmentMatcher(p6)
	self.fragmentMatcher = p6
end

function t_1:getFragmentMatcher()
	return self.fragmentMatcher
end

function t_1:clientQuery(p7)
	-- upvalues: hasDirectives (ref), boolean (ref), NULL (ref)
	return if hasDirectives({ "client" }, p7) and boolean.toJSBoolean(self.resolvers) then p7 else NULL
end

function t_1.serverQuery(_, p8)
	-- upvalues: removeClientSetsFromDocument (ref)
	return removeClientSetsFromDocument(p8)
end

function t_1:prepareContext(p9)
	-- upvalues: object (ref)
	local cache = self.cache
	
	return object.assign({}, p9, {
		cache = cache,
		getCacheKey = function(_, p10)
			-- upvalues: cache (ref)
			return cache:identify(p10)
		end
	})
end

function t_1:addExportedVariables(p11, p12, p13)
	-- upvalues: boolean (ref), object (ref), promiseModule (ref)
	if p12 == nil then
		p12 = {}
	end
	if p13 == nil then
		p13 = {}
	end
	if boolean.toJSBoolean(p11) then
		local var7 = self:buildRootValueFromCache(p11, p12)
		
		return self:resolveDocument(p11, if boolean.toJSBoolean(var7) then var7 else {}, self:prepareContext(p13), p12):andThen(function(p14)
			-- upvalues: object (copy), p12 (write)
			return object.assign({}, p12, p14.exportedVariables)
		end)
	end
	return promiseModule.resolve(object.assign({}, p12))
end

function t_1.shouldForceResolvers(_, p15)
	-- upvalues: visit (ref), boolean (ref), array (ref), BREAK (ref)
	local var8 = false
	visit(p15, {
		Directive = {
			enter = function(_, p16)
				-- upvalues: boolean (copy), var8 (write), array (copy), BREAK (copy)
				if p16.name.value == "client" and boolean.toJSBoolean(p16.arguments) then
					var8 = array.some(p16.arguments, function(p17)
						return p17.name.value == "always" and (p17.value.kind == "BooleanValue" and p17.value.value == true)
					end)
					
					return if var8 then BREAK else nil
				end
			end
		}
	})
	
	return var8
end

function t_1:buildRootValueFromCache(p18, p19)
	-- upvalues: buildQueryFromSelectionSet (ref)
	return self.cache:diff({
		returnPartialData = true,
		optimistic = false,
		query = buildQueryFromSelectionSet(p18),
		variables = p19
	}).result
end

function t_1:resolveDocument(p20, p21, p22, p23, p24, p25)
	-- upvalues: getMainDefinition (ref), getFragmentDefinitions (ref), createFragmentMap (ref), boolean (ref), string (ref), object (ref)
	if p22 == nil then
		p22 = {}
	end
	if p23 == nil then
		p23 = {}
	end
	if p24 == nil then
		p24 = function()
			return true
		end
	end
	if p25 == nil then
		p25 = false
	end
	local var9 = getMainDefinition(p20)
	local operation = var9.operation
	local t = {
		fragmentMap = createFragmentMap(getFragmentDefinitions(p20)),
		context = object.assign({}, p22, { cache = self.cache, client = self.client }),
		variables = p23,
		fragmentMatcher = p24,
		defaultOperationType = if boolean.toJSBoolean(operation) then string.upper(string.sub(operation, 1, 1)) .. string.slice(operation, 2) else "Query",
		exportedVariables = {},
		onlyRunForcedResolvers = p25
	}
	
	return self:resolveSelectionSet(var9.selectionSet, p21, t):andThen(function(p26)
		-- upvalues: t (ref)
		return { result = p26, exportedVariables = t.exportedVariables }
	end)
end

function t_1.resolveSelectionSet(value, p27, p28, p29)
	-- upvalues: boolean (ref), shouldInclude (ref), promiseModule (ref), isField (ref), resultKeyNameFromField (ref), isInlineFragment (ref), invariant (ref), array (ref), mergeDeepArray (ref)
	local fragmentMap = p29.fragmentMap
	local context = p29.context
	local variables = p29.variables
	local list = { p28 }
	
	return promiseModule.all(array.map(p27.selections, function(p30)
		-- upvalues: boolean (copy), shouldInclude (copy), variables (ref), promiseModule (copy), isField (copy), value (ref), p28 (ref), p29 (ref), list (ref), resultKeyNameFromField (copy), isInlineFragment (copy), fragmentMap (ref), invariant (copy), context (ref)
		if not boolean.toJSBoolean(shouldInclude(p30, variables)) then
			return promiseModule.resolve(nil)
		elseif isField(p30) then
			return value:resolveField(p30, p28, p29):andThen(function(p31)
				-- upvalues: list (copy), resultKeyNameFromField (copy), p30 (ref)
				if typeof(p31) ~= "nil" then
					table.insert(list, { [resultKeyNameFromField(p30)] = p31 })
				end
			end)
		end
		local var12
		local _ = nil
		
		if isInlineFragment(p30) then
			var12 = p30
		else
			var12 = fragmentMap[p30.name.value]
			invariant(var12, ("No fragment named %s"):format(p30.name.value))
		end
		return if var12 and var12.typeCondition ~= nil and boolean.toJSBoolean(p29:fragmentMatcher(p28, var12.typeCondition.name.value, context)) then value:resolveSelectionSet(var12.selectionSet, p28, p29):andThen(function(p32)
			-- upvalues: list (copy)
			table.insert(list, p32)
		end) else promiseModule.resolve(nil)
	end)):andThen(function()
		-- upvalues: mergeDeepArray (copy), list (ref)
		return mergeDeepArray(list)
	end)
end

function t_1:resolveField(p33, p34, p35)
	-- upvalues: resultKeyNameFromField (ref), boolean (ref), promiseModule (ref), cacheSlot (ref), argumentsObjectFromField (ref), array (ref), NULL (ref)
	local variables = p35.variables
	local value = p33.name.value
	local var13 = resultKeyNameFromField(p33)
	local var14 = value ~= var13
	local var15 = if boolean.toJSBoolean(p34[var13]) then p34[var13] else p34[value]
	local var16 = promiseModule.resolve(var15)
	
	if not p35.onlyRunForcedResolvers or self:shouldForceResolvers(p33) then
		local var17 = if boolean.toJSBoolean(self.resolvers) then self.resolvers[tostring(if boolean.toJSBoolean(p34.__typename) then p34.__typename else p35.defaultOperationType)] else self.resolvers
		
		if boolean.toJSBoolean(var17) then
			local var18 = var17[if var14 then value else var13]
			
			if boolean.toJSBoolean(var18) then
				var16 = promiseModule.resolve(cacheSlot:withValue(self.cache, var18, {
					p34,
					argumentsObjectFromField(p33, variables),
					p35.context,
					{ field = p33, fragmentMap = p35.fragmentMap }
				}))
			end
		end
	end
	return var16:andThen(function(p36)
		-- upvalues: var15 (ref), p33 (ref), array (copy), boolean (copy), p35 (ref), NULL (copy), self (ref)
		if p36 == nil then
			p36 = var15
		end
		if p33.directives ~= nil then
			array.forEach(p33.directives, function(p37)
				-- upvalues: boolean (copy), array (copy), p35 (copy), p36 (write)
				if p37.name.value == "export" and boolean.toJSBoolean(p37.arguments) then
					array.forEach(p37.arguments, function(p38)
						-- upvalues: p35 (copy), p36 (copy)
						if p38.name.value == "as" and p38.value.kind == "StringValue" then
							p35.exportedVariables[p38.value.value] = p36
						end
					end)
				end
			end)
		end
		return if boolean.toJSBoolean(p33.selectionSet) then if p36 == nil or p36 == NULL then p36 elseif array.isArray(p36) then self:resolveSubSelectedArray(p33, p36, p35) elseif boolean.toJSBoolean(p33.selectionSet) then self:resolveSelectionSet(p33.selectionSet, p36, p35) else nil else p36
	end)
end

function t_1.resolveSubSelectedArray(p39, p40, p41, p42)
	-- upvalues: promiseModule (ref), array (ref), NULL (ref), boolean (ref)
	return promiseModule.all(array.map(p41, function(p43)
		-- upvalues: NULL (copy), array (copy), p39 (ref), p40 (ref), p42 (ref), boolean (copy)
		return if p43 == NULL then NULL elseif array.isArray(p43) then p39:resolveSubSelectedArray(p40, p43, p42) elseif boolean.toJSBoolean(p40.selectionSet) then p39:resolveSelectionSet(p40.selectionSet, p43, p42) else nil
	end))
end

t.LocalState = t_1

return t