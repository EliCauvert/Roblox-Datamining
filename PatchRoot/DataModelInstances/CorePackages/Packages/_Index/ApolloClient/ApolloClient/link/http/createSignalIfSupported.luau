-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:15 2026 Pacific Standard Time.

return {
	createSignalIfSupported = function() --[[ line: 11 ]]
		local abortController = _G.AbortController
		
		if typeof(abortController) == "nil" then
			return { controller = false, signal = false }
		end
		local var0 = abortController.new()
		
		return { controller = var0, signal = var0.signal }
	end
}