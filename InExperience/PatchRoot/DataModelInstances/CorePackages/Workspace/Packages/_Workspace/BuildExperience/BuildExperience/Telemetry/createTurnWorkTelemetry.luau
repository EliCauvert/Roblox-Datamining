local BuildExperience = script:FindFirstAncestor("BuildExperience")
local CreateAppVisibilityTrackerModule = require(BuildExperience.Telemetry.createAppVisibilityTracker)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)

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
	-- upvalues: getWallClockSeconds (copy), v1 (ref), CreateAppVisibilityTrackerModule (copy), getIsNeverHidden (copy), SendBuildExperienceEventModule (copy)
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
	local v3 = nil
	local NewLargest = 0
	local Count = 0
	local Count1 = 0
	local Count2 = 0
	local Amounts = {}
	local v4 = 0
	local HeaderExpanded = false
	local List = {}
	
	local function closeBackground()
		-- upvalues: v3 (ref), NewLargest (ref), Now (copy)
		if v3 ~= nil then
			NewLargest += math.max(0, Now() - v3)
			v3 = nil
		end
	end
	
	local function _(): number
		-- upvalues: Amounts (copy)
		local Total = 0
		
		for _, amount in Amounts do
			Total += amount
		end
		return Total
	end
	
	local _ = function(): boolean
		-- upvalues: v2 (ref), Flag (ref)
		return v2 ~= nil and not Flag
	end
	
	return {
		start = function()
			-- upvalues: v2 (ref), Flag (ref), Now (copy), IsAppHiddenFunction (ref), v3 (ref), Count (ref), AppLifecycleObserverService (copy), List (copy), closeBackground (copy)
			if v2 ~= nil or Flag then return end
			v2 = Now()
			
			if IsAppHiddenFunction() then
				v3 = v2
				Count += 1
			end
			if AppLifecycleObserverService ~= nil then
				table.insert(List, AppLifecycleObserverService.OnHide:Connect(function()
					-- upvalues: v3 (upval), Now (upval), Count (upval)
					if v3 == nil then
						v3 = Now()
						Count += 1
					end
				end))
				table.insert(List, AppLifecycleObserverService.OnUnhide:Connect(closeBackground))
			end
		end,
		finish = function(p2)
			-- upvalues: v2 (ref), Flag (ref), List (copy), v3 (ref), NewLargest (ref), Now (copy), SendBuildExperienceEventModule (upval), Callback (copy), Count (ref), Amounts (copy), v4 (ref), HeaderExpanded (ref), Count1 (ref), Count2 (ref)
			local v5 = v2
			
			if v5 == nil or Flag then return end
			Flag = true
			
			for _, Connection in List do
				Connection:Disconnect()
			end
			table.clear(List)
			
			if v3 ~= nil then
				NewLargest += math.max(0, Now() - v3)
				v3 = nil
			end
			local Largest = math.max(0, (math.round((Now() - v5) * 1000)))
			local Smallest = math.min(Largest, (math.round(NewLargest * 1000)))
			local v6 = "TURN_WORK_FINISHED"
			local CallbackResult = Callback()
			local config = {
				completed = tostring(p2 == "completed"),
				outcome = tostring(p2),
				turnMs = tostring(Largest),
				foregroundMs = tostring(Largest - Smallest),
				backgroundMs = tostring(Smallest),
				backgroundCount = tostring(Count)
			}
			local Total = nil
			
			if next(Amounts) == nil then
				Total = v4
			else
				Total = 0
				
				for _, amount in Amounts do
					Total += amount
				end
			end
			config.stepCount = tostring(Total)
			config.headerExpanded = tostring(HeaderExpanded)
			config.headerToggleCount = tostring(Count1)
			config.stepToggleCount = tostring(Count2)
			SendBuildExperienceEventModule(v6, CallbackResult, config)
		end,
		setSegmentStepCount = function(Key, p3)
			-- upvalues: Amounts (copy), v4 (ref)
			if p3 == nil then
				Amounts[Key] = nil
				
				return
			end
			Amounts[Key] = p3
			local Total = 0
			
			for _, amount in Amounts do
				Total += amount
			end
			v4 = Total
		end,
		setHeaderExpanded = function(Value)
			-- upvalues: HeaderExpanded (ref)
			HeaderExpanded = Value
		end,
		recordHeaderToggle = function(p4)
			-- upvalues: Count1 (ref), SendBuildExperienceEventModule (upval), Callback (copy), v2 (ref), Flag (ref), Amounts (copy)
			Count1 += 1
			local v7 = "TURN_WORK_TOGGLE"
			local CallbackResult = Callback()
			local config = {
				target = "header",
				expanded = tostring(p4),
				whileRunning = tostring(v2 ~= nil and not Flag)
			}
			local Total = 0
			
			for _, amount in Amounts do
				Total += amount
			end
			config.stepCount = tostring(Total)
			SendBuildExperienceEventModule(v7, CallbackResult, config)
		end,
		recordStepToggle = function(p5, p6)
			-- upvalues: Count2 (ref), SendBuildExperienceEventModule (upval), Callback (copy), v2 (ref), Flag (ref), Amounts (copy)
			Count2 += 1
			local v8 = "TURN_WORK_TOGGLE"
			local CallbackResult = Callback()
			local config = {
				target = "step",
				stepIndex = tostring(p5),
				expanded = tostring(p6),
				whileRunning = tostring(v2 ~= nil and not Flag)
			}
			local Total = 0
			
			for _, amount in Amounts do
				Total += amount
			end
			config.stepCount = tostring(Total)
			SendBuildExperienceEventModule(v8, CallbackResult, config)
		end
	}
end