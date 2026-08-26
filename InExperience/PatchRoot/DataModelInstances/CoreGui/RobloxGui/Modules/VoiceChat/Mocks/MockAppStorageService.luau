local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	return setmetatable({ _privateValues = table.clone(p1) }, t)
end

function t:GetItem(p1)
	return self._privateValues[p1]
end

function t:SetItem(p1, p2)
	self._privateValues[p1] = p2
end

function t.Flush(_) end

function t:_DeepEquals(p1)
	for i, v in p1 do
		if self._privateValues[i] ~= v then
			return false
		end
	end
	return true
end

return t