local t = {}
t.__index = t

function t.createNode(p1)
	-- upvalues: t (ref)
	local t_1 = { previous = nil, next = nil, value = p1 }
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

function t.CreatePrevious(p1, p2)
	-- upvalues: t (ref)
	local t_1 = { previous = p1.previous, next = p1, value = p2 or {} }
	
	if p1.previous then
		p1.previous.next = t_1
	end
	setmetatable(t_1, t)
	p1.previous = t_1
	
	return t_1
end

return t