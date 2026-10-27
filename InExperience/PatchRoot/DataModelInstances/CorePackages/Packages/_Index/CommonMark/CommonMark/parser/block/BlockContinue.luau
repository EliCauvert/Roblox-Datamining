local BlockContinueModule = {}
BlockContinueModule.__index = BlockContinueModule

local function _(_newIndex, _newColumn, _finalize)
	-- upvalues: BlockContinueModule (copy)
	return (setmetatable({
		_newIndex = _newIndex,
		_newColumn = _newColumn,
		_finalize = _finalize
	}, BlockContinueModule))
end

function BlockContinueModule.none()
	return nil
end

function BlockContinueModule.atIndex(_newIndex)
	-- upvalues: BlockContinueModule (copy)
	return (setmetatable({
		_newColumn = -1,
		_finalize = false,
		_newIndex = _newIndex
	}, BlockContinueModule))
end

function BlockContinueModule.atColumn(_newColumn)
	-- upvalues: BlockContinueModule (copy)
	return (setmetatable({
		_newIndex = -1,
		_finalize = false,
		_newColumn = _newColumn
	}, BlockContinueModule))
end

function BlockContinueModule.finished()
	-- upvalues: BlockContinueModule (copy)
	return (setmetatable({ _newIndex = -1, _newColumn = -1, _finalize = true }, BlockContinueModule))
end

function BlockContinueModule.getNewIndex(p1)
	return p1._newIndex
end

function BlockContinueModule.getNewColumn(p1)
	return p1._newColumn
end

function BlockContinueModule.isFinalize(p1)
	return p1._finalize
end

return BlockContinueModule