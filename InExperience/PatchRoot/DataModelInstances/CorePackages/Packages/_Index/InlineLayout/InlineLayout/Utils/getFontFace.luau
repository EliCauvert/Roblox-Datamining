return function(p0) --[[ line: 9 | named "getFontFace" ]]
	local font = p0 and p0.Font
	
	return if typeof(font) == "EnumItem" and font:IsA("Font") then Font.fromEnum(font) else font
end