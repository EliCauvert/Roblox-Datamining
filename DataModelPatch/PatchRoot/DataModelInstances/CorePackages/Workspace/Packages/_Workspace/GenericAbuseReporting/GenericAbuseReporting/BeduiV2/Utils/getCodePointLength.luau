return function(Text): number
	return if Text == nil then 0 else utf8.len(Text) or Text:len()
end