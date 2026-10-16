return function(Text): number --[[ Line: 1 | Named "getCodePointLength" ]]
	return if Text == nil then 0 else utf8.len(Text) or Text:len()
end