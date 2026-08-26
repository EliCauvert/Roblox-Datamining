local t = {}
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local promiseModule = require(parent_1.Promise)
local _ = require(parent_1.LuauPolyfill)
local invariant = require(parent.jsutils.invariant).invariant
local _ = require(script.Parent.Parent.Parent.utilities)

function t.toPromise(p1)
	-- upvalues: promiseModule (ref), invariant (ref)
	local var1 = false
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: p1 (ref), var1 (write), invariant (copy)
		p1:subscribe({
			next = function(_, p4)
				-- upvalues: var1 (copy), invariant (copy), p2 (ref)
				if var1 then
					invariant.warn("Promise Wrapper does not support multiple results from Observable")
					
					return
				end
				var1 = true
				p2(p4)
			end,
			error = function(_, p4)
				-- upvalues: p3 (ref)
				p3(p4)
			end
		})
	end):andThen(function(p2)
		-- upvalues: promiseModule (copy)
		return promiseModule.delay(0):andThenReturn(p2)
	end)
end

return t