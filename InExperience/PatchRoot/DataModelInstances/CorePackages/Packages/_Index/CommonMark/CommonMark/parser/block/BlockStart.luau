local _ = require(script:FindFirstAncestor("CommonMark").parser.block.BlockParser)
local BlockStartModule = {}
BlockStartModule.__index = BlockStartModule

function BlockStartModule.none()
	return nil
end

function BlockStartModule.of(...)
	-- upvalues: BlockStartModule (copy)
	return (setmetatable({
		_newIndex = -1,
		_newColumn = -1,
		_replaceActiveBlockParser = false,
		_replaceParagraphLines = 0,
		_blockParsers = { ... }
	}, BlockStartModule))
end

function BlockStartModule.getBlockParsers(p1)
	return p1._blockParsers
end

function BlockStartModule.getNewIndex(p1)
	return p1._newIndex
end

function BlockStartModule.getNewColumn(p1)
	return p1._newColumn
end

function BlockStartModule.isReplaceActiveBlockParser(p1)
	return p1._replaceActiveBlockParser
end

function BlockStartModule.getReplaceParagraphLines(p1)
	return p1._replaceParagraphLines
end

function BlockStartModule.atIndex(p1, _newIndex)
	p1._newIndex = _newIndex
	
	return p1
end

function BlockStartModule.atColumn(p1, _newColumn)
	p1._newColumn = _newColumn
	
	return p1
end

function BlockStartModule.replaceActiveBlockParser(p1)
	p1._replaceActiveBlockParser = true
	
	return p1
end

function BlockStartModule.replaceParagraphLines(p1, _replaceParagraphLines: number)
	if _replaceParagraphLines < 1 then
		error("Lines must be >= 1")
	end
	p1._replaceParagraphLines = _replaceParagraphLines
	
	return p1
end

return BlockStartModule