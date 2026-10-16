return function(p1) --[[ Line: 1 ]]
	return {
		Diag = { reportCounter = p1.fn() },
		EventStream = { setRBXEventStream = p1.fn() }
	}
end