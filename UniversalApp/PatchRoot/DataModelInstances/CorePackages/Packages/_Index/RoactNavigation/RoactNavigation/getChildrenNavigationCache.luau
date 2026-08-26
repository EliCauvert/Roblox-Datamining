return function(p1)
	if not p1 then
		return {}
	elseif not p1._childrenNavigation then
		p1._childrenNavigation = {}
	end
	local childrenNavigation = p1._childrenNavigation
	local t = {}
	
	for i, v in p1.state.routes or {} do
		t[v.key] = true
	end
	if not p1.state.isTransitioning then
		for i_1, v_1 in childrenNavigation do
			if not t[i_1] then
				childrenNavigation[i_1] = nil
			end
		end
	end
	return p1._childrenNavigation
end