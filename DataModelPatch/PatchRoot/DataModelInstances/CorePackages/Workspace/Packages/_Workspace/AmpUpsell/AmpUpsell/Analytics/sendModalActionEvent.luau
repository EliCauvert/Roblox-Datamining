return function(p1, p2, Origin, AType)
	p1.sendEventDeferred(p2, "modalAction", { aType = AType, origin = Origin })
end