return function(p1, p2)
	local Ll: string = if p1:ToLocalTime().Year > DateTime.now():ToLocalTime().Year then "ll" else "ddd, MMM DD"
	
	return if p2 then ("%s at %s"):format(p1:FormatLocalTime(Ll, "en-us"), p1:FormatLocalTime("LT", "en-us")) else ("%s AT %s"):format(p1:FormatLocalTime(Ll, "en-us"), p1:FormatLocalTime("LT", "en-us")):upper()
end