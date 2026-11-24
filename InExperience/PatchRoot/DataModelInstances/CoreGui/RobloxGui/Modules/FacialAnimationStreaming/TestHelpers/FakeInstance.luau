local CreateFakeSignalModule = require(script.Parent.createFakeSignal)
local config = {
	MeshPart = { "MeshPart", "BasePart", "Instance" },
	Part = { "Part", "BasePart", "Instance" }
}
local FakeInstanceModule = {}
FakeInstanceModule.__index = FakeInstanceModule

function FakeInstanceModule.new(ClassName, p1)
	-- upvalues: CreateFakeSignalModule (copy), FakeInstanceModule (copy)
	return (setmetatable({
		Parent = nil,
		_isDataModelRoot = false,
		Destroyed = false,
		ClassName = ClassName,
		Name = p1 or ClassName,
		_children = {},
		DescendantAdded = CreateFakeSignalModule(),
		DescendantRemoving = CreateFakeSignalModule(),
		AncestryChanged = CreateFakeSignalModule()
	}, FakeInstanceModule))
end

function FakeInstanceModule.newDataModelRoot()
	-- upvalues: FakeInstanceModule (copy)
	local Workspace = FakeInstanceModule.new("Workspace")
	Workspace._isDataModelRoot = true
	
	return Workspace
end

function FakeInstanceModule:IsA(Value): boolean
	-- upvalues: config (copy)
	if self.ClassName == Value then
		return true
	else
		local Entry = config[self.ClassName]
		
		return if Entry then table.find(Entry, Value) ~= nil else Value == "Instance"
	end
end

function FakeInstanceModule:IsDescendantOf(Parent): boolean
	local Parent1 = self.Parent
	while Parent1 do
		if Parent1 == Parent then
			return true
		end
		if Parent == game and Parent1._isDataModelRoot then
			return true
		end
		Parent1 = Parent1.Parent
	end
	return false
end

function FakeInstanceModule:GetChildren()
	return table.clone(self._children)
end

function FakeInstanceModule.GetDescendants(p1)
	local List = {}
	
	for _, child in p1._children do
		table.insert(List, child)
		
		for _, descendant in child:GetDescendants() do
			table.insert(List, descendant)
		end
	end
	return List
end

function FakeInstanceModule.FindFirstChildOfClass(p2, ClassName)
	for _, child in p2._children do
		if child.ClassName == ClassName then
			return child
		end
	end
	return nil
end

function FakeInstanceModule.FindFirstChildWhichIsA(Object, ClassName, p3)
	local Descendants = if p3 then Object:GetDescendants() else Object._children
	for _, descendant in Descendants do
		if descendant:IsA(ClassName) then
			return descendant
		end
	end
	return nil
end

local function _(Parent, Callback: (any) -> ())
	local Parent1 = Parent
	while Parent1 do
		Callback(Parent1)
		Parent1 = Parent1.Parent
	end
end

local function fireAncestryChanged(Object, Parent)
	Object.AncestryChanged:Fire(Object, Parent)
	
	for _, descendant in Object:GetDescendants() do
		descendant.AncestryChanged:Fire(Object, Parent)
	end
end

function FakeInstanceModule:setParent(Parent)
	-- upvalues: fireAncestryChanged (copy)
	local Parent1 = self.Parent
	
	if Parent1 == Parent then return end
	if Parent1 then
		local List = { self }
		
		for _, descendant in self:GetDescendants() do
			table.insert(List, descendant)
		end
		local function _(p4)
			-- upvalues: List (copy)
			for _, value in List do
				p4.DescendantRemoving:Fire(value)
			end
		end
		
		local Parent2 = Parent1
		while Parent2 do
			for _, value in List do
				Parent2.DescendantRemoving:Fire(value)
			end
			Parent2 = Parent2.Parent
		end
		local FoundIndex: number? = table.find(Parent1._children, self)
		
		if FoundIndex then
			table.remove(Parent1._children, FoundIndex)
		end
	end
	self.Parent = Parent
	
	if Parent then
		table.insert(Parent._children, self)
		local List1 = { self }
		
		for _, descendant1 in self:GetDescendants() do
			table.insert(List1, descendant1)
		end
		local _ = function(p5)
			-- upvalues: List1 (copy)
			for _, value in List1 do
				p5.DescendantAdded:Fire(value)
			end
		end
		
		local Parent3 = Parent
		while Parent3 do
			for _, value1 in List1 do
				Parent3.DescendantAdded:Fire(value1)
			end
			Parent3 = Parent3.Parent
		end
	end
	fireAncestryChanged(self, Parent)
end

function FakeInstanceModule:Destroy()
	self.Destroyed = true
	self:setParent(nil)
end

return FakeInstanceModule