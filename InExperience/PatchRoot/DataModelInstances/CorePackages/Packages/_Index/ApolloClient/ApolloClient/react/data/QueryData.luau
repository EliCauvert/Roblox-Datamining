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

function tbl.new(p0)
	-- upvalues: operationData (ref), boolean (ref), tbl (ref)
	local onNewData = p0.onNewData
	local var6 = operationData.new(p0.options, p0.context)
	var6.runLazy = false
	var6.previous = {}
	var6.onNewData = onNewData
	
	function var6.runLazyQuery(p1)
		-- upvalues: var6 (ref)
		var6:cleanup()
		var6.runLazy = true
		var6.lazyOptions = p1
		var6:onNewData()
	end
	
	function var6.obsRefetch(_, p2)
		-- upvalues: boolean (copy), var6 (ref)
		return if boolean.toJSBoolean(var6.currentObservable) then var6.currentObservable:refetch(p2) else nil
	end
	
	function var6.obsFetchMore(_, p3)
		-- upvalues: var6 (ref)
		return if var6.currentObservable then var6.currentObservable:fetchMore(p3) else nil
	end
	
	function var6.obsUpdateQuery(_, p4)
		-- upvalues: var6 (ref)
		return if var6.currentObservable then var6.currentObservable:updateQuery(p4) else nil
	end
	
	function var6.obsStartPolling(_, p5)
		-- upvalues: var6 (ref)
		return if var6.currentObservable then var6.currentObservable:startPolling(p5) else nil
	end
	
	function var6.obsStopPolling(_)
		-- upvalues: var6 (ref)
		return if var6.currentObservable then var6.currentObservable:stopPolling() else nil
	end
	
	function var6.obsSubscribeToMore(p6)
		-- upvalues: var6 (ref)
		return if var6.currentObservable then var6.currentObservable:subscribeToMore(p6) else nil
	end
	
	return setmetatable(var6, tbl)
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
	
	return if boolean.toJSBoolean(if boolean.toJSBoolean(options.skip) then options.skip else options.ssr == false) then false else promiseModule.new(function(p7)
		-- upvalues: self (ref)
		return self:startQuerySubscription(p7)
	end)
end

function tbl:afterExecute(p8)
	-- upvalues: boolean (ref)
	local var9 = p8 or {}
	local var10 = if var9.lazy then var9.lazy else false
	self.isMounted = true
	local options = self:getOptions()
	
	if boolean.toJSBoolean(self.currentObservable) and not boolean.toJSBoolean(options.ssr == false) and not boolean.toJSBoolean(self:ssrInitiated()) then
		self:startQuerySubscription()
	end
	if not boolean.toJSBoolean(var10) or boolean.toJSBoolean(self.runLazy) then
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
	local var14 = object.assign({}, {
		loading = true,
		called = true,
		data = nil,
		stale = false,
		networkStatus = networkStatus.loading,
		client = self.client
	}, self:observableQueryFields())
	
	if boolean.toJSBoolean(options.ssr == false) and (boolean.toJSBoolean(self:ssrInitiated()) or boolean.toJSBoolean(self:refreshClient().client.disableNetworkFetches)) then
		self.previous.result = var14
		
		return var14
	elseif not boolean.toJSBoolean(self:ssrInitiated()) then
		return nil
	end
	local var15 = boolean.toJSBoolean(self:getExecuteResult()) and self:getExecuteResult() or var14
	
	if boolean.toJSBoolean(var15.loading) and not boolean.toJSBoolean(skip) then
		self.context.renderPromises:addQueryPromise(self, function()
			return nil
		end)
	end
	return var15
end

function tbl:prepareObservableQueryOptions()
	-- upvalues: documentType (ref), boolean (ref), object (ref)
	local options = self:getOptions()
	self:verifyDocumentType(options.query, documentType.Query)
	local var17 = if boolean.toJSBoolean(options.displayName) then options.displayName else "Query"
	
	if boolean.toJSBoolean(self:ssrInitiated()) and (options.fetchPolicy == "network-only" or options.fetchPolicy == "cache-and-network") then
		options.fetchPolicy = "cache-first"
	end
	return object.assign({}, options, { displayName = var17, context = options.context })
end

function tbl:initializeObservableQuery()
	-- upvalues: boolean (ref), object (ref)
	if boolean.toJSBoolean(self:ssrInitiated()) then
		self.currentObservable = self.context.renderPromises:getSSRObservable(self:getOptions())
	end
	if not boolean.toJSBoolean(self.currentObservable) then
		local var18 = self:prepareObservableQueryOptions()
		self.previous.observableQueryOptions = object.assign({}, var18, { children = object.None })
		self.currentObservable = self:refreshClient().client:watchQuery(object.assign({}, var18))
		
		if boolean.toJSBoolean(self:ssrInitiated()) then
			self.context.renderPromises:registerSSRObservable(self.currentObservable, var18)
		end
	end
end

function tbl:updateObservableQuery()
	-- upvalues: boolean (ref), object (ref), equalModule (ref)
	if not boolean.toJSBoolean(self.currentObservable) then
		self:initializeObservableQuery()
		
		return
	end
	local var19 = object.assign({}, self:prepareObservableQueryOptions(), { children = object.None })
	
	if boolean.toJSBoolean(self:getOptions().skip) then
		self.previous.observableQueryOptions = var19
		
		return
	elseif not equalModule(var19, self.previous.observableQueryOptions) then
		self.previous.observableQueryOptions = var19
		self.currentObservable:setOptions(var19):catch(function() end)
	end
end

function tbl:startQuerySubscription(p9)
	-- upvalues: boolean (ref), equalModule (ref), hasOwnPropertyModule (ref)
	if p9 == nil then
		p9 = self.onNewData
	end
	if boolean.toJSBoolean(self.currentSubscription) or boolean.toJSBoolean(self:getOptions().skip) then
		return
	end
	self.currentSubscription = self.currentObservable:subscribe({
		next = function(_, p10)
			-- upvalues: self (ref), boolean (copy), equalModule (copy), p9 (write)
			local result = self.previous.result
			
			if boolean.toJSBoolean(result) and result.loading == p10.loading and (result.networkStatus == p10.networkStatus and equalModule(result.data, p10.data)) then
				return
			end
			p9(self)
		end,
		error = function(_, p11)
			-- upvalues: self (ref), hasOwnPropertyModule (copy), boolean (copy), equalModule (copy), p9 (write)
			self:resubscribeToQuery()
			
			if not hasOwnPropertyModule(p11, "graphQLErrors") then
				error(p11)
			end
			local result = self.previous.result
			
			if boolean.toJSBoolean(result) and boolean.toJSBoolean(result.loading) or not equalModule(p11, self.previous.error) then
				self.previous.error = p11
				p9(self)
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
	local var22 = self:observableQueryFields()
	local options = self:getOptions()
	
	if boolean.toJSBoolean(options.skip) then
		var22 = object.assign({}, var22, {
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
		local var25 = if boolean.toJSBoolean(errors) and #errors > 0 then apolloError.new({ graphQLErrors = errors }) else currentResult.error
		var22 = object.assign({}, var22, {
			data = data,
			loading = loading,
			networkStatus = networkStatus_1,
			error = var25,
			called = true
		})
		
		if not boolean.toJSBoolean(loading) then
			if boolean.toJSBoolean(var25) then
				object.assign(var22, {
					data = (self.currentObservable:getLastResult() or {}).data
				})
			elseif boolean.toJSBoolean(options.partialRefetch) and boolean.toJSBoolean(partial) and (not boolean.toJSBoolean(data) or #object.keys(data) == 0) and self.currentObservable.options.fetchPolicy ~= "cache-only" then
				object.assign(var22, { loading = true, networkStatus = networkStatus.loading })
				var22:refetch()
				
				return var22
			end
		end
	end
	var22.client = self.client
	self:setOptions(options, true)
	local result = self.previous.result
	
	if boolean.toJSBoolean(result) and boolean.toJSBoolean(result.loading) then
		self.previous.loading = result.loading
	else
		self.previous.loading = false
	end
	if boolean.toJSBoolean(result) then
		var22.previousData = if boolean.toJSBoolean(result.data) then result.data else result.previousData
	else
		var22.previousData = result
	end
	self.previous.result = var22
	
	if boolean.toJSBoolean(self.currentObservable) then
		self.currentObservable:resetQueryStoreErrors()
	end
	return var22
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

function tbl:removeObservable(p12)
	-- upvalues: boolean (ref)
	if boolean.toJSBoolean(self.currentObservable) then
		self.currentObservable.tearDownQuery(self.currentObservable)
		
		if boolean.toJSBoolean(p12) then
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