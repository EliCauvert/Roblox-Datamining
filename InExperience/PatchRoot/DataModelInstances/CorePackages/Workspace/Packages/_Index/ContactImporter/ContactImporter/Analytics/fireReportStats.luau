return function(p0)
	return function(p1, p2)
		-- upvalues: p0 (ref)
		p0.diagImpl:reportStats(p0.eventList[p1].name, p2.loadingTime)
	end
end