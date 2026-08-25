local parent = script.Parent
local array = require(parent.Parent.Parent.LuauPolyfill).Array
local _ = require(parent.PromiseOrValue)
local isPromise = require(parent.isPromise).isPromise

return {
	promiseReduce = function(p0, p1, p2)
		-- upvalues: array (ref), isPromise (ref)
		return array.reduce(p0, function(p3, p4)
			-- upvalues: isPromise (copy), p1 (ref)
			return if isPromise(p3) then p3:andThen(function(p5)
				-- upvalues: p1 (copy), p4 (ref)
				return p1(p5, p4)
			end) else p1(p3, p4)
		end, p2)
	end
}