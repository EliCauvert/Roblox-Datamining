return function(p0, p1)
	p0.reportCounter(string.format("ExpChatV%sCount", string.gsub(p1 or "0", "%p", { ["."] = "_" })))
end