local boolean = require((nil).LuauPolyfill).Boolean
local promiseModule = require((nil).Promise)
local t = {}
local _ = require((nil).Dev.JestGlobals).expect

local function defaultAsyncIteratorReturn(p1)
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve():andThen(function()
		-- upvalues: p1 (ref)
		return { done = true, value = p1 }
	end)
end

local var1 = require(script.Parent["memoize.js"]).memoize2(function(p1, p2)
	return function(...)
		-- upvalues: p2 (ref), p1 (ref)
		return Reflect:apply(p2, p1, { ... })
	end
end)

local function getAsyncIteratorWithCancel(p1, p2)
	-- upvalues: boolean (ref), defaultAsyncIteratorReturn (ref), promiseModule (ref), var1 (ref)
	return Proxy.new(p1, {
		has = function(_, p3, p4)
			return p4 == "return" or Reflect:has(p3, p4)
		end,
		get = function(_, p3, p4, p5)
			-- upvalues: boolean (copy), defaultAsyncIteratorReturn (copy), promiseModule (copy), p2 (ref), var1 (copy)
			local var2 = Reflect:get(p3, p4, p5)
			
			if p4 == "return" then
				local var3 = if boolean.toJSBoolean(var2) then var2 else defaultAsyncIteratorReturn
				
				return function(p6)
					-- upvalues: promiseModule (copy), p2 (copy), var3 (ref), p3 (ref)
					return promiseModule.resolve():andThen(function()
						-- upvalues: p2 (copy), p6 (ref), var3 (copy), p3 (copy)
						return Reflect:apply(var3, p3, { p2(p6):expect() })
					end)
				end
			end
			return if typeof(var2) == "function" then var1(p3, var2) else var2
		end
	})
end

t.getAsyncIteratorWithCancel = getAsyncIteratorWithCancel

local function getAsyncIterableWithCancel(p1, p2)
	-- upvalues: getAsyncIteratorWithCancel (ref), var1 (ref)
	return Proxy.new(p1, {
		get = function(_, p3, p4, p5)
			-- upvalues: getAsyncIteratorWithCancel (copy), p2 (ref), var1 (copy)
			local var2 = Reflect:get(p3, p4, p5)
			
			return if Symbol.asyncIterator == p4 then function()
				-- upvalues: var2 (ref), p3 (ref), getAsyncIteratorWithCancel (copy), p2 (copy)
				return getAsyncIteratorWithCancel(Reflect:apply(var2, p3, {}), p2)
			end elseif typeof(var2) == "function" then var1(p3, var2) else var2
		end
	})
end

t.getAsyncIterableWithCancel = getAsyncIterableWithCancel
t.withCancel = getAsyncIterableWithCancel

return t