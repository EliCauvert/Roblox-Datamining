local BuildExperience = script:FindFirstAncestor("BuildExperience")
local CreateAppVisibilityTrackerModule = require(BuildExperience.Telemetry.createAppVisibilityTracker)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local SummarizeStepsModule = require(BuildExperience.Telemetry.summarizeSteps)

local function _()
	local Success, Result = pcall(function()
		return game:GetService("AppLifecycleObserverService")
	end)
	
	return if Success then Result else nil
end

local v1 = nil

local function getIsNeverHidden(): boolean
	return false
end

local function getWallClockSeconds()
	return DateTime.now().UnixTimestampMillis / 1000
end

return function(Callback, p1)
	-- upvalues: getWallClockSeconds (copy), v1 (ref), CreateAppVisibilityTrackerModule (copy), getIsNeverHidden (copy), SummarizeStepsModule (copy), SendBuildExperienceEventModule (copy)
	local P0 = p1 or {}
	local Now = P0.now or getWallClockSeconds
	local AppLifecycleObserverService = nil
	
	if P0.appLifecycleObserverService == nil then
		local Success, Result = pcall(function()
			return game:GetService("AppLifecycleObserverService")
		end)
		AppLifecycleObserverService = if Success then Result else nil
	else
		AppLifecycleObserverService = P0.appLifecycleObserverService
	end
	local IsAppHiddenFunction = nil
	
	if P0.isAppHidden == nil then
		if P0.appLifecycleObserverService == nil then
			if v1 == nil and AppLifecycleObserverService ~= nil then
				v1 = CreateAppVisibilityTrackerModule(AppLifecycleObserverService)
			end
			IsAppHiddenFunction = v1 or getIsNeverHidden
		else
			IsAppHiddenFunction = getIsNeverHidden
		end
	else
		IsAppHiddenFunction = P0.isAppHidden
	end
	local v2 = nil
	local Flag = false
	local IsNotLeft = false
	local Count = 0
	local Count1 = 0
	local Count2 = 0
	local t = {}
	local CombineStatsResult = SummarizeStepsModule.combineStats({})
	local t1 = {}
	local Count3 = 0
	local HeaderExpanded = false
	local NewLargest = 0
	local v3 = nil
	local v4 = 0
	local Count4 = 0
	local Tbl = {}
	
	local function _(): number
		-- upvalues: v3 (ref), NewLargest (ref), Now (copy)
		local v5 = v3
		
		return NewLargest + (if v5 == nil then 0 else math.max(0, Now() - v5))
	end
	
	local function watchVisibility()
		-- upvalues: Count4 (ref), IsAppHiddenFunction (ref), v3 (ref), Now (copy), AppLifecycleObserverService (copy), Tbl (copy), v2 (ref), Flag (ref), Count (ref), NewLargest (ref)
		Count4 += 1
		
		if Count4 > 1 then return end
		if IsAppHiddenFunction() then
			v3 = Now()
		end
		if AppLifecycleObserverService ~= nil then
			table.insert(Tbl, AppLifecycleObserverService.OnHide:Connect(function()
				-- upvalues: v3 (upval), Now (upval), v2 (upval), Flag (upval), Count (upval)
				if v3 == nil then
					v3 = Now()
					
					if v2 ~= nil and not Flag then
						Count += 1
					end
				end
			end))
			table.insert(Tbl, AppLifecycleObserverService.OnUnhide:Connect(function()
				-- upvalues: v3 (upval), NewLargest (upval), Now (upval)
				local v5 = v3
				
				if v5 ~= nil then
					NewLargest += math.max(0, Now() - v5)
					v3 = nil
				end
			end))
		end
	end
	
	local _ = function()
		-- upvalues: Count4 (ref), Tbl (copy), NewLargest (ref), v3 (ref)
		Count4 -= 1
		
		if Count4 > 0 then return end
		for _, Connection in Tbl do
			Connection:Disconnect()
		end
		table.clear(Tbl)
		NewLargest = 0
		v3 = nil
	end
	
	local function getCurrentStats()
		-- upvalues: t (copy), SummarizeStepsModule (upval)
		local List = {}
		
		for _, value in t do
			table.insert(List, value)
		end
		return SummarizeStepsModule.combineStats(List)
	end
	
	local _ = function()
		-- upvalues: t (copy), CombineStatsResult (ref), getCurrentStats (copy)
		return if next(t) == nil then CombineStatsResult else getCurrentStats()
	end
	
	local _ = function(): boolean
		-- upvalues: v2 (ref), IsNotLeft (ref)
		return v2 ~= nil and not IsNotLeft
	end
	
	local _ = function(Key, Identity)
		-- upvalues: t1 (copy), watchVisibility (copy), Now (copy), v3 (ref), NewLargest (ref)
		if t1[Key] == nil then
			watchVisibility()
			local v5 = v3
			t1[Key] = {
				openedAt = Now(),
				hiddenSecondsAtOpen = NewLargest + (if v5 == nil then 0 else math.max(0, Now() - v5)),
				identity = Identity
			}
			
			return
		end
	end
	
	local function closeSpan(StepName)
		-- upvalues: t1 (copy), Now (copy), v3 (ref), NewLargest (ref), Count4 (ref), Tbl (copy), v2 (ref), IsNotLeft (ref), SendBuildExperienceEventModule (upval), Callback (copy)
		local Entry = t1[StepName]
		
		if Entry == nil then return end
		local v5 = v3
		local NowResultDelta = Now() - Entry.openedAt - (NewLargest + (if v5 == nil then 0 else math.max(0, Now() - v5)) - Entry.hiddenSecondsAtOpen)
		t1[StepName] = nil
		Count4 -= 1
		
		if Count4 <= 0 then
			for _, Connection in Tbl do
				Connection:Disconnect()
			end
			table.clear(Tbl)
			NewLargest = 0
			v3 = nil
		end
		local Copy = table.clone(Entry.identity)
		Copy.openMs = tostring((math.round(math.clamp(NowResultDelta, 0, 1800) * 1000)))
		Copy.whileRunning = tostring(v2 ~= nil and not IsNotLeft)
		SendBuildExperienceEventModule("TURN_WORK_OPEN_TIME", Callback(), Copy)
	end
	
	return {
		start = function()
			-- upvalues: v2 (ref), Flag (ref), Now (copy), watchVisibility (copy), v4 (ref), v3 (ref), NewLargest (ref), Count (ref)
			if v2 ~= nil or Flag then return end
			v2 = Now()
			watchVisibility()
			local v6 = v3
			v4 = NewLargest + (if v6 == nil then 0 else math.max(0, Now() - v6))
			
			if v3 ~= nil then
				Count += 1
			end
		end,
		finish = function(p2)
			-- upvalues: v2 (ref), Flag (ref), v3 (ref), NewLargest (ref), Now (copy), v4 (ref), IsNotLeft (ref), Count4 (ref), Tbl (copy), t (copy), CombineStatsResult (ref), SummarizeStepsModule (upval), SendBuildExperienceEventModule (upval), Callback (copy), Count (ref), HeaderExpanded (ref), Count1 (ref), Count2 (ref)
			local v6 = v2
			
			if v6 == nil or Flag then return end
			local v7 = v3
			local Largest = math.max(0, NewLargest + (if v7 == nil then 0 else math.max(0, Now() - v7)) - v4)
			Flag = true
			IsNotLeft = p2 ~= "left"
			Count4 -= 1
			
			if Count4 <= 0 then
				for _, Connection in Tbl do
					Connection:Disconnect()
				end
				table.clear(Tbl)
				NewLargest = 0
				v3 = nil
			end
			local Largest1 = math.max(0, (math.round((Now() - v6) * 1000)))
			local Smallest = math.min(Largest1, (math.round(Largest * 1000)))
			local CombineStatsResult1 = nil
			
			if next(t) == nil then
				CombineStatsResult1 = CombineStatsResult
			else
				local List = {}
				
				for _, value in t do
					table.insert(List, value)
				end
				CombineStatsResult1 = SummarizeStepsModule.combineStats(List)
			end
			SendBuildExperienceEventModule("TURN_WORK_FINISHED", Callback(), {
				completed = tostring(p2 == "completed"),
				outcome = tostring(p2),
				turnMs = tostring(Largest1),
				foregroundMs = tostring(Largest1 - Smallest),
				backgroundMs = tostring(Smallest),
				backgroundCount = tostring(Count),
				stepCount = tostring(CombineStatsResult1.count),
				titleHeading = tostring(CombineStatsResult1.titleSources.heading or 0),
				titleSummary = tostring(CombineStatsResult1.titleSources.summary or 0),
				titleFallback = tostring(CombineStatsResult1.titleSources.fallback or 0),
				titleFailed = tostring(CombineStatsResult1.titleSources.failed or 0),
				titleAskedUser = tostring(CombineStatsResult1.titleSources.askedUser or 0),
				fallbackTools = SummarizeStepsModule.joinFallbackTools(CombineStatsResult1.fallbackTools),
				headerExpanded = tostring(HeaderExpanded),
				headerToggleCount = tostring(Count1),
				stepToggleCount = tostring(Count2)
			})
		end,
		setSegmentSteps = function(Key, p3)
			-- upvalues: t (copy), CombineStatsResult (ref), SummarizeStepsModule (upval)
			if p3 == nil then
				t[Key] = nil
				
				return
			end
			t[Key] = p3
			local List = {}
			
			for _, value in t do
				table.insert(List, value)
			end
			CombineStatsResult = SummarizeStepsModule.combineStats(List)
		end,
		setHeaderExpanded = function(Value)
			-- upvalues: HeaderExpanded (ref)
			HeaderExpanded = Value
		end,
		recordHeaderToggle = function(p4)
			-- upvalues: Count1 (ref), SendBuildExperienceEventModule (upval), Callback (copy), v2 (ref), IsNotLeft (ref), t (copy), SummarizeStepsModule (upval)
			Count1 += 1
			local v8 = "TURN_WORK_TOGGLE"
			local CallbackResult = Callback()
			local config = {
				target = "header",
				expanded = tostring(p4),
				whileRunning = tostring(v2 ~= nil and not IsNotLeft)
			}
			local List = {}
			
			for _, value in t do
				table.insert(List, value)
			end
			config.stepCount = tostring(SummarizeStepsModule.combineStats(List).count)
			SendBuildExperienceEventModule(v8, CallbackResult, config)
		end,
		recordStepToggle = function(p5, p6)
			-- upvalues: Count2 (ref), SendBuildExperienceEventModule (upval), Callback (copy), v2 (ref), IsNotLeft (ref), t (copy), SummarizeStepsModule (upval)
			Count2 += 1
			local v9 = "TURN_WORK_TOGGLE"
			local CallbackResult = Callback()
			local config = {
				target = "step",
				stepIndex = tostring(p5),
				expanded = tostring(p6),
				whileRunning = tostring(v2 ~= nil and not IsNotLeft)
			}
			local List = {}
			
			for _, value in t do
				table.insert(List, value)
			end
			config.stepCount = tostring(SummarizeStepsModule.combineStats(List).count)
			SendBuildExperienceEventModule(v9, CallbackResult, config)
		end,
		markTurnDone = function()
			-- upvalues: IsNotLeft (ref)
			IsNotLeft = true
		end,
		openHeaderSpan = function()
			-- upvalues: t1 (copy), watchVisibility (copy), Now (copy), v3 (ref), NewLargest (ref)
			local Identity = { target = "header" }
			
			if t1.header == nil then
				watchVisibility()
				local v10 = v3
				t1.header = {
					openedAt = Now(),
					hiddenSecondsAtOpen = NewLargest + (if v10 == nil then 0 else math.max(0, Now() - v10)),
					identity = Identity
				}
				
				return
			end
		end,
		closeHeaderSpan = function()
			-- upvalues: closeSpan (copy)
			closeSpan("header")
		end,
		openStepSpan = function(p7): number
			-- upvalues: Count3 (ref), t1 (copy), watchVisibility (copy), Now (copy), v3 (ref), NewLargest (ref)
			Count3 += 1
			local StepName: string = `step{Count3}`
			local Identity = { target = "step", stepIndex = tostring(p7) }
			
			if t1[StepName] == nil then
				watchVisibility()
				local v10 = v3
				t1[StepName] = {
					openedAt = Now(),
					hiddenSecondsAtOpen = NewLargest + (if v10 == nil then 0 else math.max(0, Now() - v10)),
					identity = Identity
				}
			end
			return Count3
		end,
		closeStepSpan = function(p7)
			-- upvalues: closeSpan (copy)
			closeSpan(`step{p7}`)
		end
	}
end