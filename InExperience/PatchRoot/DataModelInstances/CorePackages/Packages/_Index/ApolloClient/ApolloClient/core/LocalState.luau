local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local Boolean = LuauPolyfillModule.Boolean
local String = LuauPolyfillModule.String
local PromiseModule = require(Parent1.Promise)
local NULL = require(Parent.utilities.globals.null).NULL
local LocalStateModule = {}
local GraphQLModule = require(Parent1.GraphQL)
local VisitFunction = GraphQLModule.visit
local BREAK = GraphQLModule.BREAK
local InvariantFunction = require(Parent.jsutils.invariant).invariant
local _ = require(script.Parent.Parent.cache)
local UtilitiesModule = require(script.Parent.Parent.utilities)
local ArgumentsObjectFromFieldFunction = UtilitiesModule.argumentsObjectFromField
local BuildQueryFromSelectionSetFunction = UtilitiesModule.buildQueryFromSelectionSet
local CreateFragmentMapFunction = UtilitiesModule.createFragmentMap
local GetFragmentDefinitionsFunction = UtilitiesModule.getFragmentDefinitions
local GetMainDefinitionFunction = UtilitiesModule.getMainDefinition
local HasDirectivesFunction = UtilitiesModule.hasDirectives
local IsFieldFunction = UtilitiesModule.isField
local IsInlineFragmentFunction = UtilitiesModule.isInlineFragment
local MergeDeepFunction = UtilitiesModule.mergeDeep
local MergeDeepArrayFunction = UtilitiesModule.mergeDeepArray
local RemoveClientSetsFromDocumentFunction = UtilitiesModule.removeClientSetsFromDocument
local ResultKeyNameFromFieldFunction = UtilitiesModule.resultKeyNameFromField
local ShouldIncludeFunction = UtilitiesModule.shouldInclude
local _ = require(script.Parent.ApolloClient_types)
local _ = require(script.Parent.types)
local _ = require(script.Parent.Parent.link.core)
local CacheSlot = require(script.Parent.Parent.cache).cacheSlot
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	local self = setmetatable({}, Module)
	local Client = p1.client
	local Resolvers = p1.resolvers
	local FragmentMatcher = p1.fragmentMatcher
	self.cache = p1.cache
	
	if Client ~= nil then
		self.client = Client
	end
	if Resolvers ~= nil then
		self:addResolvers(Resolvers)
	end
	if FragmentMatcher ~= nil then
		self:setFragmentMatcher(FragmentMatcher)
	end
	return self
end

function Module:addResolvers(Resolvers)
	-- upvalues: Boolean (copy), Array (copy), MergeDeepFunction (copy)
	self.resolvers = Boolean.toJSBoolean(self.resolvers) and self.resolvers or {}
	
	if Array.isArray(Resolvers) then
		Array.forEach(Resolvers, function(p1)
			-- upvalues: self (copy), MergeDeepFunction (upval)
			self.resolvers = MergeDeepFunction(self.resolvers, p1)
		end)
		
		return
	else
		self.resolvers = MergeDeepFunction(self.resolvers, Resolvers)
	end
end

function Module:setResolvers(p1)
	self.resolvers = {}
	self:addResolvers(p1)
end

function Module:getResolvers()
	-- upvalues: Boolean (copy)
	return Boolean.toJSBoolean(self.resolvers) and self.resolvers or {}
end

function Module.runResolvers(p1, p2)
	-- upvalues: Boolean (copy), Object (copy), PromiseModule (copy)
	local Document = p2.document
	local RemoteResult = p2.remoteResult
	local Context = p2.context
	local Variables = p2.variables
	local OnlyRunForcedResolvers = p2.onlyRunForcedResolvers ~= nil and p2.onlyRunForcedResolvers
	
	return if Boolean.toJSBoolean(Document) then p1:resolveDocument(Document, RemoteResult.data, Context, Variables, p1.fragmentMatcher, OnlyRunForcedResolvers):andThen(function(Result)
		-- upvalues: Object (upval), RemoteResult (copy)
		return Object.assign({}, RemoteResult, { data = Result.result })
	end) else PromiseModule.resolve(RemoteResult)
end

function Module:setFragmentMatcher(FragmentMatcher)
	self.fragmentMatcher = FragmentMatcher
end

function Module:getFragmentMatcher()
	return self.fragmentMatcher
end

function Module.clientQuery(p1, p2)
	-- upvalues: HasDirectivesFunction (copy), Boolean (copy), NULL (copy)
	return if HasDirectivesFunction({ "client" }, p2) and Boolean.toJSBoolean(p1.resolvers) then p2 else NULL
end

function Module:serverQuery(p1)
	-- upvalues: RemoveClientSetsFromDocumentFunction (copy)
	return RemoveClientSetsFromDocumentFunction(p1)
end

function Module:prepareContext(p1)
	-- upvalues: Object (copy)
	local Cache = self.cache
	
	return Object.assign({}, p1, {
		cache = Cache,
		getCacheKey = function(_, p2)
			-- upvalues: Cache (copy)
			return Cache:identify(p2)
		end
	})
end

function Module:addExportedVariables(p1, Variables, p2)
	-- upvalues: Boolean (copy), Object (copy), PromiseModule (copy)
	if Variables == nil then
		Variables = {}
	end
	if p2 == nil then
		p2 = {}
	end
	if Boolean.toJSBoolean(p1) then
		local RootValueFromCache = self:buildRootValueFromCache(p1, Variables)
		
		return self:resolveDocument(p1, Boolean.toJSBoolean(RootValueFromCache) and RootValueFromCache or {}, self:prepareContext(p2), Variables):andThen(function(Result)
			-- upvalues: Object (upval), Variables (ref)
			return Object.assign({}, Variables, Result.exportedVariables)
		end)
	else
		return PromiseModule.resolve(Object.assign({}, Variables))
	end
end

function Module:shouldForceResolvers(Field): boolean
	-- upvalues: VisitFunction (copy), Boolean (copy), Array (copy), BREAK (copy)
	local SomeResult = false
	VisitFunction(Field, {
		Directive = {
			enter = function(_, p1)
				-- upvalues: Boolean (upval), SomeResult (ref), Array (upval), BREAK (upval)
				if p1.name.value == "client" and Boolean.toJSBoolean(p1.arguments) then
					SomeResult = Array.some(p1.arguments, function(p2): boolean
						return p2.name.value == "always" and p2.value.kind == "BooleanValue" and p2.value.value == true
					end)
					
					if SomeResult then
						return BREAK
					end
				end
				return nil
			end
		}
	})
	
	return SomeResult
end

function Module:buildRootValueFromCache(p1, Variables)
	-- upvalues: BuildQueryFromSelectionSetFunction (copy)
	return self.cache:diff({
		returnPartialData = true,
		optimistic = false,
		query = BuildQueryFromSelectionSetFunction(p1),
		variables = Variables
	}).result
end

function Module:resolveDocument(Document, p1, Context, Variables, FragmentMatcher: () -> boolean, OnlyRunForcedResolvers: boolean)
	-- upvalues: GetMainDefinitionFunction (copy), GetFragmentDefinitionsFunction (copy), CreateFragmentMapFunction (copy), Boolean (copy), String (copy), Object (copy)
	if Context == nil then
		Context = {}
	end
	if Variables == nil then
		Variables = {}
	end
	if FragmentMatcher == nil then
		FragmentMatcher = function(): boolean
			return true
		end
	end
	if OnlyRunForcedResolvers == nil then
		OnlyRunForcedResolvers = false
	end
	local MainDefinition = GetMainDefinitionFunction(Document)
	local Operation: string = MainDefinition.operation
	local config = {
		fragmentMap = CreateFragmentMapFunction((GetFragmentDefinitionsFunction(Document))),
		context = Object.assign({}, Context, { cache = self.cache, client = self.client }),
		variables = Variables,
		fragmentMatcher = FragmentMatcher,
		defaultOperationType = if Boolean.toJSBoolean(Operation) then string.upper((string.sub(Operation, 1, 1))) .. String.slice(Operation, 2) else "Query",
		exportedVariables = {},
		onlyRunForcedResolvers = OnlyRunForcedResolvers
	}
	
	return self:resolveSelectionSet(MainDefinition.selectionSet, p1, config):andThen(function(Result)
		-- upvalues: config (copy)
		return {
			result = Result,
			exportedVariables = config.exportedVariables
		}
	end)
end

function Module.resolveSelectionSet(p1, SelectionSet, NULL, p2)
	-- upvalues: Boolean (copy), ShouldIncludeFunction (copy), PromiseModule (copy), IsFieldFunction (copy), ResultKeyNameFromFieldFunction (copy), IsInlineFragmentFunction (copy), InvariantFunction (copy), Array (copy), MergeDeepArrayFunction (copy)
	local FragmentMap = p2.fragmentMap
	local Context = p2.context
	local Variables = p2.variables
	local List = { NULL }
	
	return PromiseModule.all(Array.map(SelectionSet.selections, function(Field)
		-- upvalues: Boolean (upval), ShouldIncludeFunction (upval), Variables (copy), PromiseModule (upval), IsFieldFunction (upval), p1 (copy), NULL (copy), p2 (copy), List (copy), ResultKeyNameFromFieldFunction (upval), IsInlineFragmentFunction (upval), FragmentMap (copy), InvariantFunction (upval), Context (copy)
		if not Boolean.toJSBoolean(ShouldIncludeFunction(Field, Variables)) then
			return PromiseModule.resolve(nil)
		end
		if IsFieldFunction(Field) then
			return p1:resolveField(Field, NULL, p2):andThen(function(Result)
				-- upvalues: List (upval), ResultKeyNameFromFieldFunction (upval), Field (copy)
				if typeof(Result) ~= "nil" then
					table.insert(List, { [ResultKeyNameFromFieldFunction(Field)] = Result })
				end
			end)
		end
		local Field1 = nil
		if IsInlineFragmentFunction(Field) then
			Field1 = Field
		else
			Field1 = FragmentMap[Field.name.value]
			InvariantFunction(Field1, ("No fragment named %s"):format(Field.name.value))
		end
		return if Field1 and Field1.typeCondition ~= nil and Boolean.toJSBoolean(p2:fragmentMatcher(NULL, Field1.typeCondition.name.value, Context)) then p1:resolveSelectionSet(Field1.selectionSet, NULL, p2):andThen(function(Result)
			-- upvalues: List (upval)
			table.insert(List, Result)
		end) else PromiseModule.resolve(nil)
	end)):andThen(function()
		-- upvalues: MergeDeepArrayFunction (upval), List (copy)
		return MergeDeepArrayFunction(List)
	end)
end

function Module:resolveField(Field, p1, p2)
	-- upvalues: ResultKeyNameFromFieldFunction (copy), Boolean (copy), PromiseModule (copy), CacheSlot (copy), ArgumentsObjectFromFieldFunction (copy), Array (copy), NULL (copy)
	local Variables = p2.variables
	local Value = Field.name.value
	local ResultKeyNameFromFieldResult = ResultKeyNameFromFieldFunction(Field)
	local IsNotValueMatch = Value ~= ResultKeyNameFromFieldResult
	local v1 = Boolean.toJSBoolean(p1[ResultKeyNameFromFieldResult]) and p1[ResultKeyNameFromFieldResult] or p1[Value]
	local ResolveResult = PromiseModule.resolve(v1)
	
	if not p2.onlyRunForcedResolvers or self:shouldForceResolvers(Field) then
		local Typename = Boolean.toJSBoolean(p1.__typename) and p1.__typename or p2.defaultOperationType
		local Resolver = if Boolean.toJSBoolean(self.resolvers) then self.resolvers[tostring(Typename)] else self.resolvers
		
		if Boolean.toJSBoolean(Resolver) then
			local ResolverEntry = Resolver[if IsNotValueMatch then Value else ResultKeyNameFromFieldResult]
			
			if Boolean.toJSBoolean(ResolverEntry) then
				ResolveResult = PromiseModule.resolve(CacheSlot:withValue(self.cache, ResolverEntry, {
					p1,
					ArgumentsObjectFromFieldFunction(Field, Variables),
					p2.context,
					{ field = Field, fragmentMap = p2.fragmentMap }
				}))
			end
		end
	end
	return ResolveResult:andThen(function(Result)
		-- upvalues: v1 (copy), Field (copy), Array (upval), Boolean (upval), p2 (copy), NULL (upval), self (copy)
		if Result == nil then
			Result = v1
		end
		if Field.directives ~= nil then
			Array.forEach(Field.directives, function(p3)
				-- upvalues: Boolean (upval), Array (upval), p2 (upval), Result (ref)
				if p3.name.value == "export" and Boolean.toJSBoolean(p3.arguments) then
					Array.forEach(p3.arguments, function(p4)
						-- upvalues: p2 (upval), Result (upval)
						if p4.name.value == "as" and p4.value.kind == "StringValue" then
							p2.exportedVariables[p4.value.value] = Result
						end
					end)
				end
			end)
		end
		return if Boolean.toJSBoolean(Field.selectionSet) then if Result == nil or Result == NULL then Result elseif Array.isArray(Result) then self:resolveSubSelectedArray(Field, Result, p2) elseif Boolean.toJSBoolean(Field.selectionSet) then self:resolveSelectionSet(Field.selectionSet, Result, p2) else nil else Result
	end)
end

function Module.resolveSubSelectedArray(p3, Field, NULL1, p4)
	-- upvalues: PromiseModule (copy), Array (copy), NULL (copy), Boolean (copy)
	return PromiseModule.all(Array.map(NULL1, function(NULL1)
		-- upvalues: NULL (upval), Array (upval), p3 (copy), Field (copy), p4 (copy), Boolean (upval)
		return if NULL1 == NULL then NULL elseif Array.isArray(NULL1) then p3:resolveSubSelectedArray(Field, NULL1, p4) elseif Boolean.toJSBoolean(Field.selectionSet) then p3:resolveSelectionSet(Field.selectionSet, NULL1, p4) else nil
	end))
end

LocalStateModule.LocalState = Module

return LocalStateModule