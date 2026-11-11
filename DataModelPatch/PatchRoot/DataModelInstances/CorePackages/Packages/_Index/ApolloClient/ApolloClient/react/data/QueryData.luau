local QueryDataModule = {}
local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local PromiseModule = require(Parent1.Promise)
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local HasOwnPropertyModule = require(Parent.luaUtils.hasOwnProperty)
local EqualModule = require(Parent.jsutils.equal)
local ApolloError = require(Parent.errors).ApolloError
local NetworkStatus = require(script.Parent.Parent.Parent.core).NetworkStatus
local _ = require(Parent.utilities)
local DocumentType = require(script.Parent.Parent.parser).DocumentType
local _ = require(script.Parent.Parent.types.types)
local OperationData = require(script.Parent.OperationData).OperationData
local self = setmetatable({}, { __index = OperationData })
self.__index = self

function self.new(Options)
	-- upvalues: OperationData (copy), Boolean (copy), self (copy)
	local OnNewData = Options.onNewData
	local NewOperationData = OperationData.new(Options.options, Options.context)
	NewOperationData.runLazy = false
	NewOperationData.previous = {}
	NewOperationData.onNewData = OnNewData
	
	function NewOperationData.runLazyQuery(LazyOptions)
		-- upvalues: NewOperationData (copy)
		NewOperationData:cleanup()
		NewOperationData.runLazy = true
		NewOperationData.lazyOptions = LazyOptions
		NewOperationData:onNewData()
	end
	
	function NewOperationData:obsRefetch(p1)
		-- upvalues: Boolean (upval), NewOperationData (copy)
		return if Boolean.toJSBoolean(NewOperationData.currentObservable) then NewOperationData.currentObservable:refetch(p1) else nil
	end
	
	function NewOperationData:obsFetchMore(p1)
		-- upvalues: NewOperationData (copy)
		return if NewOperationData.currentObservable then NewOperationData.currentObservable:fetchMore(p1) else nil
	end
	
	function NewOperationData:obsUpdateQuery(p1)
		-- upvalues: NewOperationData (copy)
		return if NewOperationData.currentObservable then NewOperationData.currentObservable:updateQuery(p1) else nil
	end
	
	function NewOperationData:obsStartPolling(p1)
		-- upvalues: NewOperationData (copy)
		return if NewOperationData.currentObservable then NewOperationData.currentObservable:startPolling(p1) else nil
	end
	
	function NewOperationData:obsStopPolling()
		-- upvalues: NewOperationData (copy)
		return if NewOperationData.currentObservable then NewOperationData.currentObservable:stopPolling() else nil
	end
	
	function NewOperationData.obsSubscribeToMore(p1)
		-- upvalues: NewOperationData (copy)
		return if NewOperationData.currentObservable then NewOperationData.currentObservable:subscribeToMore(p1) else nil
	end
	
	return (setmetatable(NewOperationData, self))
end

function self:execute()
	-- upvalues: Boolean (copy)
	self:refreshClient()
	local Options = self:getOptions()
	local Skip = Options.skip
	local Query = Options.query
	
	if Skip or Query ~= self.previous.query then
		self:removeQuerySubscription()
		self:removeObservable(not Boolean.toJSBoolean(Skip))
		self.previous.query = Query
	end
	self:updateObservableQuery()
	
	return self:getExecuteSsrResult() or self:getExecuteResult()
end

function self.executeLazy(p1)
	-- upvalues: Boolean (copy), NetworkStatus (copy)
	return if Boolean.toJSBoolean(p1.runLazy) then table.pack(p1.runLazyQuery, p1:execute()) else table.pack(p1.runLazyQuery, {
		loading = false,
		called = false,
		data = nil,
		networkStatus = NetworkStatus.ready
	})
end

function self:fetchData()
	-- upvalues: Boolean (copy), PromiseModule (copy)
	local Options = self:getOptions()
	
	return not Boolean.toJSBoolean(Boolean.toJSBoolean(Options.skip) and Options.skip or Options.ssr == false) and PromiseModule.new(function(p1)
		-- upvalues: self (copy)
		return self:startQuerySubscription(p1)
	end)
end

function self:afterExecute(p1)
	-- upvalues: Boolean (copy)
	local T = if p1 then p1 else {}
	local Lazy = if T.lazy then T.lazy else false
	self.isMounted = true
	local Options = self:getOptions()
	local IsNotSsr = Options.ssr == false
	
	if Boolean.toJSBoolean(self.currentObservable) and not Boolean.toJSBoolean(IsNotSsr) and not Boolean.toJSBoolean(self:ssrInitiated()) then
		self:startQuerySubscription()
	end
	if not Boolean.toJSBoolean(Lazy) or Boolean.toJSBoolean(self.runLazy) then
		self:handleErrorOrCompleted()
	end
	self.previousOptions = Options
	
	return function(...)
		-- upvalues: self (copy)
		return self:unmount(...)
	end
end

function self:cleanup()
	self:removeQuerySubscription()
	self:removeObservable(true)
	self.previous.result = nil
end

function self:getOptions()
	-- upvalues: Boolean (copy), Object (copy)
	local Options = getmetatable((getmetatable(self))).__index.getOptions(self)
	
	if Boolean.toJSBoolean(self.lazyOptions) then
		Options.variables = Object.assign({}, Options.variables, self.lazyOptions.variables)
		Options.context = Object.assign({}, Options.context, self.lazyOptions.context)
	end
	if Boolean.toJSBoolean(self.runLazy) then
		self.options.skip = nil
	end
	return Options
end

function self.ssrInitiated(p1)
	-- upvalues: Boolean (copy)
	return if Boolean.toJSBoolean(p1.context) then p1.context.renderPromises else p1.context
end

function self:getExecuteSsrResult()
	-- upvalues: Object (copy), NetworkStatus (copy), Boolean (copy)
	local Options = self:getOptions()
	local Skip = Options.skip
	local DisableNetworkFetches = self:refreshClient().client.disableNetworkFetches
	local AssignResult = Object.assign({}, {
		loading = true,
		called = true,
		data = nil,
		stale = false,
		networkStatus = NetworkStatus.loading,
		client = self.client
	}, self:observableQueryFields())
	
	if Boolean.toJSBoolean(Options.ssr == false) and (Boolean.toJSBoolean(self:ssrInitiated()) or Boolean.toJSBoolean(DisableNetworkFetches)) then
		self.previous.result = AssignResult
		
		return AssignResult
	end
	if not Boolean.toJSBoolean(self:ssrInitiated()) then
		return nil
	end
	local ExecuteResult = Boolean.toJSBoolean(self:getExecuteResult()) and self:getExecuteResult() or AssignResult
	
	if Boolean.toJSBoolean(ExecuteResult.loading) and not Boolean.toJSBoolean(Skip) then
		self.context.renderPromises:addQueryPromise(self, function()
			return nil
		end)
	end
	return ExecuteResult
end

function self:prepareObservableQueryOptions()
	-- upvalues: DocumentType (copy), Boolean (copy), Object (copy)
	local Options = self:getOptions()
	self:verifyDocumentType(Options.query, DocumentType.Query)
	local DisplayName = Boolean.toJSBoolean(Options.displayName) and Options.displayName or "Query"
	
	if Boolean.toJSBoolean(self:ssrInitiated()) and (Options.fetchPolicy == "network-only" or Options.fetchPolicy == "cache-and-network") then
		Options.fetchPolicy = "cache-first"
	end
	return Object.assign({}, Options, { displayName = DisplayName, context = Options.context })
end

function self:initializeObservableQuery()
	-- upvalues: Boolean (copy), Object (copy)
	if Boolean.toJSBoolean(self:ssrInitiated()) then
		self.currentObservable = self.context.renderPromises:getSSRObservable(self:getOptions())
	end
	if not Boolean.toJSBoolean(self.currentObservable) then
		local PrepareObservableQueryOptionsResult = self:prepareObservableQueryOptions()
		self.previous.observableQueryOptions = Object.assign({}, PrepareObservableQueryOptionsResult, { children = Object.None })
		self.currentObservable = self:refreshClient().client:watchQuery(Object.assign({}, PrepareObservableQueryOptionsResult))
		
		if Boolean.toJSBoolean(self:ssrInitiated()) then
			self.context.renderPromises:registerSSRObservable(self.currentObservable, PrepareObservableQueryOptionsResult)
		end
	end
end

function self:updateObservableQuery()
	-- upvalues: Boolean (copy), Object (copy), EqualModule (copy)
	if not Boolean.toJSBoolean(self.currentObservable) then
		self:initializeObservableQuery()
		
		return
	end
	local AssignResult = Object.assign({}, self:prepareObservableQueryOptions(), { children = Object.None })
	
	if Boolean.toJSBoolean(self:getOptions().skip) then
		self.previous.observableQueryOptions = AssignResult
		
		return
	end
	if not EqualModule(AssignResult, self.previous.observableQueryOptions) then
		self.previous.observableQueryOptions = AssignResult
		self.currentObservable:setOptions(AssignResult):catch(function() end)
	end
end

function self:startQuerySubscription(OnNewDataFunction)
	-- upvalues: Boolean (copy), EqualModule (copy), HasOwnPropertyModule (copy)
	if OnNewDataFunction == nil then
		OnNewDataFunction = self.onNewData
	end
	if not Boolean.toJSBoolean(self.currentSubscription) and not Boolean.toJSBoolean(self:getOptions().skip) then
		self.currentSubscription = self.currentObservable:subscribe({
			next = function(_, p1)
				-- upvalues: self (copy), Boolean (upval), EqualModule (upval), OnNewDataFunction (ref)
				local Loading = p1.loading
				local NetworkStatus = p1.networkStatus
				local Data = p1.data
				local Result = self.previous.result
				
				if not Boolean.toJSBoolean(Result) or Result.loading ~= Loading or Result.networkStatus ~= NetworkStatus or not EqualModule(Result.data, Data) then
					OnNewDataFunction(self)
					
					return
				end
			end,
			error = function(_, p1)
				-- upvalues: self (copy), HasOwnPropertyModule (upval), Boolean (upval), EqualModule (upval), OnNewDataFunction (ref)
				self:resubscribeToQuery()
				
				if not HasOwnPropertyModule(p1, "graphQLErrors") then
					error(p1)
				end
				local Result = self.previous.result
				
				if Boolean.toJSBoolean(Result) and Boolean.toJSBoolean(Result.loading) or not EqualModule(p1, self.previous.error) then
					self.previous.error = p1
					OnNewDataFunction(self)
				end
			end
		})
		
		return
	end
end

function self:resubscribeToQuery()
	-- upvalues: Boolean (copy), Object (copy)
	self:removeQuerySubscription()
	local CurrentObservable = self.currentObservable
	
	if Boolean.toJSBoolean(CurrentObservable) then
		local LastError = CurrentObservable:getLastError()
		local LastResult = CurrentObservable:getLastResult()
		CurrentObservable:resetLastResults()
		self:startQuerySubscription()
		Object.assign(CurrentObservable, { lastError = LastError, lastResult = LastResult })
	end
end

function self:getExecuteResult()
	-- upvalues: Boolean (copy), Object (copy), NetworkStatus (copy), ApolloError (copy)
	local ObservableQueryFieldsResult = self:observableQueryFields()
	local Options = self:getOptions()
	
	if Boolean.toJSBoolean(Options.skip) then
		ObservableQueryFieldsResult = Object.assign({}, ObservableQueryFieldsResult, {
			data = Object.None,
			error = Object.None,
			loading = false,
			networkStatus = NetworkStatus.ready,
			called = true
		})
	elseif Boolean.toJSBoolean(self.currentObservable) then
		local CurrentResult = self.currentObservable:getCurrentResult()
		local Data = CurrentResult.data
		local Loading = CurrentResult.loading
		local Partial = CurrentResult.partial
		local Errors = CurrentResult.errors
		local NewApolloError = if Boolean.toJSBoolean(Errors) and #Errors > 0 then ApolloError.new({ graphQLErrors = Errors }) else CurrentResult.error
		ObservableQueryFieldsResult = Object.assign({}, ObservableQueryFieldsResult, {
			data = Data,
			loading = Loading,
			networkStatus = CurrentResult.networkStatus,
			error = NewApolloError,
			called = true
		})
		
		if not Boolean.toJSBoolean(Loading) then
			if Boolean.toJSBoolean(NewApolloError) then
				Object.assign(ObservableQueryFieldsResult, {
					data = (self.currentObservable:getLastResult() or {}).data
				})
			else
				local FetchPolicy = self.currentObservable.options.fetchPolicy
				
				if Boolean.toJSBoolean(Options.partialRefetch) and Boolean.toJSBoolean(Partial) and (not Boolean.toJSBoolean(Data) or #Object.keys(Data) == 0) and FetchPolicy ~= "cache-only" then
					Object.assign(ObservableQueryFieldsResult, { loading = true, networkStatus = NetworkStatus.loading })
					ObservableQueryFieldsResult:refetch()
					
					return ObservableQueryFieldsResult
				end
			end
		end
	end
	ObservableQueryFieldsResult.client = self.client
	self:setOptions(Options, true)
	local Result = self.previous.result
	
	if Boolean.toJSBoolean(Result) and Boolean.toJSBoolean(Result.loading) then
		self.previous.loading = Result.loading
	else
		self.previous.loading = false
	end
	if Boolean.toJSBoolean(Result) then
		ObservableQueryFieldsResult.previousData = Boolean.toJSBoolean(Result.data) and Result.data or Result.previousData
	else
		ObservableQueryFieldsResult.previousData = Result
	end
	self.previous.result = ObservableQueryFieldsResult
	
	if Boolean.toJSBoolean(self.currentObservable) then
		self.currentObservable:resetQueryStoreErrors()
	end
	return ObservableQueryFieldsResult
end

function self:handleErrorOrCompleted()
	-- upvalues: Boolean (copy), EqualModule (copy)
	if not self.currentObservable or not self.previous.result then return end
	local Result = self.previous.result
	local Data = Result.data
	local Error1 = Result.error
	
	if not Boolean.toJSBoolean(Result.loading) then
		local Options = self:getOptions()
		local Query = Options.query
		local Variables = Options.variables
		local OnCompletedFunction: (any) -> () = Options.onCompleted
		local OnErrorFunction: (any) -> () = Options.onError
		local Skip = Options.skip
		
		if Boolean.toJSBoolean(self.previousOptions) and not Boolean.toJSBoolean(self.previous.loading) and EqualModule(self.previousOptions.query, Query) and EqualModule(self.previousOptions.variables, Variables) then return end
		if Boolean.toJSBoolean(OnCompletedFunction) and not Boolean.toJSBoolean(Error1) and not Boolean.toJSBoolean(Skip) then
			OnCompletedFunction(Data)
			
			return
		end
		if Boolean.toJSBoolean(OnErrorFunction) and Boolean.toJSBoolean(Error1) then
			OnErrorFunction(Error1)
		end
	end
end

function self:removeQuerySubscription()
	-- upvalues: Boolean (copy)
	if Boolean.toJSBoolean(self.currentSubscription) then
		self.currentSubscription:unsubscribe()
		self.currentSubscription = nil
	end
end

function self:removeObservable(p1)
	-- upvalues: Boolean (copy)
	if Boolean.toJSBoolean(self.currentObservable) then
		self.currentObservable.tearDownQuery(self.currentObservable)
		
		if Boolean.toJSBoolean(p1) then
			self.currentObservable = nil
		end
	end
end

function self:observableQueryFields()
	-- upvalues: Boolean (copy)
	return {
		variables = if Boolean.toJSBoolean(self.currentObservable) then self.currentObservable.variables else nil,
		refetch = self.obsRefetch,
		fetchMore = self.obsFetchMore,
		updateQuery = self.obsUpdateQuery,
		startPolling = self.obsStartPolling,
		stopPolling = self.obsStopPolling,
		subscribeToMore = self.obsSubscribeToMore
	}
end

QueryDataModule.QueryData = self

return QueryDataModule