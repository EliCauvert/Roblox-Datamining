local SortedPrefixIndexModule = {}
SortedPrefixIndexModule.__index = SortedPrefixIndexModule

function SortedPrefixIndexModule.new()
	-- upvalues: SortedPrefixIndexModule (copy)
	return (setmetatable({ isSorted = false, keys = {} }, SortedPrefixIndexModule))
end

function SortedPrefixIndexModule:insert(p1)
	table.insert(self.keys, p1)
	self.isSorted = false
end

function SortedPrefixIndexModule:setKeys(Keys)
	self.keys = Keys
	self.isSorted = false
end

function SortedPrefixIndexModule:finalize()
	if self.isSorted then return end
	table.sort(self.keys)
	local Count = 0
	local v1 = nil
	
	for _, key in self.keys do
		if key ~= v1 then
			Count += 1
			self.keys[Count] = key
			v1 = key
		end
	end
	for i = Count + 1, #self.keys do
		self.keys[i] = nil
	end
	self.isSorted = true
end

local function findFirstAtOrAfter(Keys, Segment): number
	local v2 = 1
	local v3 = #Keys + 1
	while v2 < v3 do
		local Floored = math.floor((v2 + v3) / 2)
		
		if Keys[Floored] < Segment then
			v2 = Floored + 1
		else
			v3 = Floored
		end
	end
	return v2
end

function SortedPrefixIndexModule:autocomplete(Segment)
	-- upvalues: findFirstAtOrAfter (copy)
	self:finalize()
	local Keys = {}
	
	for i = findFirstAtOrAfter(self.keys, Segment), #self.keys do
		local Key: string = self.keys[i]
		
		if string.sub(Key, 1, #Segment) ~= Segment then break end
		table.insert(Keys, Key)
	end
	return Keys
end

return SortedPrefixIndexModule