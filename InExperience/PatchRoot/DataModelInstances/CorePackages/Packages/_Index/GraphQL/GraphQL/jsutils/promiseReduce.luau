local parent = script.Parent
local array = require(parent.Parent.Parent.LuauPolyfill).Array
local _ = require(parent.PromiseOrValue)
local isPromise = require(parent.isPromise).isPromise

return {
	promiseReduce = function(p1, p2, p3)
		-- upvalues: array (ref), isPromise (ref)
		return array.reduce(p1, function(p4, p5)
			-- upvalues: isPromise (copy), p2 (ref)
			return if isPromise(p4) then p4:andThen(function(p6)
				-- upvalues: p2 (copy), p5 (ref)
				return p2(p6, p5)
			end) else p2(p4, p5)
		end, p3)
	end
}