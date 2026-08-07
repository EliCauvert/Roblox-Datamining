local t = {}
t.__index = t

function t.new(p0) --[[ line: 4 ]]
	-- upvalues: t (ref)
	return setmetatable({ _privateValues = table.clone(p0) }, t)
end

function t:GetItem(p1) --[[ line: 12 ]]
	return self._privateValues[p1]
end

function t:SetItem(p2, p3) --[[ line: 16 ]]
	self._privateValues[p2] = p3
end

function t.Flush(_) --[[ line: 20 ]] end

function t:_DeepEquals(p4) --[[ line: 23 ]]
	for i, v in p4 do
		if self._privateValues[i] ~= v then
			return false
		end
	end
	return true
end

return t