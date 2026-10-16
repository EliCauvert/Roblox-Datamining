local function _(p1, p2, p3) --[[ Line: 49 | Named "positiveInteger" ]]
	local P0 = p1 or p2
	assert(P0 >= 1 and P0 % 1 == 0, `{p3} must be a positive integer`)
	
	return P0
end

local _ = function(p1, p2, p3) --[[ Line: 55 | Named "nonNegativeInteger" ]]
	local P3 = p1 or p2
	assert(P3 >= 0 and P3 % 1 == 0, `{p3} must be a non-negative integer`)
	
	return P3
end

local _ = function(p1) --[[ Line: 61 | Named "median" ]]
	local CountP6 = #p1
	local Floored = math.floor(CountP6 / 2)
	
	return if CountP6 % 2 == 1 then p1[Floored + 1] else (p1[Floored] + p1[Floored + 1]) / 2
end

local _ = function(p1, p2) --[[ Line: 70 | Named "percentile" ]]
	return p1[math.clamp(math.ceil(#p1 * p2), 1, #p1)]
end

local _ = function(Entry) --[[ Line: 75 | Named "medianConfidenceInterval" ]]
	local CountEntry = #Entry
	
	if CountEntry < 2 then
		return Entry[1], Entry[1]
	else
		local CountEntryRatio = (CountEntry + 1) / 2
		local SquareRootRatio = math.sqrt(CountEntry) * 1.959963984540054 / 2
		
		return Entry[math.clamp(math.floor(CountEntryRatio - SquareRootRatio), 1, CountEntry)], Entry[math.clamp(math.ceil(CountEntryRatio + SquareRootRatio), 1, CountEntry)]
	end
end

local function bootstrapMedianConfidenceInterval(Entry, BootstrapResamples, RandomSeed) --[[ Line: 87 ]]
	if #Entry < 2 or BootstrapResamples == 0 then
		local Entry1 = Entry[1] or 0
		
		return Entry1, Entry1
	end
	local _Random = Random.new(RandomSeed)
	local Buffer = table.create(BootstrapResamples)
	local Buffer1 = table.create(#Entry)
	
	for i = 1, BootstrapResamples do
		for i1 = 1, #Entry do
			Buffer1[i1] = Entry[_Random:NextInteger(1, #Entry)]
		end
		table.sort(Buffer1)
		local CountBuffer1 = #Buffer1
		local Floored = math.floor(CountBuffer1 / 2)
		Buffer[i] = if CountBuffer1 % 2 == 1 then Buffer1[Floored + 1] else (Buffer1[Floored] + Buffer1[Floored + 1]) / 2
	end
	table.sort(Buffer)
	
	return Buffer[math.clamp(math.ceil(#Buffer * 0.025), 1, #Buffer)], Buffer[math.clamp(math.ceil(#Buffer * 0.975), 1, #Buffer)]
end

local function distribution(Tbl) --[[ Line: 110 ]]
	local Copy = table.clone(Tbl)
	table.sort(Copy)
	local Total = 0
	
	for _, value in Copy do
		Total += value
	end
	local TotalRatio = Total / #Copy
	local Total1 = 0
	
	for _, value1 in Copy do
		local v1 = value1 - TotalRatio
		Total1 += v1 * v1
	end
	local SquareRoot: number = if #Copy > 1 then math.sqrt(Total1 / (#Copy - 1)) else 0
	local Entry = Copy[math.clamp(math.ceil(#Copy * 0.75), 1, #Copy)]
	local NewEntry = Entry + (Entry - Copy[math.clamp(math.ceil(#Copy * 0.25), 1, #Copy)]) * 1.5
	local Count = 0
	
	for _, value2 in Copy do
		if NewEntry < value2 then
			Count += 1
		end
	end
	return Copy, TotalRatio, SquareRoot, Count
end

local function run(Callback, p1) --[[ Line: 136 ]]
	-- upvalues: distribution (copy), bootstrapMedianConfidenceInterval (copy)
	local P11 = p1 or {}
	local SampleCount = P11.sampleCount
	
	if SampleCount ~= nil then
		local SampleCount1 = SampleCount or 1
		assert(SampleCount1 >= 1 and SampleCount1 % 1 == 0, "sampleCount must be a positive integer")
		SampleCount = SampleCount1
	end
	local MinSampleCount = P11.minSampleCount or 30
	assert(MinSampleCount >= 1 and MinSampleCount % 1 == 0, "minSampleCount must be a positive integer")
	local MaxSampleCount = P11.maxSampleCount or 200
	assert(MaxSampleCount >= 1 and MaxSampleCount % 1 == 0, "maxSampleCount must be a positive integer")
	local WarmupCount = P11.warmupCount or 5
	assert(WarmupCount >= 0 and WarmupCount % 1 == 0, "warmupCount must be a non-negative integer")
	local TargetRelativeHalfWidth = P11.targetRelativeHalfWidth or 0.05
	local ConvergenceCheckInterval = P11.convergenceCheckInterval or 10
	assert(ConvergenceCheckInterval >= 1 and ConvergenceCheckInterval % 1 == 0, "convergenceCheckInterval must be a positive integer")
	local TimeBudgetSeconds = P11.timeBudgetSeconds or 5
	local BootstrapResamples = P11.bootstrapResamples or 500
	assert(BootstrapResamples >= 0 and BootstrapResamples % 1 == 0, "bootstrapResamples must be a non-negative integer")
	local RandomSeed = P11.randomSeed or 20260802
	local Clock = P11.clock or os.clock
	assert(MinSampleCount <= MaxSampleCount, "minSampleCount must not exceed maxSampleCount")
	assert(TargetRelativeHalfWidth > 0, "targetRelativeHalfWidth must be positive")
	assert(TimeBudgetSeconds > 0, "timeBudgetSeconds must be positive")
	
	for _ = 1, WarmupCount do
		Callback()
	end
	local List = {}
	local ClockResult = Clock()
	local MaxSampleCount1: string = if SampleCount == nil then "maxSampleCount" else "fixedSampleCount"
	while #List < (SampleCount or MaxSampleCount) do
		table.insert(List, Callback())
		
		if SampleCount ~= nil or MinSampleCount > #List then continue end
		if #List % ConvergenceCheckInterval == 0 then
			local Copy = table.clone(List)
			table.sort(Copy)
			local CountCopy = #Copy
			local Floored = math.floor(CountCopy / 2)
			local Entry = if CountCopy % 2 == 1 then Copy[Floored + 1] else (Copy[Floored] + Copy[Floored + 1]) / 2
			local CountCopy1 = #Copy
			local Entry1 = nil
			local Entry2 = nil
			
			if CountCopy1 < 2 then
				Entry1 = Copy[1]
				Entry2 = Copy[1]
			else
				local CountCopyRatio = (CountCopy1 + 1) / 2
				local SquareRootRatio = math.sqrt(CountCopy1) * 1.959963984540054 / 2
				Entry1 = Copy[math.clamp(math.floor(CountCopyRatio - SquareRootRatio), 1, CountCopy1)]
				Entry2 = Copy[math.clamp(math.ceil(CountCopyRatio + SquareRootRatio), 1, CountCopy1)]
			end
			if (if Entry > 0 then (Entry2 - Entry1) / 2 / Entry else 1e999) <= TargetRelativeHalfWidth then
				MaxSampleCount1 = "converged"
				break
			end
		end
		if TimeBudgetSeconds > Clock() - ClockResult then continue end
		MaxSampleCount1 = "timeBudget"
		break
	end
	local ClockResultDelta = Clock() - ClockResult
	local DistributionResult, DistributionResult2, DistributionResult3, DistributionResult4 = distribution(List)
	local BootstrapMedianConfidenceIntervalResult, BootstrapMedianConfidenceIntervalResult2 = bootstrapMedianConfidenceInterval(List, BootstrapResamples, RandomSeed)
	local CountDistributionResult = #DistributionResult
	local Floored = math.floor(CountDistributionResult / 2)
	
	return {
		iterationsPerSample = 1,
		sampleCount = #List,
		warmupCount = WarmupCount,
		medianMs = if CountDistributionResult % 2 == 1 then DistributionResult[Floored + 1] else (DistributionResult[Floored] + DistributionResult[Floored + 1]) / 2,
		medianCiLowMs = BootstrapMedianConfidenceIntervalResult,
		medianCiHighMs = BootstrapMedianConfidenceIntervalResult2,
		p95Ms = DistributionResult[math.clamp(math.ceil(#DistributionResult * 0.95), 1, #DistributionResult)],
		p99Ms = DistributionResult[math.clamp(math.ceil(#DistributionResult * 0.99), 1, #DistributionResult)],
		minMs = DistributionResult[1],
		maxMs = DistributionResult[#DistributionResult],
		meanMs = DistributionResult2,
		stddevMs = DistributionResult3,
		cvPercent = if DistributionResult2 > 0 then DistributionResult3 / DistributionResult2 * 100 else 0,
		outlierCount = DistributionResult4,
		stopReason = MaxSampleCount1,
		elapsedSeconds = ClockResultDelta
	}
end

return {
	run = run,
	measure = function(Callback: () -> (), p2) --[[ Line: 213 ]]
		-- upvalues: run (copy)
		local P12 = p2 or {}
		local TargetSampleMs = P12.targetSampleMs or 10
		local MaxIterationsPerSample = P12.maxIterationsPerSample or 100
		assert(MaxIterationsPerSample >= 1 and MaxIterationsPerSample % 1 == 0, "maxIterationsPerSample must be a positive integer")
		local MaxValue: number = MaxIterationsPerSample
		local Clock = P12.clock or os.clock
		assert(TargetSampleMs > 0, "targetSampleMs must be positive")
		local IterationsPerSample = P12.iterationsPerSample
		local ClampedValue = nil
		
		if IterationsPerSample == nil then
			local ClockResult = Clock()
			Callback()
			ClampedValue = math.clamp(math.ceil(TargetSampleMs / math.max((Clock() - ClockResult) * 1000, 0.001)), 1, MaxValue)
		else
			local IterationsPerSample1 = IterationsPerSample or 1
			assert(IterationsPerSample1 >= 1 and IterationsPerSample1 % 1 == 0, "iterationsPerSample must be a positive integer")
			ClampedValue = IterationsPerSample1
		end
		local RunResult = run(function() --[[ Line: 231 ]]
			-- upvalues: Clock (copy), ClampedValue (ref), Callback (copy)
			local ClockResult = Clock()
			
			for _ = 1, ClampedValue do
				Callback()
			end
			return (Clock() - ClockResult) * 1000 / ClampedValue
		end, P12)
		RunResult.iterationsPerSample = ClampedValue
		
		return RunResult
	end
}