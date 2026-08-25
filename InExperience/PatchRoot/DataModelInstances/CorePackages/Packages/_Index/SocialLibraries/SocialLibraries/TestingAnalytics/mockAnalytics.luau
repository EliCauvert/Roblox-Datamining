return function(p0)
	return {
		Diag = { reportCounter = p0.fn() },
		EventStream = { setRBXEventStream = p0.fn() }
	}
end