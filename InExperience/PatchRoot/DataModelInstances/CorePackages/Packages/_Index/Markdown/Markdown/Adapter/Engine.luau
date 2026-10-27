local Markdown = script:FindFirstAncestor("Markdown")
local _ = require(script.Parent.AdapterTypes)
local ChildrenModule = require(script.Parent.Children)
local _ = require(Markdown.Parent.CommonMark)
local FlattenBlocksModule = require(script.Parent.FlattenBlocks)
local PassesModule = require(script.Parent.Passes)
local _ = require(script.Parent.Registry)
local RendererNodesModule = require(script.Parent.RendererNodes)
local _ = require(Markdown.Types)

local function _(p1)
	p1.lastToken += 1
	
	return p1.lastToken
end

local function append(Run, Into, As, AttributesResult)
	-- upvalues: RendererNodesModule (copy), PassesModule (copy)
	local AppendResult = RendererNodesModule.append(Into, As, AttributesResult)
	
	if not RendererNodesModule.isInline(AppendResult) then
		Run.depths[AppendResult] = (Run.depths[Into] or 0) + 1
		
		if PassesModule.isDroppable(As) then
			Run.droppable[AppendResult] = Into
		end
	end
	return AppendResult
end

local function emitText(Run, Into, TextResult, LastTextToken)
	-- upvalues: RendererNodesModule (copy)
	if TextResult == "" then return end
	local LastText = Run.lastText
	
	if LastText ~= nil and Run.lastTextToken == LastTextToken and Run.registry.passes.mergeText then
		local Children = Into.children
		
		if Children[#Children] == LastText then
			local TextPart = Run.textParts[LastText]
			
			if TextPart == nil then
				Run.textParts[LastText] = { LastText.text, TextResult }
				
				return
			else
				table.insert(TextPart, TextResult)
				
				return
			end
		end
	end
	Run.lastText = RendererNodesModule.appendText(Into, TextResult)
	Run.lastTextToken = LastTextToken
end

local _ = function(Cursor, Into, Token, Depth)
	return {
		kind = "inlines",
		index = 0,
		into = Into,
		cursor = Cursor,
		token = Token,
		depth = Depth
	}
end

local _ = function(p1): boolean
	local FirstChild = p1:getFirstChild()
	while FirstChild ~= nil do
		if FirstChild.isBlock then
			return true
		end
		FirstChild = FirstChild:getNext()
	end
	return false
end

local function childrenFrame(Run, Node, Into, Token, Depth)
	-- upvalues: RendererNodesModule (copy), ChildrenModule (copy)
	if RendererNodesModule.holdsBlocks(Into) then
		return {
			kind = "units",
			index = 0,
			into = Into,
			units = ChildrenModule.units(Node, Run.registry, false)
		}
	end
	if not RendererNodesModule.isInline(Into) then
		local FirstChild = Node:getFirstChild()
		local Flag = nil
		while FirstChild ~= nil do
			if not FirstChild.isBlock then
				FirstChild = FirstChild:getNext()
				continue
			end
			Flag = true
			if Flag then
				return {
					kind = "flatten",
					index = 0,
					into = Into,
					node = Node,
					inlineOnly = Run.registry.blockInText == "drop"
				}
			end
		end
		Flag = false
	end
	local FirstChild1 = Node:getFirstChild()
	local LastToken = Token
	
	if not LastToken then
		Run.lastToken += 1
		LastToken = Run.lastToken
	end
	return {
		kind = "inlines",
		index = 0,
		into = Into,
		cursor = FirstChild1,
		token = LastToken,
		depth = Run.depths[Into] or Depth
	}
end

local Module = {}
Module.__index = Module

local _ = function(_run, Parent, _token, Depth)
	-- upvalues: Module (copy)
	return (setmetatable({
		_pending = nil,
		_closed = false,
		parent = Parent,
		depth = Depth,
		isFirstTopLevel = Parent == _run.root and #Parent.children == 0,
		options = _run.options,
		_run = _run,
		_token = _token
	}, Module))
end

local _ = function(p2, p3)
	if p2._closed then
		error("An adapter context schedules work only while its handler runs")
	end
	local Pending = p2._pending
	
	if Pending == nil then
		p2._pending = { p3 }
		
		return
	else
		table.insert(Pending, p3)
	end
end

local _ = function(p2)
	local Token = p2._token
	
	if Token == nil then
		local Run = p2._run
		Run.lastToken += 1
		local LastToken = Run.lastToken
		p2._token = LastToken
		
		return LastToken
	else
		return Token
	end
end

function Module.block(p2, p3, p4)
	-- upvalues: append (copy)
	return (append(p2._run, p2.parent, p3, p4))
end

function Module.append(p2, p3, p4, p5)
	-- upvalues: append (copy)
	return (append(p2._run, p3, p4, p5))
end

function Module.text(FirstChild, p2)
	-- upvalues: RendererNodesModule (copy), emitText (copy)
	if RendererNodesModule.holdsBlocks(FirstChild.parent) then
		error(`ctx:text needs an inline target, not {FirstChild.parent.name}`)
	end
	local Run = FirstChild._run
	local Parent = FirstChild.parent
	local Token = FirstChild._token
	local LastTextToken = nil
	
	if Token == nil then
		local Run1 = FirstChild._run
		Run1.lastToken += 1
		local LastToken = Run1.lastToken
		FirstChild._token = LastToken
		LastTextToken = LastToken
	else
		LastTextToken = Token
	end
	emitText(Run, Parent, p2, LastTextToken)
end

function Module.adaptChildrenOf(p2, Node, p3)
	-- upvalues: childrenFrame (copy)
	local ChildrenFrameResult = childrenFrame(p2._run, Node, p3 or p2.parent, p2._token, p2.depth)
	
	if p2._closed then
		error("An adapter context schedules work only while its handler runs")
	end
	local Pending = p2._pending
	
	if Pending == nil then
		p2._pending = { ChildrenFrameResult }
		
		return
	else
		table.insert(Pending, ChildrenFrameResult)
	end
end

function Module.adaptInlinesOf(p2, p3, Into)
	local FirstChild = p3:getFirstChild()
	local Token = p2._token
	local Token1 = nil
	
	if Token == nil then
		local Run = p2._run
		Run.lastToken += 1
		local LastToken = Run.lastToken
		p2._token = LastToken
		Token1 = LastToken
	else
		Token1 = Token
	end
	local config = {
		kind = "inlines",
		index = 0,
		into = Into,
		cursor = FirstChild,
		token = Token1,
		depth = p2._run.depths[Into] or p2.depth
	}
	
	if p2._closed then
		error("An adapter context schedules work only while its handler runs")
	end
	local Pending = p2._pending
	
	if Pending == nil then
		p2._pending = { config }
		
		return
	else
		table.insert(Pending, config)
	end
end

function Module.flatten(p2, Node, Into, Options)
	local config = {
		kind = "flatten",
		index = 0,
		into = Into,
		node = Node,
		options = Options
	}
	
	if p2._closed then
		error("An adapter context schedules work only while its handler runs")
	end
	local Pending = p2._pending
	
	if Pending == nil then
		p2._pending = { config }
		
		return
	else
		table.insert(Pending, config)
	end
end

function Module:childrenOf(p2)
	local FirstChild = p2:getFirstChild()
	
	return function()
		-- upvalues: FirstChild (ref)
		local FirstChild1 = FirstChild
		
		if FirstChild1 ~= nil then
			FirstChild = FirstChild1:getNext()
		end
		return FirstChild1
	end
end

function Module.plainText(p2, Parent): string
	local Registry = p2._run.registry
	local List = {}
	local FirstChild = Parent:getFirstChild()
	while FirstChild ~= nil do
		local InlineEntry = Registry.inline[FirstChild.kind] or Registry.unknownInline
		local Flag = false
		
		if InlineEntry.form == "text" then
			table.insert(List, InlineEntry.text(FirstChild))
		elseif InlineEntry.form ~= "drop" then
			local Literal = if FirstChild.kind == "HardLineBreak" then "\n" else FirstChild.literal
			
			if type(Literal) == "string" then
				table.insert(List, Literal)
			end
			Flag = true
		end
		local FirstChild1 = if Flag then FirstChild:getFirstChild() else nil
		
		if FirstChild1 == nil then
			local Parent1 = FirstChild
			while Parent1 ~= Parent and Parent1:getNext() == nil do
				Parent1 = Parent1:getParent()
			end
			FirstChild = if Parent1 == Parent then nil else Parent1:getNext()
		else
			FirstChild = FirstChild1
		end
	end
	return table.concat(List)
end

function Module.gap(p3, Kind, Node)
	table.insert(p3._run.gaps, { kind = Kind, node = Node })
end

function Module._units(p3, p4, p5)
	-- upvalues: ChildrenModule (copy)
	return ChildrenModule.units(p4, p3._run.registry, p5)
end

function Module._flattenUnits(p3, Units, Into, Options, Node)
	local config = {
		kind = "flatten",
		index = 0,
		into = Into,
		units = Units,
		options = Options,
		node = Node
	}
	
	if p3._closed then
		error("An adapter context schedules work only while its handler runs")
	end
	local Pending = p3._pending
	
	if Pending == nil then
		p3._pending = { config }
		
		return
	else
		table.insert(Pending, config)
	end
end

local function callHandler(Run, Callback: (any, any) -> (), Block, Parent, _token, Depth)
	-- upvalues: Module (copy)
	local self = setmetatable({
		_pending = nil,
		_closed = false,
		parent = Parent,
		depth = Depth,
		isFirstTopLevel = Parent == Run.root and #Parent.children == 0,
		options = Run.options,
		_run = Run,
		_token = _token
	}, Module)
	Callback(Block, self)
	self._closed = true
	local Pending = self._pending
	
	if Pending ~= nil then
		for i = #Pending, 1, -1 do
			table.insert(Run.stack, Pending[i])
		end
	end
end

local function adaptUnit(Run, Unit, Into)
	-- upvalues: append (copy), childrenFrame (copy), callHandler (copy)
	local Block = Unit.block
	
	if Block == nil then
		local PARAGRAPH = append(Run, Into, "PARAGRAPH")
		local Stack = Run.stack
		local Inlines = Unit.inlines
		Run.lastToken += 1
		table.insert(Stack, {
			kind = "inlines",
			index = 0,
			into = PARAGRAPH,
			list = Inlines,
			token = Run.lastToken,
			depth = Run.depths[PARAGRAPH]
		})
		
		return
	end
	local Registry = Run.registry
	local BlockEntry = Registry.block[Block.kind] or Registry.unknownBlock
	
	if BlockEntry.form == "as" then
		local AppendResult = append(Run, Into, BlockEntry.as, if BlockEntry.attributes == nil then nil else BlockEntry.attributes(Block))
		table.insert(Run.stack, (childrenFrame(Run, Block, AppendResult, nil, Run.depths[AppendResult])))
		
		return
	end
	if BlockEntry.form == "handler" then
		callHandler(Run, BlockEntry.handler, Block, Into, nil, Run.depths[Into] or 0)
	end
end

local function adaptInline(Run, Cursor, p3)
	-- upvalues: emitText (copy), append (copy), callHandler (copy)
	local Registry = Run.registry
	local InlineEntry = Registry.inline[Cursor.kind] or Registry.unknownInline
	local Form = InlineEntry.form
	local Into = p3.into
	local Token = p3.token
	
	if Form == "text" then
		emitText(Run, Into, InlineEntry.text(Cursor), Token)
		
		return
	end
	if Form == "style" then
		local STYLEDTEXT = append(Run, Into, "STYLED_TEXT", { style = InlineEntry.style })
		local FirstChild = Cursor:getFirstChild()
		
		if FirstChild ~= nil then
			table.insert(Run.stack, {
				kind = "inlines",
				index = 0,
				into = STYLEDTEXT,
				cursor = FirstChild,
				token = Token,
				depth = p3.depth
			})
			
			return
		end
	elseif Form == "children" then
		local FirstChild = Cursor:getFirstChild()
		
		if FirstChild ~= nil then
			table.insert(Run.stack, {
				kind = "inlines",
				index = 0,
				into = Into,
				cursor = FirstChild,
				token = Token,
				depth = p3.depth
			})
			
			return
		end
	elseif Form == "handler" then
		callHandler(Run, InlineEntry.handler, Cursor, Into, Token, p3.depth)
	end
end

local Frozen = table.freeze({})

local function startFlatten(p3, p4)
	-- upvalues: Frozen (copy), ChildrenModule (copy), FlattenBlocksModule (copy)
	local Options = p4.options or Frozen
	local Units = p4.units or ChildrenModule.units(p4.node, p3.registry, false)
	local Except = Options.except
	local Units1 = Units
	
	if Except ~= nil or p4.inlineOnly then
		local List = {}
		local AfterExcept = {}
		local Flag = false
		
		for _, unit in Units do
			if Except ~= nil and unit.block == Except then
				Flag = true
			elseif not p4.inlineOnly or unit.block == nil then
				table.insert(List, unit)
				AfterExcept[unit] = Flag
			end
		end
		Units1 = List
		p4.afterExcept = AfterExcept
	end
	p4.flattening = FlattenBlocksModule.start(Units1, p4.into, p3.registry, Options.drop)
end

local function finishFlatten(p5, p6)
	-- upvalues: Frozen (copy), FlattenBlocksModule (copy), ChildrenModule (copy)
	local Gap = (p6.options or Frozen).gap
	
	if Gap == nil then return end
	local DrawnUnitsResult = FlattenBlocksModule.drawnUnits(p6.flattening)
	local v1: boolean = #DrawnUnitsResult > 1 or #DrawnUnitsResult == 1 and not ChildrenModule.isParagraphLike(DrawnUnitsResult[1])
	local AfterExcept = p6.afterExcept
	
	if AfterExcept ~= nil then
		for _, value in DrawnUnitsResult do
			v1 = v1 or AfterExcept[value] == true
		end
	end
	if v1 then
		table.insert(p5.gaps, { kind = Gap, node = p6.node })
	end
end

local function stepFlatten(p7, p8)
	-- upvalues: startFlatten (copy), FlattenBlocksModule (copy), finishFlatten (copy)
	if p8.flattening == nil then
		startFlatten(p7, p8)
	end
	local ResumeResult, ResumeResult2 = FlattenBlocksModule.resume(p8.flattening)
	
	if ResumeResult == nil and ResumeResult2 == nil then
		table.remove(p7.stack)
		finishFlatten(p7, p8)
		
		return
	end
	local Into = p8.into
	local Depth = p7.depths[Into] or 0
	
	if ResumeResult == nil then
		local Stack = p7.stack
		local FirstChild = ResumeResult2:getFirstChild()
		p7.lastToken += 1
		table.insert(Stack, {
			kind = "inlines",
			index = 0,
			into = Into,
			cursor = FirstChild,
			token = p7.lastToken,
			depth = Depth
		})
		
		return
	else
		local Stack = p7.stack
		p7.lastToken += 1
		table.insert(Stack, {
			kind = "inlines",
			index = 0,
			into = Into,
			list = ResumeResult,
			token = p7.lastToken,
			depth = Depth
		})
	end
end

local function drain(p7)
	-- upvalues: adaptUnit (copy), adaptInline (copy), stepFlatten (copy)
	local Stack = p7.stack
	while #Stack > 0 do
		local StackEntry = Stack[#Stack]
		local Kind = StackEntry.kind
		
		if Kind == "units" then
			StackEntry.index += 1
			local Unit = StackEntry.units[StackEntry.index]
			
			if Unit == nil then
				table.remove(Stack)
			else
				adaptUnit(p7, Unit, StackEntry.into)
			end
		else
			if Kind ~= "inlines" then
				stepFlatten(p7, StackEntry)
				continue
			end
			local List = StackEntry.list
			local Entry = nil
			
			if List == nil then
				Entry = StackEntry.cursor
				
				if Entry ~= nil then
					StackEntry.cursor = Entry:getNext()
				end
			else
				StackEntry.index += 1
				Entry = List[StackEntry.index]
			end
			if Entry == nil then
				Stack[#Stack] = nil
			else
				adaptInline(p7, Entry, StackEntry)
			end
		end
	end
end

local Frozen1 = table.freeze({})

return {
	adapt = function(Registry, Node, p8)
		-- upvalues: RendererNodesModule (copy), Frozen1 (copy), childrenFrame (copy), drain (copy), PassesModule (copy)
		local ROOT = RendererNodesModule.create("ROOT")
		ROOT.index = 1
		ROOT.offset = 1
		local config = {
			lastText = nil,
			lastTextToken = 0,
			lastToken = 0,
			registry = Registry,
			root = ROOT,
			stack = {},
			gaps = {},
			options = p8 or Frozen1,
			textParts = {},
			droppable = {},
			depths = { [ROOT] = 0 }
		}
		table.insert(config.stack, (childrenFrame(config, Node, ROOT, nil, 0)))
		drain(config)
		PassesModule.finish(config.textParts, config.droppable, Registry.passes)
		
		return ROOT, config.gaps
	end
}