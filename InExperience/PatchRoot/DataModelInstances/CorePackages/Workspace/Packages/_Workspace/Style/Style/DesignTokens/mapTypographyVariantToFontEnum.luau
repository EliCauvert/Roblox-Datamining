local t = {
	Black = Enum.Font.GothamBlack,
	Bold = Enum.Font.GothamBold,
	Medium = Enum.Font.GothamMedium,
	Book = Enum.Font.Gotham
}

return function(p0) --[[ line: 55 | named "mapTypographyVariantToFontEnum" ]]
	-- upvalues: t (ref)
	return if p0.Font then p0.Font elseif p0.FontWeight then t[p0.FontWeight] or t.Book else t.Book
end