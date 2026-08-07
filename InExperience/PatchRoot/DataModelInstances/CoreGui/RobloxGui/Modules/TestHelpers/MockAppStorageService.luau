local t = {}
t.__index = t

function t.new(p0) --[[ line: 4 ]]
	-- upvalues: t (ref)
	p0 = p0 or {}
	setmetatable(p0, { __index = t })
	
	return p0
end

function t:GetItem(p1) --[[ line: 13 ]]
	return self[p1]
end

function t:SetItem(p2, p3) --[[ line: 18 ]]
	self[p2] = tostring(p3)
end

function t.flush(_) --[[ line: 22 ]] end

return t