-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:20 2026 Pacific Standard Time.

return {
	named = function(p0) --[[ line: 30 ]]
		assert(type(p0) == "string", "Symbols must be created using a string name!")
		local var0 = newproxy(true)
		local formattedText = string.format("Symbol(%s)", p0)
		
		getmetatable(var0).__tostring = function() --[[ line: 37 ]]
			-- upvalues: formattedText (ref)
			return formattedText
		end
		
		return var0
	end
}