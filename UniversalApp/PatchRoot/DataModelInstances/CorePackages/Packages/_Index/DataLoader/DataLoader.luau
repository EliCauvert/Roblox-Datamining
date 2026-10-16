local Parent = script.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Map = LuauPolyfillModule.Map
local InstanceofFunction = LuauPolyfillModule.instanceof
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local Error1 = LuauPolyfillModule.Error
local Error2 = LuauPolyfillModule.Error
local PromiseModule = require(Parent.Promise)
local Callback5 = nil
local Callback1 = nil
local Callback7 = nil
local Callback9 = nil
local Callback8 = nil
local Callback2 = nil
local Callback3 = nil
local Callback4 = nil
local Callback6 = nil
local Callback = nil
local Module = {}
Module.__index = Module

function Module.new(Message, p1) --[[ Line: 142 ]]
	-- upvalues: Module (copy), Error1 (copy), Callback1 (ref), Callback2 (ref), Callback3 (ref), Callback4 (ref), Callback6 (ref)
	local self = setmetatable({}, Module)
	
	if typeof(Message) ~= "function" then
		error(Error1.new("DataLoader must be constructed with a function which accepts " .. ("Array<key> and returns Promise<Array<value>>, but got: %s."):format((tostring(Message)))))
	end
	self._batchLoadFn = Message
	self._maxBatchSize = Callback1(p1)
	self._batchScheduleFn = Callback2(p1)
	self._cacheKeyFn = Callback3(p1)
	self._cacheMap = Callback4(p1)
	self._batch = nil
	self.name = Callback6(p1)
	
	return self
end

function Module:load(p1) --[[ Line: 162 ]]
	-- upvalues: Error1 (copy), Callback5 (ref), Boolean (copy), PromiseModule (copy)
	if p1 == nil then
		error(Error1.new("The loader.load() function must be called with a value, " .. ("but got: %s."):format((tostring(p1)))))
	end
	local CallbackResult = Callback5(self)
	local CacheMap = self._cacheMap
	local CacheKeyFnResult = self._cacheKeyFn(p1)
	
	if Boolean.toJSBoolean(CacheMap) then
		local GetResult = CacheMap:get(CacheKeyFnResult)
		local CacheHits = nil
		
		if Boolean.toJSBoolean(GetResult) then
			repeat
				if Boolean.toJSBoolean(CallbackResult.cacheHits) then
					CacheHits = CallbackResult.cacheHits
					
					if CacheHits then break end
				end
				CallbackResult.cacheHits = {}
				CacheHits = CallbackResult.cacheHits
			until true
			return PromiseModule.new(function(Callback) --[[ Line: 182 ]]
				-- upvalues: CacheHits (copy), GetResult (copy)
				table.insert(CacheHits, function() --[[ Line: 183 ]]
					-- upvalues: Callback (copy), GetResult (upval)
					Callback(GetResult)
				end)
			end)
		end
	end
	table.insert(CallbackResult.keys, p1)
	local NewPromise = PromiseModule.new(function(Resolve, Reject) --[[ Line: 192 ]]
		-- upvalues: CallbackResult (copy)
		table.insert(CallbackResult.callbacks, { resolve = Resolve, reject = Reject })
	end)
	
	if Boolean.toJSBoolean(CacheMap) then
		CacheMap:set(CacheKeyFnResult, NewPromise)
	end
	return NewPromise
end

function Module:loadMany(p1) --[[ Line: 202 ]]
	-- upvalues: Boolean (copy), Callback (ref), Error1 (copy), PromiseModule (copy)
	if not Boolean.toJSBoolean(Callback(p1)) then
		error(Error1.new("The loader.loadMany() function must be called with Array<key> " .. ("but got: %s."):format((tostring(p1)))))
	end
	local List = {}
	local Count = 0
	while Count < #p1 do
		table.insert(List, self:load(p1[Count + 1]):catch(function(Err) --[[ Line: 219 ]]
			return Err
		end))
		Count += 1
	end
	return PromiseModule.all(List)
end

function Module:clear(Key) --[[ Line: 230 ]]
	-- upvalues: Boolean (copy)
	local CacheMap = self._cacheMap
	
	if Boolean.toJSBoolean(CacheMap) then
		CacheMap:delete((self._cacheKeyFn(Key)))
	end
	return self
end

function Module:clearAll() --[[ Line: 239 ]]
	-- upvalues: Boolean (copy)
	local CacheMap = self._cacheMap
	
	if Boolean.toJSBoolean(CacheMap) then
		CacheMap:clear()
	end
	return self
end

function Module:prime(p2, p3) --[[ Line: 247 ]]
	-- upvalues: Boolean (copy), InstanceofFunction (copy), Error2 (copy), PromiseModule (copy)
	local CacheMap = self._cacheMap
	
	if Boolean.toJSBoolean(CacheMap) then
		local CacheKeyFnResult = self._cacheKeyFn(p2)
		
		if CacheMap:get(CacheKeyFnResult) == nil then
			local RejectResult = nil
			if InstanceofFunction(p3, Error2) then
				RejectResult = PromiseModule.reject(p3)
				RejectResult:catch(function() --[[ Line: 260 ]] end)
			else
				RejectResult = PromiseModule.resolve(p3)
			end
			CacheMap:set(CacheKeyFnResult, RejectResult)
		end
	end
	return self
end

local function v9(p2) --[[ Line: 296 ]]
	-- upvalues: SetTimeoutFunction (copy)
	SetTimeoutFunction(p2)
end

Callback5 = function(p2) --[[ Line: 316 | Named "getCurrentBatch" ]]
	-- upvalues: Boolean (copy), Callback7 (ref)
	local Batch = p2._batch
	
	if Batch == nil or Boolean.toJSBoolean(Batch.hasDispatched) or #Batch.keys >= p2._maxBatchSize then
		local config = { hasDispatched = false, keys = {}, callbacks = {} }
		p2._batch = config
		p2._batchScheduleFn(function() --[[ Line: 332 ]]
			-- upvalues: Callback7 (upval), p2 (copy), config (copy)
			Callback7(p2, config)
		end)
		
		return config
	else
		return Batch
	end
end

Callback7 = function(p2, _batch) --[[ Line: 338 | Named "dispatchBatch" ]]
	-- upvalues: Callback8 (ref), Callback9 (ref), Error1 (copy), Boolean (copy), Callback (ref), InstanceofFunction (copy), Error2 (copy)
	_batch.hasDispatched = true
	
	if #_batch.keys == 0 then
		Callback8(_batch)
		
		return
	end
	local BatchLoadFnResult = nil
	local _, Result, Result3 = xpcall(function() --[[ Line: 350 ]]
		-- upvalues: BatchLoadFnResult (ref), p2 (copy), _batch (copy)
		BatchLoadFnResult = p2._batchLoadFn(_batch.keys)
	end, function(Err) --[[ Line: 352 ]]
		-- upvalues: Callback9 (upval), p2 (copy), _batch (copy), Error1 (upval)
		return Callback9(p2, _batch, Error1.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function " .. ("errored synchronously: %s."):format((tostring(Err))))), true
	end)
	
	if Result3 then
		return Result
	elseif Boolean.toJSBoolean(BatchLoadFnResult) and typeof(BatchLoadFnResult.andThen) == "function" then
		BatchLoadFnResult:andThen(function(List) --[[ Line: 384 ]]
			-- upvalues: Boolean (upval), Callback (upval), Error1 (upval), _batch (copy), Callback8 (upval), InstanceofFunction (upval), Error2 (upval)
			if not Boolean.toJSBoolean(Callback(List)) then
				error(Error1.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function did " .. ("not return a Promise of an Array: %s."):format(table.concat(List, ","))))
			end
			if #List ~= #_batch.keys then
				error(Error1.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function did " .. "not return a Promise of an Array of the same length as the Array " .. "of keys." .. ("\n\nKeys:\n%s"):format(table.concat(_batch.keys, ",")) .. ("\n\nValues:\n%s"):format(table.concat(List, ","))))
			end
			Callback8(_batch)
			local Count = 0
			while Count < #_batch.callbacks do
				local Entry = List[Count + 1]
				
				if InstanceofFunction(Entry, Error2) then
					_batch.callbacks[Count + 1].reject(Entry)
				else
					_batch.callbacks[Count + 1].resolve(Entry)
				end
				Count += 1
			end
		end):catch(function(Err) --[[ Line: 425 ]]
			-- upvalues: Callback9 (upval), p2 (copy), _batch (copy)
			Callback9(p2, _batch, Err)
		end)
		
		return nil
	else
		return Callback9(p2, _batch, Error1.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function did " .. ("not return a Promise: %s."):format((tostring(BatchLoadFnResult)))))
	end
end

Callback9 = function(p3, _batch, NewResult) --[[ Line: 433 | Named "failedDispatch" ]]
	-- upvalues: Callback8 (ref)
	Callback8(_batch)
	local Count = 0
	while Count < #_batch.keys do
		p3:clear(_batch.keys[Count + 1])
		_batch.callbacks[Count + 1].reject(NewResult)
		Count += 1
	end
end

Callback8 = function(p4) --[[ Line: 448 | Named "resolveCacheHits" ]]
	-- upvalues: Boolean (copy)
	if Boolean.toJSBoolean(p4.cacheHits) then
		local Count = 0
		while Count < #p4.cacheHits do
			p4.cacheHits[Count + 1]()
			Count += 1
		end
	end
end

Callback1 = function(p5) --[[ Line: 463 | Named "getValidMaxBatchSize" ]]
	-- upvalues: Boolean (copy), Error1 (copy)
	if not Boolean.toJSBoolean(not Boolean.toJSBoolean(p5) or p5.batch ~= false) then
		return 1
	end
	local MaxBatchSize = if Boolean.toJSBoolean(p5) then p5.maxBatchSize else p5
	
	if MaxBatchSize == nil then
		return 1e999
	end
	if typeof(MaxBatchSize) ~= "number" or MaxBatchSize < 1 then
		error(Error1.new(("maxBatchSize must be a positive number: %s"):format((tostring(MaxBatchSize)))))
	end
	return MaxBatchSize
end

Callback2 = function(p5) --[[ Line: 481 | Named "getValidBatchScheduleFn" ]]
	-- upvalues: Boolean (copy), v9 (copy), Error1 (copy)
	local BatchScheduleFn = if Boolean.toJSBoolean(p5) then p5.batchScheduleFn else p5
	
	if BatchScheduleFn == nil then
		return v9
	end
	if typeof(BatchScheduleFn) ~= "function" then
		error(Error1.new(("batchScheduleFn must be a function: %s"):format((tostring(BatchScheduleFn)))))
	end
	return BatchScheduleFn
end

Callback3 = function(p5) --[[ Line: 495 | Named "getValidCacheKeyFn" ]]
	-- upvalues: Boolean (copy), Error1 (copy)
	local CacheKeyFn = if Boolean.toJSBoolean(p5) then p5.cacheKeyFn else p5
	
	if CacheKeyFn == nil then
		return function(p6) --[[ Line: 498 ]]
			return p6
		end
	end
	if typeof(CacheKeyFn) ~= "function" then
		error(Error1.new(("cacheKeyFn must be a function: %s"):format((tostring(CacheKeyFn)))))
	end
	return CacheKeyFn
end

Callback4 = function(p5) --[[ Line: 509 | Named "getValidCacheMap" ]]
	-- upvalues: Boolean (copy), Map (copy), Array (copy), Error1 (copy)
	if not Boolean.toJSBoolean(not Boolean.toJSBoolean(p5) or p5.cache ~= false) then
		return nil
	end
	local CacheMap = if Boolean.toJSBoolean(p5) then p5.cacheMap else p5
	
	if CacheMap == nil then
		return Map.new()
	end
	if CacheMap ~= nil then
		local FilterResult = Array.filter({ "get", "set", "delete", "clear" }, function(p6) --[[ Line: 520 ]]
			-- upvalues: Boolean (upval), CacheMap (copy)
			return if Boolean.toJSBoolean(CacheMap) then typeof(CacheMap[tostring(p6)]) ~= "function" else CacheMap
		end)
		
		if #FilterResult ~= 0 then
			error(Error1.new("Custom cacheMap missing methods: " .. tostring(Array.join(FilterResult, ", "))))
		end
	end
	return CacheMap
end

Callback6 = function(p5) --[[ Line: 530 | Named "getValidName" ]]
	-- upvalues: Boolean (copy)
	return if Boolean.toJSBoolean(if Boolean.toJSBoolean(p5) then p5.name else p5) then p5.name else nil
end

Callback = function(p5): boolean --[[ Line: 538 | Named "isArrayLike" ]]
	return typeof(p5) == "table" and (#p5 == 0 or #p5 > 0 and p5[#p5] ~= nil)
end

return { DataLoader = Module }