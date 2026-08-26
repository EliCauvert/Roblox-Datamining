local function _(p1, p2, p3)
	p1 = p1 or p2
	assert(p1 >= 1 and p1 % 1 == 0, `{p3} must be a positive integer`)
	
	return p1
end

local _ = function(p1, p2, p3)
	p1 = p1 or p2
	assert(p1 >= 0 and p1 % 1 == 0, `{p3} must be a non-negative integer`)
	
	return p1
end

local _ = function(p1)
	local p6Count = #p1
	local floored = math.floor(p6Count / 2)
	
	return if p6Count % 2 == 1 then p1[floored + 1] else (p1[floored] + p1[floored + 1]) / 2
end

local _ = function(p1, p2)
	return p1[math.clamp(math.ceil(#p1 * p2), 1, #p1)]
end

local _ = function(p1)
	local p9Count = #p1
	
	if p9Count < 2 then
		return p1[1], p1[1]
	end
	local var1 = (p9Count + 1) / 2
	local var2 = math.sqrt(p9Count) * 1.95996398454 / 2
	
	return p1[math.clamp(math.floor(var1 - var2), 1, p9Count)], p1[math.clamp(math.ceil(var1 + var2), 1, p9Count)]
end

local function bootstrapMedianConfidenceInterval(p1, p2, p3)
	if #p1 < 2 or p2 == 0 then
		local var1 = p1[1] or 0
		
		return var1, var1
	end
	local random = Random.new(p3)
	local list = table.create(p2)
	local list_1 = table.create(#p1)
	
	for i_1 = 1, p2 do
		local i
		for i = 1, #p1 do
			list_1[i] = p1[random:NextInteger(1, #p1)]
		end
		table.sort(list_1)
		local list_1Count = #list_1
		i = math.floor(list_1Count / 2)
		list[i_1] = if list_1Count % 2 == 1 then list_1[i + 1] else (list_1[i] + list_1[i + 1]) / 2
	end
	table.sort(list)
	
	return list[math.clamp(math.ceil(#list * 0.025), 1, #list)], list[math.clamp(math.ceil(#list * 0.975), 1, #list)]
end

local function distribution(p4)
	local cloned = table.clone(p4)
	table.sort(cloned)
	local var2 = 0
	
	for i, v in cloned do
		var2 += v
	end
	local var3 = var2 / #cloned
	local var4 = 0
	
	for i_1, v_1 in cloned do
		local var5 = v_1 - var3
		var4 += var5 * var5
	end
	local var6 = if #cloned > 1 then math.sqrt(var4 / (#cloned - 1)) else 0
	local var7 = cloned[math.clamp(math.ceil(#cloned * 0.75), 1, #cloned)]
	local var8 = var7 + (var7 - cloned[math.clamp(math.ceil(#cloned * 0.25), 1, #cloned)]) * 1.5
	local var9 = 0
	
	for i_2, v_2 in cloned do
		if var8 < v_2 then
			var9 += 1
		end
	end
	return cloned, var3, var6, var9
end

local function run(p5, p6)
	-- upvalues: distribution (ref), bootstrapMedianConfidenceInterval (ref)
	p6 = p6 or {}
	local sampleCount = p6.sampleCount
	
	if sampleCount ~= nil then
		local sampleCount_1 = sampleCount or 1
		assert(sampleCount_1 >= 1 and sampleCount_1 % 1 == 0, "sampleCount must be a positive integer")
		sampleCount = sampleCount_1
	end
	local minSampleCount = p6.minSampleCount or 30
	assert(minSampleCount >= 1 and minSampleCount % 1 == 0, "minSampleCount must be a positive integer")
	local maxSampleCount = p6.maxSampleCount or 200
	assert(maxSampleCount >= 1 and maxSampleCount % 1 == 0, "maxSampleCount must be a positive integer")
	local warmupCount = p6.warmupCount or 5
	assert(warmupCount >= 0 and warmupCount % 1 == 0, "warmupCount must be a non-negative integer")
	local targetRelativeHalfWidth = p6.targetRelativeHalfWidth or 0.05
	local convergenceCheckInterval = p6.convergenceCheckInterval or 10
	assert(convergenceCheckInterval >= 1 and convergenceCheckInterval % 1 == 0, "convergenceCheckInterval must be a positive integer")
	local timeBudgetSeconds = p6.timeBudgetSeconds or 5
	local bootstrapResamples = p6.bootstrapResamples or 500
	assert(bootstrapResamples >= 0 and bootstrapResamples % 1 == 0, "bootstrapResamples must be a non-negative integer")
	local randomSeed = p6.randomSeed or 20260802
	local clock = p6.clock or os.clock
	assert(minSampleCount <= maxSampleCount, "minSampleCount must not exceed maxSampleCount")
	assert(targetRelativeHalfWidth > 0, "targetRelativeHalfWidth must be positive")
	assert(timeBudgetSeconds > 0, "timeBudgetSeconds must be positive")
	
	for _ = 1, warmupCount do
		p5()
	end
	local t = {}
	local var10 = clock()
	local var11 = if sampleCount ~= nil then "maxSampleCount" else "fixedSampleCount"
	while #t < (sampleCount or maxSampleCount) do
		table.insert(t, p5())
		
		if sampleCount ~= nil or minSampleCount > #t then continue end
		if #t % convergenceCheckInterval == 0 then
			local cloned = table.clone(t)
			table.sort(cloned)
			local clonedCount = #cloned
			local floored = math.floor(clonedCount / 2)
			local var12 = if clonedCount % 2 == 1 then cloned[floored + 1] else (cloned[floored] + cloned[floored + 1]) / 2
			local clonedCount_1 = #cloned
			
			if clonedCount_1 < 2 then
				clonedCount = cloned[1]
				floored = cloned[1]
			else
				local var13 = (clonedCount_1 + 1) / 2
				local var14 = math.sqrt(clonedCount_1) * 1.95996398454 / 2
				clonedCount = cloned[math.clamp(math.floor(var13 - var14), 1, clonedCount_1)]
				floored = cloned[math.clamp(math.ceil(var13 + var14), 1, clonedCount_1)]
			end
			if (if var12 > 0 then (floored - clonedCount) / 2 / var12 else 1e999) <= targetRelativeHalfWidth then
				var11 = "converged"
				break
			elseif timeBudgetSeconds > clock() - var10 then
				continue
			else
				var11 = "timeBudget"
				break
			end
		end
	end
	local var15 = clock() - var10
	local var16, var17, var18, var19 = distribution(t)
	local var20, var21 = bootstrapMedianConfidenceInterval(t, bootstrapResamples, randomSeed)
	local t_1 = {
		iterationsPerSample = 1,
		sampleCount = #t,
		warmupCount = warmupCount
	}
	local var46Count = #var16
	local floored = math.floor(var46Count / 2)
	t_1.medianMs = if var46Count % 2 == 1 then var16[floored + 1] else (var16[floored] + var16[floored + 1]) / 2
	t_1.medianCiLowMs = var20
	t_1.medianCiHighMs = var21
	t_1.p95Ms = var16[math.clamp(math.ceil(#var16 * 0.95), 1, #var16)]
	t_1.p99Ms = var16[math.clamp(math.ceil(#var16 * 0.99), 1, #var16)]
	t_1.minMs = var16[1]
	t_1.maxMs = var16[#var16]
	t_1.meanMs = var17
	t_1.stddevMs = var18
	t_1.cvPercent = if var17 > 0 then var18 / var17 * 100 else 0
	t_1.outlierCount = var19
	t_1.stopReason = var11
	t_1.elapsedSeconds = var15
	
	return t_1
end

return {
	run = run,
	measure = function(p7, p8)
		-- upvalues: run (ref)
		p8 = p8 or {}
		local targetSampleMs = p8.targetSampleMs or 10
		local maxIterationsPerSample = p8.maxIterationsPerSample or 100
		assert(maxIterationsPerSample >= 1 and maxIterationsPerSample % 1 == 0, "maxIterationsPerSample must be a positive integer")
		local var22 = maxIterationsPerSample
		local clock = p8.clock or os.clock
		assert(targetSampleMs > 0, "targetSampleMs must be positive")
		local iterationsPerSample = p8.iterationsPerSample
		
		if iterationsPerSample == nil then
			local var23 = clock()
			p7()
			iterationsPerSample = math.clamp(math.ceil(targetSampleMs / math.max((clock() - var23) * 1000, 0.001)), 1, var22)
		else
			local iterationsPerSample_1 = iterationsPerSample or 1
			assert(iterationsPerSample_1 >= 1 and iterationsPerSample_1 % 1 == 0, "iterationsPerSample must be a positive integer")
			iterationsPerSample = iterationsPerSample_1
		end
		local var24 = run(function()
			-- upvalues: clock (ref), iterationsPerSample (write), p7 (ref)
			local var25 = clock()
			
			for _ = 1, iterationsPerSample do
				p7()
			end
			return (clock() - var25) * 1000 / iterationsPerSample
		end, p8)
		var24.iterationsPerSample = iterationsPerSample
		
		return var24
	end
}