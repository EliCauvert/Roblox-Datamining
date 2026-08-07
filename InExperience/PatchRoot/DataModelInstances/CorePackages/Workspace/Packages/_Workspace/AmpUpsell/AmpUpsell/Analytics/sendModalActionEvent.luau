return function(p0, p1, p2, p3) --[[ line: 1 ]]
	p0.sendEventDeferred(p1, "modalAction", { aType = p3, origin = p2 })
end