local t = {
	Black = Enum.Font.GothamBlack,
	Bold = Enum.Font.GothamBold,
	Medium = Enum.Font.GothamMedium,
	Book = Enum.Font.Gotham
}

return function(p1)
	-- upvalues: t (ref)
	return if p1.Font then p1.Font elseif p1.FontWeight then t[p1.FontWeight] or t.Book else t.Book
end