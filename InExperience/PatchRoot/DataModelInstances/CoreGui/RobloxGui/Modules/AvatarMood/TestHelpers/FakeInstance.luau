local CreateFakeSignalModule = require(script.Parent.createFakeSignal)
local config = {
	MeshPart = { "BasePart" },
	Part = { "BasePart" },
	LocalScript = { "BaseScript" }
}
local FakeInstanceModule = {}
FakeInstanceModule.__index = FakeInstanceModule

function FakeInstanceModule.new(ClassName, p1)
	-- upvalues: CreateFakeSignalModule (copy), FakeInstanceModule (copy)
	return (setmetatable({
		Parent = nil,
		ClassName = ClassName,
		Name = p1 or ClassName,
		_children = {},
		ChildAdded = CreateFakeSignalModule(),
		ChildRemoved = CreateFakeSignalModule(),
		DescendantAdded = CreateFakeSignalModule(),
		DescendantRemoving = CreateFakeSignalModule(),
		Changed = CreateFakeSignalModule()
	}, FakeInstanceModule))
end

function FakeInstanceModule:IsA(Value): boolean
	-- upvalues: config (copy)
	if self.ClassName == Value or Value == "Instance" then
		return true
	else
		local Entry = config[self.ClassName]
		
		return Entry ~= nil and table.find(Entry, Value) ~= nil
	end
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

function FakeInstanceModule.FindFirstChild(p2, Name)
	for _, child in p2._children do
		if child.Name == Name then
			return child
		end
	end
	return nil
end

function FakeInstanceModule.FindFirstChildOfClass(p3, ClassName)
	for _, child in p3._children do
		if child.ClassName == ClassName then
			return child
		end
	end
	return nil
end

function FakeInstanceModule.FindFirstChildWhichIsA(Object, ClassName, p4)
	local Descendants = if p4 then Object:GetDescendants() else Object._children
	for _, descendant in Descendants do
		if descendant:IsA(ClassName) then
			return descendant
		end
	end
	return nil
end

local function _(Object)
	local List = { Object }
	
	for _, descendant in Object:GetDescendants() do
		table.insert(List, descendant)
	end
	return List
end

local _ = function(p5, Callback: (any) -> ())
	while p5 do
		Callback(p5)
		p5 = p5.Parent
	end
end

function FakeInstanceModule:setParent(Parent)
	local Parent1 = self.Parent
	
	if Parent1 == Parent then return end
	if Parent1 then
		local List = { self }
		
		for _, descendant in self:GetDescendants() do
			table.insert(List, descendant)
		end
		local Parent2 = Parent1
		
		local function _(p6)
			-- upvalues: List (copy)
			for _, value in List do
				p6.DescendantRemoving:Fire(value)
			end
		end
		while Parent2 do
			for _, value in List do
				Parent2.DescendantRemoving:Fire(value)
			end
			Parent2 = Parent2.Parent
		end
		table.remove(Parent1._children, table.find(Parent1._children, self))
		self.Parent = nil
		Parent1.ChildRemoved:Fire(self)
	end
	self.Parent = Parent
	
	if Parent then
		table.insert(Parent._children, self)
		Parent.ChildAdded:Fire(self)
		local List1 = { self }
		
		for _, descendant1 in self:GetDescendants() do
			table.insert(List1, descendant1)
		end
		local Parent3 = Parent
		
		local _ = function(p7)
			-- upvalues: List1 (copy)
			for _, value in List1 do
				p7.DescendantAdded:Fire(value)
			end
		end
		while Parent3 do
			for _, value1 in List1 do
				Parent3.DescendantAdded:Fire(value1)
			end
			Parent3 = Parent3.Parent
		end
	end
end

function FakeInstanceModule:setProperty(Key, p8)
	self[Key] = p8
	self.Changed:Fire(Key)
end

function FakeInstanceModule:Destroy()
	self.Destroyed = true
	self:setParent(nil)
end

return FakeInstanceModule