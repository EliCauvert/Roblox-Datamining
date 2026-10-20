local TModule = require(script.Parent.Parent.Parent.t)
local BreadcrumbModule = require(script.Parent.Breadcrumb)
local BreadcrumbStore = {}
BreadcrumbStore.__index = BreadcrumbStore
local TupleResult = TModule.tuple(TModule.optional(TModule.strictInterface({ limit = TModule.optional(TModule.numberPositive) })))

function BreadcrumbStore.new(p1)
	-- upvalues: TupleResult (copy), BreadcrumbStore (copy)
	assert(TupleResult(p1))
	local Limit = (p1 or {}).limit or 200
	
	return (setmetatable({
		_writeIndex = 1,
		_count = 0,
		_breadcrumbs = table.create(Limit),
		_limit = Limit
	}, BreadcrumbStore))
end

function BreadcrumbStore:addBreadcrumb(p1)
	-- upvalues: BreadcrumbModule (copy)
	self._breadcrumbs[self._writeIndex] = BreadcrumbModule.new(p1)
	
	if self._count < self._limit then
		self._count += 1
	end
	self._writeIndex = self._writeIndex % self._limit + 1
end

function BreadcrumbStore:getBreadcrumbs()
	local Breadcrumbs = {}
	
	if self._count == 0 then
		return Breadcrumbs
	end
	if self._count < self._limit then
		for i = 1, self._count do
			table.insert(Breadcrumbs, self._breadcrumbs[i])
		end
		return Breadcrumbs
	else
		for i1 = self._writeIndex, self._limit do
			table.insert(Breadcrumbs, self._breadcrumbs[i1])
		end
		for i2 = 1, self._writeIndex - 1 do
			table.insert(Breadcrumbs, self._breadcrumbs[i2])
		end
		return Breadcrumbs
	end
end

function BreadcrumbStore:getCount()
	return self._count
end

function BreadcrumbStore:clear()
	self._breadcrumbs = table.create(self._limit)
	self._writeIndex = 1
	self._count = 0
end

function BreadcrumbStore:isFull(): boolean
	return self._limit <= self._count
end

return BreadcrumbStore