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
local var6 = if canUseWeakMap then weakMap.new() else map.new(nil)

local function _(p0, p1) --[[ line: 98 | named "wrapDestructiveCacheMethod" ]]
	-- upvalues: var6 (ref)
	local var9 = p0[p1]
	
	if typeof(var9) == "function" then
		p0[p1] = function(...) --[[ line: 105 ]]
			-- upvalues: var6 (copy), p0 (ref), var9 (ref)
			var6:set(p0, (var6:get(p0) + 1) % 1000000000000000)
			
			return var9(...)
		end
	end
end

local _ = function(p2) --[[ line: 119 | named "cancelNotifyTimeout" ]]
	-- upvalues: boolean (ref), clearTimeout (ref)
	if boolean.toJSBoolean(p2.notifyTimeout) then
		clearTimeout(p2.notifyTimeout)
		p2.notifyTimeout = nil
	end
end

local t_2 = {}
t_2.__index = t_2

function t_2.new(p3) --[[ line: 204 ]]
	-- upvalues: set (ref), var6 (ref), t_2 (ref)
	local t = {
		listeners = set.new(),
		document = nil,
		lastRequestId = 1,
		subscriptions = set.new(),
		stopped = false,
		cache = p3,
		dirty = false,
		observableQuery = nil
	}
	
	if not var6:has(p3) then
		var6:set(p3, 0)
		local evict = p3.evict
		
		if typeof(evict) == "function" then
			function p3.evict(...) --[[ line: 105 ]]
				-- upvalues: var6 (copy), p3 (ref), evict (ref)
				var6:set(p3, (var6:get(p3) + 1) % 1000000000000000)
				
				return evict(...)
			end
		end
		local modify = p3.modify
		
		if typeof(modify) == "function" then
			function p3.modify(...) --[[ line: 105 ]]
				-- upvalues: var6 (copy), p3 (ref), modify (ref)
				var6:set(p3, (var6:get(p3) + 1) % 1000000000000000)
				
				return modify(...)
			end
		end
		local reset = p3.reset
		
		if typeof(reset) == "function" then
			function p3.reset(...) --[[ line: 105 ]]
				-- upvalues: var6 (copy), p3 (ref), reset (ref)
				var6:set(p3, (var6:get(p3) + 1) % 1000000000000000)
				
				return reset(...)
			end
		end
	end
	return setmetatable(t, t_2)
end

function t_2:init(p4) --[[ line: 230 ]]
	-- upvalues: boolean (ref), networkStatus (ref), equalModule (ref), object (ref)
	local var11 = if boolean.toJSBoolean(self.variables) and self.networkStatus ~= networkStatus.loading and not equalModule(self.variables, p4.variables) then networkStatus.setVariables elseif boolean.toJSBoolean(p4.networkStatus) then p4.networkStatus else networkStatus.loading
	
	if not equalModule(p4.variables, self.variables) then
		self.lastDiff = nil
	end
	object.assign(self, {
		document = p4.document,
		variables = p4.variables,
		networkError = object.None,
		graphQLErrors = if boolean.toJSBoolean(self.graphQLErrors) then self.graphQLErrors else {},
		networkStatus = var11
	})
	
	if boolean.toJSBoolean(p4.observableQuery) then
		self:setObservableQuery(p4.observableQuery)
	end
	if boolean.toJSBoolean(p4.lastRequestId) then
		self.lastRequestId = p4.lastRequestId
	end
	return self
end

function t_2:reset() --[[ line: 271 ]]
	-- upvalues: boolean (ref), clearTimeout (ref)
	if boolean.toJSBoolean(self.notifyTimeout) then
		clearTimeout(self.notifyTimeout)
		self.notifyTimeout = nil
	end
	self.lastDiff = nil
	self.dirty = false
end

function t_2:getDiff(p5) --[[ line: 277 ]]
	-- upvalues: boolean (ref), equalModule (ref)
	if p5 == nil then
		p5 = self.variables
	end
	local var12 = self:getDiffOptions(p5)
	
	if boolean.toJSBoolean(self.lastDiff) and equalModule(var12, self.lastDiff.options) then
		return self.lastDiff.diff
	end
	self.variables = p5
	self:updateWatch(self.variables)
	local observableQuery = self.observableQuery
	
	if boolean.toJSBoolean(observableQuery) and observableQuery.options.fetchPolicy == "no-cache" then
		return { complete = false }
	end
	local var13 = self.cache:diff(var12)
	self:updateLastDiff(var13, var12)
	
	return var13
end

function t_2:updateLastDiff(p6, p7) --[[ line: 302 ]]
	-- upvalues: boolean (ref)
	self.lastDiff = boolean.toJSBoolean(p6) and ({
		diff = p6,
		options = if boolean.toJSBoolean(p7) then p7 else self:getDiffOptions()
	} or nil)
end

function t_2:getDiffOptions(p8) --[[ line: 311 ]]
	-- upvalues: boolean (ref)
	if p8 == nil then
		p8 = self.variables
	end
	local observableQuery = self.observableQuery
	
	return {
		returnPartialData = true,
		optimistic = true,
		query = self.document,
		variables = p8,
		canonizeResults = not boolean.toJSBoolean(observableQuery) or observableQuery.options.canonizeResults ~= false
	}
end

function t_2:setDiff(p9) --[[ line: 327 ]]
	-- upvalues: boolean (ref), equalModule (ref), setTimeout (ref)
	local var14 = if boolean.toJSBoolean(self.lastDiff) then self.lastDiff.diff else self.lastDiff
	self:updateLastDiff(p9)
	local _ = nil
	local _ = nil
	
	if not self.dirty and not equalModule(if boolean.toJSBoolean(var14) then var14.result else var14, if boolean.toJSBoolean(p9) then p9.result else p9) then
		self.dirty = true
		
		if not boolean.toJSBoolean(self.notifyTimeout) then
			self.notifyTimeout = setTimeout(function() --[[ line: 352 ]]
				-- upvalues: self (ref)
				return self:notify()
			end, 0)
		end
	end
end

function t_2:setObservableQuery(p10) --[[ line: 359 ]]
	-- upvalues: boolean (ref)
	if p10 == self.observableQuery then return end
	if boolean.toJSBoolean(self.oqListener) then
		self.listeners:delete(self.oqListener)
	end
	self.observableQuery = p10
	
	if boolean.toJSBoolean(p10) and p10 ~= nil then
		p10.queryInfo = self
		
		function self.oqListener() --[[ line: 373 ]]
			-- upvalues: boolean (copy), self (ref), p10 (ref)
			if boolean.toJSBoolean(self:getDiff().fromOptimisticTransaction) then
				p10:observe()
				
				return
			end
			p10:reobserve()
		end
		
		self.listeners:add(self.oqListener)
		
		return
	end
	self.oqListener = nil
end

function t_2:notify() --[[ line: 391 ]]
	-- upvalues: boolean (ref), clearTimeout (ref)
	if boolean.toJSBoolean(self.notifyTimeout) then
		clearTimeout(self.notifyTimeout)
		self.notifyTimeout = nil
	end
	if self:shouldNotify() then
		self.listeners:forEach(function(p11) --[[ line: 395 ]]
			-- upvalues: self (ref)
			return p11(self)
		end)
	end
	self.dirty = false
end

function t_2:shouldNotify() --[[ line: 402 ]]
	-- upvalues: boolean (ref), isNetworkRequestInFlight (ref)
	if not self.dirty or not boolean.toJSBoolean(self.listeners.size) then
		return false
	elseif isNetworkRequestInFlight(self.networkStatus) and boolean.toJSBoolean(self.observableQuery) then
		local fetchPolicy = self.observableQuery.options.fetchPolicy
		
		return fetchPolicy == "cache-only" or fetchPolicy == "cache-and-network"
	end
end

function t_2:stop() --[[ line: 416 ]]
	-- upvalues: t_2 (ref), boolean (ref)
	if not self.stopped then
		self.stopped = true
		self:reset()
		self:cancel()
		self.cancel = t_2.cancel
		self.subscriptions:forEach(function(p12) --[[ line: 426 ]]
			return p12:unsubscribe()
		end)
		local observableQuery = self.observableQuery
		
		if boolean.toJSBoolean(observableQuery) then
			observableQuery:stopPolling()
		end
	end
end

function t_2.cancel(_) --[[ line: 440 ]] end

function t_2:updateWatch(p13) --[[ line: 442 ]]
	-- upvalues: boolean (ref), object (ref), equalModule (ref)
	if p13 == nil then
		p13 = self.variables
	end
	local observableQuery = self.observableQuery
	
	if boolean.toJSBoolean(observableQuery) and observableQuery.options.fetchPolicy == "no-cache" then return end
	local var15 = object.assign({}, self:getDiffOptions(p13), {
		watcher = self,
		callback = function(_, p14) --[[ line: 461 ]]
			-- upvalues: self (ref)
			return self:setDiff(p14)
		end
	})
	
	if not boolean.toJSBoolean(self.lastWatch) or not equalModule(object.assign({}, var15, { callback = object.None }), object.assign({}, self.lastWatch, { callback = object.None })) then
		self:cancel()
		self.lastWatch = var15
		self.cancel = self.cache:watch(self.lastWatch)
	end
end

function t_2:resetLastWrite() --[[ line: 477 ]]
	self.lastWrite = nil
end

function t_2:shouldWrite(p15, p16) --[[ line: 481 ]]
	-- upvalues: boolean (ref), var6 (ref), equalModule (ref)
	local lastWrite = self.lastWrite
	
	return not (boolean.toJSBoolean(lastWrite) and (lastWrite.dmCount == var6:get(self.cache) and (equalModule(p16, lastWrite.variables) and equalModule(p15.data, lastWrite.result.data))))
end

local var8 = nil

function t_2:markResult(p17, p18, p19) --[[ line: 507 ]]
	-- upvalues: isNonEmptyArray (ref), t_1 (ref), var8 (write), var6 (ref), boolean (ref)
	if isNonEmptyArray(p17.errors) then
		self.graphQLErrors = p17.errors
	else
		self.graphQLErrors = {}
	end
	self:reset()
	
	if p18.fetchPolicy == "no-cache" then
		self:updateLastDiff({ complete = true, result = p17.data }, self:getDiffOptions(p18.variables))
		
		return
	elseif p19 ~= t_1.FORBID then
		if var8(p17, p18.errorPolicy) then
			self.cache:performTransaction(function(p20) --[[ line: 529 ]]
				-- upvalues: self (ref), p17 (ref), p18 (ref), p19 (ref), t_1 (copy), var6 (copy), boolean (copy)
				if self:shouldWrite(p17, p18.variables) then
					p20:writeQuery({
						query = self.document,
						data = p17.data,
						variables = p18.variables,
						overwrite = p19 == t_1.OVERWRITE
					})
					self.lastWrite = {
						result = p17,
						variables = p18.variables,
						dmCount = var6:get(self.cache)
					}
				elseif boolean.toJSBoolean(self.lastDiff) and boolean.toJSBoolean(self.lastDiff.diff.complete) then
					p17.data = self.lastDiff.diff.result
					
					return
				end
				local variablesDiffOptions = self:getDiffOptions(p18.variables)
				local var17 = p20:diff(variablesDiffOptions)
				
				if not self.stopped then
					self:updateWatch(p18.variables)
				end
				self:updateLastDiff(var17, variablesDiffOptions)
				
				if boolean.toJSBoolean(var17.complete) then
					p17.data = var17.result
				end
			end)
			
			return
		end
		self.lastWrite = nil
	end
end

function t_2:markReady() --[[ line: 613 ]]
	-- upvalues: networkStatus (ref)
	self.networkError = nil
	self.networkStatus = networkStatus.ready
	
	return self.networkStatus
end

function t_2:markError(p21) --[[ line: 619 ]]
	-- upvalues: networkStatus (ref), boolean (ref)
	self.networkStatus = networkStatus.error
	self.lastWrite = nil
	self:reset()
	
	if boolean.toJSBoolean(p21.graphQLErrors) then
		self.graphQLErrors = p21.graphQLErrors
	end
	if boolean.toJSBoolean(p21.networkError) then
		self.networkError = p21.networkError
	end
	return p21
end

t.QueryInfo = t_2

function t.shouldWriteResult(p22, p23) --[[ line: 637 ]]
	-- upvalues: graphQLResultHasError (ref), boolean (ref)
	if p23 == nil then
		p23 = "none"
	end
	local var18 = not graphQLResultHasError(p22)
	
	if not var18 and (if p23 ~= "ignore" then p23 == "all" else true) and boolean.toJSBoolean(p22.data) then
		var18 = true
	end
	return var18
end

return t