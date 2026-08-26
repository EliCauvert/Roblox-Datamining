return function(p1, p2)
	p1.reportCounter(string.format("ExpChatV%sCount", string.gsub(p2 or "0", "%p", { ["."] = "_" })))
end