local parent = script.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local map = luauPolyfillModule.Map
local instanceof = luauPolyfillModule.instanceof
local setTimeout = luauPolyfillModule.setTimeout
local error = luauPolyfillModule.Error
local error_1 = luauPolyfillModule.Error
local promiseModule = require(parent.Promise)
local t = {}
local getCurrentBatch = nil
local getValidMaxBatchSize = nil
local dispatchBatch = nil
local failedDispatch = nil
local resolveCacheHits = nil
local getValidBatchScheduleFn = nil
local getValidCacheKeyFn = nil
local getValidCacheMap = nil
local getValidName = nil
local isArrayLike = nil
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1, p2)
	-- upvalues: t_1 (ref), error (ref), getValidMaxBatchSize (write), getValidBatchScheduleFn (write), getValidCacheKeyFn (write), getValidCacheMap (write), getValidName (write)
	local tbl = setmetatable({}, t_1)
	
	if typeof(p1) ~= "function" then
		error(error.new("DataLoader must be constructed with a function which accepts " .. ("Array<key> and returns Promise<Array<value>>, but got: %s."):format(tostring(p1))))
	end
	tbl._batchLoadFn = p1
	tbl._maxBatchSize = getValidMaxBatchSize(p2)
	tbl._batchScheduleFn = getValidBatchScheduleFn(p2)
	tbl._cacheKeyFn = getValidCacheKeyFn(p2)
	tbl._cacheMap = getValidCacheMap(p2)
	tbl._batch = nil
	tbl.name = getValidName(p2)
	
	return tbl
end

function t_1:load(p1)
	-- upvalues: error (ref), getCurrentBatch (write), boolean (ref), promiseModule (ref)
	if p1 == nil then
		error(error.new("The loader.load() function must be called with a value, " .. ("but got: %s."):format(tostring(p1))))
	end
	local var1 = getCurrentBatch(self)
	local cacheMap = self._cacheMap
	local var2 = self._cacheKeyFn(p1)
	
	if boolean.toJSBoolean(cacheMap) then
		local var3 = cacheMap:get(var2)
		
		if boolean.toJSBoolean(var3) then
			local cacheHits
			if boolean.toJSBoolean(var1.cacheHits) then
				cacheHits = var1.cacheHits
				
				if not cacheHits then
					var1.cacheHits = {}
					cacheHits = var1.cacheHits
				end
				return promiseModule.new(function(p2)
					-- upvalues: cacheHits (ref), var3 (ref)
					table.insert(cacheHits, function()
						-- upvalues: p2 (ref), var3 (copy)
						p2(var3)
					end)
				end)
			end
		else
			table.insert(var1.keys, p1)
			local var4 = promiseModule.new(function(p2, p3)
				-- upvalues: var1 (ref)
				table.insert(var1.callbacks, { resolve = p2, reject = p3 })
			end)
			
			if boolean.toJSBoolean(cacheMap) then
				cacheMap:set(var2, var4)
			end
			return var4
		end
	end
end

function t_1:loadMany(p1)
	-- upvalues: boolean (ref), isArrayLike (write), error (ref), promiseModule (ref)
	if not boolean.toJSBoolean(isArrayLike(p1)) then
		error(error.new("The loader.loadMany() function must be called with Array<key> " .. ("but got: %s."):format(tostring(p1))))
	end
	local t = {}
	local var1 = 0
	while var1 < #p1 do
		table.insert(t, self:load(p1[var1 + 1]):catch(function(p2)
			return p2
		end))
		var1 += 1
	end
	return promiseModule.all(t)
end

function t_1:clear(p2)
	-- upvalues: boolean (ref)
	local cacheMap = self._cacheMap
	
	if boolean.toJSBoolean(cacheMap) then
		cacheMap:delete(self._cacheKeyFn(p2))
	end
	return self
end

function t_1:clearAll()
	-- upvalues: boolean (ref)
	local cacheMap = self._cacheMap
	
	if boolean.toJSBoolean(cacheMap) then
		cacheMap:clear()
	end
	return self
end

function t_1:prime(p2, p3)
	-- upvalues: boolean (ref), instanceof (ref), error_1 (ref), promiseModule (ref)
	local cacheMap = self._cacheMap
	
	if boolean.toJSBoolean(cacheMap) then
		local var2 = self._cacheKeyFn(p2)
		
		if cacheMap:get(var2) == nil then
			local var3
			local _ = nil
			
			if instanceof(p3, error_1) then
				var3 = promiseModule.reject(p3)
				var3:catch(function() end)
			else
				var3 = promiseModule.resolve(p3)
			end
			cacheMap:set(var2, var3)
		end
	end
	return self
end

local var2 = function(p2)
	-- upvalues: setTimeout (ref)
	setTimeout(p2)
end

getCurrentBatch = function(p2)
	-- upvalues: boolean (ref), dispatchBatch (write)
	local batch = p2._batch
	
	if batch == nil or boolean.toJSBoolean(batch.hasDispatched) or #batch.keys >= p2._maxBatchSize then
		local t = { hasDispatched = false, keys = {}, callbacks = {} }
		p2._batch = t
		p2._batchScheduleFn(function()
			-- upvalues: dispatchBatch (copy), p2 (ref), t (ref)
			dispatchBatch(p2, t)
		end)
		
		return t
	end
	return batch
end

dispatchBatch = function(p2, p3)
	-- upvalues: resolveCacheHits (write), failedDispatch (write), error (ref), boolean (ref), isArrayLike (write), instanceof (ref), error_1 (ref)
	p3.hasDispatched = true
	
	if #p3.keys == 0 then
		resolveCacheHits(p3)
		
		return
	end
	local var3 = nil
	local _, status, var4 = xpcall(function()
		-- upvalues: var3 (write), p2 (ref), p3 (ref)
		var3 = p2._batchLoadFn(p3.keys)
	end, function(p4)
		-- upvalues: failedDispatch (copy), p2 (ref), p3 (ref), error (copy)
		return failedDispatch(p2, p3, error.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function " .. ("errored synchronously: %s."):format(tostring(p4)))), true
	end)
	
	if var4 then
		return status
	elseif boolean.toJSBoolean(var3) and typeof(var3.andThen) == "function" then
		var3:andThen(function(p4)
			-- upvalues: boolean (copy), isArrayLike (copy), error (copy), p3 (ref), resolveCacheHits (copy), instanceof (copy), error_1 (copy)
			if not boolean.toJSBoolean(isArrayLike(p4)) then
				error(error.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function did " .. ("not return a Promise of an Array: %s."):format(table.concat(p4, ","))))
			end
			if #p4 ~= #p3.keys then
				error(error.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function did " .. "not return a Promise of an Array of the same length as the Array " .. "of keys." .. ("\n\nKeys:\n%s"):format(table.concat(p3.keys, ",")) .. ("\n\nValues:\n%s"):format(table.concat(p4, ","))))
			end
			resolveCacheHits(p3)
			local var5 = 0
			while var5 < #p3.callbacks do
				local var6 = p4[var5 + 1]
				
				if instanceof(var6, error_1) then
					p3.callbacks[var5 + 1].reject(var6)
				else
					p3.callbacks[var5 + 1].resolve(var6)
				end
				var5 += 1
			end
		end):catch(function(p5)
			-- upvalues: failedDispatch (copy), p2 (ref), p3 (ref)
			failedDispatch(p2, p3, p5)
		end)
		
		return nil
	end
	return failedDispatch(p2, p3, error.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function did " .. ("not return a Promise: %s."):format(tostring(var3))))
end

failedDispatch = function(p4, p5, p6)
	-- upvalues: resolveCacheHits (write)
	resolveCacheHits(p5)
	local var5 = 0
	while var5 < #p5.keys do
		p4:clear(p5.keys[var5 + 1])
		p5.callbacks[var5 + 1].reject(p6)
		var5 += 1
	end
end

resolveCacheHits = function(p7)
	-- upvalues: boolean (ref)
	if boolean.toJSBoolean(p7.cacheHits) then
		local var6 = 0
		while var6 < #p7.cacheHits do
			p7.cacheHits[var6 + 1]()
			var6 += 1
		end
	end
end

getValidMaxBatchSize = function(a)
	-- upvalues: boolean (ref), error (ref)
	if not boolean.toJSBoolean(not boolean.toJSBoolean(a) or a.batch ~= false) then
		return 1
	end
	local var7 = if boolean.toJSBoolean(a) then a.maxBatchSize else a
	
	if var7 == nil then
		return 1e999
	elseif typeof(var7) ~= "number" or var7 < 1 then
		error(error.new(("maxBatchSize must be a positive number: %s"):format(tostring(var7))))
	end
	return var7
end

getValidBatchScheduleFn = function(p8)
	-- upvalues: boolean (ref), var2 (ref), error (ref)
	local var7 = if boolean.toJSBoolean(p8) then p8.batchScheduleFn else p8
	
	if var7 == nil then
		return var2
	elseif typeof(var7) ~= "function" then
		error(error.new(("batchScheduleFn must be a function: %s"):format(tostring(var7))))
	end
	return var7
end

getValidCacheKeyFn = function(p8)
	-- upvalues: boolean (ref), error (ref)
	local var7 = if boolean.toJSBoolean(p8) then p8.cacheKeyFn else p8
	
	if var7 == nil then
		return function(p9)
			return p9
		end
	elseif typeof(var7) ~= "function" then
		error(error.new(("cacheKeyFn must be a function: %s"):format(tostring(var7))))
	end
	return var7
end

getValidCacheMap = function(p8)
	-- upvalues: boolean (ref), map (ref), array (ref), error (ref)
	if not boolean.toJSBoolean(not boolean.toJSBoolean(p8) or p8.cache ~= false) then
		return nil
	end
	local var7 = if boolean.toJSBoolean(p8) then p8.cacheMap else p8
	
	if var7 == nil then
		return map.new()
	elseif var7 ~= nil then
		local var8 = array.filter({ "get", "set", "delete", "clear" }, function(p9)
			-- upvalues: boolean (copy), var7 (ref)
			return if boolean.toJSBoolean(var7) then typeof(var7[tostring(p9)]) ~= "function" else var7
		end)
		
		if #var8 ~= 0 then
			error(error.new("Custom cacheMap missing methods: " .. tostring(array.join(var8, ", "))))
		end
	end
	return var7
end

getValidName = function(p8)
	-- upvalues: boolean (ref)
	return if boolean.toJSBoolean(if boolean.toJSBoolean(p8) then p8.name else p8) then p8.name else nil
end

isArrayLike = function(p8)
	return typeof(p8) == "table" and (if #p8 ~= 0 then #p8 > 0 and p8[#p8] ~= nil else true)
end

t.DataLoader = t_1

return t