local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref)
	p0 = p0 or {}
	setmetatable(p0, { __index = t })
	
	return p0
end

function t:GetItem(p1)
	return self[p1]
end

function t:SetItem(p2, p3)
	self[p2] = tostring(p3)
end

function t.flush(_) end

return t