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
local var8 = false
local tbl = setmetatable({}, { __index = observable })

function tbl:__index(p0)
	-- upvalues: tbl (ref)
	return if p0 == "variables" then self.options.variables elseif rawget(self, p0) then rawget(self, p0) elseif rawget(tbl, p0) then rawget(tbl, p0) else getmetatable(tbl).__index[p0]
end

function tbl:__newindex(p1, p2)
	if p1 == "variables" then
		error("setting getter-only property 'variables'")
	end
	rawset(self, p1, p2)
end

function tbl.new(p3)
	-- upvalues: observable (ref), boolean (ref), defaultSubscriptionObserverErrorCallback (write), tbl (ref), set (ref), iterateObserversSafely (ref), object (ref), networkStatus (ref), getOperationDefinition (ref)
	local queryManager = p3.queryManager
	local queryInfo = p3.queryInfo
	local options = p3.options
	local tbl_1 = nil
	tbl_1 = setmetatable(observable.new(function(p4)
		-- upvalues: boolean (copy), defaultSubscriptionObserverErrorCallback (copy), tbl_1 (write)
		xpcall(function()
			-- upvalues: p4 (ref), boolean (copy), defaultSubscriptionObserverErrorCallback (copy)
			local observer = p4._subscription._observer
			
			if boolean.toJSBoolean(observer) and not boolean.toJSBoolean(observer.error) then
				observer.error = defaultSubscriptionObserverErrorCallback
			end
		end, function() end)
		local var12 = not boolean.toJSBoolean(tbl_1.observers.size)
		tbl_1.observers:add(p4)
		
		if boolean.toJSBoolean(tbl_1.lastError) then
			if boolean.toJSBoolean(p4.error) then
				p4:error(tbl_1.lastError)
			end
		elseif boolean.toJSBoolean(tbl_1.lastResult) and boolean.toJSBoolean(p4.next) then
			p4:next(tbl_1.lastResult)
		end
		if var12 then
			tbl_1:reobserve():catch(function() end)
		end
		return function()
			-- upvalues: tbl_1 (copy), p4 (ref), boolean (copy)
			if tbl_1.observers:delete(p4) and not boolean.toJSBoolean(tbl_1.observers.size) then
				tbl_1:tearDownQuery()
			end
		end
	end), tbl)
	tbl_1.observers = set.new()
	tbl_1.subscriptions = set.new()
	tbl_1.observer = {
		next = function(_, p5)
			-- upvalues: boolean (copy), tbl_1 (write), iterateObserversSafely (copy)
			if boolean.toJSBoolean(tbl_1.lastError) or tbl_1:isDifferentFromLastResult(p5) then
				tbl_1:updateLastResult(p5)
				iterateObserversSafely(tbl_1.observers, "next", p5)
			end
		end,
		error = function(_, p6)
			-- upvalues: tbl_1 (write), object (copy), networkStatus (copy), iterateObserversSafely (copy)
			tbl_1:updateLastResult(object.assign({}, tbl_1.lastResult, {
				error = p6,
				errors = p6.graphQLErrors,
				networkStatus = networkStatus.error,
				loading = false
			}))
			tbl_1.lastError = p6
			iterateObserversSafely(tbl_1.observers, "error", tbl_1.lastError)
		end
	}
	tbl_1.isTornDown = false
	tbl_1.options = options
	tbl_1.queryId = queryManager:generateQueryId()
	local var11 = getOperationDefinition(options.query)
	
	if not boolean.toJSBoolean(var11) then
		tbl_1.queryName = var11
	elseif boolean.toJSBoolean(var11.name) then
		tbl_1.queryName = var11.name.value
	else
		tbl_1.queryName = var11.name
	end
	tbl_1.initialFetchPolicy = if boolean.toJSBoolean(options.fetchPolicy) then options.fetchPolicy else "cache-first"
	tbl_1.queryManager = queryManager
	tbl_1.queryInfo = queryInfo
	
	return tbl_1
end

function tbl.result(p7)
	-- upvalues: promiseModule (ref), boolean (ref), setTimeout (ref)
	return promiseModule.new(function(p8, p9)
		-- upvalues: p7 (ref), boolean (copy), setTimeout (copy)
		local var13 = nil
		local var14 = nil
		var13 = p7:subscribe({
			next = function(_, p10)
				-- upvalues: p8 (ref), p7 (copy), var14 (write), boolean (copy), setTimeout (copy), var13 (write)
				p8(p10)
				p7.observers:delete(var14)
				
				if not boolean.toJSBoolean(p7.observers.size) then
					p7.queryManager:removeQuery(p7.queryId)
				end
				setTimeout(function()
					-- upvalues: var13 (copy)
					var13:unsubscribe()
				end, 0)
			end,
			error = function(_, p11)
				-- upvalues: p9 (ref)
				p9(p11)
			end
		})
	end)
end

function tbl:getCurrentResult(p12)
	-- upvalues: boolean (ref), networkStatus (ref), object (ref), isNetworkRequestInFlight (ref), apolloError (ref)
	if p12 == nil then
		p12 = true
	end
	local lastResult = self.lastResult
	local var15 = if self.options.fetchPolicy == nil then "cache-first" else self.options.fetchPolicy
	local _ = nil
	local var16 = if boolean.toJSBoolean(self.queryInfo.networkStatus) then self.queryInfo.networkStatus elseif boolean.toJSBoolean(lastResult) and boolean.toJSBoolean(lastResult.networkStatus) then lastResult.networkStatus else networkStatus.ready
	local var17 = object.assign({}, lastResult, {
		loading = isNetworkRequestInFlight(var16),
		networkStatus = var16
	})
	
	if not self.queryManager:transform(self.options.query).hasForcedResolvers then
		local diff = self.queryInfo:getDiff()
		
		if boolean.toJSBoolean(diff.complete) or boolean.toJSBoolean(self.options.returnPartialData) then
			var17.data = diff.result
		else
			var17.data = nil
		end
		if boolean.toJSBoolean(diff.complete) then
			if var17.networkStatus == networkStatus.loading and (var15 == "cache-first" or var15 == "cache-only") then
				var17.networkStatus = networkStatus.ready
				var17.loading = false
			end
			var17.partial = nil
		elseif var15 ~= "no-cache" then
			var17.partial = true
		end
		if not boolean.toJSBoolean(diff.complete) and not boolean.toJSBoolean(self.options.partialRefetch) and (not boolean.toJSBoolean(var17.loading) and not boolean.toJSBoolean(var17.data)) and not boolean.toJSBoolean(var17.error) then
			var17.error = apolloError.new({ clientErrors = diff.missing })
		end
	end
	if p12 then
		self:updateLastResult(var17)
	end
	return var17
end

function tbl:isDifferentFromLastResult(p13)
	-- upvalues: equalModule (ref)
	return not equalModule(self.lastResultSnapshot, p13)
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

function tbl:refetch(p14)
	-- upvalues: boolean (ref), equalModule (ref), object (ref), networkStatus (ref)
	local t = { pollInterval = 0 }
	local fetchPolicy = self.options.fetchPolicy
	
	if fetchPolicy == "no-cache" then
		t.fetchPolicy = "no-cache"
	elseif fetchPolicy ~= "cache-and-network" then
		t.fetchPolicy = "network-only"
	end
	if boolean.toJSBoolean(p14) and not equalModule(self.options.variables, p14) then
		self.options.variables = object.assign({}, self.options.variables, p14)
		t.variables = self.options.variables
	end
	self.queryInfo:resetLastWrite()
	
	return self:reobserve(t, networkStatus.refetch)
end

function tbl:fetchMore(p15)
	-- upvalues: object (ref), boolean (ref), networkStatus (ref), var8 (write), invariant (ref)
	local var20 = object.assign({}, (function()
		-- upvalues: boolean (copy), p15 (ref), object (copy), self (ref)
		return if boolean.toJSBoolean(p15.query) then p15 else object.assign({}, self.options, p15, {
			variables = object.assign({}, self.options.variables, p15.variables)
		})
	end)(), { fetchPolicy = "no-cache" })
	local var21 = self.queryManager:generateQueryId()
	
	if boolean.toJSBoolean(var20.notifyOnNetworkStatusChange) then
		self.queryInfo.networkStatus = networkStatus.fetchMore
		self:observe()
	end
	return self.queryManager:fetchQuery(var21, var20, networkStatus.fetchMore):andThen(function(p18)
		-- upvalues: p15 (ref), boolean (copy), var8 (copy), invariant (copy), self (ref), var20 (ref)
		local data = p18.data
		local updateQuery = p15.updateQuery
		
		if not boolean.toJSBoolean(updateQuery) then
			self.queryManager.cache:writeQuery({
				query = var20.query,
				variables = var20.variables,
				data = data
			})
			
			return p18
		elseif _G.__DEV__ and (not var8 or not _G.__WARNED_ABOUT_OBSERVABLE_QUERY_UPDATE_QUERY__) then
			invariant.warn("The updateQuery callback for fetchMore is deprecated, and will be removed\nin the next major version of Apollo Client.\n\nPlease convert updateQuery functions to field policies with appropriate\nread and merge functions, or use/adapt a helper function (such as\nconcatPagination, offsetLimitPagination, or relayStylePagination) from\n@apollo/client/utilities.\n\nThe field policy system handles pagination more effectively than a\nhand-written updateQuery function, and you only need to define the policy\nonce, rather than every time you call fetchMore.")
			var8 = true
			_G.__WARNED_ABOUT_OBSERVABLE_QUERY_UPDATE_QUERY__ = var8
		end
		self:updateQuery(function(p19)
			-- upvalues: updateQuery (ref), p15 (copy), data (ref), var20 (copy)
			return updateQuery(p15, p19, { fetchMoreResult = data, variables = var20.variables })
		end)
		
		return p18
	end):andThen(function(p17)
		-- upvalues: self (ref), var21 (ref)
		self.queryManager:stopQuery(var21)
		self:reobserve()
		
		return p17
	end):catch(function(p16)
		-- upvalues: self (ref), var21 (ref)
		self.queryManager:stopQuery(var21)
		self:reobserve()
		error(p16)
	end)
end

function tbl:subscribeToMore(p20)
	-- upvalues: boolean (ref), invariant (ref)
	local var22 = self.queryManager:startGraphQLSubscription({
		query = p20.document,
		variables = p20.variables,
		context = p20.context
	}):subscribe({
		next = function(_, p21)
			-- upvalues: p20 (ref), boolean (copy), self (ref)
			local updateQuery = p20.updateQuery
			
			if boolean.toJSBoolean(updateQuery) then
				self:updateQuery(function(p22, p23)
					-- upvalues: updateQuery (ref), p21 (ref)
					return updateQuery(p22, { subscriptionData = p21, variables = p23.variables })
				end)
			end
		end,
		error = function(_, p24)
			-- upvalues: boolean (copy), p20 (ref), invariant (copy)
			if boolean.toJSBoolean(p20.onError) then
				p20:onError(p24)
				
				return
			end
			invariant.error("Unhandled GraphQL subscription error", p24)
		end
	})
	self.subscriptions:add(var22)
	
	return function()
		-- upvalues: boolean (copy), self (ref), var22 (ref)
		if boolean.toJSBoolean(self.subscriptions:delete(var22)) then
			var22:unsubscribe()
		end
	end
end

function tbl:setOptions(p25)
	return self:reobserve(p25)
end

function tbl:setVariables(p26)
	-- upvalues: equalModule (ref), boolean (ref), promiseModule (ref), networkStatus (ref)
	if equalModule(self.variables, p26) then
		return if boolean.toJSBoolean(self.observers.size) then self:result() else promiseModule.resolve()
	end
	self.options.variables = p26
	
	return if boolean.toJSBoolean(self.observers.size) then self:reobserve({ fetchPolicy = self.initialFetchPolicy, variables = p26 }, networkStatus.setVariables) else promiseModule.resolve()
end

function tbl:updateQuery(p27)
	-- upvalues: boolean (ref)
	local queryManager = self.queryManager
	local _ = nil
	local var23 = p27(queryManager.cache:diff({
		returnPartialData = true,
		optimistic = false,
		query = self.options.query,
		variables = self.variables,
		previousResult = if boolean.toJSBoolean(self.lastResult) then self.lastResult.data else nil
	}).result, { variables = self.variables })
	
	if boolean.toJSBoolean(var23) then
		queryManager.cache:writeQuery({
			query = self.options.query,
			data = var23,
			variables = self.variables
		})
		queryManager:broadcastQueries()
	end
end

function tbl:startPolling(p28)
	self.options.pollInterval = p28
	self:updatePolling()
end

function tbl:stopPolling()
	self.options.pollInterval = 0
	self:updatePolling()
end

function tbl:fetch(p29, p30)
	self.queryManager:setObservableQuery(self)
	
	return self.queryManager:fetchQueryObservable(self.queryId, p29, p30)
end

function tbl:updatePolling()
	-- upvalues: boolean (ref), clearTimeout (ref), invariant (ref), isNetworkRequestInFlight (ref), networkStatus (ref), setTimeout (ref)
	local var24 = nil
	
	if boolean.toJSBoolean(self.queryManager.ssrMode) then return end
	local pollingInfo = self.pollingInfo
	local pollInterval = self.options.pollInterval
	
	if boolean.toJSBoolean(pollInterval) then
		if boolean.toJSBoolean(pollingInfo) and pollingInfo.interval == pollInterval then return end
		local var25
		invariant(pollInterval, "Attempted to start a polling query without a polling interval.")
		
		if boolean.toJSBoolean(pollingInfo) then
			var25 = pollingInfo
			
			if not var25 then
				self.pollingInfo = {}
				var25 = self.pollingInfo
			end
			var25.interval = pollInterval
			
			local function maybeFetch()
				-- upvalues: boolean (copy), self (ref), isNetworkRequestInFlight (copy), networkStatus (copy), var24 (write)
				if boolean.toJSBoolean(self.pollingInfo) then
					if not isNetworkRequestInFlight(self.queryInfo.networkStatus) then
						self:reobserve({ fetchPolicy = "network-only" }, networkStatus.poll):andThen(var24, var24)
						
						return
					end
					var24()
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

function tbl:updateLastResult(p31)
	-- upvalues: boolean (ref), cloneDeep (ref), isNonEmptyArray (ref)
	local lastResult = self.lastResult
	self.lastResult = p31
	
	if boolean.toJSBoolean(self.queryManager.assumeImmutableResults) then
		self.lastResultSnapshot = p31
	else
		self.lastResultSnapshot = cloneDeep(p31)
	end
	if not isNonEmptyArray(p31.errors) then
		self.lastError = nil
	end
	return lastResult
end

function tbl:reobserve(p32, p33)
	-- upvalues: networkStatus (ref), compact (ref), object (ref), boolean (ref), equalModule (ref)
	self.isTornDown = false
	local var27 = if p33 ~= networkStatus.refetch then if p33 ~= networkStatus.fetchMore then p33 == networkStatus.poll else true else true
	local variables = self.options.variables
	local var28 = if var27 then compact(self.options, p32) else object.assign(self.options, compact(p32))
	
	if not var27 then
		self:updatePolling()
		
		if p32 ~= nil and boolean.toJSBoolean(p32.variables) and (not boolean.toJSBoolean(p32.fetchPolicy) and not equalModule(p32.variables, variables)) then
			var28.fetchPolicy = self.initialFetchPolicy
			
			if p33 == nil then
				p33 = networkStatus.setVariables
			end
		end
	end
	local var29 = self:fetch(var28, p33)
	
	if not var27 then
		if self.concast then
			self.concast:removeObserver(self.observer, true)
		end
		self.concast = var29
	end
	var29:addObserver(self.observer)
	
	return var29.promise
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
	self.subscriptions:forEach(function(p34)
		return p34:unsubscribe()
	end)
	self.subscriptions:clear()
	self.queryManager:stopQuery(self.queryId)
	self.observers:clear()
	self.isTornDown = true
end

fixObservableSubclass(tbl)
t.ObservableQuery = tbl

defaultSubscriptionObserverErrorCallback = function(_, p35)
	-- upvalues: invariant (ref)
	invariant.error("Unhandled error", p35.message, p35.stack)
end

function t.applyNextFetchPolicy(p36)
	-- upvalues: boolean (ref), isCallableModule (ref)
	local var30 = if p36.fetchPolicy == nil then "cache-first" else p36.fetchPolicy
	local nextFetchPolicy = p36.nextFetchPolicy
	
	if boolean.toJSBoolean(nextFetchPolicy) then
		if isCallableModule(nextFetchPolicy) then
			p36.fetchPolicy = nextFetchPolicy(p36, var30)
			
			return
		end
		p36.fetchPolicy = nextFetchPolicy
	end
end

return t