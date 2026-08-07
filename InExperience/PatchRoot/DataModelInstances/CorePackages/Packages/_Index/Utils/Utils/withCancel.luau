local boolean = require((nil).LuauPolyfill).Boolean
local promiseModule = require((nil).Promise)
local t = {}
local _ = require((nil).Dev.JestGlobals).expect

local function defaultAsyncIteratorReturn(p0) --[[ line: 14 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve():andThen(function() --[[ line: 15 ]]
		-- upvalues: p0 (ref)
		return { done = true, value = p0 }
	end)
end

local var3 = require(script.Parent["memoize.js"]).memoize2(function(p1, p2) --[[ line: 19 ]]
	return function(...) --[[ line: 20 ]]
		-- upvalues: p2 (ref), p1 (ref)
		return Reflect:apply(p2, p1, { ... })
	end
end)

local function getAsyncIteratorWithCancel(p3, p4) --[[ line: 29 ]]
	-- upvalues: boolean (ref), defaultAsyncIteratorReturn (ref), promiseModule (ref), var3 (ref)
	return Proxy.new(p3, {
		has = function(_, p5, p6) --[[ line: 35 ]]
			return p6 == "return" or Reflect:has(p5, p6)
		end,
		get = function(_, p7, p8, p9) --[[ line: 41 ]]
			-- upvalues: boolean (copy), defaultAsyncIteratorReturn (copy), promiseModule (copy), p4 (ref), var3 (copy)
			local var6 = Reflect:get(p7, p8, p9)
			
			if p8 == "return" then
				local var7 = if boolean.toJSBoolean(var6) then var6 else defaultAsyncIteratorReturn
				
				return function(p10) --[[ line: 46 ]]
					-- upvalues: promiseModule (copy), p4 (copy), var7 (ref), p7 (ref)
					return promiseModule.resolve():andThen(function() --[[ line: 47 ]]
						-- upvalues: p4 (copy), p10 (ref), var7 (copy), p7 (copy)
						return Reflect:apply(var7, p7, { p4(p10):expect() })
					end)
				end
			end
			return if typeof(var6) == "function" then var3(p7, var6) else var6
		end
	})
end

t.getAsyncIteratorWithCancel = getAsyncIteratorWithCancel

local function getAsyncIterableWithCancel(p11, p12) --[[ line: 62 ]]
	-- upvalues: getAsyncIteratorWithCancel (ref), var3 (ref)
	return Proxy.new(p11, {
		get = function(_, p13, p14, p15) --[[ line: 68 ]]
			-- upvalues: getAsyncIteratorWithCancel (copy), p12 (ref), var3 (copy)
			local var8 = Reflect:get(p13, p14, p15)
			
			return if Symbol.asyncIterator == p14 then function() --[[ line: 71 ]]
				-- upvalues: var8 (ref), p13 (ref), getAsyncIteratorWithCancel (copy), p12 (copy)
				return getAsyncIteratorWithCancel(Reflect:apply(var8, p13, {}), p12)
			end elseif typeof(var8) == "function" then var3(p13, var8) else var8
		end
	})
end

t.getAsyncIterableWithCancel = getAsyncIterableWithCancel
t.withCancel = getAsyncIterableWithCancel

return t