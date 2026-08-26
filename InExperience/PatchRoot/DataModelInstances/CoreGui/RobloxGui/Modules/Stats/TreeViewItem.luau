local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: t (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1._id = p1
	t_1._parent = p2
	t_1._children = {}
	
	return t_1
end

function t:getValue()
	return self._value
end

function t:getLabel()
	return self._label
end

function t:getChildren()
	return self._children
end

function t:getId()
	return self._id
end

function t:getStackDepth()
	return if self._parent == nil then 0 else 1 + self._parent:getStackDepth()
end

function t:setLabelAndValue(p1, p2)
	self._label = p1
	self._value = p2
end

function t:getOrMakeChildById(p1)
	-- upvalues: t (ref)
	for i, v in ipairs(self._children) do
		if v:getId() == p1 then
			return v
		end
	end
	local var1 = t.new(p1, self)
	table.insert(self._children, var1)
	
	return var1
end

function t:removeChildren()
	if not self._children then return end
	for i, v in ipairs(self._children) do
		v:removeChildren()
		v = nil
	end
	self._id = nil
	self._parent = nil
	self._children = nil
end

function t:removeChild(p2)
	for i, v in ipairs(self._children) do
		if v:getId() == p2 then
			v:removeChildren()
			
			return
		end
	end
end

return t