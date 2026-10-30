local Markdown = script:FindFirstAncestor("Markdown")
local ChildrenModule = require(script.Parent.Children)
local _ = require(Markdown.Parent.CommonMark)
local ListMarkersModule = require(script.Parent.ListMarkers)
local _ = require(script.Parent.Registry)
local RendererNodesModule = require(script.Parent.RendererNodes)
local _ = require(Markdown.Types)
local Frozen = table.freeze({})

local function _(p1)
	local Text = p1 or ""
	
	if string.sub(Text, -1) == "\n" then
		Text = string.sub(Text, 1, -2)
	end
	return string.split(Text, "\n")
end

local _ = function(List, p1)
	for i = #p1, 1, -1 do
		table.insert(List, p1[i])
	end
end

local function beginLine(p2, Removed)
	-- upvalues: RendererNodesModule (copy)
	local Out = p2._out
	local config = {
		contentStart = 0,
		entry = Removed,
		mark = #Out.children,
		startedBefore = p2._startedLine
	}
	
	if p2._startedLine then
		RendererNodesModule.append(Out, "BREAK")
		
		if Removed.separator == "paragraph" then
			RendererNodesModule.append(Out, "BREAK")
		end
	end
	p2._startedLine = true
	
	if Removed.prefix ~= nil then
		RendererNodesModule.appendText(Out, Removed.prefix)
	end
	config.contentStart = if Removed.prefix == nil then #Out.children else config.mark
	
	return config
end

local _ = function(p2, p3)
	local Children = p2._out.children
	
	if p3.contentStart < #Children then
		p2._drew[p3.entry.top] = true
		
		return
	end
	for i = #Children, p3.mark + 1, -1 do
		Children[i] = nil
	end
	p2._startedLine = p3.startedBefore
end

return {
	start = function(_units, _out, _registry, p4)
		-- upvalues: Frozen (copy)
		local _stack = {}
		local List = {}
		
		for Top, unit in _units do
			table.insert(List, {
				separator = "paragraph",
				level = 0,
				unit = unit,
				top = Top
			})
		end
		for i = #List, 1, -1 do
			table.insert(_stack, List[i])
		end
		return {
			_openLine = nil,
			_units = _units,
			_out = _out,
			_registry = _registry,
			_drop = p4 or Frozen,
			_stack = _stack,
			_startedLine = #_out.children > 0,
			_drew = {}
		}
	end,
	resume = function(p5)
		-- upvalues: beginLine (copy), RendererNodesModule (copy), ListMarkersModule (copy), ChildrenModule (copy)
		local OpenLine = p5._openLine
		
		if OpenLine ~= nil then
			p5._openLine = nil
			local Children = p5._out.children
			
			if OpenLine.contentStart < #Children then
				p5._drew[OpenLine.entry.top] = true
			else
				for i = #Children, OpenLine.mark + 1, -1 do
					Children[i] = nil
				end
				p5._startedLine = OpenLine.startedBefore
			end
		end
		local Out = p5._out
		local Stack = p5._stack
		local Removed = nil
		local Block = nil
		while #Stack > 0 do
			Removed = table.remove(Stack)
			Block = Removed.unit.block
			local Kind = if Block == nil then nil else Block.kind
			
			if Block == nil then
				p5._openLine = beginLine(p5, Removed)
				
				return Removed.unit.inlines or {}, nil
			end
			if p5._drop[Block.kind] then continue end
			if Kind == "Paragraph" or Kind == "Heading" then
				p5._openLine = beginLine(p5, Removed)
				
				return nil, Block
			end
			if Kind == "FencedCodeBlock" or Kind == "IndentedCodeBlock" then
				local BeginLineResult = beginLine(p5, Removed)
				local Literal = Block.literal or ""
				
				if string.sub(Literal, -1) == "\n" then
					Literal = string.sub(Literal, 1, -2)
				end
				for i1, value in string.split(Literal, "\n") do
					if i1 > 1 then
						RendererNodesModule.append(Out, "BREAK")
					end
					if value ~= "" then
						RendererNodesModule.appendText(Out, value)
					end
				end
				local Children = p5._out.children
				
				if BeginLineResult.contentStart < #Children then
					p5._drew[BeginLineResult.entry.top] = true
				else
					for i2 = #Children, BeginLineResult.mark + 1, -1 do
						Children[i2] = nil
					end
					p5._startedLine = BeginLineResult.startedBefore
				end
			elseif Kind == "HtmlBlock" then
				local BeginLineResult = beginLine(p5, Removed)
				local Literal = Block.literal
				
				if Literal ~= nil and Literal ~= "" then
					RendererNodesModule.appendText(Out, Literal)
				end
				local Children = p5._out.children
				
				if BeginLineResult.contentStart < #Children then
					p5._drew[BeginLineResult.entry.top] = true
				else
					for i3 = #Children, BeginLineResult.mark + 1, -1 do
						Children[i3] = nil
					end
					p5._startedLine = BeginLineResult.startedBefore
				end
			elseif Kind == "ThematicBreak" then
				local BeginLineResult = beginLine(p5, Removed)
				RendererNodesModule.appendText(Out, "---")
				local Children = p5._out.children
				
				if BeginLineResult.contentStart < #Children then
					p5._drew[BeginLineResult.entry.top] = true
				else
					for i4 = #Children, BeginLineResult.mark + 1, -1 do
						Children[i4] = nil
					end
					p5._startedLine = BeginLineResult.startedBefore
				end
			elseif Kind == "BulletList" or Kind == "OrderedList" then
				local Separator = Removed.separator
				
				if Removed.prefix ~= nil then
					local BeginLineResult = beginLine(p5, Removed)
					local Children = p5._out.children
					
					if BeginLineResult.contentStart < #Children then
						p5._drew[BeginLineResult.entry.top] = true
					else
						for i5 = #Children, BeginLineResult.mark + 1, -1 do
							Children[i5] = nil
						end
						p5._startedLine = BeginLineResult.startedBefore
					end
					Separator = "line"
				end
				local Repeated = string.rep("  ", Removed.level)
				local BulletPrefixResult = ListMarkersModule.bulletPrefix(Block)
				local StartNumberResult = ListMarkersModule.startNumber(Block)
				local List = {}
				
				for _, Unit in ChildrenModule.units(Block, p5._registry, true) do
					local Prefix: string? = nil
					
					if Unit.block ~= nil and Unit.block.kind == "ListItem" then
						if StartNumberResult == nil then
							Prefix = Repeated .. BulletPrefixResult
						else
							Prefix = `{Repeated}{ListMarkersModule.orderedPrefix(StartNumberResult)}. `
							StartNumberResult += 1
						end
					end
					table.insert(List, {
						unit = Unit,
						separator = if #List == 0 then Separator else "line",
						prefix = Prefix,
						level = Removed.level,
						top = Removed.top
					})
				end
				for i6 = #List, 1, -1 do
					table.insert(Stack, List[i6])
				end
			else
				local UnitsResult = ChildrenModule.units(Block, p5._registry, false)
				
				if #UnitsResult == 0 then
					local BeginLineResult = beginLine(p5, Removed)
					local Children = p5._out.children
					
					if BeginLineResult.contentStart < #Children then
						p5._drew[BeginLineResult.entry.top] = true
					else
						for i7 = #Children, BeginLineResult.mark + 1, -1 do
							Children[i7] = nil
						end
						p5._startedLine = BeginLineResult.startedBefore
					end
				end
				local NewLevel = if Kind == "ListItem" then Removed.level + 1 else Removed.level
				local Line: string = if Kind == "ListItem" then "line" else "paragraph"
				local List = {}
				
				for i8, Unit1 in UnitsResult do
					table.insert(List, {
						unit = Unit1,
						separator = if i8 == 1 then Removed.separator else Line,
						prefix = if i8 == 1 then Removed.prefix else nil,
						level = NewLevel,
						top = Removed.top
					})
				end
				for i9 = #List, 1, -1 do
					table.insert(Stack, List[i9])
				end
			end
		end
		return nil, nil
	end,
	drawnUnits = function(p6)
		local List = {}
		
		for i, unit in p6._units do
			if p6._drew[i] then
				table.insert(List, unit)
			end
		end
		return List
	end
}