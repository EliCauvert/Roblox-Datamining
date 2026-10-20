local Module = {}
Module.__index = Module

function Module.new(Data)
	-- upvalues: Module (copy)
	local self = setmetatable({}, Module)
	self.children = {}
	self.isEndOfWord = false
	self.data = Data
	
	return self
end

local TrieModule = {}
TrieModule.__index = TrieModule

function TrieModule.new()
	-- upvalues: TrieModule (copy), Module (copy)
	local self = setmetatable({}, TrieModule)
	self.root = Module.new("")
	
	return self
end

function TrieModule:insert(Text: string)
	-- upvalues: Module (copy)
	local Root = self.root
	
	for i = 1, #Text do
		local Segment = string.sub(Text, i, i)
		
		if not Root.children[Segment] then
			Root.children[Segment] = Module.new(Segment)
		end
		Root = Root.children[Segment]
	end
	Root.isEndOfWord = true
end

function TrieModule:autocomplete(Text: string)
	local t = {}
	local Root = self.root
	
	for i = 1, #Text do
		local Segment = string.sub(Text, i, i)
		
		if not Root.children[Segment] then
			return t
		end
		Root = Root.children[Segment]
	end
	self:_collect(Root, t, (string.sub(Text, 1, #Text - 1)))
	
	return t
end

function TrieModule:_collect(Root, List, Text)
	if Root.isEndOfWord then
		table.insert(List, Text .. Root.data)
	end
	for _, child in pairs(Root.children) do
		self:_collect(child, List, Text .. Root.data)
	end
end

return TrieModule