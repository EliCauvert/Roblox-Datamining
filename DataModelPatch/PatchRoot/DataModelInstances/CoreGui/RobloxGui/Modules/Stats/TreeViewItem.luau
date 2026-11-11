local TreeViewItemModule = {}
TreeViewItemModule.__index = TreeViewItemModule

function TreeViewItemModule.new(_id, _parent)
	-- upvalues: TreeViewItemModule (copy)
	local t = {}
	setmetatable(t, TreeViewItemModule)
	t._id = _id
	t._parent = _parent
	t._children = {}
	
	return t
end

function TreeViewItemModule:getValue()
	return self._value
end

function TreeViewItemModule:getLabel()
	return self._label
end

function TreeViewItemModule:getChildren()
	return self._children
end

function TreeViewItemModule:getId()
	return self._id
end

function TreeViewItemModule.getStackDepth(p1): number
	return if p1._parent == nil then 0 else 1 + p1._parent:getStackDepth()
end

function TreeViewItemModule:setLabelAndValue(_label, _value)
	self._label = _label
	self._value = _value
end

function TreeViewItemModule:getOrMakeChildById(Id)
	-- upvalues: TreeViewItemModule (copy)
	for _, child in ipairs(self._children) do
		if child:getId() == Id then
			return child
		end
	end
	local NewTreeViewItem = TreeViewItemModule.new(Id, self)
	table.insert(self._children, NewTreeViewItem)
	
	return NewTreeViewItem
end

function TreeViewItemModule:removeChildren()
	if not self._children then return end
	for _, child in ipairs(self._children) do
		child:removeChildren()
	end
	self._id = nil
	self._parent = nil
	self._children = nil
end

function TreeViewItemModule.removeChild(p1, Id)
	for _, child in ipairs(p1._children) do
		if child:getId() == Id then
			child:removeChildren()
			break
		end
	end
end

return TreeViewItemModule