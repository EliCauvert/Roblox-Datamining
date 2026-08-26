local parent = script.Parent.Parent
local parent_1 = parent.Parent
local t = {}
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local set = luauPolyfillModule.Set
local setTimeout = luauPolyfillModule.setTimeout
local clearTimeout = luauPolyfillModule.clearTimeout
local isCallableModule = require(parent.luaUtils.isCallable)
local promiseModule = require(parent_1.Promise)
local invariant = require(parent.jsutils.invariant).invariant
local equalModule = require(parent.jsutils.equal)
local networkStatusModule = require(script.Parent.networkStatus)
local networkStatus = networkStatusModule.NetworkStatus
local isNetworkRequestInFlight = networkStatusModule.isNetworkRequestInFlight
local utilitiesModule = require(script.Parent.Parent.utilities)
local compact = utilitiesModule.compact
local cloneDeep = utilitiesModule.cloneDeep
local getOperationDefinition = utilitiesModule.getOperationDefinition
local observable = utilitiesModule.Observable
local iterateObserversSafely = utilitiesModule.iterateObserversSafely
local isNonEmptyArray = utilitiesModule.isNonEmptyArray
local fixObservableSubclass = utilitiesModule.fixObservableSubclass
local apolloError = require(script.Parent.Parent.errors).ApolloError
local _ = require(script.Parent.types)
local _ = require(script.Parent.watchQueryOptions_types)
local _ = require(script.Parent.QueryInfo)
local _ = require(script.Parent.ObservableQuery_types)
local defaultSubscriptionObserverErrorCallback = nil
local var1 = false
local tbl = setmetatable({}, { __index = observable })

function tbl:__index(p1)
	-- upvalues: tbl (ref)
	return if p1 == "variables" then self.options.variables elseif rawget(self, p1) then rawget(self, p1) elseif rawget(tbl, p1) then rawget(tbl, p1) else getmetatable(tbl).__index[p1]
end

function tbl:__newindex(p1, p2)
	if p1 == "variables" then
		error("setting getter-only property 'variables'")
	end
	rawset(self, p1, p2)
end

function tbl.new(p1)
	-- upvalues: observable (ref), boolean (ref), defaultSubscriptionObserverErrorCallback (write), tbl (ref), set (ref), iterateObserversSafely (ref), object (ref), networkStatus (ref), getOperationDefinition (ref)
	local queryManager = p1.queryManager
	local queryInfo = p1.queryInfo
	local options = p1.options
	local tbl_1 = nil
	tbl_1 = setmetatable(observable.new(function(p2)
		-- upvalues: boolean (copy), defaultSubscriptionObserverErrorCallback (copy), tbl_1 (write)
		xpcall(function()
			-- upvalues: p2 (ref), boolean (copy), defaultSubscriptionObserverErrorCallback (copy)
			local observer = p2._subscription._observer
			
			if boolean.toJSBoolean(observer) and not boolean.toJSBoolean(observer.error) then
				observer.error = defaultSubscriptionObserverErrorCallback
			end
		end, function() end)
		local var2 = not boolean.toJSBoolean(tbl_1.observers.size)
		tbl_1.observers:add(p2)
		
		if boolean.toJSBoolean(tbl_1.lastError) then
			if boolean.toJSBoolean(p2.error) then
				p2:error(tbl_1.lastError)
			end
		elseif boolean.toJSBoolean(tbl_1.lastResult) and boolean.toJSBoolean(p2.next) then
			p2:next(tbl_1.lastResult)
		end
		if var2 then
			tbl_1:reobserve():catch(function() end)
		end
		return function()
			-- upvalues: tbl_1 (copy), p2 (ref), boolean (copy)
			if tbl_1.observers:delete(p2) and not boolean.toJSBoolean(tbl_1.observers.size) then
				tbl_1:tearDownQuery()
			end
		end
	end), tbl)
	tbl_1.observers = set.new()
	tbl_1.subscriptions = set.new()
	tbl_1.observer = {
		next = function(_, p2)
			-- upvalues: boolean (copy), tbl_1 (write), iterateObserversSafely (copy)
			if boolean.toJSBoolean(tbl_1.lastError) or tbl_1:isDifferentFromLastResult(p2) then
				tbl_1:updateLastResult(p2)
				iterateObserversSafely(tbl_1.observers, "next", p2)
			end
		end,
		error = function(_, p2)
			-- upvalues: tbl_1 (write), object (copy), networkStatus (copy), iterateObserversSafely (copy)
			tbl_1:updateLastResult(object.assign({}, tbl_1.lastResult, {
				error = p2,
				errors = p2.graphQLErrors,
				networkStatus = networkStatus.error,
				loading = false
			}))
			tbl_1.lastError = p2
			iterateObserversSafely(tbl_1.observers, "error", tbl_1.lastError)
		end
	}
	tbl_1.isTornDown = false
	tbl_1.options = options
	tbl_1.queryId = queryManager:generateQueryId()
	local var2 = getOperationDefinition(options.query)
	
	if not boolean.toJSBoolean(var2) then
		tbl_1.queryName = var2
	elseif boolean.toJSBoolean(var2.name) then
		tbl_1.queryName = var2.name.value
	else
		tbl_1.queryName = var2.name
	end
	tbl_1.initialFetchPolicy = if boolean.toJSBoolean(options.fetchPolicy) then options.fetchPolicy else "cache-first"
	tbl_1.queryManager = queryManager
	tbl_1.queryInfo = queryInfo
	
	return tbl_1
end

function tbl.result(p1)
	-- upvalues: promiseModule (ref), boolean (ref), setTimeout (ref)
	return promiseModule.new(function(p2, p3)
		-- upvalues: p1 (ref), boolean (copy), setTimeout (copy)
		local var2 = nil
		local var3 = nil
		var2 = p1:subscribe({
			next = function(_, p4)
				-- upvalues: p2 (ref), p1 (copy), var3 (write), boolean (copy), setTimeout (copy), var2 (write)
				p2(p4)
				p1.observers:delete(var3)
				
				if not boolean.toJSBoolean(p1.observers.size) then
					p1.queryManager:removeQuery(p1.queryId)
				end
				setTimeout(function()
					-- upvalues: var2 (copy)
					var2:unsubscribe()
				end, 0)
			end,
			error = function(_, p4)
				-- upvalues: p3 (ref)
				p3(p4)
			end
		})
	end)
end

function tbl:getCurrentResult(p1)
	-- upvalues: boolean (ref), networkStatus (ref), object (ref), isNetworkRequestInFlight (ref), apolloError (ref)
	if p1 == nil then
		p1 = true
	end
	local lastResult = self.lastResult
	local var2 = if self.options.fetchPolicy == nil then "cache-first" else self.options.fetchPolicy
	local _ = nil
	local var3 = if boolean.toJSBoolean(self.queryInfo.networkStatus) then self.queryInfo.networkStatus elseif boolean.toJSBoolean(lastResult) and boolean.toJSBoolean(lastResult.networkStatus) then lastResult.networkStatus else networkStatus.ready
	local var4 = object.assign({}, lastResult, {
		loading = isNetworkRequestInFlight(var3),
		networkStatus = var3
	})
	
	if not self.queryManager:transform(self.options.query).hasForcedResolvers then
		local diff = self.queryInfo:getDiff()
		
		if boolean.toJSBoolean(diff.complete) or boolean.toJSBoolean(self.options.returnPartialData) then
			var4.data = diff.result
		else
			var4.data = nil
		end
		if boolean.toJSBoolean(diff.complete) then
			if var4.networkStatus == networkStatus.loading and (var2 == "cache-first" or var2 == "cache-only") then
				var4.networkStatus = networkStatus.ready
				var4.loading = false
			end
			var4.partial = nil
		elseif var2 ~= "no-cache" then
			var4.partial = true
		end
		if not boolean.toJSBoolean(diff.complete) and not boolean.toJSBoolean(self.options.partialRefetch) and (not boolean.toJSBoolean(var4.loading) and not boolean.toJSBoolean(var4.data)) and not boolean.toJSBoolean(var4.error) then
			var4.error = apolloError.new({ clientErrors = diff.missing })
		end
	end
	if p1 then
		self:updateLastResult(var4)
	end
	return var4
end

function tbl:isDifferentFromLastResult(p1)
	-- upvalues: equalModule (ref)
	return not equalModule(self.lastResultSnapshot, p1)
end

function tbl:getLastResult()
	return self.lastResult
end

function tbl:getLastError()
	return self.lastError
end

function tbl:resetLastResults()
	self.lastResult = nil
	self.lastResultSnapshot = nil
	self.lastError = nil
	self.isTornDown = false
end

function tbl:resetQueryStoreErrors()
	self.queryManager:resetErrors(self.queryId)
end

function tbl:refetch(p1)
	-- upvalues: boolean (ref), equalModule (ref), object (ref), networkStatus (ref)
	local t = { pollInterval = 0 }
	local fetchPolicy = self.options.fetchPolicy
	
	if fetchPolicy == "no-cache" then
		t.fetchPolicy = "no-cache"
	elseif fetchPolicy ~= "cache-and-network" then
		t.fetchPolicy = "network-only"
	end
	if boolean.toJSBoolean(p1) and not equalModule(self.options.variables, p1) then
		self.options.variables = object.assign({}, self.options.variables, p1)
		t.variables = self.options.variables
	end
	self.queryInfo:resetLastWrite()
	
	return self:reobserve(t, networkStatus.refetch)
end

function tbl:fetchMore(p1)
	-- upvalues: object (ref), boolean (ref), networkStatus (ref), var1 (write), invariant (ref)
	local var2 = object.assign({}, (function()
		-- upvalues: boolean (copy), p1 (ref), object (copy), self (ref)
		return if boolean.toJSBoolean(p1.query) then p1 else object.assign({}, self.options, p1, {
			variables = object.assign({}, self.options.variables, p1.variables)
		})
	end)(), { fetchPolicy = "no-cache" })
	local var3 = self.queryManager:generateQueryId()
	
	if boolean.toJSBoolean(var2.notifyOnNetworkStatusChange) then
		self.queryInfo.networkStatus = networkStatus.fetchMore
		self:observe()
	end
	return self.queryManager:fetchQuery(var3, var2, networkStatus.fetchMore):andThen(function(p2)
		-- upvalues: p1 (ref), boolean (copy), var1 (copy), invariant (copy), self (ref), var2 (ref)
		local data = p2.data
		local updateQuery = p1.updateQuery
		
		if not boolean.toJSBoolean(updateQuery) then
			self.queryManager.cache:writeQuery({
				query = var2.query,
				variables = var2.variables,
				data = data
			})
			
			return p2
		elseif _G.__DEV__ and (not var1 or not _G.__WARNED_ABOUT_OBSERVABLE_QUERY_UPDATE_QUERY__) then
			invariant.warn("The updateQuery callback for fetchMore is deprecated, and will be removed\nin the next major version of Apollo Client.\n\nPlease convert updateQuery functions to field policies with appropriate\nread and merge functions, or use/adapt a helper function (such as\nconcatPagination, offsetLimitPagination, or relayStylePagination) from\n@apollo/client/utilities.\n\nThe field policy system handles pagination more effectively than a\nhand-written updateQuery function, and you only need to define the policy\nonce, rather than every time you call fetchMore.")
			var1 = true
			_G.__WARNED_ABOUT_OBSERVABLE_QUERY_UPDATE_QUERY__ = var1
		end
		self:updateQuery(function(p3)
			-- upvalues: updateQuery (ref), p1 (copy), data (ref), var2 (copy)
			return updateQuery(p1, p3, { fetchMoreResult = data, variables = var2.variables })
		end)
		
		return p2
	end):andThen(function(p2)
		-- upvalues: self (ref), var3 (ref)
		self.queryManager:stopQuery(var3)
		self:reobserve()
		
		return p2
	end):catch(function(p2)
		-- upvalues: self (ref), var3 (ref)
		self.queryManager:stopQuery(var3)
		self:reobserve()
		error(p2)
	end)
end

function tbl:subscribeToMore(p1)
	-- upvalues: boolean (ref), invariant (ref)
	local var2 = self.queryManager:startGraphQLSubscription({
		query = p1.document,
		variables = p1.variables,
		context = p1.context
	}):subscribe({
		next = function(_, p2)
			-- upvalues: p1 (ref), boolean (copy), self (ref)
			local updateQuery = p1.updateQuery
			
			if boolean.toJSBoolean(updateQuery) then
				self:updateQuery(function(p3, p4)
					-- upvalues: updateQuery (ref), p2 (ref)
					return updateQuery(p3, { subscriptionData = p2, variables = p4.variables })
				end)
			end
		end,
		error = function(_, p2)
			-- upvalues: boolean (copy), p1 (ref), invariant (copy)
			if boolean.toJSBoolean(p1.onError) then
				p1:onError(p2)
				
				return
			end
			invariant.error("Unhandled GraphQL subscription error", p2)
		end
	})
	self.subscriptions:add(var2)
	
	return function()
		-- upvalues: boolean (copy), self (ref), var2 (ref)
		if boolean.toJSBoolean(self.subscriptions:delete(var2)) then
			var2:unsubscribe()
		end
	end
end

function tbl:setOptions(p1)
	return self:reobserve(p1)
end

function tbl:setVariables(p1)
	-- upvalues: equalModule (ref), boolean (ref), promiseModule (ref), networkStatus (ref)
	if equalModule(self.variables, p1) then
		return if boolean.toJSBoolean(self.observers.size) then self:result() else promiseModule.resolve()
	end
	self.options.variables = p1
	
	return if boolean.toJSBoolean(self.observers.size) then self:reobserve({ fetchPolicy = self.initialFetchPolicy, variables = p1 }, networkStatus.setVariables) else promiseModule.resolve()
end

function tbl:updateQuery(p1)
	-- upvalues: boolean (ref)
	local queryManager = self.queryManager
	local _ = nil
	local var2 = p1(queryManager.cache:diff({
		returnPartialData = true,
		optimistic = false,
		query = self.options.query,
		variables = self.variables,
		previousResult = if boolean.toJSBoolean(self.lastResult) then self.lastResult.data else nil
	}).result, { variables = self.variables })
	
	if boolean.toJSBoolean(var2) then
		queryManager.cache:writeQuery({
			query = self.options.query,
			data = var2,
			variables = self.variables
		})
		queryManager:broadcastQueries()
	end
end

function tbl:startPolling(p1)
	self.options.pollInterval = p1
	self:updatePolling()
end

function tbl:stopPolling()
	self.options.pollInterval = 0
	self:updatePolling()
end

function tbl:fetch(p1, p2)
	self.queryManager:setObservableQuery(self)
	
	return self.queryManager:fetchQueryObservable(self.queryId, p1, p2)
end

function tbl:updatePolling()
	-- upvalues: boolean (ref), clearTimeout (ref), invariant (ref), isNetworkRequestInFlight (ref), networkStatus (ref), setTimeout (ref)
	local var2 = nil
	
	if boolean.toJSBoolean(self.queryManager.ssrMode) then return end
	local pollingInfo = self.pollingInfo
	local pollInterval = self.options.pollInterval
	
	if boolean.toJSBoolean(pollInterval) then
		if boolean.toJSBoolean(pollingInfo) and pollingInfo.interval == pollInterval then return end
		local var3
		invariant(pollInterval, "Attempted to start a polling query without a polling interval.")
		
		if boolean.toJSBoolean(pollingInfo) then
			var3 = pollingInfo
			
			if not var3 then
				self.pollingInfo = {}
				var3 = self.pollingInfo
			end
			var3.interval = pollInterval
			
			local function maybeFetch()
				-- upvalues: boolean (copy), self (ref), isNetworkRequestInFlight (copy), networkStatus (copy), var2 (write)
				if boolean.toJSBoolean(self.pollingInfo) then
					if not isNetworkRequestInFlight(self.queryInfo.networkStatus) then
						self:reobserve({ fetchPolicy = "network-only" }, networkStatus.poll):andThen(var2, var2)
						
						return
					end
					var2()
				end
			end
			
			;(function()
				-- upvalues: self (ref), boolean (copy), clearTimeout (copy), setTimeout (copy), maybeFetch (ref)
				local pollingInfo = self.pollingInfo
				
				if boolean.toJSBoolean(pollingInfo) then
					if pollingInfo.timeout then
						clearTimeout(pollingInfo.timeout)
					end
					pollingInfo.timeout = setTimeout(maybeFetch, pollingInfo.interval)
				end
			end)()
			
			return
		end
	elseif boolean.toJSBoolean(pollingInfo) then
		clearTimeout(pollingInfo.timeout)
		self.pollingInfo = nil
	end
end

function tbl:updateLastResult(p1)
	-- upvalues: boolean (ref), cloneDeep (ref), isNonEmptyArray (ref)
	local lastResult = self.lastResult
	self.lastResult = p1
	
	if boolean.toJSBoolean(self.queryManager.assumeImmutableResults) then
		self.lastResultSnapshot = p1
	else
		self.lastResultSnapshot = cloneDeep(p1)
	end
	if not isNonEmptyArray(p1.errors) then
		self.lastError = nil
	end
	return lastResult
end

function tbl:reobserve(p1, p2)
	-- upvalues: networkStatus (ref), compact (ref), object (ref), boolean (ref), equalModule (ref)
	self.isTornDown = false
	local var2 = if p2 ~= networkStatus.refetch then if p2 ~= networkStatus.fetchMore then p2 == networkStatus.poll else true else true
	local variables = self.options.variables
	local var3 = if var2 then compact(self.options, p1) else object.assign(self.options, compact(p1))
	
	if not var2 then
		self:updatePolling()
		
		if p1 ~= nil and boolean.toJSBoolean(p1.variables) and (not boolean.toJSBoolean(p1.fetchPolicy) and not equalModule(p1.variables, variables)) then
			var3.fetchPolicy = self.initialFetchPolicy
			
			if p2 == nil then
				p2 = networkStatus.setVariables
			end
		end
	end
	local var4 = self:fetch(var3, p2)
	
	if not var2 then
		if self.concast then
			self.concast:removeObserver(self.observer, true)
		end
		self.concast = var4
	end
	var4:addObserver(self.observer)
	
	return var4.promise
end

function tbl:observe()
	self.observer:next(self:getCurrentResult(false))
end

function tbl:hasObservers()
	return self.observers.size > 0
end

function tbl:tearDownQuery()
	-- upvalues: boolean (ref)
	if boolean.toJSBoolean(self.isTornDown) then return end
	if boolean.toJSBoolean(self.concast) then
		self.concast:removeObserver(self.observer)
		self.concast = nil
	end
	self:stopPolling()
	self.subscriptions:forEach(function(p1)
		return p1:unsubscribe()
	end)
	self.subscriptions:clear()
	self.queryManager:stopQuery(self.queryId)
	self.observers:clear()
	self.isTornDown = true
end

fixObservableSubclass(tbl)
t.ObservableQuery = tbl

defaultSubscriptionObserverErrorCallback = function(_, p1)
	-- upvalues: invariant (ref)
	invariant.error("Unhandled error", p1.message, p1.stack)
end

function t.applyNextFetchPolicy(p1)
	-- upvalues: boolean (ref), isCallableModule (ref)
	local var2 = if p1.fetchPolicy == nil then "cache-first" else p1.fetchPolicy
	local nextFetchPolicy = p1.nextFetchPolicy
	
	if boolean.toJSBoolean(nextFetchPolicy) then
		if isCallableModule(nextFetchPolicy) then
			p1.fetchPolicy = nextFetchPolicy(p1, var2)
			
			return
		end
		p1.fetchPolicy = nextFetchPolicy
	end
end

return t