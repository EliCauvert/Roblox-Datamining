local TreeViewItemModule = {}
TreeViewItemModule.__index = TreeViewItemModule

function TreeViewItemModule.new(_id, _parent) --[[ Line: 19 ]]
	-- upvalues: TreeViewItemModule (copy)
	local t = {}
	setmetatable(t, TreeViewItemModule)
	t._id = _id
	t._parent = _parent
	t._children = {}
	
	return t
end

function TreeViewItemModule:getValue() --[[ Line: 29 ]]
	return self._value
end

function TreeViewItemModule:getLabel() --[[ Line: 33 ]]
	return self._label
end

function TreeViewItemModule:getChildren() --[[ Line: 37 ]]
	return self._children
end

function TreeViewItemModule:getId() --[[ Line: 41 ]]
	return self._id
end

function TreeViewItemModule.getStackDepth(p1): number --[[ Line: 45 ]]
	return if p1._parent == nil then 0 else 1 + p1._parent:getStackDepth()
end

function TreeViewItemModule:setLabelAndValue(_label, _value) --[[ Line: 53 ]]
	self._label = _label
	self._value = _value
end

function TreeViewItemModule:getOrMakeChildById(Id) --[[ Line: 58 ]]
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

function TreeViewItemModule:removeChildren() --[[ Line: 70 ]]
	if not self._children then return end
	for _, child in ipairs(self._children) do
		child:removeChildren()
	end
	self._id = nil
	self._parent = nil
	self._children = nil
end

function TreeViewItemModule.removeChild(p1, Id) --[[ Line: 82 ]]
	for _, child in ipairs(p1._children) do
		if child:getId() == Id then
			child:removeChildren()
			break
		end
	end
end

return TreeViewItemModule