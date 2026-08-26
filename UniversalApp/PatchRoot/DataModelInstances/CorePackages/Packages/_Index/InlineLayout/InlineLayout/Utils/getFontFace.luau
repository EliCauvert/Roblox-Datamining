return function(p1)
	local font = p1 and p1.Font
	
	return if typeof(font) == "EnumItem" and font:IsA("Font") then Font.fromEnum(font) else font
end