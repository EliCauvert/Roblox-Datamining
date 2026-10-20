local Parent = script:FindFirstAncestor("GameCollections").Parent
local _ = require(Parent.DiscoveryTypes)
local ReportWarningFunction = require(Parent.DiscoveryAnalytics).Points.reportWarning
local LoggingProtocolModule = require(Parent.LoggingProtocol)

local function removeFromAvailableCells(List, X, Key)
	for i = 1, #List do
		local Entry = List[i]
		
		if Entry.X == X and Entry.Y == Key then
			table.remove(List, i)
			break
		end
	end
end

local function _(p1, p2: number, Key: number, p3, p4: number, p5: number, p6)
	-- upvalues: removeFromAvailableCells (copy)
	p1[Key] = p1[Key] or {}
	p1[Key][p2] = p3
	local Largest = math.max(p4, Key)
	local Largest1 = math.max(p5, p2)
	
	if p6 then
		removeFromAvailableCells(p6, p2, Key)
	end
	return Largest, Largest1
end

local _ = function(p1, p2, p3): boolean
	return if p1[p3] then p1[p3][p2] ~= nil else false
end

local function canInsertItem(p1, X: number, LastRow: number, p2: number, p3: number, p4): boolean
	if p4 < X + p2 - 1 then
		return false
	end
	for i = 0, p3 - 1 do
		for i1 = 0, p2 - 1 do
			local NewX = X + i1
			local NewLastRow = LastRow + i
			
			if if p1[NewLastRow] then p1[NewLastRow][NewX] ~= nil else false then
				return false
			end
		end
	end
	return true
end

local function markItemCells(p5, X: number, LastRow: number, p6, p7: number, p8: number, p9: number, p10: number, AvailableCells)
	-- upvalues: removeFromAvailableCells (copy)
	p5[LastRow] = p5[LastRow] or {}
	p5[LastRow][X] = p6
	local Largest = math.max(p9, LastRow)
	local Largest1 = math.max(p10, X)
	
	if AvailableCells then
		removeFromAvailableCells(AvailableCells, X, LastRow)
	end
	local Largest2: number = Largest
	local Largest3: number = Largest1
	
	for i = 0, p8 - 1 do
		for i1 = 0, p7 - 1 do
			if i1 ~= 0 or i ~= 0 then
				local NewX = X + i1
				local NewLastRow = LastRow + i
				p5[NewLastRow] = p5[NewLastRow] or {}
				p5[NewLastRow][NewX] = -1
				local Largest31 = math.max(Largest2, NewLastRow)
				local Largest4 = math.max(Largest3, NewX)
				
				if AvailableCells then
					removeFromAvailableCells(AvailableCells, NewX, NewLastRow)
				end
				Largest2 = Largest31
				Largest3 = Largest4
			end
		end
	end
	return Largest2, Largest3
end

local function findPinnedInsertionPointAndMarkOccupiedItem(Layout, p11, ColSpan: number, RowSpan, p12: number, Largest, Largest1, p13, p14: number, p15, Ceiled)
	-- upvalues: ReportWarningFunction (copy), LoggingProtocolModule (copy), canInsertItem (copy), markItemCells (copy)
	local P36 = p15 or 1
	
	if p12 < ColSpan then
		ReportWarningFunction(LoggingProtocolModule.default, "InvalidGrid", `Item {p11} has colSpan {ColSpan} greater than itemsPerRow {p12}`)
		
		return Largest, Largest1, nil
	end
	if p14 < 1 or p12 < p14 + ColSpan - 1 then
		ReportWarningFunction(LoggingProtocolModule.default, "InvalidGrid", `Item {p11} cannot be pinned at column {p14} with colSpan {ColSpan} in grid with {p12} columns`)
		
		return Largest, Largest1, nil
	end
	while P36 <= Ceiled do
		if p13.lastRow < P36 then
			p13.lastRow = P36
			
			for i = p13.lastRow * p12 + 1, P36 * p12 do
				table.insert(p13.availableCells, Vector2.new((i - 1) % p12 + 1, math.floor((i - 1) / p12) + 1))
			end
		end
		if canInsertItem(Layout, p14, P36, ColSpan, RowSpan, p12) then
			Largest, Largest1 = markItemCells(Layout, p14, P36, p11, ColSpan, RowSpan, Largest, Largest1, p13.availableCells)
			
			return Largest, Largest1, P36
		end
		P36 += 1
	end
	ReportWarningFunction(LoggingProtocolModule.default, "InvalidGrid", `Item {p11} at column {p14} with colSpan {ColSpan} could not be placed within allowed rows`)
	
	return Largest, Largest1, nil
end

local function findInsertionPointAndMarkOccupiedItem(Layout, p16, ColSpan, RowSpan, p17: number, Largest: number, Largest1, p18)
	-- upvalues: ReportWarningFunction (copy), LoggingProtocolModule (copy), canInsertItem (copy), markItemCells (copy)
	if p17 < ColSpan then
		ReportWarningFunction(LoggingProtocolModule.default, "InvalidGrid", `Item {p16} has colSpan {ColSpan} greater than itemsPerRow {p17}`)
		
		return Largest, Largest1
	end
	if p18.lastRow < Largest + 1 then
		local NewLargest = Largest + 1
		p18.lastRow = NewLargest
		
		for i = p18.lastRow * p17 + 1, NewLargest * p17 do
			table.insert(p18.availableCells, Vector2.new((i - 1) % p17 + 1, math.floor((i - 1) / p17) + 1))
		end
	end
	local Count = 1
	local X = nil
	local Y = nil
	while Count <= #p18.availableCells do
		local AvailableCell = p18.availableCells[Count]
		X = AvailableCell.X
		Y = AvailableCell.Y
		
		if canInsertItem(Layout, X, Y, ColSpan, RowSpan, p17) then
			Largest, Largest1 = markItemCells(Layout, X, Y, p16, ColSpan, RowSpan, Largest, Largest1, p18.availableCells)
			
			return Largest, Largest1
		end
		Count += 1
	end
	return Largest, Largest1
end

return function(p19, p20: number, p21)
	-- upvalues: findPinnedInsertionPointAndMarkOccupiedItem (copy), findInsertionPointAndMarkOccupiedItem (copy)
	if not p20 or p20 <= 0 then
		return { totalRows = 0, totalCols = 0, layout = {} }
	end
	local Layout = {}
	local Largest = 0
	local Largest1 = 0
	local config = { lastRow = 0, availableCells = {} }
	local Flag = false
	local v1 = 1
	local Total = 0
	
	for i = 1, p19 do
		local v2 = p21 and p21[i]
		Total += (v2 and v2.colSpan or 1) * (v2 and v2.rowSpan or 1)
	end
	local Ceiled = math.ceil(Total / p20)
	local Ceiled1: number = if Total % p20 == 0 then Ceiled else math.max(1, Ceiled - 1)
	for i1 = 1, p19 do
		local ColSpan = p21 and p21[i1] and p21[i1].colSpan or 1
		local RowSpan = p21 and p21[i1] and p21[i1].rowSpan or 1
		local AlignmentType = p21 and p21[i1] and p21[i1].alignmentType or nil
		local MinRowPadding = p21 and p21[i1] and p21[i1].minRowPadding or 0
		
		if ColSpan ~= 1 or RowSpan ~= 1 or AlignmentType then
			Flag = true
		end
		if Flag then
			if AlignmentType == "RightPin" then
				local PinnedInsertionPointAndMarkOccupiedItem3
				Largest, Largest1, PinnedInsertionPointAndMarkOccupiedItem3 = findPinnedInsertionPointAndMarkOccupiedItem(Layout, i1, ColSpan, RowSpan, p20, Largest, Largest1, config, p20 - ColSpan + 1, v1, Ceiled1)
				
				if PinnedInsertionPointAndMarkOccupiedItem3 and MinRowPadding and MinRowPadding > 0 then
					v1 = PinnedInsertionPointAndMarkOccupiedItem3 + MinRowPadding
				end
			elseif AlignmentType == "LeftPin" then
				local PinnedInsertionPointAndMarkOccupiedItem3_1
				Largest, Largest1, PinnedInsertionPointAndMarkOccupiedItem3_1 = findPinnedInsertionPointAndMarkOccupiedItem(Layout, i1, ColSpan, RowSpan, p20, Largest, Largest1, config, 1, v1, Ceiled)
				
				if PinnedInsertionPointAndMarkOccupiedItem3_1 and MinRowPadding and MinRowPadding > 0 then
					v1 = PinnedInsertionPointAndMarkOccupiedItem3_1 + MinRowPadding
				end
			else
				Largest, Largest1 = findInsertionPointAndMarkOccupiedItem(Layout, i1, ColSpan, RowSpan, p20, Largest, Largest1, config)
			end
		else
			local NewI = (i1 - 1) % p20 + 1
			local NewFloored = math.floor((i1 - 1) / p20) + 1
			Layout[NewFloored] = Layout[NewFloored] or {}
			Layout[NewFloored][NewI] = i1
			Largest = math.max(Largest, NewFloored)
			Largest1 = math.max(Largest1, NewI)
		end
	end
	return {
		layout = Layout,
		totalRows = Largest,
		totalCols = Largest1
	}
end