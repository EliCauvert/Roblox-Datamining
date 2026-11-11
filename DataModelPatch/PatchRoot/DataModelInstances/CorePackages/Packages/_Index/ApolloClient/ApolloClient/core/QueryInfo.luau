local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local Map = LuauPolyfillModule.Map
local Object = LuauPolyfillModule.Object
local Set = LuauPolyfillModule.Set
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local WeakMap = LuauPolyfillModule.WeakMap
local _ = require(Parent1.GraphQL)
local EqualModule = require(Parent.jsutils.equal)
local _ = require(Parent.cache)
local _ = require(script.Parent.watchQueryOptions_types)
local _ = require(script.Parent.ObservableQuery_types)
local _ = require(script.Parent.Parent.link.core)
local UtilitiesModule = require(script.Parent.Parent.utilities)
local IsNonEmptyArrayFunction = UtilitiesModule.isNonEmptyArray
local GraphQLResultHasErrorFunction = UtilitiesModule.graphQLResultHasError
local NetworkStatusModule = require(script.Parent.networkStatus)
local NetworkStatus = NetworkStatusModule.NetworkStatus
local IsNetworkRequestInFlightFunction = NetworkStatusModule.isNetworkRequestInFlight
local _ = require(script.Parent.Parent.errors)
local CacheWriteBehavior = { FORBID = 0, OVERWRITE = 1, MERGE = 2 }
local NewWeakMap = if UtilitiesModule.canUseWeakMap then WeakMap.new() else Map.new(nil)

local function _(Cache, Key)
	-- upvalues: NewWeakMap (copy)
	local CacheEntry = Cache[Key]
	
	if typeof(CacheEntry) == "function" then
		Cache[Key] = function(...)
			-- upvalues: NewWeakMap (upval), Cache (copy), CacheEntry (copy)
			NewWeakMap:set(Cache, (NewWeakMap:get(Cache) + 1) % 1000000000000000)
			
			return CacheEntry(...)
		end
	end
end

local _ = function(p1)
	-- upvalues: Boolean (copy), ClearTimeoutFunction (copy)
	if Boolean.toJSBoolean(p1.notifyTimeout) then
		ClearTimeoutFunction(p1.notifyTimeout)
		p1.notifyTimeout = nil
	end
end

local Module = {}
Module.__index = Module

function Module.new(Cache)
	-- upvalues: Set (copy), NewWeakMap (copy), Module (copy)
	local config = {
		listeners = Set.new(),
		document = nil,
		lastRequestId = 1,
		subscriptions = Set.new(),
		stopped = false,
		cache = Cache,
		dirty = false,
		observableQuery = nil
	}
	
	if not NewWeakMap:has(Cache) then
		NewWeakMap:set(Cache, 0)
		local Evict = Cache.evict
		
		if typeof(Evict) == "function" then
			function Cache.evict(...)
				-- upvalues: NewWeakMap (upval), Cache (copy), Evict (copy)
				NewWeakMap:set(Cache, (NewWeakMap:get(Cache) + 1) % 1000000000000000)
				
				return Evict(...)
			end
		end
		local Modify = Cache.modify
		
		if typeof(Modify) == "function" then
			function Cache.modify(...)
				-- upvalues: NewWeakMap (upval), Cache (copy), Modify (copy)
				NewWeakMap:set(Cache, (NewWeakMap:get(Cache) + 1) % 1000000000000000)
				
				return Modify(...)
			end
		end
		local ResetFunction = Cache.reset
		
		if typeof(ResetFunction) == "function" then
			function Cache.reset(...)
				-- upvalues: NewWeakMap (upval), Cache (copy), ResetFunction (copy)
				NewWeakMap:set(Cache, (NewWeakMap:get(Cache) + 1) % 1000000000000000)
				
				return ResetFunction(...)
			end
		end
	end
	return (setmetatable(config, Module))
end

function Module:init(p1)
	-- upvalues: Boolean (copy), NetworkStatus (copy), EqualModule (copy), Object (copy)
	local SetVariables = if Boolean.toJSBoolean(self.variables) and self.networkStatus ~= NetworkStatus.loading and not EqualModule(self.variables, p1.variables) then NetworkStatus.setVariables else Boolean.toJSBoolean(p1.networkStatus) and p1.networkStatus or NetworkStatus.loading
	
	if not EqualModule(p1.variables, self.variables) then
		self.lastDiff = nil
	end
	Object.assign(self, {
		document = p1.document,
		variables = p1.variables,
		networkError = Object.None,
		graphQLErrors = Boolean.toJSBoolean(self.graphQLErrors) and self.graphQLErrors or {},
		networkStatus = SetVariables
	})
	
	if Boolean.toJSBoolean(p1.observableQuery) then
		self:setObservableQuery(p1.observableQuery)
	end
	if Boolean.toJSBoolean(p1.lastRequestId) then
		self.lastRequestId = p1.lastRequestId
	end
	return self
end

function Module:reset()
	-- upvalues: Boolean (copy), ClearTimeoutFunction (copy)
	if Boolean.toJSBoolean(self.notifyTimeout) then
		ClearTimeoutFunction(self.notifyTimeout)
		self.notifyTimeout = nil
	end
	self.lastDiff = nil
	self.dirty = false
end

function Module:getDiff(Variables)
	-- upvalues: Boolean (copy), EqualModule (copy)
	if Variables == nil then
		Variables = self.variables
	end
	local DiffOptions = self:getDiffOptions(Variables)
	
	if Boolean.toJSBoolean(self.lastDiff) and EqualModule(DiffOptions, self.lastDiff.options) then
		return self.lastDiff.diff
	end
	self.variables = Variables
	self:updateWatch(self.variables)
	local ObservableQuery = self.observableQuery
	
	if Boolean.toJSBoolean(ObservableQuery) and ObservableQuery.options.fetchPolicy == "no-cache" then
		return { complete = false }
	else
		local DiffResult = self.cache:diff(DiffOptions)
		self:updateLastDiff(DiffResult, DiffOptions)
		
		return DiffResult
	end
end

function Module:updateLastDiff(Diff, DiffOptions)
	-- upvalues: Boolean (copy)
	self.lastDiff = Boolean.toJSBoolean(Diff) and {
		diff = Diff,
		options = Boolean.toJSBoolean(DiffOptions) and DiffOptions or self:getDiffOptions()
	} or nil
end

function Module:getDiffOptions(Variables)
	-- upvalues: Boolean (copy)
	if Variables == nil then
		Variables = self.variables
	end
	local ObservableQuery = self.observableQuery
	
	return {
		returnPartialData = true,
		optimistic = true,
		query = self.document,
		variables = Variables,
		canonizeResults = not Boolean.toJSBoolean(ObservableQuery) or ObservableQuery.options.canonizeResults ~= false
	}
end

function Module:setDiff(Diff)
	-- upvalues: Boolean (copy), EqualModule (copy), SetTimeoutFunction (copy)
	local Diff1 = if Boolean.toJSBoolean(self.lastDiff) then self.lastDiff.diff else self.lastDiff
	self:updateLastDiff(Diff)
	local Result = if Boolean.toJSBoolean(Diff1) then Diff1.result else Diff1
	local Result1 = if Boolean.toJSBoolean(Diff) then Diff.result else Diff
	
	if not self.dirty and not EqualModule(Result, Result1) then
		self.dirty = true
		
		if not Boolean.toJSBoolean(self.notifyTimeout) then
			self.notifyTimeout = SetTimeoutFunction(function()
				-- upvalues: self (copy)
				return self:notify()
			end, 0)
		end
	end
end

function Module:setObservableQuery(ObservableQuery)
	-- upvalues: Boolean (copy)
	if ObservableQuery == self.observableQuery then return end
	if Boolean.toJSBoolean(self.oqListener) then
		self.listeners:delete(self.oqListener)
	end
	self.observableQuery = ObservableQuery
	
	if Boolean.toJSBoolean(ObservableQuery) and ObservableQuery ~= nil then
		ObservableQuery.queryInfo = self
		
		function self.oqListener()
			-- upvalues: Boolean (upval), self (copy), ObservableQuery (copy)
			if Boolean.toJSBoolean(self:getDiff().fromOptimisticTransaction) then
				ObservableQuery.observe(ObservableQuery)
				
				return
			else
				ObservableQuery:reobserve()
			end
		end
		
		self.listeners:add(self.oqListener)
		
		return
	else
		self.oqListener = nil
	end
end

function Module:notify()
	-- upvalues: Boolean (copy), ClearTimeoutFunction (copy)
	if Boolean.toJSBoolean(self.notifyTimeout) then
		ClearTimeoutFunction(self.notifyTimeout)
		self.notifyTimeout = nil
	end
	if self:shouldNotify() then
		self.listeners:forEach(function(Callback)
			-- upvalues: self (copy)
			return Callback(self)
		end)
	end
	self.dirty = false
end

function Module:shouldNotify(): boolean
	-- upvalues: Boolean (copy), IsNetworkRequestInFlightFunction (copy)
	if not self.dirty or not Boolean.toJSBoolean(self.listeners.size) then
		return false
	end
	if IsNetworkRequestInFlightFunction(self.networkStatus) and Boolean.toJSBoolean(self.observableQuery) then
		local FetchPolicy = self.observableQuery.options.fetchPolicy
		
		if FetchPolicy ~= "cache-only" and FetchPolicy ~= "cache-and-network" then
			return false
		end
	end
	return true
end

function Module:stop()
	-- upvalues: Module (copy), Boolean (copy)
	if not self.stopped then
		self.stopped = true
		self:reset()
		self:cancel()
		self.cancel = Module.cancel
		self.subscriptions:forEach(function(p1)
			return p1:unsubscribe()
		end)
		local ObservableQuery = self.observableQuery
		
		if Boolean.toJSBoolean(ObservableQuery) then
			ObservableQuery:stopPolling()
		end
	end
end

function Module:cancel() end

function Module:updateWatch(Variables)
	-- upvalues: Boolean (copy), Object (copy), EqualModule (copy)
	if Variables == nil then
		Variables = self.variables
	end
	local ObservableQuery = self.observableQuery
	
	if Boolean.toJSBoolean(ObservableQuery) and ObservableQuery.options.fetchPolicy == "no-cache" then return end
	local AssignResult = Object.assign({}, self:getDiffOptions(Variables), {
		watcher = self,
		callback = function(_, p1)
			-- upvalues: self (copy)
			return self:setDiff(p1)
		end
	})
	local AssignResult1 = Object.assign({}, AssignResult, { callback = Object.None })
	local AssignResult2 = Object.assign({}, self.lastWatch, { callback = Object.None })
	
	if not Boolean.toJSBoolean(self.lastWatch) or not EqualModule(AssignResult1, AssignResult2) then
		self:cancel()
		self.lastWatch = AssignResult
		self.cancel = self.cache:watch(self.lastWatch)
	end
end

function Module:resetLastWrite()
	self.lastWrite = nil
end

function Module:shouldWrite(p1, Variables): boolean
	-- upvalues: Boolean (copy), NewWeakMap (copy), EqualModule (copy)
	local LastWrite = self.lastWrite
	
	return not (Boolean.toJSBoolean(LastWrite) and (LastWrite.dmCount == NewWeakMap:get(self.cache) and (EqualModule(Variables, LastWrite.variables) and EqualModule(p1.data, LastWrite.result.data))))
end

local Callback = nil

function Module:markResult(Result, p1, FORBID)
	-- upvalues: IsNonEmptyArrayFunction (copy), CacheWriteBehavior (copy), Callback (ref), NewWeakMap (copy), Boolean (copy)
	if IsNonEmptyArrayFunction(Result.errors) then
		self.graphQLErrors = Result.errors
	else
		self.graphQLErrors = {}
	end
	self:reset()
	
	if p1.fetchPolicy == "no-cache" then
		self:updateLastDiff({ complete = true, result = Result.data }, self:getDiffOptions(p1.variables))
		
		return
	end
	if FORBID ~= CacheWriteBehavior.FORBID then
		if Callback(Result, p1.errorPolicy) then
			self.cache:performTransaction(function(p2)
				-- upvalues: self (copy), Result (copy), p1 (copy), FORBID (copy), CacheWriteBehavior (upval), NewWeakMap (upval), Boolean (upval)
				if self:shouldWrite(Result, p1.variables) then
					p2:writeQuery({
						query = self.document,
						data = Result.data,
						variables = p1.variables,
						overwrite = FORBID == CacheWriteBehavior.OVERWRITE
					})
					self.lastWrite = {
						result = Result,
						variables = p1.variables,
						dmCount = NewWeakMap:get(self.cache)
					}
				elseif Boolean.toJSBoolean(self.lastDiff) and Boolean.toJSBoolean(self.lastDiff.diff.complete) then
					Result.data = self.lastDiff.diff.result
					
					return
				end
				local DiffOptions = self:getDiffOptions(p1.variables)
				local DiffResult = p2:diff(DiffOptions)
				
				if not self.stopped then
					self:updateWatch(p1.variables)
				end
				self:updateLastDiff(DiffResult, DiffOptions)
				
				if Boolean.toJSBoolean(DiffResult.complete) then
					Result.data = DiffResult.result
				end
			end)
			
			return
		end
		self.lastWrite = nil
	end
end

function Module:markReady()
	-- upvalues: NetworkStatus (copy)
	self.networkError = nil
	self.networkStatus = NetworkStatus.ready
	
	return self.networkStatus
end

function Module:markError(p1)
	-- upvalues: NetworkStatus (copy), Boolean (copy)
	self.networkStatus = NetworkStatus.error
	self.lastWrite = nil
	self:reset()
	
	if Boolean.toJSBoolean(p1.graphQLErrors) then
		self.graphQLErrors = p1.graphQLErrors
	end
	if Boolean.toJSBoolean(p1.networkError) then
		self.networkError = p1.networkError
	end
	return p1
end

Callback = function(p1, ErrorPolicy: string): boolean
	-- upvalues: GraphQLResultHasErrorFunction (copy), Boolean (copy)
	if ErrorPolicy == nil then
		ErrorPolicy = "none"
	end
	local IsIgnore: boolean = ErrorPolicy == "ignore" or ErrorPolicy == "all"
	local Inverted = not GraphQLResultHasErrorFunction(p1)
	
	if not Inverted and IsIgnore and Boolean.toJSBoolean(p1.data) then
		Inverted = true
	end
	return Inverted
end

return {
	CacheWriteBehavior = CacheWriteBehavior,
	QueryInfo = Module,
	shouldWriteResult = Callback
}