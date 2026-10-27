local CommonMark = script:FindFirstAncestor("CommonMark")
local BlockContinueModule = require(CommonMark.parser.block.BlockContinue)
local _ = require(CommonMark.parser.block.BlockParserFactory)
local BlockStartModule = require(CommonMark.parser.block.BlockStart)
local _ = require(CommonMark.parser.block.MatchedBlockParser)
local NodesModule = require(CommonMark.node.Nodes)
local _ = require(CommonMark.parser.block.ParserState)
local ByteFunction = string.byte
local SubFunction = string.sub
local self = setmetatable({}, {
	__index = require(CommonMark.parser.block.AbstractBlockParser)
})
self.__index = self

function self.new(Literal)
	-- upvalues: NodesModule (copy), self (copy)
	local ThematicBreakResult = NodesModule.ThematicBreak()
	ThematicBreakResult.literal = Literal
	
	return (setmetatable({ _block = ThematicBreakResult }, self))
end

function self:getBlock()
	return self._block
end

function self:tryContinue(_)
	-- upvalues: BlockContinueModule (copy)
	return BlockContinueModule.none()
end

local function isThematicBreak(Content, NextNonSpaceIndex): boolean
	-- upvalues: ByteFunction (copy)
	local Count = 0
	local Count1 = 0
	local Count2 = 0
	
	for i = NextNonSpaceIndex, #Content - 1 do
		local ByteResult = ByteFunction(Content, i + 1)
		
		if ByteResult == 45 then
			Count += 1
		elseif ByteResult == 95 then
			Count1 += 1
		elseif ByteResult == 42 then
			Count2 += 1
		elseif ByteResult ~= 32 and ByteResult ~= 9 then
			return false
		end
	end
	return Count >= 3 and Count1 == 0 and Count2 == 0 or (Count1 >= 3 and Count == 0 and Count2 == 0 or Count2 >= 3 and Count == 0 and Count1 == 0)
end

local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({}, Module))
end

function Module:tryStart(p1, _)
	-- upvalues: BlockStartModule (copy), isThematicBreak (copy), SubFunction (copy), self (copy)
	if p1:getIndent() >= 4 then
		return BlockStartModule.none()
	else
		local Content = p1:getLine():getContent()
		
		return if isThematicBreak(Content, (p1:getNextNonSpaceIndex())) then BlockStartModule.of(self.new((SubFunction(Content, p1:getIndex() + 1, #Content)))):atIndex(#Content) else BlockStartModule.none()
	end
end

self.Factory = Module

return self