local t = {}
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local clearTimeout = luauPolyfillModule.clearTimeout
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local set = luauPolyfillModule.Set
local setTimeout = luauPolyfillModule.setTimeout
local weakMap = luauPolyfillModule.WeakMap
local _ = require(parent_1.GraphQL)
local equalModule = require(parent.jsutils.equal)
local _ = require(parent.cache)
local _ = require(script.Parent.watchQueryOptions_types)
local _ = require(script.Parent.ObservableQuery_types)
local _ = require(script.Parent.Parent.link.core)
local utilitiesModule = require(script.Parent.Parent.utilities)
local isNonEmptyArray = utilitiesModule.isNonEmptyArray
local graphQLResultHasError = utilitiesModule.graphQLResultHasError
local canUseWeakMap = utilitiesModule.canUseWeakMap
local networkStatusModule = require(script.Parent.networkStatus)
local networkStatus = networkStatusModule.NetworkStatus
local isNetworkRequestInFlight = networkStatusModule.isNetworkRequestInFlight
local _ = require(script.Parent.Parent.errors)
local t_1 = { FORBID = 0, OVERWRITE = 1, MERGE = 2 }
t.CacheWriteBehavior = t_1
local var1 = if canUseWeakMap then weakMap.new() else map.new(nil)

local function _(p1, p2)
	-- upvalues: var1 (ref)
	local var2 = p1[p2]
	
	if typeof(var2) == "function" then
		p1[p2] = function(...)
			-- upvalues: var1 (copy), p1 (ref), var2 (ref)
			var1:set(p1, (var1:get(p1) + 1) % 1000000000000000)
			
			return var2(...)
		end
	end
end

local _ = function(p1)
	-- upvalues: boolean (ref), clearTimeout (ref)
	if boolean.toJSBoolean(p1.notifyTimeout) then
		clearTimeout(p1.notifyTimeout)
		p1.notifyTimeout = nil
	end
end

local t_2 = {}
t_2.__index = t_2

function t_2.new(p1)
	-- upvalues: set (ref), var1 (ref), t_2 (ref)
	local t = {
		listeners = set.new(),
		document = nil,
		lastRequestId = 1,
		subscriptions = set.new(),
		stopped = false,
		cache = p1,
		dirty = false,
		observableQuery = nil
	}
	
	if not var1:has(p1) then
		var1:set(p1, 0)
		local evict = p1.evict
		
		if typeof(evict) == "function" then
			function p3.evict(...)
				-- upvalues: var1 (copy), p1 (ref), evict (ref)
				var1:set(p1, (var1:get(p1) + 1) % 1000000000000000)
				
				return evict(...)
			end
		end
		local modify = p1.modify
		
		if typeof(modify) == "function" then
			function p3.modify(...)
				-- upvalues: var1 (copy), p1 (ref), modify (ref)
				var1:set(p1, (var1:get(p1) + 1) % 1000000000000000)
				
				return modify(...)
			end
		end
		local reset = p1.reset
		
		if typeof(reset) == "function" then
			function p3.reset(...)
				-- upvalues: var1 (copy), p1 (ref), reset (ref)
				var1:set(p1, (var1:get(p1) + 1) % 1000000000000000)
				
				return reset(...)
			end
		end
	end
	return setmetatable(t, t_2)
end

function t_2:init(p1)
	-- upvalues: boolean (ref), networkStatus (ref), equalModule (ref), object (ref)
	local var2 = if boolean.toJSBoolean(self.variables) and self.networkStatus ~= networkStatus.loading and not equalModule(self.variables, p1.variables) then networkStatus.setVariables elseif boolean.toJSBoolean(p1.networkStatus) then p1.networkStatus else networkStatus.loading
	
	if not equalModule(p1.variables, self.variables) then
		self.lastDiff = nil
	end
	object.assign(self, {
		document = p1.document,
		variables = p1.variables,
		networkError = object.None,
		graphQLErrors = if boolean.toJSBoolean(self.graphQLErrors) then self.graphQLErrors else {},
		networkStatus = var2
	})
	
	if boolean.toJSBoolean(p1.observableQuery) then
		self:setObservableQuery(p1.observableQuery)
	end
	if boolean.toJSBoolean(p1.lastRequestId) then
		self.lastRequestId = p1.lastRequestId
	end
	return self
end

function t_2:reset()
	-- upvalues: boolean (ref), clearTimeout (ref)
	if boolean.toJSBoolean(self.notifyTimeout) then
		clearTimeout(self.notifyTimeout)
		self.notifyTimeout = nil
	end
	self.lastDiff = nil
	self.dirty = false
end

function t_2:getDiff(p1)
	-- upvalues: boolean (ref), equalModule (ref)
	if p1 == nil then
		p1 = self.variables
	end
	local var2 = self:getDiffOptions(p1)
	
	if boolean.toJSBoolean(self.lastDiff) and equalModule(var2, self.lastDiff.options) then
		return self.lastDiff.diff
	end
	self.variables = p1
	self:updateWatch(self.variables)
	local observableQuery = self.observableQuery
	
	if boolean.toJSBoolean(observableQuery) and observableQuery.options.fetchPolicy == "no-cache" then
		return { complete = false }
	end
	local var3 = self.cache:diff(var2)
	self:updateLastDiff(var3, var2)
	
	return var3
end

function t_2:updateLastDiff(p1, p2)
	-- upvalues: boolean (ref)
	self.lastDiff = boolean.toJSBoolean(p1) and ({
		diff = p1,
		options = if boolean.toJSBoolean(p2) then p2 else self:getDiffOptions()
	} or nil)
end

function t_2:getDiffOptions(p1)
	-- upvalues: boolean (ref)
	if p1 == nil then
		p1 = self.variables
	end
	local observableQuery = self.observableQuery
	
	return {
		returnPartialData = true,
		optimistic = true,
		query = self.document,
		variables = p1,
		canonizeResults = not boolean.toJSBoolean(observableQuery) or observableQuery.options.canonizeResults ~= false
	}
end

function t_2:setDiff(p1)
	-- upvalues: boolean (ref), equalModule (ref), setTimeout (ref)
	local var2 = if boolean.toJSBoolean(self.lastDiff) then self.lastDiff.diff else self.lastDiff
	self:updateLastDiff(p1)
	local _ = nil
	local _ = nil
	
	if not self.dirty and not equalModule(if boolean.toJSBoolean(var2) then var2.result else var2, if boolean.toJSBoolean(p1) then p1.result else p1) then
		self.dirty = true
		
		if not boolean.toJSBoolean(self.notifyTimeout) then
			self.notifyTimeout = setTimeout(function()
				-- upvalues: self (ref)
				return self:notify()
			end, 0)
		end
	end
end

function t_2:setObservableQuery(p1)
	-- upvalues: boolean (ref)
	if p1 == self.observableQuery then return end
	if boolean.toJSBoolean(self.oqListener) then
		self.listeners:delete(self.oqListener)
	end
	self.observableQuery = p1
	
	if boolean.toJSBoolean(p1) and p1 ~= nil then
		p1.queryInfo = self
		
		function self.oqListener()
			-- upvalues: boolean (copy), self (ref), p1 (ref)
			if boolean.toJSBoolean(self:getDiff().fromOptimisticTransaction) then
				p1:observe()
				
				return
			end
			p1:reobserve()
		end
		
		self.listeners:add(self.oqListener)
		
		return
	end
	self.oqListener = nil
end

function t_2:notify()
	-- upvalues: boolean (ref), clearTimeout (ref)
	if boolean.toJSBoolean(self.notifyTimeout) then
		clearTimeout(self.notifyTimeout)
		self.notifyTimeout = nil
	end
	if self:shouldNotify() then
		self.listeners:forEach(function(p1)
			-- upvalues: self (ref)
			return p1(self)
		end)
	end
	self.dirty = false
end

function t_2:shouldNotify()
	-- upvalues: boolean (ref), isNetworkRequestInFlight (ref)
	if not self.dirty or not boolean.toJSBoolean(self.listeners.size) then
		return false
	elseif isNetworkRequestInFlight(self.networkStatus) and boolean.toJSBoolean(self.observableQuery) then
		local fetchPolicy = self.observableQuery.options.fetchPolicy
		
		return fetchPolicy == "cache-only" or fetchPolicy == "cache-and-network"
	end
end

function t_2:stop()
	-- upvalues: t_2 (ref), boolean (ref)
	if not self.stopped then
		self.stopped = true
		self:reset()
		self:cancel()
		self.cancel = t_2.cancel
		self.subscriptions:forEach(function(p1)
			return p1:unsubscribe()
		end)
		local observableQuery = self.observableQuery
		
		if boolean.toJSBoolean(observableQuery) then
			observableQuery:stopPolling()
		end
	end
end

function t_2.cancel(_) end

function t_2:updateWatch(p1)
	-- upvalues: boolean (ref), object (ref), equalModule (ref)
	if p1 == nil then
		p1 = self.variables
	end
	local observableQuery = self.observableQuery
	
	if boolean.toJSBoolean(observableQuery) and observableQuery.options.fetchPolicy == "no-cache" then return end
	local var2 = object.assign({}, self:getDiffOptions(p1), {
		watcher = self,
		callback = function(_, p2)
			-- upvalues: self (ref)
			return self:setDiff(p2)
		end
	})
	
	if not boolean.toJSBoolean(self.lastWatch) or not equalModule(object.assign({}, var2, { callback = object.None }), object.assign({}, self.lastWatch, { callback = object.None })) then
		self:cancel()
		self.lastWatch = var2
		self.cancel = self.cache:watch(self.lastWatch)
	end
end

function t_2:resetLastWrite()
	self.lastWrite = nil
end

function t_2:shouldWrite(p1, p2)
	-- upvalues: boolean (ref), var1 (ref), equalModule (ref)
	local lastWrite = self.lastWrite
	
	return not (boolean.toJSBoolean(lastWrite) and (lastWrite.dmCount == var1:get(self.cache) and (equalModule(p2, lastWrite.variables) and equalModule(p1.data, lastWrite.result.data))))
end

local var2 = nil

function t_2:markResult(p1, p2, p3)
	-- upvalues: isNonEmptyArray (ref), t_1 (ref), var2 (write), var1 (ref), boolean (ref)
	if isNonEmptyArray(p1.errors) then
		self.graphQLErrors = p1.errors
	else
		self.graphQLErrors = {}
	end
	self:reset()
	
	if p2.fetchPolicy == "no-cache" then
		self:updateLastDiff({ complete = true, result = p1.data }, self:getDiffOptions(p2.variables))
		
		return
	elseif p3 ~= t_1.FORBID then
		if var2(p1, p2.errorPolicy) then
			self.cache:performTransaction(function(p4)
				-- upvalues: self (ref), p1 (ref), p2 (ref), p3 (ref), t_1 (copy), var1 (copy), boolean (copy)
				if self:shouldWrite(p1, p2.variables) then
					p4:writeQuery({
						query = self.document,
						data = p1.data,
						variables = p2.variables,
						overwrite = p3 == t_1.OVERWRITE
					})
					self.lastWrite = {
						result = p1,
						variables = p2.variables,
						dmCount = var1:get(self.cache)
					}
				elseif boolean.toJSBoolean(self.lastDiff) and boolean.toJSBoolean(self.lastDiff.diff.complete) then
					p1.data = self.lastDiff.diff.result
					
					return
				end
				local variablesDiffOptions = self:getDiffOptions(p2.variables)
				local var3 = p4:diff(variablesDiffOptions)
				
				if not self.stopped then
					self:updateWatch(p2.variables)
				end
				self:updateLastDiff(var3, variablesDiffOptions)
				
				if boolean.toJSBoolean(var3.complete) then
					p1.data = var3.result
				end
			end)
			
			return
		end
		self.lastWrite = nil
	end
end

function t_2:markReady()
	-- upvalues: networkStatus (ref)
	self.networkError = nil
	self.networkStatus = networkStatus.ready
	
	return self.networkStatus
end

function t_2:markError(p1)
	-- upvalues: networkStatus (ref), boolean (ref)
	self.networkStatus = networkStatus.error
	self.lastWrite = nil
	self:reset()
	
	if boolean.toJSBoolean(p1.graphQLErrors) then
		self.graphQLErrors = p1.graphQLErrors
	end
	if boolean.toJSBoolean(p1.networkError) then
		self.networkError = p1.networkError
	end
	return p1
end

t.QueryInfo = t_2

function t.shouldWriteResult(p1, p2)
	-- upvalues: graphQLResultHasError (ref), boolean (ref)
	if p2 == nil then
		p2 = "none"
	end
	local var3 = not graphQLResultHasError(p1)
	
	if not var3 and (if p2 ~= "ignore" then p2 == "all" else true) and boolean.toJSBoolean(p1.data) then
		var3 = true
	end
	return var3
end

return t