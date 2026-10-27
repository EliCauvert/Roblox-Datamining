local _ = require(script:FindFirstAncestor("CommonMark").node.SourceSpan)
local NodeModule = {}
NodeModule.__index = NodeModule
local Frozen = table.freeze({})

function NodeModule.new(Kind, IsBlock)
	-- upvalues: NodeModule (copy)
	return (setmetatable({
		_parent = nil,
		_firstChild = nil,
		_lastChild = nil,
		_prev = nil,
		_next = nil,
		_sourceSpans = nil,
		kind = Kind,
		isBlock = IsBlock
	}, NodeModule))
end

function NodeModule:accept(p1)
	local Callback: (any, any) -> () = p1["visit" .. self.kind]
	
	if Callback == nil then
		Callback = if self.isBlock then p1.visitCustomBlock else p1.visitCustomNode
	end
	Callback(p1, self)
end

function NodeModule:getNext()
	return self._next
end

function NodeModule:getPrevious()
	return self._prev
end

function NodeModule:getFirstChild()
	return self._firstChild
end

function NodeModule:getLastChild()
	return self._lastChild
end

function NodeModule:getParent()
	return self._parent
end

function NodeModule:setParent(Parent)
	if self.isBlock and not Parent.isBlock then
		error("Parent of block must also be block (can not be inline)")
	end
	self._parent = Parent
end

function NodeModule:appendChild(_firstChild)
	_firstChild:unlink()
	_firstChild:setParent(self)
	
	if self._lastChild == nil then
		self._firstChild = _firstChild
	else
		self._lastChild._next = _firstChild
		_firstChild._prev = self._lastChild
	end
	self._lastChild = _firstChild
end

function NodeModule:prependChild(_firstChild)
	_firstChild:unlink()
	_firstChild:setParent(self)
	
	if self._firstChild == nil then
		self._firstChild = _firstChild
		self._lastChild = _firstChild
		
		return
	else
		self._firstChild._prev = _firstChild
		_firstChild._next = self._firstChild
		self._firstChild = _firstChild
	end
end

function NodeModule:unlink()
	if self._prev == nil then
		if self._parent ~= nil then
			self._parent._firstChild = self._next
		end
	else
		self._prev._next = self._next
	end
	if self._next == nil then
		if self._parent ~= nil then
			self._parent._lastChild = self._prev
		end
	else
		self._next._prev = self._prev
	end
	self._parent = nil
	self._next = nil
	self._prev = nil
end

function NodeModule:insertAfter(_lastChild)
	_lastChild:unlink()
	_lastChild._next = self._next
	
	if _lastChild._next ~= nil then
		_lastChild._next._prev = _lastChild
	end
	_lastChild._prev = self
	self._next = _lastChild
	_lastChild._parent = self._parent
	
	if _lastChild._next == nil then
		_lastChild._parent._lastChild = _lastChild
	end
end

function NodeModule:insertBefore(_firstChild)
	_firstChild:unlink()
	_firstChild._prev = self._prev
	
	if _firstChild._prev ~= nil then
		_firstChild._prev._next = _firstChild
	end
	_firstChild._next = self
	self._prev = _firstChild
	_firstChild._parent = self._parent
	
	if _firstChild._prev == nil then
		_firstChild._parent._firstChild = _firstChild
	end
end

function NodeModule.getSourceSpans(p1)
	-- upvalues: Frozen (copy)
	return if p1._sourceSpans == nil then Frozen else p1._sourceSpans
end

function NodeModule:setSourceSpans(Tbl)
	if #Tbl == 0 then
		self._sourceSpans = nil
		
		return
	else
		self._sourceSpans = table.clone(Tbl)
	end
end

function NodeModule:addSourceSpan(p1)
	if self._sourceSpans == nil then
		self._sourceSpans = {}
	end
	table.insert(self._sourceSpans, p1)
end

function NodeModule:toString(): string
	return `{self.kind}\{{self:toStringAttributes()}}`
end

NodeModule.toStringAttributesByKind = {}

function NodeModule:toStringAttributes()
	-- upvalues: NodeModule (copy)
	local ToStringAttributesByKindEntry = NodeModule.toStringAttributesByKind[self.kind]
	
	return if ToStringAttributesByKindEntry == nil then "" else ToStringAttributesByKindEntry(self)
end

return NodeModule