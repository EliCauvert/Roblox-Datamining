local _ = require(script.Parent.Parent.Parent.Parent.LuauPolyfill)

local function defaultMakeData()
	return {}
end

local Module = {}
Module.__index = Module

function Module.new(Weakness, MakeData)
	-- upvalues: defaultMakeData (copy), Module (copy)
	local Weakness1: boolean = Weakness
	local MakeData1 = MakeData
	
	if Weakness1 == nil then
		Weakness1 = true
	end
	if MakeData1 == nil then
		MakeData1 = defaultMakeData
	end
	local self = setmetatable({}, Module)
	self.weakness = Weakness1
	self.makeData = MakeData1
	
	return self
end

function Module:lookup(...)
	return self:lookupArray({ ... })
end

function Module:lookupArray(Tbl)
	local ChildTrie1 = self
	
	for _, value in Tbl do
		ChildTrie1 = ChildTrie1:getChildTrie(value)
	end
	if not ChildTrie1.data then
		ChildTrie1.data = self.makeData(table.clone(Tbl))
	end
	return ChildTrie1.data
end

function Module:getChildTrie(Key)
	-- upvalues: Module (copy)
	local Weak = nil
	if self.weakness then
		if self.weak == nil then
			self.weak = setmetatable({}, { __mode = "k" })
		end
		Weak = self.weak
	else
		if self.strong == nil then
			self.strong = {}
		end
		Weak = self.strong
	end
	local WeakEntry = Weak[Key]
	
	if not WeakEntry then
		WeakEntry = Module.new(self.weakness, self.makeData)
		Weak[Key] = WeakEntry
	end
	return WeakEntry
end

return { Trie = Module }