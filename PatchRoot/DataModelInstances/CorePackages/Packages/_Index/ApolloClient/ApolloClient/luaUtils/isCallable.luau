-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:15 2026 Pacific Standard Time.

return function(p0) --[[ line: 9 | named "isCallable" ]]
	if typeof(p0) == "function" then
		return true
	elseif typeof(p0) == "table" then
		local var0 = getmetatable(p0)
		
		return if var0 and rawget(var0, "__call") then true else p0._isMockFunction
	end
end