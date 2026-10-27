local CommonMark = script:FindFirstAncestor("CommonMark")
local BlockContinueModule = require(CommonMark.parser.block.BlockContinue)
local _ = require(CommonMark.node.Node)
local NodesModule = require(CommonMark.node.Nodes)
local _ = require(CommonMark.parser.block.ParserState)
local self = setmetatable({}, {
	__index = require(CommonMark.parser.block.AbstractBlockParser)
})
self.__index = self

function self.new(MarkerIndent, ContentIndent)
	-- upvalues: NodesModule (copy), self (copy)
	local ListItemResult = NodesModule.ListItem()
	ListItemResult.markerIndent = MarkerIndent
	ListItemResult.contentIndent = ContentIndent
	
	return (setmetatable({
		_hadBlankLine = false,
		_block = ListItemResult,
		_contentIndent = ContentIndent
	}, self))
end

function self:isContainer(): boolean
	return true
end

function self:canContain(_): boolean
	if self._hadBlankLine then
		local Parent = self._block:getParent()
		
		if Parent ~= nil and (Parent.kind == "BulletList" or Parent.kind == "OrderedList") then
			Parent.tight = false
		end
	end
	return true
end

function self:getBlock()
	return self._block
end

function self:tryContinue(p1)
	-- upvalues: BlockContinueModule (copy)
	if not p1:isBlank() then
		return if self._contentIndent <= p1:getIndent() then BlockContinueModule.atColumn(p1:getColumn() + self._contentIndent) else BlockContinueModule.none()
	elseif self._block:getFirstChild() == nil then
		return BlockContinueModule.none()
	else
		local Block = p1:getActiveBlockParser():getBlock()
		self._hadBlankLine = Block.kind == "Paragraph" or Block.kind == "ListItem"
		
		return BlockContinueModule.atIndex(p1:getNextNonSpaceIndex())
	end
end

return self