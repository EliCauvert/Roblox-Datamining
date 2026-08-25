local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref)
	return setmetatable({
		levels = { table.create(p0) },
		weightedSketch = { totalWeight = 0, cached = false, weightTuples = {} },
		maxSize = if p0 % 2 == 0 then p0 else p0 - 1
	}, t)
end

function t:insert(p1)
	self.weightedSketch.cached = false
	local levels = self.levels
	table.insert(levels[1], p1)
	
	for i, v in levels do
		if self.maxSize <= #v then
			compressWeightedKll(levels, i)
		end
	end
end

function compressWeightedKll(p2, p3)
	local var1 = p2[p3]
	table.sort(var1)
	local list = table.create(#var1 // 2)
	
	for i = 1, #var1, 2 do
		table.insert(list, var1[math.random(2) - 1 + i])
	end
	if p3 == #p2 then
		table.insert(p2, list)
	else
		table.move(list, 1, #list, #p2[p3 + 1] + 1, p2[p3 + 1])
	end
	table.clear(p2[p3])
end

function t:generateWeightedSketch()
	local t = {}
	local var4 = 1
	local var5 = 0
	
	for i, v in self.levels do
		for i_1, v_1 in v do
			table.insert(t, { value = v_1, weight = var4 })
			var5 += var4
		end
		var4 *= 2
	end
	table.sort(t, function(p4, p5)
		return p4.value < p5.value
	end)
	self.weightedSketch = { cached = true, weightTuples = t, totalWeight = var5 }
end

function t:getPercentile(p6)
	if not self.weightedSketch.cached then
		self:generateWeightedSketch()
	end
	if #self.weightedSketch.weightTuples > 0 then
		local floored = math.floor(p6 / 100 * self.weightedSketch.totalWeight)
		local var7 = 0
		
		for i, v in self.weightedSketch.weightTuples do
			var7 += v.weight
			
			if floored <= var7 then
				return v.value
			end
		end
	end
	return 0
end

return t