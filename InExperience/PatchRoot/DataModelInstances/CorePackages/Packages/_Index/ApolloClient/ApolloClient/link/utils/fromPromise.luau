local t = {}
local _ = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local observable = require(script.Parent.Parent.Parent.utilities).Observable

function t.fromPromise(p1)
	-- upvalues: observable (ref)
	return observable.new(function(p2)
		-- upvalues: p1 (ref)
		p1:andThen(function(p3)
			-- upvalues: p2 (ref)
			p2:next(p3)
			p2:complete()
		end):catch(function(p3)
			-- upvalues: p2 (ref)
			p2:error(p3)
		end)
	end)
end

return t