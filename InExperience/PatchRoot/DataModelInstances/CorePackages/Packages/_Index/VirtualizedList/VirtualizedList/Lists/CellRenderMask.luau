local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local t = {}
local invariantModule = require(parent.jsUtils.invariant)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref), invariantModule (ref)
	local tbl = setmetatable({}, t_1)
	invariantModule(p1 >= 0, "CellRenderMask must contain a non-negative number os cells")
	tbl._numCells = p1
	
	if p1 == 0 then
		tbl._regions = {}
		
		return tbl
	end
	tbl._regions = { { first = 0, isSpacer = true, last = p1 - 1 } }
	
	return tbl
end

function t_1:enumerateRegions()
	return self._regions
end

function t_1:addCells(p1)
	-- upvalues: invariantModule (ref), object (ref), array (ref)
	invariantModule(p1.first >= 0 and (p1.first < self._numCells and (p1.last >= 0 and (p1.last < self._numCells and p1.first <= p1.last))), "CellRenderMask.addCells called with invalid cell range")
	local first, first_1 = self:_findRegion(p1.first)
	local last, last_1 = self:_findRegion(p1.last)
	
	if first_1 == last_1 and not first.isSpacer then return end
	local t = {}
	local t_1 = {}
	local var1 = object.assign({}, p1, { isSpacer = false })
	
	if first.first < var1.first then
		if first.isSpacer then
			table.insert(t, {
				isSpacer = true,
				first = first.first,
				last = var1.first - 1
			})
		else
			var1.first = first.first
		end
	end
	if var1.last < last.last then
		if last.isSpacer then
			table.insert(t_1, {
				isSpacer = true,
				first = var1.last + 1,
				last = last.last
			})
		else
			var1.last = last.last
		end
	end
	array.splice(self._regions, first_1, last_1 - first_1 + 1, table.unpack(array.concat(t, { var1 }, t_1)))
end

function t_1:equals(p1)
	-- upvalues: array (ref)
	return self._numCells == p1._numCells and (#self._regions == #p1._regions and array.every(self._regions, function(p2, p3)
		-- upvalues: p1 (ref)
		return p2.first == p1._regions[p3].first and (p2.last == p1._regions[p3].last and p2.isSpacer == p1._regions[p3].isSpacer)
	end))
end

function t_1:_findRegion(p1)
	-- upvalues: invariantModule (ref)
	local var1 = 1
	local regionsCount = #self._regions
	while var1 <= regionsCount do
		local floored = math.floor((var1 + regionsCount) / 2)
		local var2 = self._regions[floored]
		
		if var2.first > p1 or p1 > var2.last then
			if p1 < var2.first then
				regionsCount = floored - 1
			elseif var2.last < p1 then
				var1 = floored + 1
			end
		end
		return var2, floored
	end
	invariantModule(false, string.format("A region was not found containing cellIdx %s", tostring(p1)))
	
	return nil, nil
end

t.CellRenderMask = t_1

return t