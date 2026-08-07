return function(p0, p1) --[[ line: 1 | named "formatDate" ]]
	local _ = nil
	local var0 = if DateTime.now():ToLocalTime().Year < p0:ToLocalTime().Year then "ll" else "ddd, MMM DD"
	
	return if p1 then ("%s at %s"):format(p0:FormatLocalTime(var0, "en-us"), p0:FormatLocalTime("LT", "en-us")) else ("%s AT %s"):format(p0:FormatLocalTime(var0, "en-us"), p0:FormatLocalTime("LT", "en-us")):upper()
end