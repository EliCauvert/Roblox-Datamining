local Parent = script.Parent
local ReactModule = require(Parent.React)
local REACTMEMOCACHESENTINEL = require(Parent.Shared).ReactSymbols.REACT_MEMO_CACHE_SENTINEL

local function useMemoFallback(p1)
	-- upvalues: ReactModule (copy), REACTMEMOCACHESENTINEL (copy)
	return ReactModule.useMemo(function()
		-- upvalues: p1 (copy), REACTMEMOCACHESENTINEL (upval)
		local Buffer = table.create(p1)
		
		for i = 1, p1 do
			Buffer[i] = REACTMEMOCACHESENTINEL
		end
		return Buffer
	end, {})
end

local COMPILERRUNTIME = ReactModule.__COMPILER_RUNTIME
local C = if COMPILERRUNTIME == nil then nil else COMPILERRUNTIME.c
local Cg = if COMPILERRUNTIME == nil then nil else COMPILERRUNTIME.cg
local Cc = if COMPILERRUNTIME == nil then nil else COMPILERRUNTIME.cc
local Jsx = if COMPILERRUNTIME == nil then nil else COMPILERRUNTIME.jsx

local function _(p2)
	return coroutine.wrap(function()
		-- upvalues: p2 (copy)
		for i, value, value1, value2, value3, value4, value5, value6 in p2 do
			coroutine.yield(i, value, value1, value2, value3, value4, value5, value6)
		end
	end)
end

local function uncachedMemoCache(p3, _)
	-- upvalues: REACTMEMOCACHESENTINEL (copy)
	return table.create(p3, REACTMEMOCACHESENTINEL)
end

local function unsupportedClassMemoCache(_)
	error("React Compiler class memo caching requires a renderer with native cc support.", 2)
end

return {
	c = C or useMemoFallback,
	cg = Cg or uncachedMemoCache,
	cc = Cc or unsupportedClassMemoCache,
	iterate = function(Callback, p3, p4)
		if type(Callback) == "function" then
			return Callback, p3, p4
		elseif type(Callback) == "table" and getmetatable(Callback) == nil then
			return next, Callback, nil
		else
			return coroutine.wrap(function()
				-- upvalues: Callback (copy)
				for i, value, value1, value2, value3, value4, value5, value6 in Callback do
					coroutine.yield(i, value, value1, value2, value3, value4, value5, value6)
				end
			end), nil, nil
		end
	end,
	jsx = Jsx or ReactModule.createElement,
	MEMO_CACHE_SENTINEL = REACTMEMOCACHESENTINEL,
	createMemoCacheSlot = function(p5)
		-- upvalues: REACTMEMOCACHESENTINEL (copy)
		local Buffer = table.create(p5)
		
		for i = 1, p5 do
			Buffer[i] = REACTMEMOCACHESENTINEL
		end
		return Buffer
	end,
	createMemoCache = function()
		return { index = 1, data = {}, sizes = {} }
	end,
	cloneMemoCache = function(MemoCache)
		local Buffer = table.create(#MemoCache.data)
		
		for i, entry in MemoCache.data do
			Buffer[i] = table.clone(entry)
		end
		return {
			index = 1,
			data = Buffer,
			sizes = table.clone(MemoCache.sizes)
		}
	end,
	shareMemoCache = function(MemoCache)
		return {
			index = 1,
			data = MemoCache.data,
			sizes = MemoCache.sizes
		}
	end,
	resetMemoCache = function(p6)
		p6.index = 1
	end
}