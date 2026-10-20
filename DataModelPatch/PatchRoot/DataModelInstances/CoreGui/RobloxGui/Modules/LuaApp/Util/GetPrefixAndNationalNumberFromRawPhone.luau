return function(Text: string)
	local D: string = Text:gsub("%D", "")
	
	if #D == 10 then
		return "1", D
	elseif #D == 11 and string.sub(D, 1, 1) == "1" then
		return "1", (string.sub(D, 2))
	else
		return "", D
	end
end