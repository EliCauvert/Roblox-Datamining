local KllSketchModule = {}
KllSketchModule.__index = KllSketchModule

function KllSketchModule.new(p1: number)
	-- upvalues: KllSketchModule (copy)
	return (setmetatable({
		levels = { table.create(p1) },
		weightedSketch = { totalWeight = 0, cached = false, weightTuples = {} },
		maxSize = if p1 % 2 == 0 then p1 else p1 - 1
	}, KllSketchModule))
end

function KllSketchModule:insert(p1)
	self.weightedSketch.cached = false
	local Levels = self.levels
	table.insert(Levels[1], p1)
	
	for i, level in Levels do
		if self.maxSize <= #level then
			compressWeightedKll(Levels, i)
		end
	end
end

function compressWeightedKll(List1, Count: number)
	local List = List1[Count]
	table.sort(List)
	local Buffer = table.create(#List // 2)
	
	for i = 1, #List, 2 do
		table.insert(Buffer, List[math.random(2) - 1 + i])
	end
	if Count == #List1 then
		table.insert(List1, Buffer)
	else
		table.move(Buffer, 1, #Buffer, #List1[Count + 1] + 1, List1[Count + 1])
	end
	table.clear(List1[Count])
end

function KllSketchModule:generateWeightedSketch()
	local List = {}
	local Weight = 1
	local TotalWeight = 0
	
	for _, level in self.levels do
		for _, Value in level do
			table.insert(List, { value = Value, weight = Weight })
			TotalWeight += Weight
		end
		Weight *= 2
	end
	table.sort(List, function(A, B): boolean
		return A.value < B.value
	end)
	self.weightedSketch = {
		cached = true,
		weightTuples = List,
		totalWeight = TotalWeight
	}
end

function KllSketchModule:getPercentile(p2: number)
	if not self.weightedSketch.cached then
		self:generateWeightedSketch()
	end
	if #self.weightedSketch.weightTuples > 0 then
		local Floored = math.floor(p2 / 100 * self.weightedSketch.totalWeight)
		local NewWeight = 0
		
		for _, weightTuple in self.weightedSketch.weightTuples do
			NewWeight += weightTuple.weight
			
			if Floored <= NewWeight then
				return weightTuple.value
			end
		end
	end
	return 0
end

return KllSketchModule