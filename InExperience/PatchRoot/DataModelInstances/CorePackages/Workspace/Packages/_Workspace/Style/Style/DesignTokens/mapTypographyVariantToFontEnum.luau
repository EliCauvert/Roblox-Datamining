local config = {
	Black = Enum.Font.GothamBlack,
	Bold = Enum.Font.GothamBold,
	Medium = Enum.Font.GothamMedium,
	Book = Enum.Font.Gotham
}

return function(p1) --[[ Line: 55 | Named "mapTypographyVariantToFontEnum" ]]
	-- upvalues: config (copy)
	return if p1.Font then p1.Font else p1.FontWeight and config[p1.FontWeight] or config.Book
end