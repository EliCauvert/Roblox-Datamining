local t = {}
local _ = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)
local observable = require(script.Parent.Parent.Parent.utilities).Observable

function t.fromPromise(p0) --[[ line: 21 ]]
	-- upvalues: observable (ref)
	return observable.new(function(p1) --[[ line: 22 ]]
		-- upvalues: p0 (ref)
		p0:andThen(function(p3) --[[ line: 24 ]]
			-- upvalues: p1 (ref)
			p1:next(p3)
			p1:complete()
		end):catch(function(p2) --[[ line: 28 ]]
			-- upvalues: p1 (ref)
			p1:error(p2)
		end)
	end)
end

return t