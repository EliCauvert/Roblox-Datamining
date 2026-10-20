local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ObservableQueryModule = {}
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local Set = LuauPolyfillModule.Set
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local IsCallableModule = require(Parent.luaUtils.isCallable)
local PromiseModule = require(Parent1.Promise)
local InvariantFunction = require(Parent.jsutils.invariant).invariant
local EqualModule = require(Parent.jsutils.equal)
local NetworkStatusModule = require(script.Parent.networkStatus)
local NetworkStatus = NetworkStatusModule.NetworkStatus
local IsNetworkRequestInFlightFunction = NetworkStatusModule.isNetworkRequestInFlight
local UtilitiesModule = require(script.Parent.Parent.utilities)
local CompactFunction = UtilitiesModule.compact
local CloneDeepFunction = UtilitiesModule.cloneDeep
local GetOperationDefinitionFunction = UtilitiesModule.getOperationDefinition
local Observable = UtilitiesModule.Observable
local IterateObserversSafelyFunction = UtilitiesModule.iterateObserversSafely
local IsNonEmptyArrayFunction = UtilitiesModule.isNonEmptyArray
local FixObservableSubclassFunction: (any) -> () = UtilitiesModule.fixObservableSubclass
local ApolloError = require(script.Parent.Parent.errors).ApolloError
local _ = require(script.Parent.types)
local _ = require(script.Parent.watchQueryOptions_types)
local _ = require(script.Parent.QueryInfo)
local _ = require(script.Parent.ObservableQuery_types)
local DefaultSubscriptionObserverErrorCallback = nil
local Flag = false
local self = setmetatable({}, { __index = Observable })

function self.__index(p1, p2)
	-- upvalues: self (copy)
	return if p2 == "variables" then p1.options.variables elseif rawget(p1, p2) then rawget(p1, p2) elseif rawget(self, p2) then rawget(self, p2) else getmetatable(self).__index[p2]
end

function self.__newindex(p1, p2, p3)
	if p2 == "variables" then
		error("setting getter-only property 'variables'")
	end
	rawset(p1, p2, p3)
end

function self.new(p1)
	-- upvalues: Observable (copy), Boolean (copy), DefaultSubscriptionObserverErrorCallback (ref), self (copy), Set (copy), IterateObserversSafelyFunction (copy), Object (copy), NetworkStatus (copy), GetOperationDefinitionFunction (copy)
	local QueryManager = p1.queryManager
	local QueryInfo = p1.queryInfo
	local Options = p1.options
	local v1 = nil
	v1 = setmetatable(Observable.new(function(p2)
		-- upvalues: Boolean (upval), DefaultSubscriptionObserverErrorCallback (upval), v1 (ref)
		xpcall(function()
			-- upvalues: p2 (copy), Boolean (upval), DefaultSubscriptionObserverErrorCallback (upval)
			local Observer = p2._subscription._observer
			
			if Boolean.toJSBoolean(Observer) and not Boolean.toJSBoolean(Observer.error) then
				Observer.error = DefaultSubscriptionObserverErrorCallback
			end
		end, function() end)
		local Inverted = not Boolean.toJSBoolean(v1.observers.size)
		v1.observers:add(p2)
		
		if Boolean.toJSBoolean(v1.lastError) then
			if Boolean.toJSBoolean(p2.error) then
				p2:error(v1.lastError)
			end
		elseif Boolean.toJSBoolean(v1.lastResult) and Boolean.toJSBoolean(p2.next) then
			p2:next(v1.lastResult)
		end
		if Inverted then
			v1:reobserve():catch(function() end)
		end
		return function()
			-- upvalues: v1 (upval), p2 (copy), Boolean (upval)
			if v1.observers:delete(p2) and not Boolean.toJSBoolean(v1.observers.size) then
				v1:tearDownQuery()
			end
		end
	end), self)
	v1.observers = Set.new()
	v1.subscriptions = Set.new()
	v1.observer = {
		next = function(_, LastResult)
			-- upvalues: Boolean (upval), v1 (ref), IterateObserversSafelyFunction (upval)
			if Boolean.toJSBoolean(v1.lastError) or v1:isDifferentFromLastResult(LastResult) then
				v1:updateLastResult(LastResult)
				IterateObserversSafelyFunction(v1.observers, "next", LastResult)
			end
		end,
		error = function(_, LastError)
			-- upvalues: v1 (ref), Object (upval), NetworkStatus (upval), IterateObserversSafelyFunction (upval)
			v1:updateLastResult((Object.assign({}, v1.lastResult, {
				error = LastError,
				errors = LastError.graphQLErrors,
				networkStatus = NetworkStatus.error,
				loading = false
			})))
			v1.lastError = LastError
			IterateObserversSafelyFunction(v1.observers, "error", v1.lastError)
		end
	}
	v1.isTornDown = false
	v1.options = Options
	v1.queryId = QueryManager:generateQueryId()
	local OperationDefinition = GetOperationDefinitionFunction(Options.query)
	
	if Boolean.toJSBoolean(OperationDefinition) then
		if Boolean.toJSBoolean(OperationDefinition.name) then
			v1.queryName = OperationDefinition.name.value
		else
			v1.queryName = OperationDefinition.name
		end
	else
		v1.queryName = OperationDefinition
	end
	v1.initialFetchPolicy = Boolean.toJSBoolean(Options.fetchPolicy) and Options.fetchPolicy or "cache-first"
	v1.queryManager = QueryManager
	v1.queryInfo = QueryInfo
	
	return v1
end

function self.result(p1)
	-- upvalues: PromiseModule (copy), Boolean (copy), SetTimeoutFunction (copy)
	return PromiseModule.new(function(Callback, Callback1)
		-- upvalues: p1 (copy), Boolean (upval), SetTimeoutFunction (upval)
		local SubscribeResult = nil
		local v1 = nil
		v1 = {
			next = function(_, p2)
				-- upvalues: Callback (copy), p1 (upval), v1 (ref), Boolean (upval), SetTimeoutFunction (upval), SubscribeResult (ref)
				Callback(p2)
				p1.observers:delete(v1)
				
				if not Boolean.toJSBoolean(p1.observers.size) then
					p1.queryManager:removeQuery(p1.queryId)
				end
				SetTimeoutFunction(function()
					-- upvalues: SubscribeResult (upval)
					SubscribeResult:unsubscribe()
				end, 0)
			end,
			error = function(_, p2)
				-- upvalues: Callback1 (copy)
				Callback1(p2)
			end
		}
		SubscribeResult = p1:subscribe(v1)
	end)
end

function self:getCurrentResult(p1: boolean)
	-- upvalues: Boolean (copy), NetworkStatus (copy), Object (copy), IsNetworkRequestInFlightFunction (copy), ApolloError (copy)
	if p1 == nil then
		p1 = true
	end
	local LastResult = self.lastResult
	local CacheFirst = if self.options.fetchPolicy == nil then "cache-first" else self.options.fetchPolicy
	local NetworkStatus1 = if Boolean.toJSBoolean(self.queryInfo.networkStatus) then self.queryInfo.networkStatus elseif Boolean.toJSBoolean(LastResult) and Boolean.toJSBoolean(LastResult.networkStatus) then LastResult.networkStatus else NetworkStatus.ready
	local AssignResult = Object.assign({}, LastResult, {
		loading = IsNetworkRequestInFlightFunction(NetworkStatus1),
		networkStatus = NetworkStatus1
	})
	
	if not self.queryManager:transform(self.options.query).hasForcedResolvers then
		local Diff = self.queryInfo:getDiff()
		
		if Boolean.toJSBoolean(Diff.complete) or Boolean.toJSBoolean(self.options.returnPartialData) then
			AssignResult.data = Diff.result
		else
			AssignResult.data = nil
		end
		if Boolean.toJSBoolean(Diff.complete) then
			if AssignResult.networkStatus == NetworkStatus.loading and (CacheFirst == "cache-first" or CacheFirst == "cache-only") then
				AssignResult.networkStatus = NetworkStatus.ready
				AssignResult.loading = false
			end
			AssignResult.partial = nil
		elseif CacheFirst ~= "no-cache" then
			AssignResult.partial = true
		end
		if not Boolean.toJSBoolean(Diff.complete) and not Boolean.toJSBoolean(self.options.partialRefetch) and not Boolean.toJSBoolean(AssignResult.loading) and not Boolean.toJSBoolean(AssignResult.data) and not Boolean.toJSBoolean(AssignResult.error) then
			AssignResult.error = ApolloError.new({ clientErrors = Diff.missing })
		end
	end
	if p1 then
		self:updateLastResult(AssignResult)
	end
	return AssignResult
end

function self:isDifferentFromLastResult(p1): boolean
	-- upvalues: EqualModule (copy)
	return not EqualModule(self.lastResultSnapshot, p1)
end

function self:getLastResult()
	return self.lastResult
end

function self:getLastError()
	return self.lastError
end

function self:resetLastResults()
	self.lastResult = nil
	self.lastResultSnapshot = nil
	self.lastError = nil
	self.isTornDown = false
end

function self:resetQueryStoreErrors()
	self.queryManager:resetErrors(self.queryId)
end

function self:refetch(p1)
	-- upvalues: Boolean (copy), EqualModule (copy), Object (copy), NetworkStatus (copy)
	local config = { pollInterval = 0 }
	local FetchPolicy = self.options.fetchPolicy
	
	if FetchPolicy == "no-cache" then
		config.fetchPolicy = "no-cache"
	elseif FetchPolicy ~= "cache-and-network" then
		config.fetchPolicy = "network-only"
	end
	if Boolean.toJSBoolean(p1) and not EqualModule(self.options.variables, p1) then
		self.options.variables = Object.assign({}, self.options.variables, p1)
		config.variables = self.options.variables
	end
	self.queryInfo:resetLastWrite()
	
	return self:reobserve(config, NetworkStatus.refetch)
end

function self:fetchMore(p1)
	-- upvalues: Object (copy), Boolean (copy), NetworkStatus (copy), Flag (ref), InvariantFunction (copy)
	local AssignResult = Object.assign({}, if Boolean.toJSBoolean(p1.query) then p1 else Object.assign({}, self.options, p1, {
		variables = Object.assign({}, self.options.variables, p1.variables)
	}), { fetchPolicy = "no-cache" })
	local QueryId = self.queryManager:generateQueryId()
	
	if Boolean.toJSBoolean(AssignResult.notifyOnNetworkStatusChange) then
		self.queryInfo.networkStatus = NetworkStatus.fetchMore
		self:observe()
	end
	return self.queryManager:fetchQuery(QueryId, AssignResult, NetworkStatus.fetchMore):andThen(function(Result)
		-- upvalues: p1 (copy), Boolean (upval), Flag (upval), InvariantFunction (upval), self (copy), AssignResult (copy)
		local Data = Result.data
		local UpdateQueryFunction = p1.updateQuery
		
		if not Boolean.toJSBoolean(UpdateQueryFunction) then
			self.queryManager.cache:writeQuery({
				query = AssignResult.query,
				variables = AssignResult.variables,
				data = Data
			})
			
			return Result
		end
		if _G.__DEV__ and (not Flag or not _G.__WARNED_ABOUT_OBSERVABLE_QUERY_UPDATE_QUERY__) then
			InvariantFunction.warn("The updateQuery callback for fetchMore is deprecated, and will be removed\nin the next major version of Apollo Client.\n\nPlease convert updateQuery functions to field policies with appropriate\nread and merge functions, or use/adapt a helper function (such as\nconcatPagination, offsetLimitPagination, or relayStylePagination) from\n@apollo/client/utilities.\n\nThe field policy system handles pagination more effectively than a\nhand-written updateQuery function, and you only need to define the policy\nonce, rather than every time you call fetchMore.")
			Flag = true
			_G.__WARNED_ABOUT_OBSERVABLE_QUERY_UPDATE_QUERY__ = Flag
		end
		self:updateQuery(function(p2)
			-- upvalues: UpdateQueryFunction (copy), p1 (upval), Data (copy), AssignResult (upval)
			return UpdateQueryFunction(p1, p2, {
				fetchMoreResult = Data,
				variables = AssignResult.variables
			})
		end)
		
		return Result
	end):andThen(function(Result)
		-- upvalues: self (copy), QueryId (copy)
		self.queryManager:stopQuery(QueryId)
		self:reobserve()
		
		return Result
	end):catch(function(Err)
		-- upvalues: self (copy), QueryId (copy)
		self.queryManager:stopQuery(QueryId)
		self:reobserve()
		error(Err)
	end)
end

function self:subscribeToMore(p1)
	-- upvalues: Boolean (copy), InvariantFunction (copy)
	local SubscribeResult = self.queryManager:startGraphQLSubscription({
		query = p1.document,
		variables = p1.variables,
		context = p1.context
	}):subscribe({
		next = function(_, SubscriptionData)
			-- upvalues: p1 (copy), Boolean (upval), self (copy)
			local UpdateQueryFunction = p1.updateQuery
			
			if Boolean.toJSBoolean(UpdateQueryFunction) then
				self:updateQuery(function(p2, p3)
					-- upvalues: UpdateQueryFunction (copy), SubscriptionData (copy)
					return UpdateQueryFunction(p2, {
						subscriptionData = SubscriptionData,
						variables = p3.variables
					})
				end)
			end
		end,
		error = function(_, p2)
			-- upvalues: Boolean (upval), p1 (copy), InvariantFunction (upval)
			if Boolean.toJSBoolean(p1.onError) then
				p1:onError(p2)
				
				return
			else
				InvariantFunction.error("Unhandled GraphQL subscription error", p2)
			end
		end
	})
	self.subscriptions:add(SubscribeResult)
	
	return function()
		-- upvalues: Boolean (upval), self (copy), SubscribeResult (copy)
		if Boolean.toJSBoolean(self.subscriptions:delete(SubscribeResult)) then
			SubscribeResult:unsubscribe()
		end
	end
end

function self:setOptions(p1)
	return self:reobserve(p1)
end

function self:setVariables(Variables)
	-- upvalues: EqualModule (copy), Boolean (copy), PromiseModule (copy), NetworkStatus (copy)
	if EqualModule(self.variables, Variables) then
		return if Boolean.toJSBoolean(self.observers.size) then self:result() else PromiseModule.resolve()
	else
		self.options.variables = Variables
		
		return if Boolean.toJSBoolean(self.observers.size) then self:reobserve({
			fetchPolicy = self.initialFetchPolicy,
			variables = Variables
		}, NetworkStatus.setVariables) else PromiseModule.resolve()
	end
end

function self:updateQuery(Callback)
	-- upvalues: Boolean (copy)
	local QueryManager = self.queryManager
	local CallbackResult = Callback(QueryManager.cache:diff({
		returnPartialData = true,
		optimistic = false,
		query = self.options.query,
		variables = self.variables,
		previousResult = Boolean.toJSBoolean(self.lastResult) and self.lastResult.data or nil
	}).result, { variables = self.variables })
	
	if Boolean.toJSBoolean(CallbackResult) then
		QueryManager.cache:writeQuery({
			query = self.options.query,
			data = CallbackResult,
			variables = self.variables
		})
		QueryManager:broadcastQueries()
	end
end

function self:startPolling(PollInterval)
	self.options.pollInterval = PollInterval
	self:updatePolling()
end

function self:stopPolling()
	self.options.pollInterval = 0
	self:updatePolling()
end

function self:fetch(AssignResult, SetVariables)
	self.queryManager:setObservableQuery(self)
	
	return self.queryManager:fetchQueryObservable(self.queryId, AssignResult, SetVariables)
end

function self:updatePolling()
	-- upvalues: Boolean (copy), ClearTimeoutFunction (copy), InvariantFunction (copy), IsNetworkRequestInFlightFunction (copy), NetworkStatus (copy), SetTimeoutFunction (copy)
	local Callback = nil
	
	if Boolean.toJSBoolean(self.queryManager.ssrMode) then return end
	local PollingInfo = self.pollingInfo
	local PollInterval = self.options.pollInterval
	
	if Boolean.toJSBoolean(PollInterval) then
		if Boolean.toJSBoolean(PollingInfo) and PollingInfo.interval == PollInterval then return end
		InvariantFunction(PollInterval, "Attempted to start a polling query without a polling interval.")
		local PollingInfo1 = nil
		repeat
			if Boolean.toJSBoolean(PollingInfo) then
				PollingInfo1 = PollingInfo
				
				if PollingInfo1 then break end
			end
			self.pollingInfo = {}
			PollingInfo1 = self.pollingInfo
		until true
		PollingInfo1.interval = PollInterval
		
		local function maybeFetch()
			-- upvalues: Boolean (upval), self (copy), IsNetworkRequestInFlightFunction (upval), NetworkStatus (upval), Callback (ref)
			if Boolean.toJSBoolean(self.pollingInfo) then
				if not IsNetworkRequestInFlightFunction(self.queryInfo.networkStatus) then
					self:reobserve({ fetchPolicy = "network-only" }, NetworkStatus.poll):andThen(Callback, Callback)
					
					return
				end
				Callback()
			end
		end
		
		Callback = function()
			-- upvalues: self (copy), Boolean (upval), ClearTimeoutFunction (upval), SetTimeoutFunction (upval), maybeFetch (copy)
			local PollingInfo = self.pollingInfo
			
			if Boolean.toJSBoolean(PollingInfo) then
				if PollingInfo.timeout then
					ClearTimeoutFunction(PollingInfo.timeout)
				end
				PollingInfo.timeout = SetTimeoutFunction(maybeFetch, PollingInfo.interval)
			end
		end
		
		Callback()
		
		return
	elseif Boolean.toJSBoolean(PollingInfo) then
		ClearTimeoutFunction(PollingInfo.timeout)
		self.pollingInfo = nil
	end
end

function self:updateLastResult(LastResult)
	-- upvalues: Boolean (copy), CloneDeepFunction (copy), IsNonEmptyArrayFunction (copy)
	local LastResult1 = self.lastResult
	self.lastResult = LastResult
	
	if Boolean.toJSBoolean(self.queryManager.assumeImmutableResults) then
		self.lastResultSnapshot = LastResult
	else
		self.lastResultSnapshot = CloneDeepFunction(LastResult)
	end
	if not IsNonEmptyArrayFunction(LastResult.errors) then
		self.lastError = nil
	end
	return LastResult1
end

function self:reobserve(p1, Poll)
	-- upvalues: NetworkStatus (copy), CompactFunction (copy), Object (copy), Boolean (copy), EqualModule (copy)
	self.isTornDown = false
	local IsPollMatch: boolean = Poll == NetworkStatus.refetch or (Poll == NetworkStatus.fetchMore or Poll == NetworkStatus.poll)
	local Variables = self.options.variables
	local CompactResult = if IsPollMatch then CompactFunction(self.options, p1) else Object.assign(self.options, CompactFunction(p1))
	
	if not IsPollMatch then
		self:updatePolling()
		
		if p1 ~= nil and Boolean.toJSBoolean(p1.variables) and not Boolean.toJSBoolean(p1.fetchPolicy) and not EqualModule(p1.variables, Variables) then
			CompactResult.fetchPolicy = self.initialFetchPolicy
			
			if Poll == nil then
				Poll = NetworkStatus.setVariables
			end
		end
	end
	local FetchResult = self:fetch(CompactResult, Poll)
	
	if not IsPollMatch then
		if self.concast then
			self.concast:removeObserver(self.observer, true)
		end
		self.concast = FetchResult
	end
	FetchResult:addObserver(self.observer)
	
	return FetchResult.promise
end

function self:observe()
	self.observer:next(self:getCurrentResult(false))
end

function self:hasObservers(): boolean
	return self.observers.size > 0
end

function self:tearDownQuery()
	-- upvalues: Boolean (copy)
	if Boolean.toJSBoolean(self.isTornDown) then return end
	if Boolean.toJSBoolean(self.concast) then
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

FixObservableSubclassFunction(self)
ObservableQueryModule.ObservableQuery = self

DefaultSubscriptionObserverErrorCallback = function(_, p1)
	-- upvalues: InvariantFunction (copy)
	InvariantFunction.error("Unhandled error", p1.message, p1.stack)
end

function ObservableQueryModule.applyNextFetchPolicy(p1)
	-- upvalues: Boolean (copy), IsCallableModule (copy)
	local CacheFirst = if p1.fetchPolicy == nil then "cache-first" else p1.fetchPolicy
	local NextFetchPolicyFunction = p1.nextFetchPolicy
	
	if Boolean.toJSBoolean(NextFetchPolicyFunction) then
		if IsCallableModule(NextFetchPolicyFunction) then
			p1.fetchPolicy = NextFetchPolicyFunction(p1, CacheFirst)
			
			return
		end
		p1.fetchPolicy = NextFetchPolicyFunction
	end
end

return ObservableQueryModule