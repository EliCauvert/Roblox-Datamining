local _ = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local Observable = require(script.Parent.Parent.Parent.utilities).Observable

return {
	fromPromise = function(Promise) --[[ Line: 21 ]]
		-- upvalues: Observable (copy)
		return Observable.new(function(p1) --[[ Line: 22 ]]
			-- upvalues: Promise (copy)
			Promise:andThen(function(Result) --[[ Line: 24 ]]
				-- upvalues: p1 (copy)
				p1:next(Result)
				p1:complete()
			end):catch(function(Err) --[[ Line: 28 ]]
				-- upvalues: p1 (copy)
				p1.error(p1, Err)
			end)
		end)
	end
}