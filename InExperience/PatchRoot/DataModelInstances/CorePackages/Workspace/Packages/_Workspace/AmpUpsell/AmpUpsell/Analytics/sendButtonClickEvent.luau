return function(p0, p1, p2, p3) --[[ line: 1 ]]
	p0.sendEventDeferred(p1, "buttonClick", { origin = p2, btn = p3 })
end