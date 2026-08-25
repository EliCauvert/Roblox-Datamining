local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local t = {}
local invariantModule = require(parent.jsUtils.invariant)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t_1 (ref), invariantModule (ref)
	local tbl = setmetatable({}, t_1)
	invariantModule(p0 >= 0, "CellRenderMask must contain a non-negative number os cells")
	tbl._numCells = p0
	
	if p0 == 0 then
		tbl._regions = {}
		
		return tbl
	end
	tbl._regions = { { first = 0, isSpacer = true, last = p0 - 1 } }
	
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
	local var11 = object.assign({}, p1, { isSpacer = false })
	
	if first.first < var11.first then
		if first.isSpacer then
			table.insert(t, {
				isSpacer = true,
				first = first.first,
				last = var11.first - 1
			})
		else
			var11.first = first.first
		end
	end
	if var11.last < last.last then
		if last.isSpacer then
			table.insert(t_1, {
				isSpacer = true,
				first = var11.last + 1,
				last = last.last
			})
		else
			var11.last = last.last
		end
	end
	array.splice(self._regions, first_1, last_1 - first_1 + 1, table.unpack(array.concat(t, { var11 }, t_1)))
end

function t_1:equals(p2)
	-- upvalues: array (ref)
	return self._numCells == p2._numCells and (#self._regions == #p2._regions and array.every(self._regions, function(p3, p4)
		-- upvalues: p2 (ref)
		return p3.first == p2._regions[p4].first and (p3.last == p2._regions[p4].last and p3.isSpacer == p2._regions[p4].isSpacer)
	end))
end

function t_1:_findRegion(p5)
	-- upvalues: invariantModule (ref)
	local var12 = 1
	local regionsCount = #self._regions
	while var12 <= regionsCount do
		local floored = math.floor((var12 + regionsCount) / 2)
		local var15 = self._regions[floored]
		
		if var15.first > p5 or p5 > var15.last then
			if p5 < var15.first then
				regionsCount = floored - 1
			elseif var15.last < p5 then
				var12 = floored + 1
			end
		end
		return var15, floored
	end
	invariantModule(false, string.format("A region was not found containing cellIdx %s", tostring(p5)))
	
	return nil, nil
end

t.CellRenderMask = t_1

return t