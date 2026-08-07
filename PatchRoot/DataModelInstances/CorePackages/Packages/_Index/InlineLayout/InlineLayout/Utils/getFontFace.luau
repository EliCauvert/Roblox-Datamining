-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:40 2026 Pacific Standard Time.

return function(p0) --[[ line: 9 | named "getFontFace" ]]
	local font = p0 and p0.Font
	
	return if typeof(font) == "EnumItem" and font:IsA("Font") then Font.fromEnum(font) else font
end