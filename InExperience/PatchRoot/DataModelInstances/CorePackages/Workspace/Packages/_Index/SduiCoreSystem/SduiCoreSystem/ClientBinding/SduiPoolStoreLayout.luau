local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(parent.CollectionViews)
local tutilsModule = require(parent.tutils)
local _ = require(sduiCoreSystem.ClientBinding.SduiPoolStoreTypes)
local frozen = table.freeze({})

local function getSpanConfigAt(p1, p2)
	local var1 = p1[p2]
	
	if var1 == nil then
		return nil
	end
	local colSpan = var1.colSpan or 1
	local rowSpan = var1.rowSpan or 1
	local alignmentType = var1.alignmentType
	local minRowPadding = var1.minRowPadding or 0
	
	return if colSpan == 1 and rowSpan == 1 and (alignmentType == nil and minRowPadding == 0) then nil else {
		colSpan = colSpan,
		rowSpan = rowSpan,
		alignmentType = alignmentType,
		minRowPadding = minRowPadding
	}
end

return {
	EMPTY_CELLS = frozen,
	getSpanConfigAt = getSpanConfigAt,
	makePoolGetSpanConfig = function(p1)
		-- upvalues: getSpanConfigAt (ref)
		return function(_, p2)
			-- upvalues: getSpanConfigAt (copy), p1 (ref)
			return getSpanConfigAt(p1, p2)
		end
	end,
	layoutToCells = function(p1, p2, p3, p4)
		-- upvalues: frozen (ref), getSpanConfigAt (ref)
		if p1 == nil then
			return frozen, 0
		end
		local var1 = 0
		
		for i in p1 do
			if var1 < i then
				var1 = i
			end
		end
		if var1 == 0 then
			return frozen, 0
		end
		local t = {}
		
		for i_2 = 1, var1 do
			local var2 = p1[i_2] or {}
			
			for i_1 = 1, p2 do
				local var3 = var2[i_1]
				
				if var3 == nil or var3 <= 0 then
					table.insert(t, {})
				else
					table.insert(t, {
						item = p3[var3],
						realIndex = var3,
						spanOverride = if p4 ~= nil then nil else getSpanConfigAt(p4, var3)
					})
				end
			end
		end
		return t, var1
	end,
	cellsEqual = function(p5, p6)
		-- upvalues: tutilsModule (ref)
		if p5 == p6 then
			return true
		elseif p5 == nil or p6 == nil then
			return false
		elseif #p5 ~= #p6 then
			return false
		end
		for i, v in p5 do
			if not tutilsModule.shallowEqual(v, p6[i]) then
				return false
			end
		end
		return true
	end
}