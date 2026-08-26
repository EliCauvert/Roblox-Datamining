return function(p1, p2, p3, p4)
	p1.sendEventDeferred(p2, "buttonClick", { origin = p3, btn = p4 })
end