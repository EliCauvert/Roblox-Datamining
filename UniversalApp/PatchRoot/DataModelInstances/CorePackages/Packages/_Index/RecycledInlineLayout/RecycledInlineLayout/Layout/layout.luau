local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local _ = require(RecycledInlineLayout.Types)
local _ = require(RecycledInlineLayout.Layout.flatten)
local MergeModule = require(RecycledInlineLayout.Layout.merge)

local function _(p1, p2, p3)
	local Definition = p1.definition
	
	if Definition.split == nil and p3.reportedSize ~= nil then
		local ReportedSizeResult = p3.reportedSize(p1.key, p2)
		
		if ReportedSizeResult ~= nil then
			return ReportedSizeResult
		end
	end
	return Definition.measure(p2, p3)
end

local function closeRow(p1, p2)
	local NewX = 0
	
	for _, value in p1.pending do
		NewX += value.size.X
	end
	p1.rawWidth = NewX
	local PendingEntry = p1.pending[#p1.pending]
	repeat
		if PendingEntry == nil or PendingEntry.leaf.definition.trimEnd == nil then break end
		local TrimEndResult = PendingEntry.leaf.definition.trimEnd(PendingEntry.props)
		
		if TrimEndResult == PendingEntry.props then break end
		PendingEntry.props = TrimEndResult
		local Leaf = PendingEntry.leaf
		local Definition = Leaf.definition
		local MeasureResult = nil
		repeat
			if Definition.split == nil and p2.reportedSize ~= nil then
				local ReportedSizeResult = p2.reportedSize(Leaf.key, TrimEndResult)
				
				if ReportedSizeResult ~= nil then
					MeasureResult = ReportedSizeResult
					break
				end
			end
			MeasureResult = Definition.measure(TrimEndResult, p2)
		until true
		PendingEntry.size = MeasureResult
	until true
	local NewX1 = 0
	local Largest = 0
	
	for _, value1 in p1.pending do
		NewX1 += value1.size.X
		Largest = math.max(Largest, value1.size.Y)
	end
	p1.width = NewX1
	p1.height = Largest
end

local _ = function(HorizontalAlignment, p3, p4)
	return if HorizontalAlignment == Enum.HorizontalAlignment.Center then (p3 - p4) / 2 elseif HorizontalAlignment == Enum.HorizontalAlignment.Right then p3 - p4 else 0
end

local function breakIntoRows(Leafs, Total, p3)
	-- upvalues: closeRow (copy)
	local List = {}
	local config = { width = 0, height = 0, rawWidth = 0, pending = {} }
	local Wrapped = false
	local Total1 = Total
	local v1 = false
	local Count = 0
	local v2 = #Leafs * 16 + 1000
	
	local function flushRow(p4)
		-- upvalues: closeRow (upval), config (ref), p3 (copy), List (copy), Total1 (ref), Total (copy), v1 (ref), Wrapped (ref)
		closeRow(config, p3)
		table.insert(List, config)
		config = { width = 0, height = 0, rawWidth = 0, pending = {} }
		Total1 = Total
		v1 = p4
		Wrapped = Wrapped or p4
	end
	
	local function _(Leaf, Props, Size, Index)
		-- upvalues: config (ref), Total1 (ref)
		table.insert(config.pending, { leaf = Leaf, props = Props, size = Size, index = Index })
		Total1 -= Size.X
	end
	local Index = nil
	local ReportedSizeResult = nil
	local ReportedSizeResult1 = nil
	local Props1 = nil
	
	for _, leaf in Leafs do
		if leaf.type == "HardBreak" then
			flushRow(false)
		else
			local Definition = leaf.definition
			local Props = leaf.props
			Index = 0
			while Props ~= nil and Count < v2 do
				Count += 1
				
				if #config.pending == 0 and v1 and Definition.trimStart ~= nil then
					Props = Definition.trimStart(Props)
					
					if Props == nil then break end
				end
				Props1 = Props
				local Definition1 = leaf.definition
				local MeasureResult = nil
				repeat
					if Definition1.split == nil and p3.reportedSize ~= nil then
						ReportedSizeResult = p3.reportedSize(leaf.key, Props1)
						
						if ReportedSizeResult ~= nil then
							MeasureResult = ReportedSizeResult
							break
						end
					end
					MeasureResult = Definition1.measure(Props1, p3)
				until true
				if MeasureResult.X <= Total1 then
					table.insert(config.pending, {
						leaf = leaf,
						props = Props1,
						size = MeasureResult,
						index = Index + 1
					})
					Total1 -= MeasureResult.X
					break
				end
				local NoSplit = Definition.split == nil
				local MeasureResult1 = nil
				local SplitResult = nil
				local SplitResult2 = nil
				
				if not NoSplit then
					SplitResult, SplitResult2 = Definition.split(Props1, Total1, false, p3)
					MeasureResult1 = Definition.measure(SplitResult, p3)
					NoSplit = SplitResult2 == nil or MeasureResult1.X > Total1
				end
				if NoSplit then
					repeat
						if #config.pending ~= 0 then break end
						local Props2 = Props1
						local v3 = nil
						
						if Definition.split ~= nil and Definition.canForceSplit then
							Props2, v40 = Definition.split(Props1, Total1, true, p3)
						end
						Index += 1
						local Definition2 = leaf.definition
						local MeasureResult2 = nil
						repeat
							if Definition2.split == nil and p3.reportedSize ~= nil then
								ReportedSizeResult1 = p3.reportedSize(leaf.key, Props2)
								
								if ReportedSizeResult1 ~= nil then
									MeasureResult2 = ReportedSizeResult1
									break
								end
							end
							MeasureResult2 = Definition2.measure(Props2, p3)
						until true
						table.insert(config.pending, {
							leaf = leaf,
							props = Props2,
							size = MeasureResult2,
							index = Index
						})
						Total1 -= MeasureResult2.X
						Props = v3
					until true
					flushRow(true)
				else
					Index += 1
					table.insert(config.pending, {
						leaf = leaf,
						props = SplitResult,
						size = MeasureResult1,
						index = Index
					})
					Total1 -= MeasureResult1.X
					Props = SplitResult2
					flushRow(true)
				end
			end
		end
	end
	if #config.pending > 0 then
		closeRow(config, p3)
		table.insert(List, config)
	end
	return { rows = List, wrapped = Wrapped }
end

return function(p4, p5: number, p6, p7)
	-- upvalues: breakIntoRows (copy), MergeModule (copy)
	local HorizontalAlignment = p6.HorizontalAlignment or Enum.HorizontalAlignment.Left
	local VerticalPadding = p6.VerticalPadding or 0
	local BreakIntoRowsResult = if p5 > 0 then breakIntoRows(p4, p5, p7) else { wrapped = false, rows = {} }
	local Rows = BreakIntoRowsResult.rows
	
	if p6.mergeText then
		for _, row in Rows do
			row.pending = MergeModule(row.pending, p7)
			local NewX = 0
			
			for _, value in row.pending do
				NewX += value.size.X
			end
			row.width = NewX
		end
	end
	local Largest = 0
	local Largest1 = 0
	
	for _, row2 in Rows do
		Largest = math.max(Largest, row2.width)
		Largest1 = math.max(Largest1, row2.rawWidth)
	end
	local Largest2: number = if p6.fitContent then Largest else p5
	local Fragments = {}
	local t = {}
	local Keys = {}
	local Y = 0
	
	for i1, row3 in Rows do
		if i1 > 1 then
			Y += VerticalPadding
		end
		local Width: number = row3.width
		local X: number = if HorizontalAlignment == Enum.HorizontalAlignment.Center then (Largest2 - Width) / 2 elseif HorizontalAlignment == Enum.HorizontalAlignment.Right then Largest2 - Width else 0
		local t1 = {}
		local List = {}
		
		for _, value1 in row3.pending do
			table.insert(Fragments, {
				key = `{value1.leaf.key}#{value1.index}`,
				leafKey = value1.leaf.key,
				definition = value1.leaf.definition,
				props = value1.props,
				spans = value1.leaf.spans,
				position = Vector2.new(X, Y + (row3.height - value1.size.Y) / 2),
				size = value1.size
			})
			local XRatio = if value1.members then value1.size.X / math.max(value1.membersWidth or 1, 1) else 1
			local MinX: number = X
			
			for _, value2 in value1.members or { value1 } do
				local ScaledX = value2.size.X * XRatio
				
				for _, span in value2.leaf.spans do
					if span.definition.decoration ~= nil then
						local Entry2 = t1[span.key]
						
						if Entry2 == nil then
							t1[span.key] = { minX = MinX, maxX = MinX + ScaledX }
							table.insert(List, span)
						else
							Entry2.maxX = MinX + ScaledX
						end
					end
				end
				MinX += ScaledX
			end
			X += value1.size.X
		end
		for _, Span in List do
			local Entry = t1[Span.key]
			local Entry1 = t[Span.key]
			
			if Entry1 == nil then
				Entry1 = { span = Span, rows = {} }
				t[Span.key] = Entry1
				table.insert(Keys, Span.key)
			end
			table.insert(Entry1.rows, {
				position = Vector2.new(Entry.minX, Y),
				size = Vector2.new(Entry.maxX - Entry.minX, row3.height)
			})
		end
		Y += row3.height
	end
	local Decorations = {}
	
	for _, key in Keys do
		local Entry = t[key]
		local Decoration = Entry.span.definition.decoration
		local Smallest = 1e999
		local Smallest1 = 1e999
		local Largest3 = -1e999
		local Largest4 = -1e999
		
		for _, row4 in Entry.rows do
			Smallest = math.min(Smallest, row4.position.X)
			Smallest1 = math.min(Smallest1, row4.position.Y)
			Largest3 = math.max(Largest3, row4.position.X + row4.size.X)
			Largest4 = math.max(Largest4, row4.position.Y + row4.size.Y)
		end
		local _Vector2 = Vector2.new(Smallest, Smallest1)
		local Buffer = table.create(#Entry.rows)
		
		for i, row1 in Entry.rows do
			Buffer[i] = { position = row1.position - _Vector2, size = row1.size }
		end
		table.insert(Decorations, {
			key = key,
			span = Entry.span,
			definition = Decoration,
			position = _Vector2,
			size = Vector2.new(Largest3 - Smallest, Largest4 - Smallest1),
			rows = Buffer
		})
	end
	return {
		fragments = Fragments,
		decorations = Decorations,
		height = Y,
		contentWidth = Largest,
		wrapped = BreakIntoRowsResult.wrapped,
		naturalWidth = Largest1
	}
end