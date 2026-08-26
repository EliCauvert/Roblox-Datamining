local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	p1 = p1 or {}
	setmetatable(p1, { __index = t })
	
	return p1
end

function t:GetItem(p1)
	return self[p1]
end

function t:SetItem(p1, p2)
	self[p1] = tostring(p2)
end

function t.flush(_) end

return t