return function(p0)
	local font = p0 and p0.Font
	
	return if typeof(font) == "EnumItem" and font:IsA("Font") then Font.fromEnum(font) else font
end