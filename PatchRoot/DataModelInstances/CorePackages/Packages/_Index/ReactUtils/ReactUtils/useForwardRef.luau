-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:39 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p0, p1) --[[ line: 29 | named "useForwardRef" ]]
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useCallback(function(p2) --[[ line: 33 ]]
		-- upvalues: var2 (ref), var1 (ref), p1 (ref)
		if var2.current then
			var2.current()
			var2.current = nil
		end
		if p2 then
			var1.current = p2
			var2.current = p1(p2)
		end
	end, { p1 })
	reactModule.useImperativeHandle(p0, function() --[[ line: 44 ]]
		-- upvalues: var1 (ref)
		return var1.current
	end)
	
	return var3
end