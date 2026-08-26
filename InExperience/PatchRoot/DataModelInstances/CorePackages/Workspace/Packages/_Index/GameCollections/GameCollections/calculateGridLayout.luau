local parent = script:FindFirstAncestor("GameCollections").Parent
local _ = require(parent.DiscoveryTypes)
local reportWarning = require(parent.DiscoveryAnalytics).Points.reportWarning
local loggingProtocolModule = require(parent.LoggingProtocol)

local function removeFromAvailableCells(p1, p2, p3)
	for i = 1, #p1 do
		local var1 = p1[i]
		
		if var1.X ~= p2 or var1.Y ~= p3 then
			continue
		end
		table.remove(p1, i)
		
		return
	end
end

local function _(p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: removeFromAvailableCells (ref)
	p4[p6] = p4[p6] or {}
	p4[p6][p5] = p7
	local maxValue = math.max(p8, p6)
	local maxValue_1 = math.max(p9, p5)
	
	if p10 then
		removeFromAvailableCells(p10, p5, p6)
	end
	return maxValue, maxValue_1
end

local _ = function(p4, p5, p6)
	return if p4[p6] then p4[p6][p5] ~= nil else false
end

local function canInsertItem(p4, p5, p6, p7, p8, p9)
	if p9 < p5 + p7 - 1 then
		return false
	end
	for i_1 = 0, p8 - 1 do
		for i = 0, p7 - 1 do
			local var2
			local var3 = p5 + i
			local var4 = p6 + i_1
			
			if p4[var4] then
				var2 = p4[var4][var3] ~= nil
				var2 = nil
			else
				var2 = false
			end
			if not var2 then
				continue
			end
			return false
		end
	end
	return true
end

local function markItemCells(p10, p11, p12, p13, p14, p15, p16, p17, p18)
	-- upvalues: removeFromAvailableCells (ref)
	p10[p12] = p10[p12] or {}
	p10[p12][p11] = p13
	local maxValue = math.max(p16, p12)
	local maxValue_1 = math.max(p17, p11)
	
	if p18 then
		removeFromAvailableCells(p18, p11, p12)
	end
	var14 = maxValue
	var15 = maxValue_1
	
	for i_1 = 0, p15 - 1 do
		for i = 0, p14 - 1 do
			if i == 0 and i_1 == 0 then
				continue
			end
			local var5 = p11 + i
			local var6 = p12 + i_1
			p10[var6] = p10[var6] or {}
			p10[var6][var5] = -1
			local maxValue_2 = math.max(var14, var6)
			local maxValue_3 = math.max(var15, var5)
			
			if p18 then
				removeFromAvailableCells(p18, var5, var6)
			end
			var14 = maxValue_2
			var15 = maxValue_3
		end
	end
	return var14, var15
end

local function findPinnedInsertionPointAndMarkOccupiedItem(p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29)
	-- upvalues: reportWarning (ref), loggingProtocolModule (ref), canInsertItem (ref), markItemCells (ref)
	p28 = p28 or 1
	
	if p23 < p21 then
		reportWarning(loggingProtocolModule.default, "InvalidGrid", `Item {p20} has colSpan {p21} greater than itemsPerRow {p23}`)
		
		return p24, p25, nil
	elseif p27 < 1 or p23 < p27 + p21 - 1 then
		reportWarning(loggingProtocolModule.default, "InvalidGrid", `Item {p20} cannot be pinned at column {p27} with colSpan {p21} in grid with {p23} columns`)
		
		return p24, p25, nil
	end
	while p28 <= p29 do
		if p26.lastRow < p28 then
			local lastRow = p26.lastRow
			p26.lastRow = p28
			
			for i = lastRow * p23 + 1, p28 * p23 do
				table.insert(p26.availableCells, Vector2.new((i - 1) % p23 + 1, math.floor((i - 1) / p23) + 1))
			end
		end
		if not canInsertItem(p19, p27, p28, p21, p22, p23) then
			p28 += 1
			continue
		end
		local var7, var8 = markItemCells(p19, p27, p28, p20, p21, p22, p24, p25, p26.availableCells)
		p24 = var7
		p25 = var8
		
		return p24, p25, p28
	end
	reportWarning(loggingProtocolModule.default, "InvalidGrid", `Item {p20} at column {p27} with colSpan {p21} could not be placed within allowed rows`)
	
	return p24, p25, nil
end

local function findInsertionPointAndMarkOccupiedItem(p30, p31, p32, p33, p34, p35, p36, p37)
	-- upvalues: reportWarning (ref), loggingProtocolModule (ref), canInsertItem (ref), markItemCells (ref)
	if p34 < p32 then
		reportWarning(loggingProtocolModule.default, "InvalidGrid", `Item {p31} has colSpan {p32} greater than itemsPerRow {p34}`)
		
		return p35, p36
	elseif p37.lastRow < p35 + 1 then
		local lastRow = p37.lastRow
		local var9 = p35 + 1
		p37.lastRow = var9
		
		for i = lastRow * p34 + 1, var9 * p34 do
			table.insert(p37.availableCells, Vector2.new((i - 1) % p34 + 1, math.floor((i - 1) / p34) + 1))
		end
	end
	local var10 = 1
	while var10 <= #p37.availableCells do
		local var11 = p37.availableCells[var10]
		local x = var11.X
		local y = var11.Y
		
		if not canInsertItem(p30, x, y, p32, p33, p34) then
			var10 += 1
			continue
		end
		local var12, var13 = markItemCells(p30, x, y, p31, p32, p33, p35, p36, p37.availableCells)
		p35 = var12
		p36 = var13
		
		return p35, p36
	end
	return p35, p36
end

return function(p38, p39, p40)
	-- upvalues: findPinnedInsertionPointAndMarkOccupiedItem (ref), findInsertionPointAndMarkOccupiedItem (ref)
	if not p39 or p39 <= 0 then
		return { totalRows = 0, totalCols = 0, layout = {} }
	end
	local t = {}
	local var14 = 0
	local var15 = 0
	local t_1 = { lastRow = 0, availableCells = {} }
	local var16 = false
	local var17 = 1
	local var18 = 0
	
	for i = 1, p38 do
		local var19 = p40 and p40[i]
		var18 += (if var19 then var19.colSpan else 1) * (if var19 then var19.rowSpan else 1)
	end
	local ceiled = math.ceil(var18 / p39)
	local var20 = if var18 % p39 == 0 then ceiled else math.max(1, ceiled - 1)
	
	for i_1 = 1, p38 do
		local colSpan = p40 and (p40[i_1] and (p40[i_1].colSpan or 1))
		local rowSpan = p40 and (p40[i_1] and (p40[i_1].rowSpan or 1))
		local alignmentType = p40 and (p40[i_1] and (p40[i_1].alignmentType or nil))
		local minRowPadding = p40 and (p40[i_1] and (p40[i_1].minRowPadding or 0))
		
		if colSpan ~= 1 or rowSpan ~= 1 or alignmentType then
			var16 = true
		end
		if not var16 then
			local var21 = (i_1 - 1) % p39 + 1
			local var22 = math.floor((i_1 - 1) / p39) + 1
			t[var22] = t[var22] or {}
			t[var22][var21] = i_1
			var14 = math.max(var14, var22)
			var15 = math.max(var15, var21)
		elseif alignmentType == "RightPin" then
			local _ = nil
			local var23, var24, var25 = findPinnedInsertionPointAndMarkOccupiedItem(t, i_1, colSpan, rowSpan, p39, var14, var15, t_1, p39 - colSpan + 1, var17, var20)
			var14 = var23
			var15 = var24
			local var26 = var25
			
			if var26 and minRowPadding and minRowPadding > 0 then
				var17 = var26 + minRowPadding
			end
		elseif alignmentType == "LeftPin" then
			local _ = nil
			local var27, var28, var29 = findPinnedInsertionPointAndMarkOccupiedItem(t, i_1, colSpan, rowSpan, p39, var14, var15, t_1, 1, var17, ceiled)
			var14 = var27
			var15 = var28
			local var30 = var29
			
			if var30 and minRowPadding and minRowPadding > 0 then
				var17 = var30 + minRowPadding
			end
		else
			local var31, var32 = findInsertionPointAndMarkOccupiedItem(t, i_1, colSpan, rowSpan, p39, var14, var15, t_1)
			var14 = var31
			var15 = var32
		end
	end
	return { layout = t, totalRows = var14, totalCols = var15 }
end