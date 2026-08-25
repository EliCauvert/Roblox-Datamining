local parent = script:FindFirstAncestor("GameCollections").Parent
local _ = require(parent.DiscoveryTypes)
local reportWarning = require(parent.DiscoveryAnalytics).Points.reportWarning
local loggingProtocolModule = require(parent.LoggingProtocol)

local function removeFromAvailableCells(p0, p1, p2)
	for i = 1, #p0 do
		local var6 = p0[i]
		
		if var6.X ~= p1 or var6.Y ~= p2 then
			continue
		end
		table.remove(p0, i)
		
		return
	end
end

local function _(p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: removeFromAvailableCells (ref)
	p3[p5] = p3[p5] or {}
	p3[p5][p4] = p6
	local maxValue = math.max(p7, p5)
	local maxValue_1 = math.max(p8, p4)
	
	if p9 then
		removeFromAvailableCells(p9, p4, p5)
	end
	return maxValue, maxValue_1
end

local _ = function(p10, p11, p12)
	return if p10[p12] then p10[p12][p11] ~= nil else false
end

local function canInsertItem(p13, p14, p15, p16, p17, p18)
	if p18 < p14 + p16 - 1 then
		return false
	end
	for i_1 = 0, p17 - 1 do
		for i = 0, p16 - 1 do
			local var11
			local var9 = p14 + i
			local var10 = p15 + i_1
			
			if p13[var10] then
				var11 = p13[var10][var9] ~= nil
				var11 = nil
			else
				var11 = false
			end
			if not var11 then
				continue
			end
			return false
		end
	end
	return true
end

local function markItemCells(p19, p20, p21, p22, p23, p24, p25, p26, p27)
	-- upvalues: removeFromAvailableCells (ref)
	p19[p21] = p19[p21] or {}
	p19[p21][p20] = p22
	local maxValue = math.max(p25, p21)
	local maxValue_1 = math.max(p26, p20)
	
	if p27 then
		removeFromAvailableCells(p27, p20, p21)
	end
	var14 = maxValue
	var15 = maxValue_1
	
	for i_1 = 0, p24 - 1 do
		for i = 0, p23 - 1 do
			if i == 0 and i_1 == 0 then
				continue
			end
			local var16 = p20 + i
			local var17 = p21 + i_1
			p19[var17] = p19[var17] or {}
			p19[var17][var16] = -1
			local maxValue_2 = math.max(var14, var17)
			local maxValue_3 = math.max(var15, var16)
			
			if p27 then
				removeFromAvailableCells(p27, var16, var17)
			end
			var14 = maxValue_2
			var15 = maxValue_3
		end
	end
	return var14, var15
end

local function findPinnedInsertionPointAndMarkOccupiedItem(p28, p29, p30, p31, p32, p33, p34, p35, p36, p37, p38)
	-- upvalues: reportWarning (ref), loggingProtocolModule (ref), canInsertItem (ref), markItemCells (ref)
	p37 = p37 or 1
	
	if p32 < p30 then
		reportWarning(loggingProtocolModule.default, "InvalidGrid", `Item {p29} has colSpan {p30} greater than itemsPerRow {p32}`)
		
		return p33, p34, nil
	elseif p36 < 1 or p32 < p36 + p30 - 1 then
		reportWarning(loggingProtocolModule.default, "InvalidGrid", `Item {p29} cannot be pinned at column {p36} with colSpan {p30} in grid with {p32} columns`)
		
		return p33, p34, nil
	end
	while p37 <= p38 do
		if p35.lastRow < p37 then
			local lastRow = p35.lastRow
			p35.lastRow = p37
			
			for i = lastRow * p32 + 1, p37 * p32 do
				table.insert(p35.availableCells, Vector2.new((i - 1) % p32 + 1, math.floor((i - 1) / p32) + 1))
			end
		end
		if not canInsertItem(p28, p36, p37, p30, p31, p32) then
			p37 += 1
			continue
		end
		local var21, var22 = markItemCells(p28, p36, p37, p29, p30, p31, p33, p34, p35.availableCells)
		p33 = var21
		p34 = var22
		
		return p33, p34, p37
	end
	reportWarning(loggingProtocolModule.default, "InvalidGrid", `Item {p29} at column {p36} with colSpan {p30} could not be placed within allowed rows`)
	
	return p33, p34, nil
end

local function findInsertionPointAndMarkOccupiedItem(p39, p40, p41, p42, p43, p44, p45, p46)
	-- upvalues: reportWarning (ref), loggingProtocolModule (ref), canInsertItem (ref), markItemCells (ref)
	if p43 < p41 then
		reportWarning(loggingProtocolModule.default, "InvalidGrid", `Item {p40} has colSpan {p41} greater than itemsPerRow {p43}`)
		
		return p44, p45
	elseif p46.lastRow < p44 + 1 then
		local lastRow = p46.lastRow
		local var23 = p44 + 1
		p46.lastRow = var23
		
		for i = lastRow * p43 + 1, var23 * p43 do
			table.insert(p46.availableCells, Vector2.new((i - 1) % p43 + 1, math.floor((i - 1) / p43) + 1))
		end
	end
	local var24 = 1
	while var24 <= #p46.availableCells do
		local var25 = p46.availableCells[var24]
		local x = var25.X
		local y = var25.Y
		
		if not canInsertItem(p39, x, y, p41, p42, p43) then
			var24 += 1
			continue
		end
		local var26, var27 = markItemCells(p39, x, y, p40, p41, p42, p44, p45, p46.availableCells)
		p44 = var26
		p45 = var27
		
		return p44, p45
	end
	return p44, p45
end

return function(p47, p48, p49)
	-- upvalues: findPinnedInsertionPointAndMarkOccupiedItem (ref), findInsertionPointAndMarkOccupiedItem (ref)
	if not p48 or p48 <= 0 then
		return { totalRows = 0, totalCols = 0, layout = {} }
	end
	local t = {}
	local var29 = 0
	local var30 = 0
	local t_1 = { lastRow = 0, availableCells = {} }
	local var32 = false
	local var33 = 1
	local var34 = 0
	
	for i = 1, p47 do
		local var35 = p49 and p49[i]
		var34 += (if var35 then var35.colSpan else 1) * (if var35 then var35.rowSpan else 1)
	end
	local ceiled = math.ceil(var34 / p48)
	local var37 = if var34 % p48 == 0 then ceiled else math.max(1, ceiled - 1)
	
	for i_1 = 1, p47 do
		local colSpan = p49 and (p49[i_1] and (p49[i_1].colSpan or 1))
		local rowSpan = p49 and (p49[i_1] and (p49[i_1].rowSpan or 1))
		local alignmentType = p49 and (p49[i_1] and (p49[i_1].alignmentType or nil))
		local minRowPadding = p49 and (p49[i_1] and (p49[i_1].minRowPadding or 0))
		
		if colSpan ~= 1 or rowSpan ~= 1 or alignmentType then
			var32 = true
		end
		if not var32 then
			local var52 = (i_1 - 1) % p48 + 1
			local var53 = math.floor((i_1 - 1) / p48) + 1
			t[var53] = t[var53] or {}
			t[var53][var52] = i_1
			var29 = math.max(var29, var53)
			var30 = math.max(var30, var52)
		elseif alignmentType == "RightPin" then
			local _ = nil
			local var42, var43, var44 = findPinnedInsertionPointAndMarkOccupiedItem(t, i_1, colSpan, rowSpan, p48, var29, var30, t_1, p48 - colSpan + 1, var33, var37)
			var29 = var42
			var30 = var43
			local var45 = var44
			
			if var45 and minRowPadding and minRowPadding > 0 then
				var33 = var45 + minRowPadding
			end
		elseif alignmentType == "LeftPin" then
			local _ = nil
			local var46, var47, var48 = findPinnedInsertionPointAndMarkOccupiedItem(t, i_1, colSpan, rowSpan, p48, var29, var30, t_1, 1, var33, ceiled)
			var29 = var46
			var30 = var47
			local var49 = var48
			
			if var49 and minRowPadding and minRowPadding > 0 then
				var33 = var49 + minRowPadding
			end
		else
			local var50, var51 = findInsertionPointAndMarkOccupiedItem(t, i_1, colSpan, rowSpan, p48, var29, var30, t_1)
			var29 = var50
			var30 = var51
		end
	end
	return { layout = t, totalRows = var29, totalCols = var30 }
end