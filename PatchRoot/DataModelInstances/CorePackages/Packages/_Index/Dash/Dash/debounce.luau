-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

local assignModule = require(script.Parent.assign)

return function(p0, p1, p2) --[[ line: 30 | named "debounce" ]]
	-- upvalues: assignModule (ref)
	local var1 = assignModule({ leading = false, trailing = true }, p2)
	local var2 = 0
	local var3 = nil
	local var4 = false
	
	local var5 = function() --[[ line: 41 ]] end
	
	if var1.trailing then
		var5 = function(p3, p4, ...) --[[ line: 44 ]]
			-- upvalues: var2 (write), var4 (write), p0 (ref)
			if var2 == p3 then
				var4 = false
				
				if not p4 then
					p0(...)
				end
			end
		end
	elseif var1.leading then
		var5 = function(p5) --[[ line: 56 ]]
			-- upvalues: var2 (write), var4 (write)
			if var2 == p5 then
				var4 = false
			end
		end
	end
	return function(...) --[[ line: 63 ]]
		-- upvalues: var2 (write), var1 (ref), var4 (write), var3 (write), p0 (ref), p1 (ref), var5 (write)
		var2 += 1
		local var6 = var2
		local var7 = var1.leading and not var4
		
		if var3 then
			task.cancel(var3)
			var3 = nil
		end
		if var7 then
			var4 = true
			p0(...)
		end
		var3 = task.delay(p1, var5, var6, var7, ...)
	end
end