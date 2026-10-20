return function(p1, p2, Origin, Btn)
	p1.sendEventDeferred(p2, "buttonClick", { origin = Origin, btn = Btn })
end