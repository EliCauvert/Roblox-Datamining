return function(p1)
	local _Font = p1 and p1.Font
	
	return if typeof(_Font) == "EnumItem" and _Font:IsA("Font") then Font.fromEnum(_Font) else _Font
end