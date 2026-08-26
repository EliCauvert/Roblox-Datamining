local t = {}
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local promiseModule = require(parent_1.Promise)
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local hasOwnPropertyModule = require(parent.luaUtils.hasOwnProperty)
local equalModule = require(parent.jsutils.equal)
local apolloError = require(parent.errors).ApolloError
local networkStatus = require(script.Parent.Parent.Parent.core).NetworkStatus
local _ = require(parent.utilities)
local documentType = require(script.Parent.Parent.parser).DocumentType
local _ = require(script.Parent.Parent.types.types)
local operationData = require(script.Parent.OperationData).OperationData
local tbl = setmetatable({}, { __index = operationData })
tbl.__index = tbl

function tbl.new(p1)
	-- upvalues: operationData (ref), boolean (ref), tbl (ref)
	local onNewData = p1.onNewData
	local var1 = operationData.new(p1.options, p1.context)
	var1.runLazy = false
	var1.previous = {}
	var1.onNewData = onNewData
	
	function var6.runLazyQuery(p2)
		-- upvalues: var1 (ref)
		var1:cleanup()
		var1.runLazy = true
		var1.lazyOptions = p2
		var1:onNewData()
	end
	
	function var6.obsRefetch(_, p2)
		-- upvalues: boolean (copy), var1 (ref)
		return if boolean.toJSBoolean(var1.currentObservable) then var1.currentObservable:refetch(p2) else nil
	end
	
	function var6.obsFetchMore(_, p2)
		-- upvalues: var1 (ref)
		return if var1.currentObservable then var1.currentObservable:fetchMore(p2) else nil
	end
	
	function var6.obsUpdateQuery(_, p2)
		-- upvalues: var1 (ref)
		return if var1.currentObservable then var1.currentObservable:updateQuery(p2) else nil
	end
	
	function var6.obsStartPolling(_, p2)
		-- upvalues: var1 (ref)
		return if var1.currentObservable then var1.currentObservable:startPolling(p2) else nil
	end
	
	function var6.obsStopPolling(_)
		-- upvalues: var1 (ref)
		return if var1.currentObservable then var1.currentObservable:stopPolling() else nil
	end
	
	function var6.obsSubscribeToMore(p2)
		-- upvalues: var1 (ref)
		return if var1.currentObservable then var1.currentObservable:subscribeToMore(p2) else nil
	end
	
	return setmetatable(var1, tbl)
end

function tbl:execute()
	-- upvalues: boolean (ref)
	self:refreshClient()
	local options = self:getOptions()
	local skip = options.skip
	local query = options.query
	
	if skip or query ~= self.previous.query then
		self:removeQuerySubscription()
		self:removeObservable(not boolean.toJSBoolean(skip))
		self.previous.query = query
	end
	self:updateObservableQuery()
	
	return self:getExecuteSsrResult() or self:getExecuteResult()
end

function tbl:executeLazy()
	-- upvalues: boolean (ref), networkStatus (ref)
	return if boolean.toJSBoolean(self.runLazy) then table.pack(self.runLazyQuery, self:execute()) else table.pack(self.runLazyQuery, {
		loading = false,
		called = false,
		data = nil,
		networkStatus = networkStatus.ready
	})
end

function tbl:fetchData()
	-- upvalues: boolean (ref), promiseModule (ref)
	local options = self:getOptions()
	
	return if boolean.toJSBoolean(if boolean.toJSBoolean(options.skip) then options.skip else options.ssr == false) then false else promiseModule.new(function(p1)
		-- upvalues: self (ref)
		return self:startQuerySubscription(p1)
	end)
end

function tbl:afterExecute(p1)
	-- upvalues: boolean (ref)
	local var1 = p1 or {}
	local var2 = if var1.lazy then var1.lazy else false
	self.isMounted = true
	local options = self:getOptions()
	
	if boolean.toJSBoolean(self.currentObservable) and not boolean.toJSBoolean(options.ssr == false) and not boolean.toJSBoolean(self:ssrInitiated()) then
		self:startQuerySubscription()
	end
	if not boolean.toJSBoolean(var2) or boolean.toJSBoolean(self.runLazy) then
		self:handleErrorOrCompleted()
	end
	self.previousOptions = options
	
	return function(...)
		-- upvalues: self (ref)
		return self:unmount(...)
	end
end

function tbl:cleanup()
	self:removeQuerySubscription()
	self:removeObservable(true)
	self.previous.result = nil
end

function tbl:getOptions()
	-- upvalues: boolean (ref), object (ref)
	local options = getmetatable(getmetatable(self)).__index.getOptions(self)
	
	if boolean.toJSBoolean(self.lazyOptions) then
		options.variables = object.assign({}, options.variables, self.lazyOptions.variables)
		options.context = object.assign({}, options.context, self.lazyOptions.context)
	end
	if boolean.toJSBoolean(self.runLazy) then
		self.options.skip = nil
	end
	return options
end

function tbl:ssrInitiated()
	-- upvalues: boolean (ref)
	return if boolean.toJSBoolean(self.context) then self.context.renderPromises else self.context
end

function tbl:getExecuteSsrResult()
	-- upvalues: object (ref), networkStatus (ref), boolean (ref)
	local options = self:getOptions()
	local skip = options.skip
	local var1 = object.assign({}, {
		loading = true,
		called = true,
		data = nil,
		stale = false,
		networkStatus = networkStatus.loading,
		client = self.client
	}, self:observableQueryFields())
	
	if boolean.toJSBoolean(options.ssr == false) and (boolean.toJSBoolean(self:ssrInitiated()) or boolean.toJSBoolean(self:refreshClient().client.disableNetworkFetches)) then
		self.previous.result = var1
		
		return var1
	elseif not boolean.toJSBoolean(self:ssrInitiated()) then
		return nil
	end
	local var2 = boolean.toJSBoolean(self:getExecuteResult()) and self:getExecuteResult() or var1
	
	if boolean.toJSBoolean(var2.loading) and not boolean.toJSBoolean(skip) then
		self.context.renderPromises:addQueryPromise(self, function()
			return nil
		end)
	end
	return var2
end

function tbl:prepareObservableQueryOptions()
	-- upvalues: documentType (ref), boolean (ref), object (ref)
	local options = self:getOptions()
	self:verifyDocumentType(options.query, documentType.Query)
	local var1 = if boolean.toJSBoolean(options.displayName) then options.displayName else "Query"
	
	if boolean.toJSBoolean(self:ssrInitiated()) and (options.fetchPolicy == "network-only" or options.fetchPolicy == "cache-and-network") then
		options.fetchPolicy = "cache-first"
	end
	return object.assign({}, options, { displayName = var1, context = options.context })
end

function tbl:initializeObservableQuery()
	-- upvalues: boolean (ref), object (ref)
	if boolean.toJSBoolean(self:ssrInitiated()) then
		self.currentObservable = self.context.renderPromises:getSSRObservable(self:getOptions())
	end
	if not boolean.toJSBoolean(self.currentObservable) then
		local var1 = self:prepareObservableQueryOptions()
		self.previous.observableQueryOptions = object.assign({}, var1, { children = object.None })
		self.currentObservable = self:refreshClient().client:watchQuery(object.assign({}, var1))
		
		if boolean.toJSBoolean(self:ssrInitiated()) then
			self.context.renderPromises:registerSSRObservable(self.currentObservable, var1)
		end
	end
end

function tbl:updateObservableQuery()
	-- upvalues: boolean (ref), object (ref), equalModule (ref)
	if not boolean.toJSBoolean(self.currentObservable) then
		self:initializeObservableQuery()
		
		return
	end
	local var1 = object.assign({}, self:prepareObservableQueryOptions(), { children = object.None })
	
	if boolean.toJSBoolean(self:getOptions().skip) then
		self.previous.observableQueryOptions = var1
		
		return
	elseif not equalModule(var1, self.previous.observableQueryOptions) then
		self.previous.observableQueryOptions = var1
		self.currentObservable:setOptions(var1):catch(function() end)
	end
end

function tbl:startQuerySubscription(p1)
	-- upvalues: boolean (ref), equalModule (ref), hasOwnPropertyModule (ref)
	if p1 == nil then
		p1 = self.onNewData
	end
	if boolean.toJSBoolean(self.currentSubscription) or boolean.toJSBoolean(self:getOptions().skip) then
		return
	end
	self.currentSubscription = self.currentObservable:subscribe({
		next = function(_, p2)
			-- upvalues: self (ref), boolean (copy), equalModule (copy), p1 (write)
			local result = self.previous.result
			
			if boolean.toJSBoolean(result) and result.loading == p2.loading and (result.networkStatus == p2.networkStatus and equalModule(result.data, p2.data)) then
				return
			end
			p1(self)
		end,
		error = function(_, p2)
			-- upvalues: self (ref), hasOwnPropertyModule (copy), boolean (copy), equalModule (copy), p1 (write)
			self:resubscribeToQuery()
			
			if not hasOwnPropertyModule(p2, "graphQLErrors") then
				error(p2)
			end
			local result = self.previous.result
			
			if boolean.toJSBoolean(result) and boolean.toJSBoolean(result.loading) or not equalModule(p2, self.previous.error) then
				self.previous.error = p2
				p1(self)
			end
		end
	})
end

function tbl:resubscribeToQuery()
	-- upvalues: boolean (ref), object (ref)
	self:removeQuerySubscription()
	local currentObservable = self.currentObservable
	
	if boolean.toJSBoolean(currentObservable) then
		local lastError = currentObservable:getLastError()
		local lastResult = currentObservable:getLastResult()
		currentObservable:resetLastResults()
		self:startQuerySubscription()
		object.assign(currentObservable, { lastError = lastError, lastResult = lastResult })
	end
end

function tbl:getExecuteResult()
	-- upvalues: boolean (ref), object (ref), networkStatus (ref), apolloError (ref)
	local var1 = self:observableQueryFields()
	local options = self:getOptions()
	
	if boolean.toJSBoolean(options.skip) then
		var1 = object.assign({}, var1, {
			data = object.None,
			error = object.None,
			loading = false,
			networkStatus = networkStatus.ready,
			called = true
		})
	elseif boolean.toJSBoolean(self.currentObservable) then
		local currentResult = self.currentObservable:getCurrentResult()
		local data = currentResult.data
		local loading = currentResult.loading
		local partial = currentResult.partial
		local networkStatus_1 = currentResult.networkStatus
		local errors = currentResult.errors
		local var2 = if boolean.toJSBoolean(errors) and #errors > 0 then apolloError.new({ graphQLErrors = errors }) else currentResult.error
		var1 = object.assign({}, var1, {
			data = data,
			loading = loading,
			networkStatus = networkStatus_1,
			error = var2,
			called = true
		})
		
		if not boolean.toJSBoolean(loading) then
			if boolean.toJSBoolean(var2) then
				object.assign(var1, {
					data = (self.currentObservable:getLastResult() or {}).data
				})
			elseif boolean.toJSBoolean(options.partialRefetch) and boolean.toJSBoolean(partial) and (not boolean.toJSBoolean(data) or #object.keys(data) == 0) and self.currentObservable.options.fetchPolicy ~= "cache-only" then
				object.assign(var1, { loading = true, networkStatus = networkStatus.loading })
				var1:refetch()
				
				return var1
			end
		end
	end
	var1.client = self.client
	self:setOptions(options, true)
	local result = self.previous.result
	
	if boolean.toJSBoolean(result) and boolean.toJSBoolean(result.loading) then
		self.previous.loading = result.loading
	else
		self.previous.loading = false
	end
	if boolean.toJSBoolean(result) then
		var1.previousData = if boolean.toJSBoolean(result.data) then result.data else result.previousData
	else
		var1.previousData = result
	end
	self.previous.result = var1
	
	if boolean.toJSBoolean(self.currentObservable) then
		self.currentObservable:resetQueryStoreErrors()
	end
	return var1
end

function tbl:handleErrorOrCompleted()
	-- upvalues: boolean (ref), equalModule (ref)
	if not self.currentObservable or not self.previous.result then return end
	local result = self.previous.result
	local data = result.data
	local error = result.error
	
	if not boolean.toJSBoolean(result.loading) then
		local options = self:getOptions()
		local query = options.query
		local variables = options.variables
		local onCompleted = options.onCompleted
		local onError = options.onError
		local skip = options.skip
		
		if boolean.toJSBoolean(self.previousOptions) and not boolean.toJSBoolean(self.previous.loading) and (equalModule(self.previousOptions.query, query) and equalModule(self.previousOptions.variables, variables)) then return end
		if boolean.toJSBoolean(onCompleted) and not boolean.toJSBoolean(error) and not boolean.toJSBoolean(skip) then
			onCompleted(data)
			
			return
		elseif boolean.toJSBoolean(onError) and boolean.toJSBoolean(error) then
			onError(error)
		end
	end
end

function tbl:removeQuerySubscription()
	-- upvalues: boolean (ref)
	if boolean.toJSBoolean(self.currentSubscription) then
		self.currentSubscription:unsubscribe()
		self.currentSubscription = nil
	end
end

function tbl:removeObservable(p1)
	-- upvalues: boolean (ref)
	if boolean.toJSBoolean(self.currentObservable) then
		self.currentObservable.tearDownQuery(self.currentObservable)
		
		if boolean.toJSBoolean(p1) then
			self.currentObservable = nil
		end
	end
end

function tbl:observableQueryFields()
	-- upvalues: boolean (ref)
	return {
		variables = if boolean.toJSBoolean(self.currentObservable) then self.currentObservable.variables else nil,
		refetch = self.obsRefetch,
		fetchMore = self.obsFetchMore,
		updateQuery = self.obsUpdateQuery,
		startPolling = self.obsStartPolling,
		stopPolling = self.obsStopPolling,
		subscribeToMore = self.obsSubscribeToMore
	}
end

t.QueryData = tbl

return t