-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:15 2026 Pacific Standard Time.

local t = {}
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local promiseModule = require(parent_1.Promise)
local _ = require(parent_1.LuauPolyfill)
local invariant = require(parent.jsutils.invariant).invariant
local _ = require(script.Parent.Parent.Parent.utilities)

function t.toPromise(p0) --[[ line: 23 ]]
	-- upvalues: promiseModule (ref), invariant (ref)
	local var2 = false
	
	return promiseModule.new(function(p2, p3) --[[ line: 25 ]]
		-- upvalues: p0 (ref), var2 (write), invariant (copy)
		p0:subscribe({
			next = function(_, p4) --[[ line: 27 ]]
				-- upvalues: var2 (copy), invariant (copy), p2 (ref)
				if var2 then
					invariant.warn("Promise Wrapper does not support multiple results from Observable")
					
					return
				end
				var2 = true
				p2(p4)
			end,
			error = function(_, p5) --[[ line: 35 ]]
				-- upvalues: p3 (ref)
				p3(p5)
			end
		})
	end):andThen(function(p1) --[[ line: 41 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.delay(0):andThenReturn(p1)
	end)
end

return t