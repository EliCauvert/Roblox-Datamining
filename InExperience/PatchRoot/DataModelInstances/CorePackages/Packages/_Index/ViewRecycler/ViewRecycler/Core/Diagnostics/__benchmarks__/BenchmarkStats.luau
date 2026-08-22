local function _(p0, p1, p2) --[[ line: 49 | named "positiveInteger" ]]
	p0 = p0 or p1
	assert(p0 >= 1 and p0 % 1 == 0, `{p2} must be a positive integer`)
	
	return p0
end

local _ = function(p3, p4, p5) --[[ line: 55 | named "nonNegativeInteger" ]]
	p3 = p3 or p4
	assert(p3 >= 0 and p3 % 1 == 0, `{p5} must be a non-negative integer`)
	
	return p3
end

local _ = function(p6) --[[ line: 61 | named "median" ]]
	local p6Count = #p6
	local floored = math.floor(p6Count / 2)
	
	return if p6Count % 2 == 1 then p6[floored + 1] else (p6[floored] + p6[floored + 1]) / 2
end

local _ = function(p7, p8) --[[ line: 70 | named "percentile" ]]
	return p7[math.clamp(math.ceil(#p7 * p8), 1, #p7)]
end

local _ = function(p9) --[[ line: 75 | named "medianConfidenceInterval" ]]
	local p9Count = #p9
	
	if p9Count < 2 then
		return p9[1], p9[1]
	end
	local var8 = (p9Count + 1) / 2
	local var9 = math.sqrt(p9Count) * 1.95996398454 / 2
	
	return p9[math.clamp(math.floor(var8 - var9), 1, p9Count)], p9[math.clamp(math.ceil(var8 + var9), 1, p9Count)]
end

local function bootstrapMedianConfidenceInterval(p10, p11, p12) --[[ line: 87 ]]
	if #p10 < 2 or p11 == 0 then
		local var10 = p10[1] or 0
		
		return var10, var10
	end
	local random = Random.new(p12)
	local list = table.create(p11)
	local list_1 = table.create(#p10)
	
	for i_1 = 1, p11 do
		local i
		for i = 1, #p10 do
			list_1[i] = p10[random:NextInteger(1, #p10)]
		end
		table.sort(list_1)
		local list_1Count = #list_1
		i = math.floor(list_1Count / 2)
		list[i_1] = if list_1Count % 2 == 1 then list_1[i + 1] else (list_1[i] + list_1[i + 1]) / 2
	end
	table.sort(list)
	
	return list[math.clamp(math.ceil(#list * 0.025), 1, #list)], list[math.clamp(math.ceil(#list * 0.975), 1, #list)]
end

local function distribution(p13) --[[ line: 110 ]]
	local cloned = table.clone(p13)
	table.sort(cloned)
	local var16 = 0
	
	for i, v in cloned do
		var16 += v
	end
	local var17 = var16 / #cloned
	local var18 = 0
	
	for i_1, v_1 in cloned do
		local var23 = v_1 - var17
		var18 += var23 * var23
	end
	local var19 = if #cloned > 1 then math.sqrt(var18 / (#cloned - 1)) else 0
	local var20 = cloned[math.clamp(math.ceil(#cloned * 0.75), 1, #cloned)]
	local var21 = var20 + (var20 - cloned[math.clamp(math.ceil(#cloned * 0.25), 1, #cloned)]) * 1.5
	local var22 = 0
	
	for i_2, v_2 in cloned do
		if var21 < v_2 then
			var22 += 1
		end
	end
	return cloned, var17, var19, var22
end

local function run(p14, p15) --[[ line: 136 ]]
	-- upvalues: distribution (ref), bootstrapMedianConfidenceInterval (ref)
	p15 = p15 or {}
	local sampleCount = p15.sampleCount
	
	if sampleCount ~= nil then
		local sampleCount_1 = sampleCount or 1
		assert(sampleCount_1 >= 1 and sampleCount_1 % 1 == 0, "sampleCount must be a positive integer")
		sampleCount = sampleCount_1
	end
	local minSampleCount = p15.minSampleCount or 30
	assert(minSampleCount >= 1 and minSampleCount % 1 == 0, "minSampleCount must be a positive integer")
	local maxSampleCount = p15.maxSampleCount or 200
	assert(maxSampleCount >= 1 and maxSampleCount % 1 == 0, "maxSampleCount must be a positive integer")
	local warmupCount = p15.warmupCount or 5
	assert(warmupCount >= 0 and warmupCount % 1 == 0, "warmupCount must be a non-negative integer")
	local targetRelativeHalfWidth = p15.targetRelativeHalfWidth or 0.05
	local convergenceCheckInterval = p15.convergenceCheckInterval or 10
	assert(convergenceCheckInterval >= 1 and convergenceCheckInterval % 1 == 0, "convergenceCheckInterval must be a positive integer")
	local timeBudgetSeconds = p15.timeBudgetSeconds or 5
	local bootstrapResamples = p15.bootstrapResamples or 500
	assert(bootstrapResamples >= 0 and bootstrapResamples % 1 == 0, "bootstrapResamples must be a non-negative integer")
	local randomSeed = p15.randomSeed or 20260802
	local clock = p15.clock or os.clock
	assert(minSampleCount <= maxSampleCount, "minSampleCount must not exceed maxSampleCount")
	assert(targetRelativeHalfWidth > 0, "targetRelativeHalfWidth must be positive")
	assert(timeBudgetSeconds > 0, "timeBudgetSeconds must be positive")
	
	for _ = 1, warmupCount do
		p14()
	end
	local t = {}
	local var36 = clock()
	local var37 = if sampleCount ~= nil then "maxSampleCount" else "fixedSampleCount"
	while #t < (sampleCount or maxSampleCount) do
		table.insert(t, p14())
		
		if sampleCount ~= nil or minSampleCount > #t then continue end
		if #t % convergenceCheckInterval == 0 then
			local cloned = table.clone(t)
			table.sort(cloned)
			local clonedCount = #cloned
			local floored = math.floor(clonedCount / 2)
			local var41 = if clonedCount % 2 == 1 then cloned[floored + 1] else (cloned[floored] + cloned[floored + 1]) / 2
			local clonedCount_1 = #cloned
			
			if clonedCount_1 < 2 then
				clonedCount = cloned[1]
				floored = cloned[1]
			else
				local var43 = (clonedCount_1 + 1) / 2
				local var44 = math.sqrt(clonedCount_1) * 1.95996398454 / 2
				clonedCount = cloned[math.clamp(math.floor(var43 - var44), 1, clonedCount_1)]
				floored = cloned[math.clamp(math.ceil(var43 + var44), 1, clonedCount_1)]
			end
			if (if var41 > 0 then (floored - clonedCount) / 2 / var41 else 1e999) <= targetRelativeHalfWidth then
				var37 = "converged"
				break
			elseif timeBudgetSeconds > clock() - var36 then
				continue
			else
				var37 = "timeBudget"
				break
			end
		end
	end
	local var45 = clock() - var36
	local var46, var47, var48, var49 = distribution(t)
	local var50, var51 = bootstrapMedianConfidenceInterval(t, bootstrapResamples, randomSeed)
	local t_1 = {
		iterationsPerSample = 1,
		sampleCount = #t,
		warmupCount = warmupCount
	}
	local var46Count = #var46
	local floored = math.floor(var46Count / 2)
	t_1.medianMs = if var46Count % 2 == 1 then var46[floored + 1] else (var46[floored] + var46[floored + 1]) / 2
	t_1.medianCiLowMs = var50
	t_1.medianCiHighMs = var51
	t_1.p95Ms = var46[math.clamp(math.ceil(#var46 * 0.95), 1, #var46)]
	t_1.p99Ms = var46[math.clamp(math.ceil(#var46 * 0.99), 1, #var46)]
	t_1.minMs = var46[1]
	t_1.maxMs = var46[#var46]
	t_1.meanMs = var47
	t_1.stddevMs = var48
	t_1.cvPercent = if var47 > 0 then var48 / var47 * 100 else 0
	t_1.outlierCount = var49
	t_1.stopReason = var37
	t_1.elapsedSeconds = var45
	
	return t_1
end

return {
	run = run,
	measure = function(p16, p17) --[[ line: 213 ]]
		-- upvalues: run (ref)
		p17 = p17 or {}
		local targetSampleMs = p17.targetSampleMs or 10
		local maxIterationsPerSample = p17.maxIterationsPerSample or 100
		assert(maxIterationsPerSample >= 1 and maxIterationsPerSample % 1 == 0, "maxIterationsPerSample must be a positive integer")
		local var58 = maxIterationsPerSample
		local clock = p17.clock or os.clock
		assert(targetSampleMs > 0, "targetSampleMs must be positive")
		local iterationsPerSample = p17.iterationsPerSample
		
		if iterationsPerSample == nil then
			local var60 = clock()
			p16()
			iterationsPerSample = math.clamp(math.ceil(targetSampleMs / math.max((clock() - var60) * 1000, 0.001)), 1, var58)
		else
			local iterationsPerSample_1 = iterationsPerSample or 1
			assert(iterationsPerSample_1 >= 1 and iterationsPerSample_1 % 1 == 0, "iterationsPerSample must be a positive integer")
			iterationsPerSample = iterationsPerSample_1
		end
		local var62 = run(function() --[[ line: 231 ]]
			-- upvalues: clock (ref), iterationsPerSample (write), p16 (ref)
			local var63 = clock()
			
			for _ = 1, iterationsPerSample do
				p16()
			end
			return (clock() - var63) * 1000 / iterationsPerSample
		end, p17)
		var62.iterationsPerSample = iterationsPerSample
		
		return var62
	end
}