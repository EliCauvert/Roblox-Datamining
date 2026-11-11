return function(p1)
	return {
		Diag = { reportCounter = p1.fn() },
		EventStream = { setRBXEventStream = p1.fn() }
	}
end