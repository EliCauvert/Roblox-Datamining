return function(p1, p2)
	local _ = nil
	local var1 = if DateTime.now():ToLocalTime().Year < p1:ToLocalTime().Year then "ll" else "ddd, MMM DD"
	
	return if p2 then ("%s at %s"):format(p1:FormatLocalTime(var1, "en-us"), p1:FormatLocalTime("LT", "en-us")) else ("%s AT %s"):format(p1:FormatLocalTime(var1, "en-us"), p1:FormatLocalTime("LT", "en-us")):upper()
end