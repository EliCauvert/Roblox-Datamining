return function(p1) --[[ Line: 1 ]]
	return function(p2, p3) --[[ Line: 2 ]]
		-- upvalues: p1 (copy)
		p1.diagImpl:reportStats(p1.eventList[p2].name, p3.loadingTime)
	end
end