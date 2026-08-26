return function(p1)
	return function(p2, p3)
		-- upvalues: p1 (ref)
		p1.diagImpl:reportStats(p1.eventList[p2].name, p3.loadingTime)
	end
end