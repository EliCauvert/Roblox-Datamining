local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local PromiseModule = require(Parent1.Promise)
local _ = require(Parent1.LuauPolyfill)
local Invariant = require(Parent.jsutils.invariant).invariant
local _ = require(script.Parent.Parent.Parent.utilities)

return {
	toPromise = function(p1) --[[ Line: 23 ]]
		-- upvalues: PromiseModule (copy), Invariant (copy)
		local Flag = false
		
		return PromiseModule.new(function(Callback, Callback1) --[[ Line: 25 ]]
			-- upvalues: p1 (copy), Flag (ref), Invariant (upval)
			p1:subscribe({
				next = function(_, p2) --[[ Line: 27 ]]
					-- upvalues: Flag (upval), Invariant (upval), Callback (copy)
					if Flag then
						Invariant.warn("Promise Wrapper does not support multiple results from Observable")
						
						return
					else
						Flag = true
						Callback(p2)
					end
				end,
				error = function(_, p2) --[[ Line: 35 ]]
					-- upvalues: Callback1 (copy)
					Callback1(p2)
				end
			})
		end):andThen(function(Result) --[[ Line: 41 ]]
			-- upvalues: PromiseModule (upval)
			return PromiseModule.delay(0):andThenReturn(Result)
		end)
	end
}