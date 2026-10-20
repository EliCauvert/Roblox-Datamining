local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local _ = require(Parent.CollectionViews)
local TutilsModule = require(Parent.tutils)
local _ = require(SduiCoreSystem.ClientBinding.SduiPoolStoreTypes)
local Frozen = table.freeze({})

local function getSpanConfigAt(p1, RealIndex)
	local v1 = p1[RealIndex]
	
	if v1 == nil then
		return nil
	else
		local ColSpan = v1.colSpan or 1
		local RowSpan = v1.rowSpan or 1
		local AlignmentType = v1.alignmentType
		local MinRowPadding = v1.minRowPadding or 0
		
		return if ColSpan == 1 and RowSpan == 1 and AlignmentType == nil and MinRowPadding == 0 then nil else {
			colSpan = ColSpan,
			rowSpan = RowSpan,
			alignmentType = AlignmentType,
			minRowPadding = MinRowPadding
		}
	end
end

return {
	EMPTY_CELLS = Frozen,
	getSpanConfigAt = getSpanConfigAt,
	makePoolGetSpanConfig = function(p1)
		-- upvalues: getSpanConfigAt (copy)
		return function(_, p2)
			-- upvalues: getSpanConfigAt (upval), p1 (copy)
			return (getSpanConfigAt(p1, p2))
		end
	end,
	layoutToCells = function(List, p1, p2, p3)
		-- upvalues: Frozen (copy), getSpanConfigAt (copy)
		if List == nil then
			return Frozen, 0
		end
		local v1 = 0
		
		for i in List do
			if v1 < i then
				v1 = i
			end
		end
		if v1 == 0 then
			return Frozen, 0
		end
		local List1 = {}
		
		for i1 = 1, v1 do
			local Entry = List[i1] or {}
			for i2 = 1, p1 do
				local Entry1: number = Entry[i2]
				
				if Entry1 == nil or Entry1 <= 0 then
					table.insert(List1, {})
				else
					table.insert(List1, {
						item = p2[Entry1],
						realIndex = Entry1,
						spanOverride = if p3 == nil then nil else getSpanConfigAt(p3, Entry1)
					})
				end
			end
		end
		return List1, v1
	end,
	cellsEqual = function(List, p4): boolean
		-- upvalues: TutilsModule (copy)
		if List == p4 then
			return true
		end
		if List == nil or p4 == nil then
			return false
		end
		if #List ~= #p4 then
			return false
		end
		for i, value in List do
			if not TutilsModule.shallowEqual(value, p4[i]) then
				return false
			end
		end
		return true
	end
}