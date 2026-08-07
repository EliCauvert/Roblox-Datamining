-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:33 2026 Pacific Standard Time.

return {
	genFuzzStrings = function(p0) --[[ line: 13 ]]
		return coroutine.wrap(function() --[[ line: 14 | named "getFuzzStrings" ]]
			-- upvalues: p0 (ref)
			local allowedChars = p0.allowedChars
			local maxLength = p0.maxLength
			local allowedCharsCount = #allowedChars
			local var1 = 0
			
			for i = 1, maxLength do
				var1 += allowedCharsCount ^ i
			end
			coroutine.yield("")
			
			for i_1 = 0, var1 - 1 do
				local var2 = ""
				local var3 = i_1
			end
		end)
	end
}