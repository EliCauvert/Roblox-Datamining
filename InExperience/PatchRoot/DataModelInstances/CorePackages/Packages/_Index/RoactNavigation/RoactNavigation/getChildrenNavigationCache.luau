return function(p0) --[[ line: 3 ]]
	if not p0 then
		return {}
	elseif not p0._childrenNavigation then
		p0._childrenNavigation = {}
	end
	local childrenNavigation = p0._childrenNavigation
	local t = {}
	
	for i, v in p0.state.routes or {} do
		t[v.key] = true
	end
	if not p0.state.isTransitioning then
		for i_1, v_1 in childrenNavigation do
			if not t[i_1] then
				childrenNavigation[i_1] = nil
			end
		end
	end
	return p0._childrenNavigation
end