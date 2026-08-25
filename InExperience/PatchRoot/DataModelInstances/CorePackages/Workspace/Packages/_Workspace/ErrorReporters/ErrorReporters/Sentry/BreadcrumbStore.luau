local tModule = require(script.Parent.Parent.Parent.t)
local breadcrumbModule = require(script.Parent.Breadcrumb)
local t = {}
t.__index = t
local var3 = tModule.tuple(tModule.optional(tModule.strictInterface({ limit = tModule.optional(tModule.numberPositive) })))

function t.new(p0)
	-- upvalues: var3 (ref), t (ref)
	assert(var3(p0))
	local limit = (p0 or {}).limit or 200
	
	return setmetatable({
		_writeIndex = 1,
		_count = 0,
		_breadcrumbs = table.create(limit),
		_limit = limit
	}, t)
end

function t:addBreadcrumb(p1)
	-- upvalues: breadcrumbModule (ref)
	self._breadcrumbs[self._writeIndex] = breadcrumbModule.new(p1)
	
	if self._count < self._limit then
		self._count += 1
	end
	self._writeIndex = self._writeIndex % self._limit + 1
end

function t:getBreadcrumbs()
	local t = {}
	
	if self._count == 0 then
		return t
	elseif self._count < self._limit then
		for i = 1, self._count do
			table.insert(t, self._breadcrumbs[i])
		end
		return t
	else
		for i_1 = self._writeIndex, self._limit do
			table.insert(t, self._breadcrumbs[i_1])
		end
		for i_2 = 1, self._writeIndex - 1 do
			table.insert(t, self._breadcrumbs[i_2])
		end
		return t
	end
end

function t:getCount()
	return self._count
end

function t:clear()
	self._breadcrumbs = table.create(self._limit)
	self._writeIndex = 1
	self._count = 0
end

function t:isFull()
	return self._limit <= self._count
end

return t