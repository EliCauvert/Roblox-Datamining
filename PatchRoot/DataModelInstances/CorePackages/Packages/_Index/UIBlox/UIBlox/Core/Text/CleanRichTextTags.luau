-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:04 2026 Pacific Standard Time.

return function(p0) --[[ line: 4 | named "cleanRichTextTags" ]]
	local var0 = ""
	local var1 = 0
	
	for i = 1, #p0 do
		local substring = string.sub(p0, i, i)
		
		if substring == "<" then
			var1 += 1
			continue
		end
		if substring == ">" and var1 > 0 then
			var1 -= 1
		elseif var1 == 0 then
			var0 ..= substring
		end
	end
	return if var1 == 0 then var0 else p0
end