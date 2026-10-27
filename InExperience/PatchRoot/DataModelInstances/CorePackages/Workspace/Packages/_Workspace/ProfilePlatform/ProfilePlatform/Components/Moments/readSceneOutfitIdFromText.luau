return function(Text: string)
	local Number: number? = tonumber((string.match(Text, "name=\"Name\">outfitId</string><int64 name=\"Value\">(%d+)</int64>")))
	
	return if type(Number) == "number" and Number > 0 and Number % 1 == 0 then Number else nil
end