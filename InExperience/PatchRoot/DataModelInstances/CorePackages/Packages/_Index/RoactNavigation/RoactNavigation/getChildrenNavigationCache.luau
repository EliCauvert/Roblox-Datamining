return function(p1)
	if not p1 then
		return {}
	end
	if not p1._childrenNavigation then
		p1._childrenNavigation = {}
	end
	local ChildrenNavigation = p1._childrenNavigation
	local t = {}
	local Routes = p1.state.routes or {}
	for i, route in Routes do
		t[route.key] = true
	end
	if not p1.state.isTransitioning then
		for i, _ in ChildrenNavigation do
			if not t[i] then
				ChildrenNavigation[i] = nil
			end
		end
	end
	return p1._childrenNavigation
end