return function(p1, p2, p3, p4)
	p1.sendEventDeferred(p2, "modalAction", { aType = p4, origin = p3 })
end