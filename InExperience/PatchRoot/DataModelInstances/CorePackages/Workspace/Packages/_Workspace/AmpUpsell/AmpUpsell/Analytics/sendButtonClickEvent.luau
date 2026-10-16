return function(p1, p2, Origin, Btn) --[[ Line: 1 ]]
	p1.sendEventDeferred(p2, "buttonClick", { origin = Origin, btn = Btn })
end