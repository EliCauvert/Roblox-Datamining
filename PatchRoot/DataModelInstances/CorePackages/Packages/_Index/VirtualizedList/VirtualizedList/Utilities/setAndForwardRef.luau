-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:12 2026 Pacific Standard Time.

local _ = require(script.Parent.Parent.Parent.React)

return function(value) --[[ line: 57 | named "setAndForwardRef" ]]
	local getForwardedRef = value.getForwardedRef
	local setLocalRef = value.setLocalRef
	
	return function(p0) --[[ line: 59 ]]
		-- upvalues: getForwardedRef (ref), setLocalRef (ref)
		local var0 = getForwardedRef()
		setLocalRef(p0)
		
		if typeof(var0) == "function" then
			var0(p0)
			
			return
		elseif typeof(var0) == "table" then
			var0.current = p0
		end
	end
end