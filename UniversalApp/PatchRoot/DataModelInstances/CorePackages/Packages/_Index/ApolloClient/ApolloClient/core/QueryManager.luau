local t = {}
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local instanceof = luauPolyfillModule.instanceof
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local set = luauPolyfillModule.Set
local weakMap = luauPolyfillModule.WeakMap
local promiseModule = require(parent_1.Promise)
local httpService = game:GetService("HttpService")
local isCallableModule = require(parent.luaUtils.isCallable)
local toJSBoolean = require(parent.utilities.globals.null).toJSBoolean
local _ = require(parent_1.GraphQL)
local invariantModule = require(parent.jsutils.invariant)
local invariant = invariantModule.invariant
local invariantError = invariantModule.InvariantError
local equalModule = require(parent.jsutils.equal)
local execute = require(script.Parent.Parent.link.core).execute
local canonicalStringify = require(script.Parent.Parent.cache).canonicalStringify
local utilitiesModule = require(script.Parent.Parent.utilities)
local getDefaultValues = utilitiesModule.getDefaultValues
local getOperationDefinition = utilitiesModule.getOperationDefinition
local getOperationName = utilitiesModule.getOperationName
local hasClientExports = utilitiesModule.hasClientExports
local graphQLResultHasError = utilitiesModule.graphQLResultHasError
local removeConnectionDirectiveFromDocument = utilitiesModule.removeConnectionDirectiveFromDocument
local _ = utilitiesModule.canUseWeakMap
local observable = utilitiesModule.Observable
local asyncMap = utilitiesModule.asyncMap
local isNonEmptyArray = utilitiesModule.isNonEmptyArray
local concast = utilitiesModule.Concast
local makeUniqueId = utilitiesModule.makeUniqueId
local isDocumentNode = utilitiesModule.isDocumentNode
local isNonNullObject = utilitiesModule.isNonNullObject
local errorsModule = require(script.Parent.Parent.errors)
local apolloError = errorsModule.ApolloError
local isApolloError = errorsModule.isApolloError
local _ = require(script.Parent.watchQueryOptions_types)
local observableQueryModule = require(script.Parent.ObservableQuery)
local _ = require(script.Parent.ObservableQuery_types)
local observableQuery = observableQueryModule.ObservableQuery
local applyNextFetchPolicy = observableQueryModule.applyNextFetchPolicy
local networkStatusModule = require(script.Parent.networkStatus)
local networkStatus = networkStatusModule.NetworkStatus
local isNetworkRequestInFlight = networkStatusModule.isNetworkRequestInFlight
local _ = require(script.Parent.types)
local localState = require(script.Parent.LocalState).LocalState
local queryInfoModule = require(script.Parent.QueryInfo)
local queryInfo = queryInfoModule.QueryInfo
local shouldWriteResult = queryInfoModule.shouldWriteResult
local cacheWriteBehavior = queryInfoModule.CacheWriteBehavior
local hasOwnPropertyModule = require(parent.luaUtils.hasOwnProperty)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 310 ]]
	-- upvalues: t_1 (ref), map (ref), weakMap (ref), localState (ref), boolean (ref)
	local cache = p0.cache
	local link = p0.link
	local queryDeduplication = p0.queryDeduplication
	local onBroadcast = p0.onBroadcast
	local ssrMode = p0.ssrMode
	local clientAwareness = p0.clientAwareness
	local localState_1 = p0.localState
	local assumeImmutableResults = p0.assumeImmutableResults
	
	if queryDeduplication == nil then
		queryDeduplication = false
	end
	if ssrMode == nil then
		ssrMode = false
	end
	if clientAwareness == nil then
		clientAwareness = {}
	end
	local tbl = setmetatable({}, t_1)
	tbl.clientAwareness = {}
	tbl.queries = map.new()
	tbl.fetchCancelFns = map.new()
	tbl.transformCache = weakMap.new()
	tbl.queryIdCounter = 1
	tbl.requestIdCounter = 1
	tbl.mutationIdCounter = 1
	tbl.inFlightLinkObservables = map.new()
	tbl.cache = cache
	tbl.link = link
	tbl.queryDeduplication = queryDeduplication
	tbl.clientAwareness = clientAwareness
	tbl.localState = localState_1 or localState.new({ cache = cache })
	tbl.ssrMode = ssrMode
	tbl.assumeImmutableResults = boolean.toJSBoolean(assumeImmutableResults)
	tbl.onBroadcast = onBroadcast
	
	if boolean.toJSBoolean(tbl.onBroadcast) then
		tbl.mutationStore = {}
	end
	return tbl
end

function t_1:stop() --[[ line: 390 ]]
	-- upvalues: invariantError (ref)
	self.queries:forEach(function(_, p1) --[[ line: 391 ]]
		-- upvalues: self (ref)
		self:stopQueryNoBroadcast(p1)
	end)
	self:cancelPendingFetches(invariantError.new("QueryManager stopped while query was in flight"))
end

function t_1:cancelPendingFetches(p2) --[[ line: 398 ]]
	self.fetchCancelFns:forEach(function(p3) --[[ line: 399 ]]
		-- upvalues: p2 (ref)
		return p3(p2)
	end)
	self.fetchCancelFns:clear()
end

function t_1.mutate(p4, p5) --[[ line: 405 ]]
	-- upvalues: promiseModule (ref), invariant (ref), boolean (ref), asyncMap (ref), object (ref), graphQLResultHasError (ref), apolloError (ref), isCallableModule (ref), instanceof (ref)
	return promiseModule.resolve():andThen(function() --[[ line: 408 ]]
		-- upvalues: p5 (ref), invariant (copy), boolean (copy), p4 (ref), promiseModule (copy), asyncMap (copy), object (copy), graphQLResultHasError (copy), apolloError (copy), isCallableModule (copy), instanceof (copy)
		local mutation = p5.mutation
		local variables = p5.variables
		local optimisticResponse = p5.optimisticResponse
		local updateQueries = p5.updateQueries
		local refetchQueries = p5.refetchQueries
		local awaitRefetchQueries = p5.awaitRefetchQueries
		local update = p5.update
		local onQueryUpdated = p5.onQueryUpdated
		local errorPolicy = p5.errorPolicy
		local fetchPolicy = p5.fetchPolicy
		local keepRootFields = p5.keepRootFields
		local context = p5.context
		local var15 = if refetchQueries == nil then {} else refetchQueries
		
		if awaitRefetchQueries == nil then
			awaitRefetchQueries = false
		end
		if errorPolicy == nil then
			errorPolicy = "none"
		end
		invariant(mutation, "mutation option is required. You must specify your GraphQL document in the mutation option.")
		invariant(not boolean.toJSBoolean(fetchPolicy) or fetchPolicy == "no-cache", "Mutations only support a 'no-cache' fetchPolicy. If you don't want to disable the cache, remove your fetchPolicy setting to proceed with the default mutation behavior.")
		local var16 = p4:generateMutationId()
		mutation = p4:transform(mutation).document
		variables = p4:getVariables(mutation, variables)
		
		if p4:transform(mutation).hasClientExports then
			variables = p4.localState:addExportedVariables(mutation, variables, context):expect()
		end
		local var17
		local _ = nil
		
		if boolean.toJSBoolean(p4.mutationStore) then
			p4.mutationStore[var16] = {
				loading = true,
				error = nil,
				mutation = mutation,
				variables = variables
			}
			var17 = p4.mutationStore[var16]
		else
			var17 = p4.mutationStore
		end
		if boolean.toJSBoolean(optimisticResponse) then
			p4:markMutationOptimistic(optimisticResponse, {
				mutationId = var16,
				document = mutation,
				variables = variables,
				fetchPolicy = fetchPolicy,
				errorPolicy = errorPolicy,
				context = context,
				updateQueries = updateQueries,
				update = update,
				keepRootFields = keepRootFields
			})
		end
		p4:broadcastQueries()
		
		return promiseModule.new(function(p6, p7) --[[ line: 486 ]]
			-- upvalues: asyncMap (copy), p4 (copy), mutation (write), object (copy), context (ref), optimisticResponse (ref), variables (write), graphQLResultHasError (copy), errorPolicy (write), apolloError (copy), boolean (copy), var17 (write), isCallableModule (copy), var15 (write), var16 (ref), fetchPolicy (ref), update (ref), updateQueries (ref), awaitRefetchQueries (write), onQueryUpdated (ref), keepRootFields (ref), p4 (ref), instanceof (copy)
			return asyncMap(p4:getObservableFromLink(mutation, object.assign({}, context, { optimisticResponse = optimisticResponse }), variables, false), function(p10) --[[ line: 494 ]]
				-- upvalues: graphQLResultHasError (copy), errorPolicy (copy), apolloError (copy), boolean (copy), var17 (copy), object (copy), isCallableModule (copy), var15 (copy), p4 (copy), var16 (copy), mutation (copy), variables (copy), fetchPolicy (copy), context (copy), update (copy), updateQueries (copy), awaitRefetchQueries (copy), optimisticResponse (copy), onQueryUpdated (copy), keepRootFields (copy)
				if graphQLResultHasError(p10) and errorPolicy == "none" then
					error(apolloError.new({ graphQLErrors = p10.errors }))
				end
				if boolean.toJSBoolean(var17) then
					var17.loading = false
					var17.error = nil
				end
				local var18 = object.assign({}, p10)
				
				if isCallableModule(var15) then
					var15 = var15(var18)
				end
				if errorPolicy == "ignore" and graphQLResultHasError(var18) then
					var18.errors = nil
				end
				return p4:markMutationResult({
					mutationId = var16,
					result = var18,
					document = mutation,
					variables = variables,
					fetchPolicy = fetchPolicy,
					errorPolicy = errorPolicy,
					context = context,
					update = update,
					updateQueries = updateQueries,
					awaitRefetchQueries = awaitRefetchQueries,
					refetchQueries = var15,
					removeOptimistic = if boolean.toJSBoolean(optimisticResponse) then var16 else nil,
					onQueryUpdated = onQueryUpdated,
					keepRootFields = keepRootFields
				})
			end):subscribe({
				next = function(_, p8) --[[ line: 534 ]]
					-- upvalues: p4 (copy), p6 (ref)
					p4:broadcastQueries()
					p6(p8)
				end,
				error = function(_, p9) --[[ line: 544 ]]
					-- upvalues: boolean (copy), var17 (copy), optimisticResponse (copy), p4 (copy), var16 (copy), p7 (ref), instanceof (copy), apolloError (copy)
					if boolean.toJSBoolean(var17) then
						var17.loading = false
						var17.error = p9
					end
					if boolean.toJSBoolean(optimisticResponse) then
						p4.cache:removeOptimistic(var16)
					end
					p4:broadcastQueries()
					p7(if instanceof(p9, apolloError) then p9 else apolloError.new({ networkError = p9 }))
				end
			})
		end)
	end)
end

function t_1:markMutationResult(p11, p12) --[[ line: 563 ]]
	-- upvalues: shouldWriteResult (ref), boolean (ref), hasOwnPropertyModule (ref), getOperationName (ref), array (ref), object (ref), promiseModule (ref), toJSBoolean (ref)
	if p12 == nil then
		p12 = self.cache
	end
	local result = p11.result
	local t = {}
	local var20 = p11.fetchPolicy == "no-cache"
	
	if not var20 and shouldWriteResult(result, p11.errorPolicy) then
		table.insert(t, {
			dataId = "ROOT_MUTATION",
			result = result.data,
			query = p11.document,
			variables = p11.variables
		})
		local updateQueries = p11.updateQueries
		
		if updateQueries ~= nil then
			self.queries:forEach(function(p13, p14) --[[ line: 600 ]]
				-- upvalues: boolean (copy), hasOwnPropertyModule (copy), updateQueries (ref), self (ref), p12 (write), result (write), getOperationName (copy), t (ref)
				local observableQuery = p13.observableQuery
				local var22 = if boolean.toJSBoolean(observableQuery) then observableQuery.queryName else observableQuery
				
				if not boolean.toJSBoolean(var22) or not hasOwnPropertyModule(updateQueries, var22) then return end
				local var23 = updateQueries[var22]
				local var24 = self.queries:get(p14)
				local document = var24.document
				local variables = var24.variables
				local var25 = p12:diff({
					returnPartialData = true,
					optimistic = false,
					query = document,
					variables = variables
				})
				local result_1 = var25.result
				
				if var25.complete and boolean.toJSBoolean(result_1) then
					local var28
					local t_1 = { mutationResult = result }
					
					if boolean.toJSBoolean(document) then
						local var27 = getOperationName(document)
						var28 = if boolean.toJSBoolean(var27) then var27 else nil
					else
						var28 = nil
					end
					t_1.queryName = var28
					t_1.queryVariables = variables
					local var29 = var23(updateQueries, result_1, t_1)
					
					if boolean.toJSBoolean(var29) then
						table.insert(t, {
							dataId = "ROOT_QUERY",
							result = var29,
							query = document,
							variables = variables
						})
					end
				end
			end)
		end
	end
	if #t > 0 or boolean.toJSBoolean(p11.refetchQueries) or (boolean.toJSBoolean(p11.update) or boolean.toJSBoolean(p11.onQueryUpdated)) or boolean.toJSBoolean(p11.removeOptimistic) then
		local t_1 = {}
		self:refetchQueries({
			optimistic = false,
			updateCache = function(_, p16) --[[ line: 667 ]]
				-- upvalues: var20 (ref), array (copy), t (ref), p11 (ref), boolean (copy), self (ref), result (write), object (copy)
				if not var20 then
					array.forEach(t, function(p17) --[[ line: 669 ]]
						-- upvalues: p16 (ref)
						return p16:write(p17)
					end)
				end
				local update = p11.update
				
				if update ~= nil and boolean.toJSBoolean(update) then
					if not var20 then
						local var30 = p16:diff({
							id = "ROOT_MUTATION",
							optimistic = false,
							returnPartialData = true,
							query = self:transform(p11.document).asQuery,
							variables = p11.variables
						})
						
						if var30.complete then
							result = object.assign({}, result, { data = var30.result })
						end
					end
					update(p11, p16, result, { context = p11.context, variables = p11.variables })
				end
				if not var20 and not p11.keepRootFields then
					p16:modify({
						id = "ROOT_MUTATION",
						fields = function(_, p18, p19) --[[ line: 711 ]]
							return if p19.fieldName == "__typename" then p18 else p19.DELETE
						end
					})
				end
			end,
			include = p11.refetchQueries,
			removeOptimistic = p11.removeOptimistic,
			onQueryUpdated = if boolean.toJSBoolean(p11.onQueryUpdated) then p11.onQueryUpdated else nil
		}):forEach(function(p15) --[[ line: 737 ]]
			-- upvalues: t_1 (ref)
			return table.insert(t_1, p15)
		end)
		
		return if p11.awaitRefetchQueries or boolean.toJSBoolean(p11.onQueryUpdated) then promiseModule.all(array.filter(t_1, toJSBoolean)):andThen(function() --[[ line: 746 ]]
			-- upvalues: result (write)
			return result
		end) else promiseModule.resolve(result)
	end
end

function t_1:markMutationOptimistic(p20, p21) --[[ line: 755 ]]
	-- upvalues: isCallableModule (ref), object (ref), invariant (ref)
	local var31 = if isCallableModule(p20) then p20(p21.variables) else p20
	
	return self.cache:recordOptimisticTransaction(function(p22) --[[ line: 776 ]]
		-- upvalues: self (ref), object (copy), p21 (ref), var31 (write), invariant (copy)
		local ok, status = pcall(function() --[[ line: 777 ]]
			-- upvalues: self (copy), object (copy), p21 (copy), var31 (copy), p22 (ref)
			self:markMutationResult(object.assign({}, p21, { result = { data = var31 } }), p22)
		end)
		
		if not ok then
			invariant.error(status)
		end
	end, p21.mutationId)
end

function t_1:fetchQuery(p23, p24, p25) --[[ line: 786 ]]
	return self:fetchQueryObservable(p23, p24, p25).promise
end

function t_1:getQueryStore() --[[ line: 794 ]]
	local t = {}
	self.queries:forEach(function(p26, p27) --[[ line: 796 ]]
		-- upvalues: t (ref)
		t[p27] = {
			variables = p26.variables,
			networkStatus = p26.networkStatus,
			networkError = p26.networkError,
			graphQLErrors = p26.graphQLErrors
		}
	end)
	
	return t
end

function t_1:resetErrors(p28) --[[ line: 807 ]]
	-- upvalues: boolean (ref)
	local var33 = self.queries:get(p28)
	
	if boolean.toJSBoolean(var33) then
		var33.networkError = nil
		var33.graphQLErrors = {}
	end
end

function t_1:transform(p29) --[[ line: 815 ]]
	-- upvalues: removeConnectionDirectiveFromDocument (ref), boolean (ref), hasClientExports (ref), getDefaultValues (ref), getOperationDefinition (ref), object (ref), array (ref)
	local transformCache = self.transformCache
	
	if not transformCache:has(p29) then
		local var34 = self.cache:transformDocument(p29)
		local var35 = removeConnectionDirectiveFromDocument(self.cache:transformForLink(var34))
		local var36 = self.localState:clientQuery(var34)
		local var37 = if boolean.toJSBoolean(var35) then self.localState:serverQuery(var35) else var35
		local t = {
			document = var34,
			hasClientExports = hasClientExports(var34),
			hasForcedResolvers = self.localState:shouldForceResolvers(var34),
			clientQuery = var36,
			serverQuery = var37,
			defaultVars = getDefaultValues(getOperationDefinition(var34)),
			asQuery = object.assign({}, var34, {
				definitions = array.map(var34.definitions, function(p30) --[[ line: 842 ]]
					-- upvalues: object (copy)
					return if p30.kind == "OperationDefinition" and p30.operation ~= "query" then object.assign({}, p30, { operation = "query" }) else p30
				end)
			})
		}
		
		local function _(p31) --[[ line: 851 | named "add" ]]
			-- upvalues: transformCache (ref), t (ref)
			if p31 ~= nil and not transformCache:has(p31) then
				transformCache:set(p31, t)
			end
		end
		
		if p29 ~= nil and not transformCache:has(p29) then
			transformCache:set(p29, t)
		end
		if var34 ~= nil and not transformCache:has(var34) then
			transformCache:set(var34, t)
		end
		if var36 ~= nil and not transformCache:has(var36) then
			transformCache:set(var36, t)
		end
		local var39 = var37
		
		if var39 ~= nil and not transformCache:has(var39) then
			transformCache:set(var39, t)
		end
	end
	return transformCache:get(p29)
end

function t_1:getVariables(p32, p33) --[[ line: 868 ]]
	-- upvalues: object (ref)
	return object.assign({}, self:transform(p32).defaultVars, p33)
end

function t_1:watchQuery(p34) --[[ line: 872 ]]
	-- upvalues: object (ref), queryInfo (ref), observableQuery (ref)
	local var40 = object.assign({}, p34, { variables = self:getVariables(p34.query, p34.variables) })
	
	if typeof(var40.notifyOnNetworkStatusChange) == "nil" then
		var40.notifyOnNetworkStatusChange = false
	end
	local var41 = queryInfo.new(self.cache)
	local var42 = observableQuery.new({ queryManager = self, queryInfo = var41, options = var40 })
	self.queries:set(var42.queryId, var41)
	var41:init({
		document = var40.query,
		observableQuery = var42,
		variables = var40.variables
	})
	
	return var42
end

function t_1:query(p35, p36) --[[ line: 900 ]]
	-- upvalues: invariant (ref), boolean (ref)
	if p36 == nil then
		p36 = self:generateQueryId()
	end
	invariant(p35.query, "query option is required. You must specify your GraphQL document in the query option.")
	invariant(p35.query.kind == "Document", "You must wrap the query string in a \"gql\" tag.")
	invariant(not boolean.toJSBoolean(p35.returnPartialData), "returnPartialData option only supported on watchQuery.")
	invariant(not boolean.toJSBoolean(p35.pollInterval), "pollInterval option only supported on watchQuery.")
	
	return self:fetchQuery(p36, p35):andThen(function(p38) --[[ line: 927 ]]
		-- upvalues: self (ref), p36 (write)
		self:stopQuery(p36)
		
		return p38
	end):catch(function(p37) --[[ line: 931 ]]
		-- upvalues: self (ref), p36 (write)
		self:stopQuery(p36)
		error(p37)
	end)
end

function t_1:generateQueryId() --[[ line: 937 ]]
	local queryIdCounter = self.queryIdCounter
	self.queryIdCounter += 1
	
	return tostring(queryIdCounter)
end

function t_1:generateRequestId() --[[ line: 944 ]]
	local requestIdCounter = self.requestIdCounter
	self.requestIdCounter += 1
	
	return requestIdCounter
end

function t_1:generateMutationId() --[[ line: 951 ]]
	local mutationIdCounter = self.mutationIdCounter
	self.mutationIdCounter += 1
	
	return tostring(mutationIdCounter)
end

function t_1:stopQueryInStore(p39) --[[ line: 958 ]]
	self:stopQueryInStoreNoBroadcast(p39)
	self:broadcastQueries()
end

function t_1:stopQueryInStoreNoBroadcast(p40) --[[ line: 963 ]]
	-- upvalues: boolean (ref)
	local var43 = self.queries:get(p40)
	
	if boolean.toJSBoolean(var43) then
		var43:stop()
	end
end

function t_1:clearStore() --[[ line: 970 ]]
	-- upvalues: invariantError (ref), boolean (ref), networkStatus (ref)
	self:cancelPendingFetches(invariantError.new("Store reset while query was in flight (not completed in link chain)"))
	self.queries:forEach(function(p41, _) --[[ line: 978 ]]
		-- upvalues: boolean (copy), networkStatus (copy)
		if boolean.toJSBoolean(p41.observableQuery) then
			p41.networkStatus = networkStatus.loading
			
			return
		end
		p41:stop()
	end)
	
	if boolean.toJSBoolean(self.mutationStore) then
		self.mutationStore = {}
	end
	return self.cache:reset()
end

function t_1:resetStore() --[[ line: 996 ]]
	return self:clearStore():andThen(function() --[[ line: 1003 ]]
		-- upvalues: self (ref)
		return self:reFetchObservableQueries()
	end)
end

function t_1:getObservableQueries(p42) --[[ line: 1008 ]]
	-- upvalues: map (ref), set (ref), array (ref), isDocumentNode (ref), isNonNullObject (ref), boolean (ref), makeUniqueId (ref), observableQuery (ref), object (ref), invariant (ref), httpService (ref)
	if p42 == nil then
		p42 = "active"
	end
	local var44 = map.new(nil)
	local var45 = map.new(nil)
	local var46 = set.new()
	
	if array.isArray(p42) then
		array.forEach(p42, function(p43) --[[ line: 1023 ]]
			-- upvalues: var45 (ref), isDocumentNode (copy), self (ref), isNonNullObject (copy), boolean (copy), var46 (ref)
			if typeof(p43) == "string" then
				var45:set(p43, false)
				
				return
			elseif isDocumentNode(p43) then
				var45:set(self:transform(p43).document, false)
				
				return
			elseif isNonNullObject(p43) and boolean.toJSBoolean(p43.query) then
				var46:add(p43)
			end
		end)
	end
	self.queries:forEach(function(p44, p45) --[[ line: 1034 ]]
		-- upvalues: boolean (copy), p42 (write), var44 (ref), var45 (ref)
		local observableQuery = p44.observableQuery
		local document = p44.document
		
		if boolean.toJSBoolean(observableQuery) then
			if p42 == "all" then
				var44:set(p45, observableQuery)
				
				return
			end
			local queryName = observableQuery.queryName
			
			if observableQuery.options.fetchPolicy == "standby" or not observableQuery:hasObservers() then return end
			if p42 == "active" or boolean.toJSBoolean(queryName) and var45:has(queryName) or boolean.toJSBoolean(document) and var45:has(document) then
				var44:set(p45, observableQuery)
				
				if boolean.toJSBoolean(queryName) then
					var45:set(queryName, true)
				end
				if boolean.toJSBoolean(document) then
					var45:set(document, true)
				end
			end
		end
	end)
	
	if boolean.toJSBoolean(var46.size) then
		for i, v in var46 do
			local var47 = makeUniqueId("legacyOneTimeQuery")
			local var48 = self:getQuery(var47):init({ document = v.query, variables = v.variables })
			local var49 = observableQuery.new({
				queryManager = self,
				queryInfo = var48,
				options = object.assign({}, v, { fetchPolicy = "network-only" })
			})
			var48:setObservableQuery(var49)
			var44:set(var47, var49)
		end
	end
	if _G.__DEV__ and boolean.toJSBoolean(var45.size) then
		var45:forEach(function(p46, p47) --[[ line: 1086 ]]
			-- upvalues: invariant (copy), httpService (copy)
			if not p46 then
				invariant.warn(("Unknown query %s%s requested in refetchQueries options.include array"):format(if typeof(p47) == "string" then "named " else "", httpService:JSONEncode(p47)))
			end
		end)
	end
	return var44
end

function t_1:reFetchObservableQueries(p48) --[[ line: 1101 ]]
	-- upvalues: boolean (ref), promiseModule (ref), array (ref), toJSBoolean (ref)
	if p48 == nil then
		p48 = false
	end
	local t = {}
	self:getObservableQueries(if boolean.toJSBoolean(p48) then "all" else "active"):forEach(function(p49, p50) --[[ line: 1109 ]]
		-- upvalues: boolean (copy), p48 (write), t (ref), self (ref)
		local fetchPolicy = p49.options.fetchPolicy
		p49:resetLastResults()
		
		if boolean.toJSBoolean(p48) or fetchPolicy ~= "standby" and fetchPolicy ~= "cache-only" then
			table.insert(t, p49:refetch())
		end
		self:getQuery(p50):setDiff(nil)
	end)
	self:broadcastQueries()
	
	return promiseModule.all(array.filter(t, toJSBoolean))
end

function t_1:setObservableQuery(p51) --[[ line: 1124 ]]
	self:getQuery(p51.queryId):setObservableQuery(p51)
end

function t_1:startGraphQLSubscription(p52) --[[ line: 1128 ]]
	-- upvalues: shouldWriteResult (ref), graphQLResultHasError (ref), apolloError (ref), observable (ref)
	local query = p52.query
	local fetchPolicy = p52.fetchPolicy
	local errorPolicy = p52.errorPolicy
	local variables = p52.variables
	local var51 = if p52.context == nil then {} else p52.context
	query = self:transform(query).document
	local var52 = self:getVariables(query, variables)
	
	local function makeObservable(p53) --[[ line: 1140 ]]
		-- upvalues: self (ref), query (write), var51 (write), fetchPolicy (ref), shouldWriteResult (copy), errorPolicy (ref), graphQLResultHasError (copy), apolloError (copy)
		return self:getObservableFromLink(query, var51, p53):map(function(p54) --[[ line: 1141 ]]
			-- upvalues: fetchPolicy (copy), shouldWriteResult (copy), errorPolicy (copy), self (copy), query (copy), p53 (ref), graphQLResultHasError (copy), apolloError (copy)
			if fetchPolicy ~= "no-cache" then
				if shouldWriteResult(p54, errorPolicy) then
					self.cache:write({
						dataId = "ROOT_SUBSCRIPTION",
						query = query,
						result = p54.data,
						variables = p53
					})
				end
				self:broadcastQueries()
			end
			if graphQLResultHasError(p54) then
				error(apolloError.new({ graphQLErrors = p54.errors }))
			end
			return p54
		end)
	end
	
	if self:transform(query).hasClientExports then
		local var54 = self.localState:addExportedVariables(query, var52, var51):andThen(makeObservable)
		
		return observable.new(function(p55) --[[ line: 1171 ]]
			-- upvalues: var54 (ref)
			local var55 = nil
			var54:andThen(function(p56) --[[ line: 1173 ]]
				-- upvalues: var55 (write), p55 (ref)
				var55 = p56:subscribe(p55)
				
				return var55
			end, p55.error)
			
			return function() --[[ line: 1177 ]]
				-- upvalues: var55 (write)
				return if var55 == nil then var55 else var55:unsubscribe()
			end
		end)
	end
	return makeObservable(var52)
end

function t_1:stopQuery(p57) --[[ line: 1190 ]]
	self:stopQueryNoBroadcast(p57)
	self:broadcastQueries()
end

function t_1:stopQueryNoBroadcast(p58) --[[ line: 1195 ]]
	self:stopQueryInStoreNoBroadcast(p58)
	self:removeQuery(p58)
end

function t_1:removeQuery(p59) --[[ line: 1200 ]]
	self.fetchCancelFns:delete(p59)
	self:getQuery(p59):stop()
	self.queries:delete(p59)
end

function t_1:broadcastQueries() --[[ line: 1211 ]]
	-- upvalues: boolean (ref)
	if boolean.toJSBoolean(self.onBroadcast) then
		self:onBroadcast()
	end
	self.queries:forEach(function(p60, _) --[[ line: 1216 ]]
		return p60:notify()
	end)
end

function t_1:getLocalState() --[[ line: 1221 ]]
	return self.localState
end

function t_1:getObservableFromLink(p61, p62, p63, p64) --[[ line: 1225 ]]
	-- upvalues: boolean (ref), getOperationName (ref), object (ref), map (ref), canonicalStringify (ref), concast (ref), execute (ref), observable (ref), toJSBoolean (ref), asyncMap (ref)
	if p64 == nil then
		p64 = if boolean.toJSBoolean(p62) then if p62.queryDeduplication ~= nil then self.queryDeduplication else p62.queryDeduplication else self.queryDeduplication
	end
	local var57
	local _ = nil
	local serverQuery = self:transform(p61).serverQuery
	
	if boolean.toJSBoolean(serverQuery) then
		local inFlightLinkObservables = self.inFlightLinkObservables
		local link = self.link
		local t = {
			query = serverQuery,
			variables = p63,
			operationName = boolean.toJSBoolean(getOperationName(serverQuery)) and getOperationName(serverQuery) or nil,
			context = self:prepareContext(object.assign({}, p62, { forceFetch = not p64 }))
		}
		p62 = t.context
		
		if p64 then
			local var58 = inFlightLinkObservables:get(serverQuery)
			local var59 = if boolean.toJSBoolean(var58) then var58 else map.new(nil)
			inFlightLinkObservables:set(serverQuery, var59)
			local var60 = canonicalStringify(p63)
			var57 = var59:get(var60)
			
			if not boolean.toJSBoolean(var57) then
				local var61 = concast.new({ execute(link, t) })
				var57 = var61
				var59:set(var60, var57)
				var61:cleanup(function() --[[ line: 1277 ]]
					-- upvalues: boolean (copy), var59 (ref), var60 (ref), inFlightLinkObservables (ref), serverQuery (ref)
					if boolean.toJSBoolean(var59:delete(var60)) and var59.size < 1 then
						inFlightLinkObservables:delete(serverQuery)
					end
				end)
			end
		else
			var57 = concast.new({ execute(link, t) })
		end
	else
		var57 = concast.new({ observable.of({ data = {} }) })
		p62 = self:prepareContext(p62)
	end
	local clientQuery = self:transform(p61).clientQuery
	
	if toJSBoolean(clientQuery) then
		var57 = asyncMap(var57, function(p65) --[[ line: 1298 ]]
			-- upvalues: self (ref), clientQuery (ref), p62 (write), p63 (ref)
			return self.localState:runResolvers({
				document = clientQuery,
				remoteResult = p65,
				context = p62,
				variables = p63
			})
		end)
	end
	return var57
end

function t_1:getResultsFromLink(p66, p67, p68) --[[ line: 1311 ]]
	-- upvalues: asyncMap (ref), isNonEmptyArray (ref), apolloError (ref), boolean (ref), networkStatus (ref), isApolloError (ref)
	p66.lastRequestId = self:generateRequestId()
	local lastRequestId = p66.lastRequestId
	
	return asyncMap(self:getObservableFromLink(p66.document, p68.context, p68.variables), function(p69) --[[ line: 1321 ]]
		-- upvalues: isNonEmptyArray (copy), lastRequestId (ref), p66 (ref), p68 (ref), apolloError (copy), p67 (ref), boolean (copy), networkStatus (copy)
		local var62 = isNonEmptyArray(p69.errors)
		
		if p66.lastRequestId <= lastRequestId then
			if var62 and p68.errorPolicy == "none" then
				error(p66:markError(apolloError.new({ graphQLErrors = p69.errors })))
			end
			p66:markResult(p69, p68, p67)
			p66:markReady()
		end
		local t = {
			loading = false,
			data = p69.data,
			networkStatus = if boolean.toJSBoolean(p66.networkStatus) then p66.networkStatus else networkStatus.ready
		}
		
		if var62 and p68.errorPolicy ~= "ignore" then
			t.errors = p69.errors
		end
		return t
	end, function(p70) --[[ line: 1350 ]]
		-- upvalues: isApolloError (copy), apolloError (copy), lastRequestId (ref), p66 (ref)
		local var64 = if isApolloError(p70) then p70 else apolloError.new({ networkError = p70 })
		
		if p66.lastRequestId <= lastRequestId then
			p66:markError(var64)
		end
		error(var64)
	end)
end

function t_1:fetchQueryObservable(p71, p72, p73) --[[ line: 1368 ]]
	-- upvalues: networkStatus (ref), object (ref), promiseModule (ref), concast (ref), applyNextFetchPolicy (ref)
	if p73 == nil then
		p73 = networkStatus.loading
	end
	local document = self:transform(p72.query).document
	local var65 = self:getVariables(document, p72.variables)
	local var66 = self:getQuery(p71)
	local fetchPolicy = p72.fetchPolicy
	local errorPolicy = p72.errorPolicy
	local returnPartialData = p72.returnPartialData
	local notifyOnNetworkStatusChange = p72.notifyOnNetworkStatusChange
	local context = p72.context
	
	if fetchPolicy == nil then
		fetchPolicy = "cache-first"
	end
	if errorPolicy == nil then
		errorPolicy = "none"
	end
	if returnPartialData == nil then
		returnPartialData = false
	end
	if notifyOnNetworkStatusChange == nil then
		notifyOnNetworkStatusChange = false
	end
	if context == nil then
		context = {}
	end
	local var67 = object.assign({}, p72, {
		query = document,
		variables = var65,
		fetchPolicy = fetchPolicy,
		errorPolicy = errorPolicy,
		returnPartialData = returnPartialData,
		notifyOnNetworkStatusChange = notifyOnNetworkStatusChange,
		context = context
	})
	
	local function fromVariables(p74) --[[ line: 1417 ]]
		-- upvalues: var67 (ref), self (ref), var66 (ref), p73 (write)
		var67.variables = p74
		
		return self:fetchQueryByPolicy(var66, var67, p73)
	end
	
	local var69 = nil
	self.fetchCancelFns:set(p71, function(p75) --[[ line: 1430 ]]
		-- upvalues: promiseModule (copy), var69 (write)
		promiseModule.delay(0):andThen(function() --[[ line: 1433 ]]
			-- upvalues: var69 (copy), p75 (ref)
			return var69:cancel(p75)
		end)
	end)
	var69 = concast.new((function() --[[ line: 1441 ]]
		-- upvalues: self (ref), var67 (ref), fromVariables (ref)
		return if self:transform(var67.query).hasClientExports then self.localState:addExportedVariables(var67.query, var67.variables, var67.context):andThen(fromVariables) else fromVariables(var67.variables)
	end)())
	var69:cleanup(function() --[[ line: 1458 ]]
		-- upvalues: self (ref), p71 (ref), applyNextFetchPolicy (copy), p72 (ref)
		self.fetchCancelFns:delete(p71)
		applyNextFetchPolicy(p72)
	end)
	
	return var69
end

function t_1:refetchQueries(p76) --[[ line: 1466 ]]
	-- upvalues: boolean (ref), makeUniqueId (ref), map (ref), instanceof (ref), queryInfo (ref)
	local updateCache = p76.updateCache
	local include = p76.include
	local optimistic = p76.optimistic
	local removeOptimistic = p76.removeOptimistic
	local onQueryUpdated = p76.onQueryUpdated
	
	if optimistic == nil then
		optimistic = false
	end
	if removeOptimistic == nil then
		removeOptimistic = if boolean.toJSBoolean(optimistic) then makeUniqueId("refetchQueries") else nil
	end
	local var70 = map.new(nil)
	
	if boolean.toJSBoolean(include) then
		self:getObservableQueries(include):forEach(function(p77, p78) --[[ line: 1490 ]]
			-- upvalues: var70 (ref), self (ref)
			var70:set(p78, { oq = p77, lastDiff = self:getQuery(p78):getDiff() })
		end)
	end
	local var71 = map.new(nil)
	
	if boolean.toJSBoolean(updateCache) then
		self.cache:batch({
			update = updateCache,
			optimistic = if optimistic and boolean.toJSBoolean(removeOptimistic) then removeOptimistic else false,
			removeOptimistic = removeOptimistic,
			onWatchUpdated = function(_, p79, p80, p81) --[[ line: 1545 ]]
				-- upvalues: instanceof (copy), queryInfo (copy), boolean (copy), onQueryUpdated (ref), var70 (ref), p76 (ref), var71 (ref)
				local var72 = if instanceof(p79.watcher, queryInfo) then p79.watcher.observableQuery else instanceof(p79.watcher, queryInfo)
				
				if boolean.toJSBoolean(var72) then
					if onQueryUpdated then
						var70:delete(var72.queryId)
						local var73 = onQueryUpdated(p76, var72, p80, p81)
						
						if var73 == true then
							var73 = var72:refetch()
						end
						if var73 ~= false then
							var71:set(var72, var73)
						end
						return false
					elseif onQueryUpdated then
						var70:set(var72.queryId, { oq = var72, lastDiff = p81, diff = p80 })
					end
				end
				return nil
			end
		})
	end
	if boolean.toJSBoolean(var70.size) then
		var70:forEach(function(p82, p83) --[[ line: 1593 ]]
			-- upvalues: onQueryUpdated (ref), p76 (ref), var71 (ref), self (ref)
			local oq = p82.oq
			local lastDiff = p82.lastDiff
			local diff = p82.diff
			local var74 = nil
			
			if onQueryUpdated ~= nil then
				if diff == nil then
					local queryInfo = oq.queryInfo
					queryInfo:reset()
					diff = queryInfo:getDiff()
				end
				var74 = onQueryUpdated(p76, oq, diff, lastDiff)
			end
			if onQueryUpdated == nil or var74 == true then
				var74 = oq:refetch()
			end
			if var74 ~= false then
				var71:set(oq, var74)
			end
			local matchIndex = string.find(p83, "legacyOneTimeQuery")
			
			if matchIndex ~= nil and matchIndex >= 1 then
				self:stopQueryNoBroadcast(p83)
			end
		end)
	end
	if boolean.toJSBoolean(removeOptimistic) then
		self.cache:removeOptimistic(removeOptimistic)
	end
	return var71
end

function t_1.fetchQueryByPolicy(p84, p85, p86, p87) --[[ line: 1653 ]]
	-- upvalues: boolean (ref), networkStatus (ref), isNonEmptyArray (ref), equalModule (ref), invariant (ref), array (ref), observable (ref), object (ref), isNetworkRequestInFlight (ref), cacheWriteBehavior (ref)
	local var82
	local query = p86.query
	local variables = p86.variables
	local fetchPolicy = p86.fetchPolicy
	local refetchWritePolicy = p86.refetchWritePolicy
	local errorPolicy = p86.errorPolicy
	local returnPartialData = p86.returnPartialData
	local context = p86.context
	local notifyOnNetworkStatusChange = p86.notifyOnNetworkStatusChange
	local networkStatus_1 = p85.networkStatus
	p85:init({
		document = query,
		variables = variables,
		networkStatus = p87
	})
	
	local function readCache() --[[ line: 1679 ]]
		-- upvalues: p85 (ref), variables (ref)
		return p85:getDiff(variables)
	end
	
	local function resultsFromCache(p88, p89) --[[ line: 1683 ]]
		-- upvalues: boolean (copy), p85 (ref), networkStatus (copy), isNonEmptyArray (copy), equalModule (copy), returnPartialData (ref), invariant (copy), array (copy), observable (copy), object (copy), isNetworkRequestInFlight (copy), p84 (ref), query (ref), context (ref), variables (ref)
		if p89 == nil then
			p89 = if boolean.toJSBoolean(p85.networkStatus) then p85.networkStatus else networkStatus.loading
		end
		local result = p88.result
		
		if _G.__DEV__ and p88.missing ~= nil and (isNonEmptyArray(p88.missing) and not equalModule(result, {})) and not boolean.toJSBoolean(returnPartialData) then
			invariant.debug(("Missing cache result fields: %s"):format(array.join(array.map(p88.missing, function(p90) --[[ line: 1701 ]]
				-- upvalues: array (copy)
				return array.join(p90.path, ".")
			end), ", ")), p88.missing)
		end
		local function fromData(p91) --[[ line: 1710 ]]
			-- upvalues: observable (copy), object (copy), isNetworkRequestInFlight (copy), p89 (write), boolean (copy), p88 (ref)
			return observable.of(object.assign({}, {
				data = p91,
				loading = isNetworkRequestInFlight(p89),
				networkStatus = p89
			}, if boolean.toJSBoolean(p88.complete) then nil else { partial = true }))
		end
		
		return if boolean.toJSBoolean(result) and p84:transform(query).hasForcedResolvers then p84.localState:runResolvers({
			onlyRunForcedResolvers = true,
			document = query,
			remoteResult = { data = result },
			context = context,
			variables = variables
		}):andThen(function(p92) --[[ line: 1737 ]]
			-- upvalues: fromData (ref), boolean (copy)
			return fromData(if boolean.toJSBoolean(p92.data) then p92.data else nil)
		end) else fromData(result)
	end
	
	local _ = nil
	local var78 = if fetchPolicy == "no-cache" then cacheWriteBehavior.FORBID elseif p87 == networkStatus.refetch and refetchWritePolicy ~= "merge" then cacheWriteBehavior.OVERWRITE else cacheWriteBehavior.MERGE
	
	local function resultsFromLink() --[[ line: 1758 ]]
		-- upvalues: p84 (ref), p85 (ref), var78 (write), variables (ref), context (ref), fetchPolicy (ref), errorPolicy (ref)
		return p84:getResultsFromLink(p85, var78, {
			variables = variables,
			context = context,
			fetchPolicy = fetchPolicy,
			errorPolicy = errorPolicy
		})
	end
	
	local var80 = notifyOnNetworkStatusChange and (typeof(networkStatus_1) == "number" and (networkStatus_1 ~= p87 and isNetworkRequestInFlight(p87)))
	
	if fetchPolicy == "cache-first" then
		local var81 = p85:getDiff(variables)
		
		return if boolean.toJSBoolean(var81.complete) then { resultsFromCache(var81, p85:markReady()) } elseif boolean.toJSBoolean(returnPartialData) or boolean.toJSBoolean(var80) then { resultsFromCache(var81), resultsFromLink() } else { resultsFromLink() }
	elseif fetchPolicy == "cache-and-network" then
		var82 = p85:getDiff(variables)
		
		return if boolean.toJSBoolean(var82.complete) or boolean.toJSBoolean(returnPartialData) or boolean.toJSBoolean(var80) then { resultsFromCache(var82), resultsFromLink() } else { resultsFromLink() }
	elseif fetchPolicy == "cache-only" then
		return {
			resultsFromCache(p85:getDiff(variables), p85:markReady())
		}
	elseif fetchPolicy == "network-only" then
		return if boolean.toJSBoolean(var80) then { resultsFromCache(readCache()), resultsFromLink() } else { resultsFromLink() }
	elseif fetchPolicy == "no-cache" then
		return if boolean.toJSBoolean(var80) then { resultsFromCache(p85:getDiff()), resultsFromLink() } else { resultsFromLink() }
	elseif fetchPolicy == "standby" then
		return {}
	end
	var82 = p85:getDiff(variables)
	
	return if boolean.toJSBoolean(var82.complete) then { resultsFromCache(var82, p85:markReady()) } elseif boolean.toJSBoolean(returnPartialData) or boolean.toJSBoolean(var80) then { resultsFromCache(var82), resultsFromLink() } else { resultsFromLink() }
end

function t_1:getQuery(p93) --[[ line: 1834 ]]
	-- upvalues: boolean (ref), queryInfo (ref)
	if boolean.toJSBoolean(p93) and not self.queries:has(p93) then
		self.queries:set(p93, queryInfo.new(self.cache))
	end
	return self.queries:get(p93)
end

function t_1:prepareContext(p94) --[[ line: 1841 ]]
	-- upvalues: object (ref)
	if p94 == nil then
		p94 = {}
	end
	return object.assign({}, self.localState:prepareContext(p94), { clientAwareness = self.clientAwareness })
end

t.QueryManager = t_1

return t