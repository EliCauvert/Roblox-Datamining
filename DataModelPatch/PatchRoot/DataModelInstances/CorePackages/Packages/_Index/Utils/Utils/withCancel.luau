local Boolean = require((nil).LuauPolyfill).Boolean
local PromiseModule = require((nil).Promise)
local _ = require((nil).Dev.JestGlobals).expect

local function defaultAsyncIteratorReturn(Value)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve():andThen(function()
		-- upvalues: Value (copy)
		return { done = true, value = Value }
	end)
end

local Memoize2Result = require(script.Parent["memoize.js"]).memoize2(function(p1, p2)
	return function(...)
		-- upvalues: p2 (copy), p1 (copy)
		return Reflect:apply(p2, p1, { ... })
	end
end)

local function getAsyncIteratorWithCancel(ApplyResult, Callback)
	-- upvalues: Boolean (copy), defaultAsyncIteratorReturn (copy), PromiseModule (copy), Memoize2Result (copy)
	return Proxy.new(ApplyResult, {
		has = function(_, p1, p2)
			return p2 == "return" or Reflect:has(p1, p2)
		end,
		get = function(_, p1, p2, p3)
			-- upvalues: Boolean (upval), defaultAsyncIteratorReturn (upval), PromiseModule (upval), Callback (copy), Memoize2Result (upval)
			local GetResult = Reflect:get(p1, p2, p3)
			
			if p2 == "return" then
				local GetResult1 = Boolean.toJSBoolean(GetResult) and GetResult or defaultAsyncIteratorReturn
				
				return function(p4)
					-- upvalues: PromiseModule (upval), Callback (upval), GetResult1 (copy), p1 (copy)
					return PromiseModule.resolve():andThen(function()
						-- upvalues: Callback (upval), p4 (copy), GetResult1 (upval), p1 (upval)
						return Reflect:apply(GetResult1, p1, { (Callback(p4):expect()) })
					end)
				end
			else
				return if typeof(GetResult) == "function" then Memoize2Result(p1, GetResult) else GetResult
			end
		end
	})
end

local function getAsyncIterableWithCancel(p1, p2)
	-- upvalues: getAsyncIteratorWithCancel (copy), Memoize2Result (copy)
	return Proxy.new(p1, {
		get = function(_, p3, AsyncIterator, p4)
			-- upvalues: getAsyncIteratorWithCancel (upval), p2 (copy), Memoize2Result (upval)
			local GetResult = Reflect:get(p3, AsyncIterator, p4)
			
			return if Symbol.asyncIterator == AsyncIterator then function()
				-- upvalues: GetResult (copy), p3 (copy), getAsyncIteratorWithCancel (upval), p2 (upval)
				return getAsyncIteratorWithCancel(Reflect:apply(GetResult, p3, {}), p2)
			end elseif typeof(GetResult) == "function" then Memoize2Result(p3, GetResult) else GetResult
		end
	})
end

return {
	getAsyncIteratorWithCancel = getAsyncIteratorWithCancel,
	getAsyncIterableWithCancel = getAsyncIterableWithCancel,
	withCancel = getAsyncIterableWithCancel
}