-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:58 2026 Pacific Standard Time.

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

function t_1.new(p0, p1) --[[ line: 142 ]]
	-- upvalues: t_1 (ref), error (ref), getValidMaxBatchSize (write), getValidBatchScheduleFn (write), getValidCacheKeyFn (write), getValidCacheMap (write), getValidName (write)
	local tbl = setmetatable({}, t_1)
	
	if typeof(p0) ~= "function" then
		error(error.new("DataLoader must be constructed with a function which accepts " .. ("Array<key> and returns Promise<Array<value>>, but got: %s."):format(tostring(p0))))
	end
	tbl._batchLoadFn = p0
	tbl._maxBatchSize = getValidMaxBatchSize(p1)
	tbl._batchScheduleFn = getValidBatchScheduleFn(p1)
	tbl._cacheKeyFn = getValidCacheKeyFn(p1)
	tbl._cacheMap = getValidCacheMap(p1)
	tbl._batch = nil
	tbl.name = getValidName(p1)
	
	return tbl
end

function t_1:load(p2) --[[ line: 162 ]]
	-- upvalues: error (ref), getCurrentBatch (write), boolean (ref), promiseModule (ref)
	if p2 == nil then
		error(error.new("The loader.load() function must be called with a value, " .. ("but got: %s."):format(tostring(p2))))
	end
	local var16 = getCurrentBatch(self)
	local cacheMap = self._cacheMap
	local var17 = self._cacheKeyFn(p2)
	
	if boolean.toJSBoolean(cacheMap) then
		local var18 = cacheMap:get(var17)
		
		if boolean.toJSBoolean(var18) then
			local cacheHits
			if boolean.toJSBoolean(var16.cacheHits) then
				cacheHits = var16.cacheHits
				
				if not cacheHits then
					var16.cacheHits = {}
					cacheHits = var16.cacheHits
				end
				return promiseModule.new(function(p3) --[[ line: 182 ]]
					-- upvalues: cacheHits (ref), var18 (ref)
					table.insert(cacheHits, function() --[[ line: 183 ]]
						-- upvalues: p3 (ref), var18 (copy)
						p3(var18)
					end)
				end)
			end
		else
			table.insert(var16.keys, p2)
			local var19 = promiseModule.new(function(p4, p5) --[[ line: 192 ]]
				-- upvalues: var16 (ref)
				table.insert(var16.callbacks, { resolve = p4, reject = p5 })
			end)
			
			if boolean.toJSBoolean(cacheMap) then
				cacheMap:set(var17, var19)
			end
			return var19
		end
	end
end

function t_1:loadMany(p6) --[[ line: 202 ]]
	-- upvalues: boolean (ref), isArrayLike (write), error (ref), promiseModule (ref)
	if not boolean.toJSBoolean(isArrayLike(p6)) then
		error(error.new("The loader.loadMany() function must be called with Array<key> " .. ("but got: %s."):format(tostring(p6))))
	end
	local t = {}
	local var21 = 0
	while var21 < #p6 do
		table.insert(t, self:load(p6[var21 + 1]):catch(function(p7) --[[ line: 219 ]]
			return p7
		end))
		var21 += 1
	end
	return promiseModule.all(t)
end

function t_1:clear(p8) --[[ line: 230 ]]
	-- upvalues: boolean (ref)
	local cacheMap = self._cacheMap
	
	if boolean.toJSBoolean(cacheMap) then
		cacheMap:delete(self._cacheKeyFn(p8))
	end
	return self
end

function t_1:clearAll() --[[ line: 239 ]]
	-- upvalues: boolean (ref)
	local cacheMap = self._cacheMap
	
	if boolean.toJSBoolean(cacheMap) then
		cacheMap:clear()
	end
	return self
end

function t_1:prime(p9, p10) --[[ line: 247 ]]
	-- upvalues: boolean (ref), instanceof (ref), error_1 (ref), promiseModule (ref)
	local cacheMap = self._cacheMap
	
	if boolean.toJSBoolean(cacheMap) then
		local var22 = self._cacheKeyFn(p9)
		
		if cacheMap:get(var22) == nil then
			local var23
			local _ = nil
			
			if instanceof(p10, error_1) then
				var23 = promiseModule.reject(p10)
				var23:catch(function() --[[ line: 260 ]] end)
			else
				var23 = promiseModule.resolve(p10)
			end
			cacheMap:set(var22, var23)
		end
	end
	return self
end

local var14 = function(p11) --[[ line: 296 ]]
	-- upvalues: setTimeout (ref)
	setTimeout(p11)
end

getCurrentBatch = function(p12) --[[ line: 316 | named "getCurrentBatch" ]]
	-- upvalues: boolean (ref), dispatchBatch (write)
	local batch = p12._batch
	
	if batch == nil or boolean.toJSBoolean(batch.hasDispatched) or #batch.keys >= p12._maxBatchSize then
		local t = { hasDispatched = false, keys = {}, callbacks = {} }
		p12._batch = t
		p12._batchScheduleFn(function() --[[ line: 332 ]]
			-- upvalues: dispatchBatch (copy), p12 (ref), t (ref)
			dispatchBatch(p12, t)
		end)
		
		return t
	end
	return batch
end

dispatchBatch = function(p13, p14) --[[ line: 338 | named "dispatchBatch" ]]
	-- upvalues: resolveCacheHits (write), failedDispatch (write), error (ref), boolean (ref), isArrayLike (write), instanceof (ref), error_1 (ref)
	p14.hasDispatched = true
	
	if #p14.keys == 0 then
		resolveCacheHits(p14)
		
		return
	end
	local var25 = nil
	local _, status, var26 = xpcall(function() --[[ line: 350 ]]
		-- upvalues: var25 (write), p13 (ref), p14 (ref)
		var25 = p13._batchLoadFn(p14.keys)
	end, function(p15) --[[ line: 352 ]]
		-- upvalues: failedDispatch (copy), p13 (ref), p14 (ref), error (copy)
		return failedDispatch(p13, p14, error.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function " .. ("errored synchronously: %s."):format(tostring(p15)))), true
	end)
	
	if var26 then
		return status
	elseif boolean.toJSBoolean(var25) and typeof(var25.andThen) == "function" then
		var25:andThen(function(p17) --[[ line: 384 ]]
			-- upvalues: boolean (copy), isArrayLike (copy), error (copy), p14 (ref), resolveCacheHits (copy), instanceof (copy), error_1 (copy)
			if not boolean.toJSBoolean(isArrayLike(p17)) then
				error(error.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function did " .. ("not return a Promise of an Array: %s."):format(table.concat(p17, ","))))
			end
			if #p17 ~= #p14.keys then
				error(error.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function did " .. "not return a Promise of an Array of the same length as the Array " .. "of keys." .. ("\n\nKeys:\n%s"):format(table.concat(p14.keys, ",")) .. ("\n\nValues:\n%s"):format(table.concat(p17, ","))))
			end
			resolveCacheHits(p14)
			local var27 = 0
			while var27 < #p14.callbacks do
				local var28 = p17[var27 + 1]
				
				if instanceof(var28, error_1) then
					p14.callbacks[var27 + 1].reject(var28)
				else
					p14.callbacks[var27 + 1].resolve(var28)
				end
				var27 += 1
			end
		end):catch(function(p16) --[[ line: 425 ]]
			-- upvalues: failedDispatch (copy), p13 (ref), p14 (ref)
			failedDispatch(p13, p14, p16)
		end)
		
		return nil
	end
	return failedDispatch(p13, p14, error.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function did " .. ("not return a Promise: %s."):format(tostring(var25))))
end

failedDispatch = function(p18, p19, p20) --[[ line: 433 | named "failedDispatch" ]]
	-- upvalues: resolveCacheHits (write)
	resolveCacheHits(p19)
	local var29 = 0
	while var29 < #p19.keys do
		p18:clear(p19.keys[var29 + 1])
		p19.callbacks[var29 + 1].reject(p20)
		var29 += 1
	end
end

resolveCacheHits = function(p21) --[[ line: 448 | named "resolveCacheHits" ]]
	-- upvalues: boolean (ref)
	if boolean.toJSBoolean(p21.cacheHits) then
		local var30 = 0
		while var30 < #p21.cacheHits do
			p21.cacheHits[var30 + 1]()
			var30 += 1
		end
	end
end

getValidMaxBatchSize = function(a) --[[ line: 463 | named "getValidMaxBatchSize" ]]
	-- upvalues: boolean (ref), error (ref)
	if not boolean.toJSBoolean(not boolean.toJSBoolean(a) or a.batch ~= false) then
		return 1
	end
	local var31 = if boolean.toJSBoolean(a) then a.maxBatchSize else a
	
	if var31 == nil then
		return 1e999
	elseif typeof(var31) ~= "number" or var31 < 1 then
		error(error.new(("maxBatchSize must be a positive number: %s"):format(tostring(var31))))
	end
	return var31
end

getValidBatchScheduleFn = function(p22) --[[ line: 481 | named "getValidBatchScheduleFn" ]]
	-- upvalues: boolean (ref), var14 (ref), error (ref)
	local var32 = if boolean.toJSBoolean(p22) then p22.batchScheduleFn else p22
	
	if var32 == nil then
		return var14
	elseif typeof(var32) ~= "function" then
		error(error.new(("batchScheduleFn must be a function: %s"):format(tostring(var32))))
	end
	return var32
end

getValidCacheKeyFn = function(p23) --[[ line: 495 | named "getValidCacheKeyFn" ]]
	-- upvalues: boolean (ref), error (ref)
	local var33 = if boolean.toJSBoolean(p23) then p23.cacheKeyFn else p23
	
	if var33 == nil then
		return function(p24) --[[ line: 498 ]]
			return p24
		end
	elseif typeof(var33) ~= "function" then
		error(error.new(("cacheKeyFn must be a function: %s"):format(tostring(var33))))
	end
	return var33
end

getValidCacheMap = function(p25) --[[ line: 509 | named "getValidCacheMap" ]]
	-- upvalues: boolean (ref), map (ref), array (ref), error (ref)
	if not boolean.toJSBoolean(not boolean.toJSBoolean(p25) or p25.cache ~= false) then
		return nil
	end
	local var34 = if boolean.toJSBoolean(p25) then p25.cacheMap else p25
	
	if var34 == nil then
		return map.new()
	elseif var34 ~= nil then
		local var35 = array.filter({ "get", "set", "delete", "clear" }, function(p26) --[[ line: 520 ]]
			-- upvalues: boolean (copy), var34 (ref)
			return if boolean.toJSBoolean(var34) then typeof(var34[tostring(p26)]) ~= "function" else var34
		end)
		
		if #var35 ~= 0 then
			error(error.new("Custom cacheMap missing methods: " .. tostring(array.join(var35, ", "))))
		end
	end
	return var34
end

getValidName = function(p27) --[[ line: 530 | named "getValidName" ]]
	-- upvalues: boolean (ref)
	return if boolean.toJSBoolean(if boolean.toJSBoolean(p27) then p27.name else p27) then p27.name else nil
end

isArrayLike = function(p28) --[[ line: 538 | named "isArrayLike" ]]
	return typeof(p28) == "table" and (if #p28 ~= 0 then #p28 > 0 and p28[#p28] ~= nil else true)
end

t.DataLoader = t_1

return t