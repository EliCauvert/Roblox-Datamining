local t = {}
t.__index = t

function t.createNode(p0)
	-- upvalues: t (ref)
	local t_1 = { previous = nil, next = nil, value = p0 }
	setmetatable(t_1, t)
	
	return t_1
end

function t.CreateNext(p1, p2)
	-- upvalues: t (ref)
	local t_1 = { previous = p1, next = p1.next, value = p2 or {} }
	
	if p1.next then
		p1.next.previous = t_1
	end
	setmetatable(t_1, t)
	p1.next = t_1
	
	return t_1
end

function t.CreatePrevious(p3, p4)
	-- upvalues: t (ref)
	local t_1 = { previous = p3.previous, next = p3, value = p4 or {} }
	
	if p3.previous then
		p3.previous.next = t_1
	end
	setmetatable(t_1, t)
	p3.previous = t_1
	
	return t_1
end

return t