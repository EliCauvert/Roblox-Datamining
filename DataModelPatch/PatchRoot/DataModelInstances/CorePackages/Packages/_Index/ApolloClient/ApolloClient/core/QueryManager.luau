local QueryManager = {}
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local InstanceofFunction = LuauPolyfillModule.instanceof
local Map = LuauPolyfillModule.Map
local Object = LuauPolyfillModule.Object
local Set = LuauPolyfillModule.Set
local WeakMap = LuauPolyfillModule.WeakMap
local PromiseModule = require(Parent1.Promise)
local HttpService = game:GetService("HttpService")
local IsCallableModule = require(Parent.luaUtils.isCallable)
local ToJSBooleanFunction = require(Parent.utilities.globals.null).toJSBoolean
local _ = require(Parent1.GraphQL)
local InvariantModule = require(Parent.jsutils.invariant)
local InvariantFunction = InvariantModule.invariant
local InvariantError = InvariantModule.InvariantError
local EqualModule = require(Parent.jsutils.equal)
local ExecuteFunction = require(script.Parent.Parent.link.core).execute
local CanonicalStringifyFunction = require(script.Parent.Parent.cache).canonicalStringify
local UtilitiesModule = require(script.Parent.Parent.utilities)
local GetDefaultValuesFunction = UtilitiesModule.getDefaultValues
local GetOperationDefinitionFunction = UtilitiesModule.getOperationDefinition
local GetOperationNameFunction = UtilitiesModule.getOperationName
local HasClientExportsFunction = UtilitiesModule.hasClientExports
local GraphQLResultHasErrorFunction = UtilitiesModule.graphQLResultHasError
local RemoveConnectionDirectiveFromDocumentFunction = UtilitiesModule.removeConnectionDirectiveFromDocument
local _ = UtilitiesModule.canUseWeakMap
local Observable = UtilitiesModule.Observable
local AsyncMapFunction = UtilitiesModule.asyncMap
local IsNonEmptyArrayFunction = UtilitiesModule.isNonEmptyArray
local Concast = UtilitiesModule.Concast
local MakeUniqueIdFunction = UtilitiesModule.makeUniqueId
local IsDocumentNodeFunction = UtilitiesModule.isDocumentNode
local IsNonNullObjectFunction = UtilitiesModule.isNonNullObject
local ErrorsModule = require(script.Parent.Parent.errors)
local ApolloError = ErrorsModule.ApolloError
local IsApolloErrorFunction = ErrorsModule.isApolloError
local _ = require(script.Parent.watchQueryOptions_types)
local ObservableQueryModule = require(script.Parent.ObservableQuery)
local _ = require(script.Parent.ObservableQuery_types)
local ObservableQuery = ObservableQueryModule.ObservableQuery
local ApplyNextFetchPolicyFunction = ObservableQueryModule.applyNextFetchPolicy
local NetworkStatusModule = require(script.Parent.networkStatus)
local NetworkStatus = NetworkStatusModule.NetworkStatus
local IsNetworkRequestInFlightFunction = NetworkStatusModule.isNetworkRequestInFlight
local _ = require(script.Parent.types)
local LocalState = require(script.Parent.LocalState).LocalState
local QueryInfoModule = require(script.Parent.QueryInfo)
local QueryInfo = QueryInfoModule.QueryInfo
local ShouldWriteResultFunction = QueryInfoModule.shouldWriteResult
local CacheWriteBehavior = QueryInfoModule.CacheWriteBehavior
local HasOwnPropertyModule = require(Parent.luaUtils.hasOwnProperty)
local Module = {}
Module.__index = Module

function Module.new(Cache)
	-- upvalues: Module (copy), Map (copy), WeakMap (copy), LocalState (copy), Boolean (copy)
	local Cache1 = Cache.cache
	local Link = Cache.link
	local QueryDeduplication = Cache.queryDeduplication
	local OnBroadcast = Cache.onBroadcast
	local SsrMode = Cache.ssrMode
	local ClientAwareness = Cache.clientAwareness
	local LocalState1 = Cache.localState
	local AssumeImmutableResults = Cache.assumeImmutableResults
	
	if QueryDeduplication == nil then
		QueryDeduplication = false
	end
	if SsrMode == nil then
		SsrMode = false
	end
	if ClientAwareness == nil then
		ClientAwareness = {}
	end
	local self = setmetatable({}, Module)
	self.clientAwareness = {}
	self.queries = Map.new()
	self.fetchCancelFns = Map.new()
	self.transformCache = WeakMap.new()
	self.queryIdCounter = 1
	self.requestIdCounter = 1
	self.mutationIdCounter = 1
	self.inFlightLinkObservables = Map.new()
	self.cache = Cache1
	self.link = Link
	self.queryDeduplication = QueryDeduplication
	self.clientAwareness = ClientAwareness
	self.localState = LocalState1 or LocalState.new({ cache = Cache1 })
	self.ssrMode = SsrMode
	self.assumeImmutableResults = Boolean.toJSBoolean(AssumeImmutableResults)
	self.onBroadcast = OnBroadcast
	
	if Boolean.toJSBoolean(self.onBroadcast) then
		self.mutationStore = {}
	end
	return self
end

function Module:stop()
	-- upvalues: InvariantError (copy)
	self.queries:forEach(function(_, p1)
		-- upvalues: self (copy)
		self:stopQueryNoBroadcast(p1)
	end)
	self:cancelPendingFetches(InvariantError.new("QueryManager stopped while query was in flight"))
end

function Module:cancelPendingFetches(QueryManagerStoppedWhileQueryWasInFlight)
	self.fetchCancelFns:forEach(function(Callback)
		-- upvalues: QueryManagerStoppedWhileQueryWasInFlight (copy)
		return Callback(QueryManagerStoppedWhileQueryWasInFlight)
	end)
	self.fetchCancelFns:clear()
end

function Module.mutate(p1, p2)
	-- upvalues: PromiseModule (copy), InvariantFunction (copy), Boolean (copy), AsyncMapFunction (copy), Object (copy), GraphQLResultHasErrorFunction (copy), ApolloError (copy), IsCallableModule (copy), InstanceofFunction (copy)
	return PromiseModule.resolve():andThen(function()
		-- upvalues: p2 (copy), InvariantFunction (upval), Boolean (upval), p1 (copy), PromiseModule (upval), AsyncMapFunction (upval), Object (upval), GraphQLResultHasErrorFunction (upval), ApolloError (upval), IsCallableModule (upval), InstanceofFunction (upval)
		local Mutation = p2.mutation
		local Variables = p2.variables
		local OptimisticResponse = p2.optimisticResponse
		local UpdateQueries = p2.updateQueries
		local RefetchQueries = p2.refetchQueries
		local AwaitRefetchQueries = p2.awaitRefetchQueries
		local Update = p2.update
		local OnQueryUpdated = p2.onQueryUpdated
		local ErrorPolicy = p2.errorPolicy
		local FetchPolicy = p2.fetchPolicy
		local KeepRootFields = p2.keepRootFields
		local Context = p2.context
		local T = if RefetchQueries == nil then {} else RefetchQueries
		
		if AwaitRefetchQueries == nil then
			AwaitRefetchQueries = false
		end
		if ErrorPolicy == nil then
			ErrorPolicy = "none"
		end
		InvariantFunction(Mutation, "mutation option is required. You must specify your GraphQL document in the mutation option.")
		InvariantFunction(not Boolean.toJSBoolean(FetchPolicy) or FetchPolicy == "no-cache", "Mutations only support a 'no-cache' fetchPolicy. If you don't want to disable the cache, remove your fetchPolicy setting to proceed with the default mutation behavior.")
		local MutationId = p1:generateMutationId()
		local Document = p1:transform(Mutation).document
		local Variables1 = p1:getVariables(Document, Variables)
		
		if p1:transform(Document).hasClientExports then
			Variables1 = p1.localState:addExportedVariables(Document, Variables1, Context):expect()
		end
		local Mutation1 = nil
		
		if Boolean.toJSBoolean(p1.mutationStore) then
			p1.mutationStore[MutationId] = {
				loading = true,
				error = nil,
				mutation = Document,
				variables = Variables1
			}
			Mutation1 = p1.mutationStore[MutationId]
		else
			Mutation1 = p1.mutationStore
		end
		if Boolean.toJSBoolean(OptimisticResponse) then
			p1:markMutationOptimistic(OptimisticResponse, {
				mutationId = MutationId,
				document = Document,
				variables = Variables1,
				fetchPolicy = FetchPolicy,
				errorPolicy = ErrorPolicy,
				context = Context,
				updateQueries = UpdateQueries,
				update = Update,
				keepRootFields = KeepRootFields
			})
		end
		p1:broadcastQueries()
		
		return PromiseModule.new(function(Callback, Callback1)
			-- upvalues: AsyncMapFunction (upval), p1 (upval), Document (ref), Object (upval), Context (copy), OptimisticResponse (copy), Variables1 (ref), GraphQLResultHasErrorFunction (upval), ErrorPolicy (ref), ApolloError (upval), Boolean (upval), Mutation1 (ref), IsCallableModule (upval), T (ref), MutationId (copy), FetchPolicy (copy), Update (copy), UpdateQueries (copy), AwaitRefetchQueries (ref), OnQueryUpdated (copy), KeepRootFields (copy), p1 (copy), InstanceofFunction (upval)
			return AsyncMapFunction(p1:getObservableFromLink(Document, Object.assign({}, Context, { optimisticResponse = OptimisticResponse }), Variables1, false), function(p3)
				-- upvalues: GraphQLResultHasErrorFunction (upval), ErrorPolicy (upval), ApolloError (upval), Boolean (upval), Mutation1 (upval), Object (upval), IsCallableModule (upval), T (upval), p1 (upval), MutationId (upval), Document (upval), Variables1 (upval), FetchPolicy (upval), Context (upval), Update (upval), UpdateQueries (upval), AwaitRefetchQueries (upval), OptimisticResponse (upval), OnQueryUpdated (upval), KeepRootFields (upval)
				if GraphQLResultHasErrorFunction(p3) and ErrorPolicy == "none" then
					error(ApolloError.new({ graphQLErrors = p3.errors }))
				end
				if Boolean.toJSBoolean(Mutation1) then
					Mutation1.loading = false
					Mutation1.error = nil
				end
				local AssignResult = Object.assign({}, p3)
				
				if IsCallableModule(T) then
					T = T(AssignResult)
				end
				if ErrorPolicy == "ignore" and GraphQLResultHasErrorFunction(AssignResult) then
					AssignResult.errors = nil
				end
				return p1:markMutationResult({
					mutationId = MutationId,
					result = AssignResult,
					document = Document,
					variables = Variables1,
					fetchPolicy = FetchPolicy,
					errorPolicy = ErrorPolicy,
					context = Context,
					update = Update,
					updateQueries = UpdateQueries,
					awaitRefetchQueries = AwaitRefetchQueries,
					refetchQueries = T,
					removeOptimistic = Boolean.toJSBoolean(OptimisticResponse) and MutationId or nil,
					onQueryUpdated = OnQueryUpdated,
					keepRootFields = KeepRootFields
				})
			end):subscribe({
				next = function(_, p3)
					-- upvalues: p1 (upval), Callback (copy)
					p1:broadcastQueries()
					Callback(p3)
				end,
				error = function(_, NetworkError)
					-- upvalues: Boolean (upval), Mutation1 (upval), OptimisticResponse (upval), p1 (upval), MutationId (upval), Callback1 (copy), InstanceofFunction (upval), ApolloError (upval)
					if Boolean.toJSBoolean(Mutation1) then
						Mutation1.loading = false
						Mutation1.error = NetworkError
					end
					if Boolean.toJSBoolean(OptimisticResponse) then
						p1.cache:removeOptimistic(MutationId)
					end
					p1:broadcastQueries()
					Callback1(InstanceofFunction(NetworkError, ApolloError) and NetworkError or ApolloError.new({ networkError = NetworkError }))
				end
			})
		end)
	end)
end

function Module:markMutationResult(AssignResult, p1)
	-- upvalues: ShouldWriteResultFunction (copy), Boolean (copy), HasOwnPropertyModule (copy), GetOperationNameFunction (copy), Array (copy), Object (copy), PromiseModule (copy), ToJSBooleanFunction (copy)
	if p1 == nil then
		p1 = self.cache
	end
	local Result = AssignResult.result
	local List = {}
	local IsNoCache = AssignResult.fetchPolicy == "no-cache"
	
	if not IsNoCache and ShouldWriteResultFunction(Result, AssignResult.errorPolicy) then
		table.insert(List, {
			dataId = "ROOT_MUTATION",
			result = Result.data,
			query = AssignResult.document,
			variables = AssignResult.variables
		})
		local UpdateQueries = AssignResult.updateQueries
		
		if UpdateQueries ~= nil then
			self.queries:forEach(function(p2, p3)
				-- upvalues: Boolean (upval), HasOwnPropertyModule (upval), UpdateQueries (copy), self (copy), p1 (ref), Result (ref), GetOperationNameFunction (upval), List (copy)
				local ObservableQuery = p2.observableQuery
				local QueryName = if Boolean.toJSBoolean(ObservableQuery) then ObservableQuery.queryName else ObservableQuery
				
				if not Boolean.toJSBoolean(QueryName) or not HasOwnPropertyModule(UpdateQueries, QueryName) then return end
				local UpdateQuery = UpdateQueries[QueryName]
				local GetResult = self.queries:get(p3)
				local Document = GetResult.document
				local Variables = GetResult.variables
				local DiffResult = p1:diff({
					returnPartialData = true,
					optimistic = false,
					query = Document,
					variables = Variables
				})
				local Result1 = DiffResult.result
				
				if DiffResult.complete and Boolean.toJSBoolean(Result1) then
					local config = { mutationResult = Result }
					local OperationName1 = nil
					
					if Boolean.toJSBoolean(Document) then
						local OperationName = GetOperationNameFunction(Document)
						OperationName1 = if Boolean.toJSBoolean(OperationName) then OperationName else nil
					else
						OperationName1 = nil
					end
					config.queryName = OperationName1
					config.queryVariables = Variables
					local UpdateQueryResult = UpdateQuery(UpdateQueries, Result1, config)
					
					if Boolean.toJSBoolean(UpdateQueryResult) then
						table.insert(List, {
							dataId = "ROOT_QUERY",
							result = UpdateQueryResult,
							query = Document,
							variables = Variables
						})
					end
				end
			end)
		end
	end
	if #List > 0 or Boolean.toJSBoolean(AssignResult.refetchQueries) or Boolean.toJSBoolean(AssignResult.update) or Boolean.toJSBoolean(AssignResult.onQueryUpdated) or Boolean.toJSBoolean(AssignResult.removeOptimistic) then
		local List1 = {}
		self:refetchQueries({
			optimistic = false,
			updateCache = function(_, p2)
				-- upvalues: IsNoCache (copy), Array (upval), List (copy), AssignResult (copy), Boolean (upval), self (copy), Result (ref), Object (upval)
				if not IsNoCache then
					Array.forEach(List, function(p3)
						-- upvalues: p2 (copy)
						return p2:write(p3)
					end)
				end
				local UpdateFunction: (any, any, any, any) -> () = AssignResult.update
				
				if UpdateFunction ~= nil and Boolean.toJSBoolean(UpdateFunction) then
					if not IsNoCache then
						local DiffResult = p2:diff({
							id = "ROOT_MUTATION",
							optimistic = false,
							returnPartialData = true,
							query = self:transform(AssignResult.document).asQuery,
							variables = AssignResult.variables
						})
						
						if DiffResult.complete then
							Result = Object.assign({}, Result, { data = DiffResult.result })
						end
					end
					UpdateFunction(AssignResult, p2, Result, {
						context = AssignResult.context,
						variables = AssignResult.variables
					})
				end
				if not IsNoCache and not AssignResult.keepRootFields then
					p2:modify({
						id = "ROOT_MUTATION",
						fields = function(_, p3, p4)
							local DELETE = p4.DELETE
							
							return if p4.fieldName == "__typename" then p3 else DELETE
						end
					})
				end
			end,
			include = AssignResult.refetchQueries,
			removeOptimistic = AssignResult.removeOptimistic,
			onQueryUpdated = Boolean.toJSBoolean(AssignResult.onQueryUpdated) and AssignResult.onQueryUpdated or nil
		}):forEach(function(p2)
			-- upvalues: List1 (copy)
			return table.insert(List1, p2)
		end)
		
		if AssignResult.awaitRefetchQueries or Boolean.toJSBoolean(AssignResult.onQueryUpdated) then
			return PromiseModule.all(Array.filter(List1, ToJSBooleanFunction)):andThen(function()
				-- upvalues: Result (ref)
				return Result
			end)
		end
	end
	return PromiseModule.resolve(Result)
end

function Module:markMutationOptimistic(Callback, p1)
	-- upvalues: IsCallableModule (copy), Object (copy), InvariantFunction (copy)
	local CallbackResult = nil
	CallbackResult = if IsCallableModule(Callback) then Callback(p1.variables) else Callback
	
	return self.cache:recordOptimisticTransaction(function(p2)
		-- upvalues: self (copy), Object (upval), p1 (copy), CallbackResult (ref), InvariantFunction (upval)
		local Success, Result = pcall(function()
			-- upvalues: self (upval), Object (upval), p1 (upval), CallbackResult (upval), p2 (copy)
			self:markMutationResult(Object.assign({}, p1, { result = { data = CallbackResult } }), p2)
		end)
		
		if not Success then
			InvariantFunction.error(Result)
		end
	end, p1.mutationId)
end

function Module:fetchQuery(QueryId, p1, p2)
	return self:fetchQueryObservable(QueryId, p1, p2).promise
end

function Module:getQueryStore()
	local t = {}
	self.queries:forEach(function(p1, Key)
		-- upvalues: t (copy)
		t[Key] = {
			variables = p1.variables,
			networkStatus = p1.networkStatus,
			networkError = p1.networkError,
			graphQLErrors = p1.graphQLErrors
		}
	end)
	
	return t
end

function Module:resetErrors(p1)
	-- upvalues: Boolean (copy)
	local GetResult = self.queries:get(p1)
	
	if Boolean.toJSBoolean(GetResult) then
		GetResult.networkError = nil
		GetResult.graphQLErrors = {}
	end
end

function Module:transform(Query)
	-- upvalues: RemoveConnectionDirectiveFromDocumentFunction (copy), Boolean (copy), HasClientExportsFunction (copy), GetDefaultValuesFunction (copy), GetOperationDefinitionFunction (copy), Object (copy), Array (copy)
	local TransformCache = self.transformCache
	
	if not TransformCache:has(Query) then
		local TransformDocumentResult = self.cache:transformDocument(Query)
		local RemoveConnectionDirectiveFromDocumentResult = RemoveConnectionDirectiveFromDocumentFunction(self.cache:transformForLink(TransformDocumentResult))
		local ClientQueryResult = self.localState:clientQuery(TransformDocumentResult)
		local ServerQueryResult = if Boolean.toJSBoolean(RemoveConnectionDirectiveFromDocumentResult) then self.localState:serverQuery(RemoveConnectionDirectiveFromDocumentResult) else RemoveConnectionDirectiveFromDocumentResult
		local config = {
			document = TransformDocumentResult,
			hasClientExports = HasClientExportsFunction(TransformDocumentResult),
			hasForcedResolvers = self.localState:shouldForceResolvers(TransformDocumentResult),
			clientQuery = ClientQueryResult,
			serverQuery = ServerQueryResult,
			defaultVars = GetDefaultValuesFunction(GetOperationDefinitionFunction(TransformDocumentResult)),
			asQuery = Object.assign({}, TransformDocumentResult, {
				definitions = Array.map(TransformDocumentResult.definitions, function(p1)
					-- upvalues: Object (upval)
					return if p1.kind == "OperationDefinition" and p1.operation ~= "query" then Object.assign({}, p1, { operation = "query" }) else p1
				end)
			})
		}
		
		local function _(p1)
			-- upvalues: TransformCache (copy), config (copy)
			if p1 ~= nil and not TransformCache:has(p1) then
				TransformCache:set(p1, config)
			end
		end
		
		if Query ~= nil and not TransformCache:has(Query) then
			TransformCache:set(Query, config)
		end
		if TransformDocumentResult ~= nil and not TransformCache:has(TransformDocumentResult) then
			TransformCache:set(TransformDocumentResult, config)
		end
		if ClientQueryResult ~= nil and not TransformCache:has(ClientQueryResult) then
			TransformCache:set(ClientQueryResult, config)
		end
		if ServerQueryResult ~= nil and not TransformCache:has(ServerQueryResult) then
			TransformCache:set(ServerQueryResult, config)
		end
	end
	return TransformCache:get(Query)
end

function Module:getVariables(Document, Variables)
	-- upvalues: Object (copy)
	return Object.assign({}, self:transform(Document).defaultVars, Variables)
end

function Module:watchQuery(p1)
	-- upvalues: Object (copy), QueryInfo (copy), ObservableQuery (copy)
	local AssignResult = Object.assign({}, p1, { variables = self:getVariables(p1.query, p1.variables) })
	
	if typeof(AssignResult.notifyOnNetworkStatusChange) == "nil" then
		AssignResult.notifyOnNetworkStatusChange = false
	end
	local NewQueryInfo = QueryInfo.new(self.cache)
	local NewObservableQuery = ObservableQuery.new({
		queryManager = self,
		queryInfo = NewQueryInfo,
		options = AssignResult
	})
	self.queries:set(NewObservableQuery.queryId, NewQueryInfo)
	NewQueryInfo:init({
		document = AssignResult.query,
		observableQuery = NewObservableQuery,
		variables = AssignResult.variables
	})
	
	return NewObservableQuery
end

function Module:query(p1, p2)
	-- upvalues: InvariantFunction (copy), Boolean (copy)
	if p2 == nil then
		p2 = self:generateQueryId()
	end
	InvariantFunction(p1.query, "query option is required. You must specify your GraphQL document in the query option.")
	InvariantFunction(p1.query.kind == "Document", "You must wrap the query string in a \"gql\" tag.")
	InvariantFunction(not Boolean.toJSBoolean(p1.returnPartialData), "returnPartialData option only supported on watchQuery.")
	InvariantFunction(not Boolean.toJSBoolean(p1.pollInterval), "pollInterval option only supported on watchQuery.")
	
	return self:fetchQuery(p2, p1):andThen(function(Result)
		-- upvalues: self (copy), p2 (ref)
		self:stopQuery(p2)
		
		return Result
	end):catch(function(Err)
		-- upvalues: self (copy), p2 (ref)
		self:stopQuery(p2)
		error(Err)
	end)
end

function Module:generateQueryId(): string
	local QueryIdCounter = self.queryIdCounter
	self.queryIdCounter += 1
	
	return (tostring(QueryIdCounter))
end

function Module:generateRequestId()
	local RequestIdCounter = self.requestIdCounter
	self.requestIdCounter += 1
	
	return RequestIdCounter
end

function Module:generateMutationId(): string
	local MutationIdCounter = self.mutationIdCounter
	self.mutationIdCounter += 1
	
	return (tostring(MutationIdCounter))
end

function Module:stopQueryInStore(p1)
	self:stopQueryInStoreNoBroadcast(p1)
	self:broadcastQueries()
end

function Module:stopQueryInStoreNoBroadcast(p1)
	-- upvalues: Boolean (copy)
	local GetResult = self.queries:get(p1)
	
	if Boolean.toJSBoolean(GetResult) then
		GetResult:stop()
	end
end

function Module:clearStore()
	-- upvalues: InvariantError (copy), Boolean (copy), NetworkStatus (copy)
	self:cancelPendingFetches(InvariantError.new("Store reset while query was in flight (not completed in link chain)"))
	self.queries:forEach(function(p1, _)
		-- upvalues: Boolean (upval), NetworkStatus (upval)
		if Boolean.toJSBoolean(p1.observableQuery) then
			p1.networkStatus = NetworkStatus.loading
			
			return
		else
			p1:stop()
		end
	end)
	
	if Boolean.toJSBoolean(self.mutationStore) then
		self.mutationStore = {}
	end
	return self.cache:reset()
end

function Module:resetStore()
	return self:clearStore():andThen(function()
		-- upvalues: self (copy)
		return self:reFetchObservableQueries()
	end)
end

function Module:getObservableQueries(All: string)
	-- upvalues: Map (copy), Set (copy), Array (copy), IsDocumentNodeFunction (copy), IsNonNullObjectFunction (copy), Boolean (copy), MakeUniqueIdFunction (copy), ObservableQuery (copy), Object (copy), InvariantFunction (copy), HttpService (copy)
	if All == nil then
		All = "active"
	end
	local NewMap = Map.new(nil)
	local NewMap1 = Map.new(nil)
	local NewSet = Set.new()
	
	if Array.isArray(All) then
		Array.forEach(All, function(p1)
			-- upvalues: NewMap1 (copy), IsDocumentNodeFunction (upval), self (copy), IsNonNullObjectFunction (upval), Boolean (upval), NewSet (copy)
			if typeof(p1) == "string" then
				NewMap1:set(p1, false)
				
				return
			end
			if IsDocumentNodeFunction(p1) then
				NewMap1:set(self:transform(p1).document, false)
				
				return
			end
			if IsNonNullObjectFunction(p1) and Boolean.toJSBoolean(p1.query) then
				NewSet:add(p1)
			end
		end)
	end
	self.queries:forEach(function(p1, p2)
		-- upvalues: Boolean (upval), All (ref), NewMap (copy), NewMap1 (copy)
		local ObservableQuery = p1.observableQuery
		local Document = p1.document
		
		if Boolean.toJSBoolean(ObservableQuery) then
			if All == "all" then
				NewMap:set(p2, ObservableQuery)
				
				return
			end
			local QueryName = ObservableQuery.queryName
			
			if ObservableQuery.options.fetchPolicy == "standby" or not ObservableQuery:hasObservers() then return end
			if All == "active" or Boolean.toJSBoolean(QueryName) and NewMap1:has(QueryName) or Boolean.toJSBoolean(Document) and NewMap1:has(Document) then
				NewMap:set(p2, ObservableQuery)
				
				if Boolean.toJSBoolean(QueryName) then
					NewMap1:set(QueryName, true)
				end
				if Boolean.toJSBoolean(Document) then
					NewMap1:set(Document, true)
				end
			end
		end
	end)
	
	if Boolean.toJSBoolean(NewSet.size) then
		for _, value in NewSet do
			local LegacyOneTimeQuery = MakeUniqueIdFunction("legacyOneTimeQuery")
			local InitResult = self:getQuery(LegacyOneTimeQuery):init({ document = value.query, variables = value.variables })
			local NewObservableQuery = ObservableQuery.new({
				queryManager = self,
				queryInfo = InitResult,
				options = Object.assign({}, value, { fetchPolicy = "network-only" })
			})
			InitResult:setObservableQuery(NewObservableQuery)
			NewMap:set(LegacyOneTimeQuery, NewObservableQuery)
		end
	end
	if _G.__DEV__ and Boolean.toJSBoolean(NewMap1.size) then
		NewMap1:forEach(function(p1, Input)
			-- upvalues: InvariantFunction (upval), HttpService (upval)
			if not p1 then
				InvariantFunction.warn(("Unknown query %s%s requested in refetchQueries options.include array"):format(if typeof(Input) == "string" then "named " else "", HttpService:JSONEncode(Input)))
			end
		end)
	end
	return NewMap
end

function Module:reFetchObservableQueries(p1: boolean)
	-- upvalues: Boolean (copy), PromiseModule (copy), Array (copy), ToJSBooleanFunction (copy)
	if p1 == nil then
		p1 = false
	end
	local List = {}
	self:getObservableQueries(if Boolean.toJSBoolean(p1) then "all" else "active"):forEach(function(p2, p3)
		-- upvalues: Boolean (upval), p1 (ref), List (copy), self (copy)
		local FetchPolicy = p2.options.fetchPolicy
		p2:resetLastResults()
		
		if Boolean.toJSBoolean(p1) or FetchPolicy ~= "standby" and FetchPolicy ~= "cache-only" then
			table.insert(List, p2:refetch())
		end
		self:getQuery(p3):setDiff(nil)
	end)
	self:broadcastQueries()
	
	return PromiseModule.all(Array.filter(List, ToJSBooleanFunction))
end

function Module:setObservableQuery(NewResult)
	self:getQuery(NewResult.queryId):setObservableQuery(NewResult)
end

function Module:startGraphQLSubscription(p1)
	-- upvalues: ShouldWriteResultFunction (copy), GraphQLResultHasErrorFunction (copy), ApolloError (copy), Observable (copy)
	local FetchPolicy = p1.fetchPolicy
	local ErrorPolicy = p1.errorPolicy
	local T = if p1.context == nil then {} else p1.context
	local Document = self:transform(p1.query).document
	local Variables = self:getVariables(Document, p1.variables)
	
	local function makeObservable(Result)
		-- upvalues: self (copy), Document (ref), T (ref), FetchPolicy (copy), ShouldWriteResultFunction (upval), ErrorPolicy (copy), GraphQLResultHasErrorFunction (upval), ApolloError (upval)
		return self:getObservableFromLink(Document, T, Result):map(function(p2)
			-- upvalues: FetchPolicy (upval), ShouldWriteResultFunction (upval), ErrorPolicy (upval), self (upval), Document (upval), Result (copy), GraphQLResultHasErrorFunction (upval), ApolloError (upval)
			if FetchPolicy ~= "no-cache" then
				if ShouldWriteResultFunction(p2, ErrorPolicy) then
					self.cache:write({
						dataId = "ROOT_SUBSCRIPTION",
						query = Document,
						result = p2.data,
						variables = Result
					})
				end
				self:broadcastQueries()
			end
			if GraphQLResultHasErrorFunction(p2) then
				error(ApolloError.new({ graphQLErrors = p2.errors }))
			end
			return p2
		end)
	end
	
	if self:transform(Document).hasClientExports then
		local Promise = self.localState:addExportedVariables(Document, Variables, T):andThen(makeObservable)
		
		return Observable.new(function(p2)
			-- upvalues: Promise (copy)
			local SubscribeResult = nil
			Promise:andThen(function(Result)
				-- upvalues: SubscribeResult (ref), p2 (copy)
				SubscribeResult = Result:subscribe(p2)
				
				return SubscribeResult
			end, p2.error)
			
			return function()
				-- upvalues: SubscribeResult (ref)
				return if SubscribeResult == nil then SubscribeResult else SubscribeResult:unsubscribe()
			end
		end)
	else
		return makeObservable(Variables)
	end
end

function Module:stopQuery(QueryId)
	self:stopQueryNoBroadcast(QueryId)
	self:broadcastQueries()
end

function Module:stopQueryNoBroadcast(p1)
	self:stopQueryInStoreNoBroadcast(p1)
	self:removeQuery(p1)
end

function Module:removeQuery(p1)
	self.fetchCancelFns:delete(p1)
	self:getQuery(p1):stop()
	self.queries:delete(p1)
end

function Module:broadcastQueries()
	-- upvalues: Boolean (copy)
	if Boolean.toJSBoolean(self.onBroadcast) then
		self:onBroadcast()
	end
	self.queries:forEach(function(p1, _)
		return p1:notify()
	end)
end

function Module:getLocalState()
	return self.localState
end

function Module:getObservableFromLink(Document, AssignResult, Variables, p1)
	-- upvalues: Boolean (copy), GetOperationNameFunction (copy), Object (copy), Map (copy), CanonicalStringifyFunction (copy), Concast (copy), ExecuteFunction (copy), Observable (copy), ToJSBooleanFunction (copy), AsyncMapFunction (copy)
	if p1 == nil then
		p1 = if Boolean.toJSBoolean(AssignResult) then if AssignResult.queryDeduplication == nil then self.queryDeduplication else AssignResult.queryDeduplication else self.queryDeduplication
	end
	local ServerQuery = self:transform(Document).serverQuery
	local Context = nil
	local NewConcast = nil
	
	if Boolean.toJSBoolean(ServerQuery) then
		local InFlightLinkObservables = self.inFlightLinkObservables
		local Link = self.link
		local config = {
			query = ServerQuery,
			variables = Variables,
			operationName = Boolean.toJSBoolean(GetOperationNameFunction(ServerQuery)) and GetOperationNameFunction(ServerQuery) or nil,
			context = self:prepareContext(Object.assign({}, AssignResult, { forceFetch = not p1 }))
		}
		Context = config.context
		
		if p1 then
			local GetResult = InFlightLinkObservables:get(ServerQuery)
			local GetResult1 = Boolean.toJSBoolean(GetResult) and GetResult or Map.new(nil)
			InFlightLinkObservables:set(ServerQuery, GetResult1)
			local CanonicalStringifyResult = CanonicalStringifyFunction(Variables)
			NewConcast = GetResult1:get(CanonicalStringifyResult)
			
			if not Boolean.toJSBoolean(NewConcast) then
				local NewConcast1 = Concast.new({ (ExecuteFunction(Link, config)) })
				NewConcast = NewConcast1
				GetResult1:set(CanonicalStringifyResult, NewConcast)
				NewConcast1:cleanup(function()
					-- upvalues: Boolean (upval), GetResult1 (copy), CanonicalStringifyResult (copy), InFlightLinkObservables (copy), ServerQuery (copy)
					if Boolean.toJSBoolean(GetResult1:delete(CanonicalStringifyResult)) and GetResult1.size < 1 then
						InFlightLinkObservables:delete(ServerQuery)
					end
				end)
			end
		else
			NewConcast = Concast.new({ (ExecuteFunction(Link, config)) })
		end
	else
		NewConcast = Concast.new({ Observable.of({ data = {} }) })
		Context = self:prepareContext(AssignResult)
	end
	local ClientQuery = self:transform(Document).clientQuery
	
	if ToJSBooleanFunction(ClientQuery) then
		NewConcast = AsyncMapFunction(NewConcast, function(RemoteResult)
			-- upvalues: self (copy), ClientQuery (copy), Context (ref), Variables (copy)
			return self.localState:runResolvers({
				document = ClientQuery,
				remoteResult = RemoteResult,
				context = Context,
				variables = Variables
			})
		end)
	end
	return NewConcast
end

function Module:getResultsFromLink(p1, FORBID, p2)
	-- upvalues: AsyncMapFunction (copy), IsNonEmptyArrayFunction (copy), ApolloError (copy), Boolean (copy), NetworkStatus (copy), IsApolloErrorFunction (copy)
	p1.lastRequestId = self:generateRequestId()
	local LastRequestId = p1.lastRequestId
	
	return AsyncMapFunction(self:getObservableFromLink(p1.document, p2.context, p2.variables), function(p3)
		-- upvalues: IsNonEmptyArrayFunction (upval), LastRequestId (copy), p1 (copy), p2 (copy), ApolloError (upval), FORBID (copy), Boolean (upval), NetworkStatus (upval)
		local IsNonEmptyArray = IsNonEmptyArrayFunction(p3.errors)
		
		if p1.lastRequestId <= LastRequestId then
			if IsNonEmptyArray and p2.errorPolicy == "none" then
				error(p1:markError(ApolloError.new({ graphQLErrors = p3.errors })))
			end
			p1:markResult(p3, p2, FORBID)
			p1:markReady()
		end
		local config = {
			loading = false,
			data = p3.data,
			networkStatus = Boolean.toJSBoolean(p1.networkStatus) and p1.networkStatus or NetworkStatus.ready
		}
		
		if IsNonEmptyArray and p2.errorPolicy ~= "ignore" then
			config.errors = p3.errors
		end
		return config
	end, function(NetworkError)
		-- upvalues: IsApolloErrorFunction (upval), ApolloError (upval), LastRequestId (copy), p1 (copy)
		local NetworkError1 = if IsApolloErrorFunction(NetworkError) then NetworkError else ApolloError.new({ networkError = NetworkError })
		
		if p1.lastRequestId <= LastRequestId then
			p1:markError(NetworkError1)
		end
		error(NetworkError1)
	end)
end

function Module:fetchQueryObservable(p1, p2, NetworkStatus1)
	-- upvalues: NetworkStatus (copy), Object (copy), PromiseModule (copy), Concast (copy), ApplyNextFetchPolicyFunction (copy)
	if NetworkStatus1 == nil then
		NetworkStatus1 = NetworkStatus.loading
	end
	local Document = self:transform(p2.query).document
	local Variables = self:getVariables(Document, p2.variables)
	local Query = self:getQuery(p1)
	local FetchPolicy = p2.fetchPolicy
	local ErrorPolicy = p2.errorPolicy
	local ReturnPartialData = p2.returnPartialData
	local NotifyOnNetworkStatusChange = p2.notifyOnNetworkStatusChange
	local Context = p2.context
	
	if FetchPolicy == nil then
		FetchPolicy = "cache-first"
	end
	if ErrorPolicy == nil then
		ErrorPolicy = "none"
	end
	if ReturnPartialData == nil then
		ReturnPartialData = false
	end
	if NotifyOnNetworkStatusChange == nil then
		NotifyOnNetworkStatusChange = false
	end
	if Context == nil then
		Context = {}
	end
	local AssignResult = Object.assign({}, p2, {
		query = Document,
		variables = Variables,
		fetchPolicy = FetchPolicy,
		errorPolicy = ErrorPolicy,
		returnPartialData = ReturnPartialData,
		notifyOnNetworkStatusChange = NotifyOnNetworkStatusChange,
		context = Context
	})
	
	local function fromVariables(Result)
		-- upvalues: AssignResult (copy), self (copy), Query (copy), NetworkStatus1 (ref)
		AssignResult.variables = Result
		
		return self:fetchQueryByPolicy(Query, AssignResult, NetworkStatus1)
	end
	
	local NewResult = nil
	self.fetchCancelFns:set(p1, function(p3)
		-- upvalues: PromiseModule (upval), NewResult (ref)
		PromiseModule.delay(0):andThen(function()
			-- upvalues: NewResult (upval), p3 (copy)
			return NewResult:cancel(p3)
		end)
	end)
	NewResult = Concast.new((function()
		-- upvalues: self (copy), AssignResult (copy), fromVariables (copy)
		return if self:transform(AssignResult.query).hasClientExports then self.localState:addExportedVariables(AssignResult.query, AssignResult.variables, AssignResult.context):andThen(fromVariables) else fromVariables(AssignResult.variables)
	end)())
	NewResult:cleanup(function()
		-- upvalues: self (copy), p1 (copy), ApplyNextFetchPolicyFunction (upval), p2 (copy)
		self.fetchCancelFns:delete(p1)
		ApplyNextFetchPolicyFunction(p2)
	end)
	
	return NewResult
end

function Module:refetchQueries(p1)
	-- upvalues: Boolean (copy), MakeUniqueIdFunction (copy), Map (copy), InstanceofFunction (copy), QueryInfo (copy)
	local UpdateCache = p1.updateCache
	local Include = p1.include
	local Optimistic = p1.optimistic
	local RemoveOptimistic = p1.removeOptimistic
	local OnQueryUpdatedFunction = p1.onQueryUpdated
	
	if Optimistic == nil then
		Optimistic = false
	end
	if RemoveOptimistic == nil then
		RemoveOptimistic = if Boolean.toJSBoolean(Optimistic) then MakeUniqueIdFunction("refetchQueries") else nil
	end
	local NewMap = Map.new(nil)
	
	if Boolean.toJSBoolean(Include) then
		self:getObservableQueries(Include):forEach(function(Oq, p2)
			-- upvalues: NewMap (copy), self (copy)
			NewMap:set(p2, { oq = Oq, lastDiff = self:getQuery(p2):getDiff() })
		end)
	end
	local NewMap1 = Map.new(nil)
	
	if Boolean.toJSBoolean(UpdateCache) then
		self.cache:batch({
			update = UpdateCache,
			optimistic = if Optimistic and Boolean.toJSBoolean(RemoveOptimistic) then RemoveOptimistic else false,
			removeOptimistic = RemoveOptimistic,
			onWatchUpdated = function(_, p2, Diff, LastDiff): boolean?
				-- upvalues: InstanceofFunction (upval), QueryInfo (upval), Boolean (upval), OnQueryUpdatedFunction (copy), NewMap (copy), p1 (copy), NewMap1 (copy)
				local ObservableQuery = if InstanceofFunction(p2.watcher, QueryInfo) then p2.watcher.observableQuery else InstanceofFunction(p2.watcher, QueryInfo)
				
				if Boolean.toJSBoolean(ObservableQuery) then
					if OnQueryUpdatedFunction then
						NewMap:delete(ObservableQuery.queryId)
						local OnQueryUpdatedResult = OnQueryUpdatedFunction(p1, ObservableQuery, Diff, LastDiff)
						
						if OnQueryUpdatedResult == true then
							OnQueryUpdatedResult = ObservableQuery:refetch()
						end
						if OnQueryUpdatedResult ~= false then
							NewMap1:set(ObservableQuery, OnQueryUpdatedResult)
						end
						return false
					elseif OnQueryUpdatedFunction then
						NewMap:set(ObservableQuery.queryId, { oq = ObservableQuery, lastDiff = LastDiff, diff = Diff })
					end
				end
				return nil
			end
		})
	end
	if Boolean.toJSBoolean(NewMap.size) then
		NewMap:forEach(function(p2, Text: string)
			-- upvalues: OnQueryUpdatedFunction (copy), p1 (copy), NewMap1 (copy), self (copy)
			local Oq = p2.oq
			local LastDiff = p2.lastDiff
			local Diff = p2.diff
			local Enabled = nil
			
			if OnQueryUpdatedFunction ~= nil then
				if Diff == nil then
					local QueryInfo = Oq.queryInfo
					QueryInfo:reset()
					Diff = QueryInfo:getDiff()
				end
				Enabled = OnQueryUpdatedFunction(p1, Oq, Diff, LastDiff)
			end
			if OnQueryUpdatedFunction == nil or Enabled == true then
				Enabled = Oq:refetch()
			end
			if Enabled ~= false then
				NewMap1:set(Oq, Enabled)
			end
			local FoundAt: number? = string.find(Text, "legacyOneTimeQuery")
			
			if FoundAt ~= nil and FoundAt >= 1 then
				self:stopQueryNoBroadcast(Text)
			end
		end)
	end
	if Boolean.toJSBoolean(RemoveOptimistic) then
		self.cache:removeOptimistic(RemoveOptimistic)
	end
	return NewMap1
end

function Module.fetchQueryByPolicy(p1, Query, AssignResult, NetworkStatus1)
	-- upvalues: Boolean (copy), NetworkStatus (copy), IsNonEmptyArrayFunction (copy), EqualModule (copy), InvariantFunction (copy), Array (copy), Observable (copy), Object (copy), IsNetworkRequestInFlightFunction (copy), CacheWriteBehavior (copy)
	local Query1 = AssignResult.query
	local Variables = AssignResult.variables
	local FetchPolicy = AssignResult.fetchPolicy
	local RefetchWritePolicy = AssignResult.refetchWritePolicy
	local ErrorPolicy = AssignResult.errorPolicy
	local ReturnPartialData = AssignResult.returnPartialData
	local Context = AssignResult.context
	local NotifyOnNetworkStatusChange = AssignResult.notifyOnNetworkStatusChange
	local NetworkStatus2 = Query.networkStatus
	Query:init({
		document = Query1,
		variables = Variables,
		networkStatus = NetworkStatus1
	})
	
	local function readCache()
		-- upvalues: Query (copy), Variables (copy)
		return Query:getDiff(Variables)
	end
	
	local function resultsFromCache(Diff, MarkReadyResult)
		-- upvalues: Boolean (upval), Query (copy), NetworkStatus (upval), IsNonEmptyArrayFunction (upval), EqualModule (upval), ReturnPartialData (copy), InvariantFunction (upval), Array (upval), Observable (upval), Object (upval), IsNetworkRequestInFlightFunction (upval), p1 (copy), Query1 (copy), Context (copy), Variables (copy)
		if MarkReadyResult == nil then
			MarkReadyResult = Boolean.toJSBoolean(Query.networkStatus) and Query.networkStatus or NetworkStatus.loading
		end
		local Result = Diff.result
		
		if _G.__DEV__ and Diff.missing ~= nil and IsNonEmptyArrayFunction(Diff.missing) and not EqualModule(Result, {}) and not Boolean.toJSBoolean(ReturnPartialData) then
			InvariantFunction.debug(("Missing cache result fields: %s"):format(Array.join(Array.map(Diff.missing, function(p2)
				-- upvalues: Array (upval)
				return Array.join(p2.path, ".")
			end), ", ")), Diff.missing)
		end
		local function fromData(Data)
			-- upvalues: Observable (upval), Object (upval), IsNetworkRequestInFlightFunction (upval), MarkReadyResult (ref), Boolean (upval), Diff (copy)
			return Observable.of((Object.assign({}, {
				data = Data,
				loading = IsNetworkRequestInFlightFunction(MarkReadyResult),
				networkStatus = MarkReadyResult
			}, if Boolean.toJSBoolean(Diff.complete) then nil else { partial = true })))
		end
		
		return if Boolean.toJSBoolean(Result) and p1:transform(Query1).hasForcedResolvers then p1.localState:runResolvers({
			onlyRunForcedResolvers = true,
			document = Query1,
			remoteResult = { data = Result },
			context = Context,
			variables = Variables
		}):andThen(function(Result)
			-- upvalues: fromData (copy), Boolean (upval)
			return fromData(Boolean.toJSBoolean(Result.data) and Result.data or nil)
		end) else fromData(Result)
	end
	
	local FORBID = nil
	FORBID = if FetchPolicy == "no-cache" then CacheWriteBehavior.FORBID elseif NetworkStatus1 == NetworkStatus.refetch and RefetchWritePolicy ~= "merge" then CacheWriteBehavior.OVERWRITE else CacheWriteBehavior.MERGE
	
	local function resultsFromLink()
		-- upvalues: p1 (copy), Query (copy), FORBID (ref), Variables (copy), Context (copy), FetchPolicy (copy), ErrorPolicy (copy)
		return p1:getResultsFromLink(Query, FORBID, {
			variables = Variables,
			context = Context,
			fetchPolicy = FetchPolicy,
			errorPolicy = ErrorPolicy
		})
	end
	
	local IsNetworkRequestInFlight = NotifyOnNetworkStatusChange and (typeof(NetworkStatus2) == "number" and (NetworkStatus2 ~= NetworkStatus1 and IsNetworkRequestInFlightFunction(NetworkStatus1)))
	
	if FetchPolicy == "cache-first" then
		local Diff = Query:getDiff(Variables)
		
		return if Boolean.toJSBoolean(Diff.complete) then { resultsFromCache(Diff, Query:markReady()) } elseif Boolean.toJSBoolean(ReturnPartialData) or Boolean.toJSBoolean(IsNetworkRequestInFlight) then { resultsFromCache(Diff), resultsFromLink() } else { resultsFromLink() }
	elseif FetchPolicy == "cache-and-network" then
		local Diff = Query:getDiff(Variables)
		
		return if Boolean.toJSBoolean(Diff.complete) or Boolean.toJSBoolean(ReturnPartialData) or Boolean.toJSBoolean(IsNetworkRequestInFlight) then { resultsFromCache(Diff), resultsFromLink() } else { resultsFromLink() }
	elseif FetchPolicy == "cache-only" then
		return {
			resultsFromCache(Query:getDiff(Variables), Query:markReady())
		}
	elseif FetchPolicy == "network-only" then
		return if Boolean.toJSBoolean(IsNetworkRequestInFlight) then { resultsFromCache(readCache()), resultsFromLink() } else { resultsFromLink() }
	elseif FetchPolicy == "no-cache" then
		return if Boolean.toJSBoolean(IsNetworkRequestInFlight) then { resultsFromCache(Query:getDiff()), resultsFromLink() } else { resultsFromLink() }
	elseif FetchPolicy == "standby" then
		return {}
	else
		local Diff = Query:getDiff(Variables)
		
		return if Boolean.toJSBoolean(Diff.complete) then { resultsFromCache(Diff, Query:markReady()) } elseif Boolean.toJSBoolean(ReturnPartialData) or Boolean.toJSBoolean(IsNetworkRequestInFlight) then { resultsFromCache(Diff), resultsFromLink() } else { resultsFromLink() }
	end
end

function Module:getQuery(LegacyOneTimeQuery)
	-- upvalues: Boolean (copy), QueryInfo (copy)
	if Boolean.toJSBoolean(LegacyOneTimeQuery) and not self.queries:has(LegacyOneTimeQuery) then
		self.queries:set(LegacyOneTimeQuery, QueryInfo.new(self.cache))
	end
	return self.queries:get(LegacyOneTimeQuery)
end

function Module:prepareContext(AssignResult)
	-- upvalues: Object (copy)
	if AssignResult == nil then
		AssignResult = {}
	end
	return Object.assign({}, self.localState:prepareContext(AssignResult), { clientAwareness = self.clientAwareness })
end

QueryManager.QueryManager = Module

return QueryManager