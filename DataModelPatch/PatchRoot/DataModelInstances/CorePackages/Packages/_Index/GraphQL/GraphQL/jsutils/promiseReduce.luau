local Parent = script.Parent
local Array = require(Parent.Parent.Parent.LuauPolyfill).Array
local _ = require(Parent.PromiseOrValue)
local IsPromiseFunction = require(Parent.isPromise).isPromise

return {
	promiseReduce = function(p1, Callback, p2)
		-- upvalues: Array (copy), IsPromiseFunction (copy)
		return Array.reduce(p1, function(Promise, p3)
			-- upvalues: IsPromiseFunction (upval), Callback (copy)
			return if IsPromiseFunction(Promise) then Promise:andThen(function(Result)
				-- upvalues: Callback (upval), p3 (copy)
				return Callback(Result, p3)
			end) else Callback(Promise, p3)
		end, p2)
	end
}