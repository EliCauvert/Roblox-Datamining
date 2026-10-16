local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local InvariantModule = require(Parent.jsUtils.invariant)
local Module = {}
Module.__index = Module

function Module.new(_numCells: number) --[[ Line: 36 ]]
	-- upvalues: Module (copy), InvariantModule (copy)
	local self = setmetatable({}, Module)
	InvariantModule(_numCells >= 0, "CellRenderMask must contain a non-negative number os cells")
	self._numCells = _numCells
	
	if _numCells == 0 then
		self._regions = {}
		
		return self
	else
		self._regions = { { first = 0, isSpacer = true, last = _numCells - 1 } }
		
		return self
	end
end

function Module:enumerateRegions() --[[ Line: 47 ]]
	return self._regions
end

function Module:addCells(p1) --[[ Line: 50 ]]
	-- upvalues: InvariantModule (copy), Object (copy), Array (copy)
	InvariantModule(p1.first >= 0 and (p1.first < self._numCells and (p1.last >= 0 and p1.last < self._numCells)) and p1.first <= p1.last, "CellRenderMask.addCells called with invalid cell range")
	local Region, Region2 = self:_findRegion(p1.first)
	local Region1, Region2_1 = self:_findRegion(p1.last)
	
	if Region2 == Region2_1 and not Region.isSpacer then return end
	local List = {}
	local List1 = {}
	local AssignResult = Object.assign({}, p1, { isSpacer = false })
	
	if Region.first < AssignResult.first then
		if Region.isSpacer then
			table.insert(List, {
				isSpacer = true,
				first = Region.first,
				last = AssignResult.first - 1
			})
		else
			AssignResult.first = Region.first
		end
	end
	if AssignResult.last < Region1.last then
		if Region1.isSpacer then
			table.insert(List1, {
				isSpacer = true,
				first = AssignResult.last + 1,
				last = Region1.last
			})
		else
			AssignResult.last = Region1.last
		end
	end
	Array.splice(self._regions, Region2, Region2_1 - Region2 + 1, table.unpack((Array.concat(List, { AssignResult }, List1))))
end

function Module:equals(p1) --[[ Line: 95 ]]
	-- upvalues: Array (copy)
	return self._numCells == p1._numCells and #self._regions == #p1._regions and Array.every(self._regions, function(p2, p3): boolean --[[ Line: 98 ]]
		-- upvalues: p1 (copy)
		return p2.first == p1._regions[p3].first and p2.last == p1._regions[p3].last and p2.isSpacer == p1._regions[p3].isSpacer
	end)
end

function Module:_findRegion(First) --[[ Line: 105 ]]
	-- upvalues: InvariantModule (copy)
	local v1 = 1
	local CountRegions = #self._regions
	local Floored = nil
	local Region = nil
	while v1 <= CountRegions do
		Floored = math.floor((v1 + CountRegions) / 2)
		Region = self._regions[Floored]
		
		if Region.first <= First and First <= Region.last then
			return Region, Floored
		end
		if First < Region.first then
			CountRegions = Floored - 1
		elseif Region.last < First then
			v1 = Floored + 1
		end
	end
	InvariantModule(false, string.format("A region was not found containing cellIdx %s", (tostring(First))))
	
	return nil, nil
end

return { CellRenderMask = Module }