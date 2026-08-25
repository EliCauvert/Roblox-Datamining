local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(parent.CollectionViews)
local tutilsModule = require(parent.tutils)
local _ = require(sduiCoreSystem.ClientBinding.SduiPoolStoreTypes)
local frozen = table.freeze({})

local function getSpanConfigAt(p0, p1)
	local var4 = p0[p1]
	
	if var4 == nil then
		return nil
	end
	local colSpan = var4.colSpan or 1
	local rowSpan = var4.rowSpan or 1
	local alignmentType = var4.alignmentType
	local minRowPadding = var4.minRowPadding or 0
	
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
	makePoolGetSpanConfig = function(p2)
		-- upvalues: getSpanConfigAt (ref)
		return function(_, p3)
			-- upvalues: getSpanConfigAt (copy), p2 (ref)
			return getSpanConfigAt(p2, p3)
		end
	end,
	layoutToCells = function(p4, p5, p6, p7)
		-- upvalues: frozen (ref), getSpanConfigAt (ref)
		if p4 == nil then
			return frozen, 0
		end
		local var8 = 0
		
		for i in p4 do
			if var8 < i then
				var8 = i
			end
		end
		if var8 == 0 then
			return frozen, 0
		end
		local t = {}
		
		for i_2 = 1, var8 do
			local var10 = p4[i_2] or {}
			
			for i_1 = 1, p5 do
				local var11 = var10[i_1]
				
				if var11 == nil or var11 <= 0 then
					table.insert(t, {})
				else
					table.insert(t, {
						item = p6[var11],
						realIndex = var11,
						spanOverride = if p7 ~= nil then nil else getSpanConfigAt(p7, var11)
					})
				end
			end
		end
		return t, var8
	end,
	cellsEqual = function(p8, p9)
		-- upvalues: tutilsModule (ref)
		if p8 == p9 then
			return true
		elseif p8 == nil or p9 == nil then
			return false
		elseif #p8 ~= #p9 then
			return false
		end
		for i, v in p8 do
			if not tutilsModule.shallowEqual(v, p9[i]) then
				return false
			end
		end
		return true
	end
}