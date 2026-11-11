local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiUsageAnalyticsModule = require(SduiCoreSystem.Analytics.SduiUsageAnalytics)
local DiscoverySduiTypeUsageHundredthsPercent = game:DefineFastInt("DiscoverySduiTypeUsageHundredthsPercent", 0)
local DiscoverySduiParamUsageHundredthsPercent = game:DefineFastInt("DiscoverySduiParamUsageHundredthsPercent", 0)
local IsRandomValueBelow = false
local IsRandomValueBelow1 = false

if require(SduiCoreSystem.Parent.SharedFlags).FFlagSduiUsageTelemetry then
	IsRandomValueBelow = math.random(10000) <= DiscoverySduiTypeUsageHundredthsPercent
	IsRandomValueBelow1 = math.random(10000) <= DiscoverySduiParamUsageHundredthsPercent
end
local t = {}
local t1 = {}

local function getOrCreateAccumulator(Key, Key1)
	-- upvalues: t (ref)
	local Entry = t[Key]
	
	if not Entry then
		Entry = {}
		t[Key] = Entry
	end
	local Entry1 = Entry[Key1]
	
	if Entry1 then
		return Entry1
	else
		local config = {
			hasRecorded = false,
			types = {},
			props = {},
			actionTypes = {},
			actionParams = {}
		}
		Entry[Key1] = config
		
		return config
	end
end

local function getOrCreateGlobalSeen(Page, Version)
	-- upvalues: t1 (ref)
	local Entry = t1[Page]
	
	if not Entry then
		Entry = {}
		t1[Page] = Entry
	end
	local Entry1 = Entry[Version]
	
	if Entry1 then
		return Entry1
	else
		local config = {
			types = {},
			props = {},
			actionTypes = {},
			actionParams = {}
		}
		Entry[Version] = config
		
		return config
	end
end

local function deltaAndCommit(ActionParams, ActionParams1)
	local t = {}
	
	for i, _ in ActionParams do
		if not ActionParams1[i] then
			t[i] = true
			ActionParams1[i] = true
		end
	end
	return t
end

local function flushPageVersion(Page, Version)
	-- upvalues: t (ref), getOrCreateGlobalSeen (copy), deltaAndCommit (copy), SduiUsageAnalyticsModule (copy)
	local Entry = t[Page]
	local Entry1 = Entry and Entry[Version]
	
	if not Entry1 or not Entry1.hasRecorded then return end
	local OrCreateGlobalSeen = getOrCreateGlobalSeen(Page, Version)
	local DeltaAndCommitResult = deltaAndCommit(Entry1.types, OrCreateGlobalSeen.types)
	local DeltaAndCommitResult1 = deltaAndCommit(Entry1.props, OrCreateGlobalSeen.props)
	local DeltaAndCommitResult2 = deltaAndCommit(Entry1.actionTypes, OrCreateGlobalSeen.actionTypes)
	local DeltaAndCommitResult3 = deltaAndCommit(Entry1.actionParams, OrCreateGlobalSeen.actionParams)
	Entry[Version] = nil
	
	if next(Entry) == nil then
		t[Page] = nil
	end
	if next(DeltaAndCommitResult) ~= nil or next(DeltaAndCommitResult2) ~= nil then
		SduiUsageAnalyticsModule.sendTypeUsageEvent({
			page = Page,
			version = Version,
			componentTypes = DeltaAndCommitResult,
			actionTypes = DeltaAndCommitResult2
		})
	end
	if next(DeltaAndCommitResult1) ~= nil or next(DeltaAndCommitResult3) ~= nil then
		SduiUsageAnalyticsModule.sendParamUsageEvent({
			page = Page,
			version = Version,
			props = DeltaAndCommitResult1,
			actionParams = DeltaAndCommitResult3
		})
	end
end

local function flushAll()
	-- upvalues: t (ref), flushPageVersion (copy)
	local List = {}
	
	for Page, value in t do
		for Version, _ in value do
			table.insert(List, { page = Page, version = Version })
		end
	end
	for _, value1 in List do
		flushPageVersion(value1.page, value1.version)
	end
end

local Delay = 1
local Flag = false

return {
	recordComponentType = function(p1, p2, p3)
		-- upvalues: IsRandomValueBelow (ref), getOrCreateAccumulator (copy)
		if not IsRandomValueBelow or not p3 then return end
		local OrCreateAccumulator = getOrCreateAccumulator(p1, p2)
		
		if not OrCreateAccumulator.types[p3] then
			OrCreateAccumulator.types[p3] = true
			OrCreateAccumulator.hasRecorded = true
		end
	end,
	recordProp = function(p1, p2, p3, p4)
		-- upvalues: IsRandomValueBelow1 (ref), getOrCreateAccumulator (copy)
		if not IsRandomValueBelow1 or not p3 or not p4 then return end
		local OrCreateAccumulator = getOrCreateAccumulator(p1, p2)
		local Text: string = `{p3}.{p4}`
		
		if not OrCreateAccumulator.props[Text] then
			OrCreateAccumulator.props[Text] = true
			OrCreateAccumulator.hasRecorded = true
		end
	end,
	recordActionType = function(p1, p2, p3)
		-- upvalues: IsRandomValueBelow (ref), getOrCreateAccumulator (copy)
		if not IsRandomValueBelow or not p3 then return end
		local OrCreateAccumulator = getOrCreateAccumulator(p1, p2)
		
		if not OrCreateAccumulator.actionTypes[p3] then
			OrCreateAccumulator.actionTypes[p3] = true
			OrCreateAccumulator.hasRecorded = true
		end
	end,
	recordActionParam = function(p1, p2, p3, p4)
		-- upvalues: IsRandomValueBelow1 (ref), getOrCreateAccumulator (copy)
		if not IsRandomValueBelow1 or not p3 or not p4 then return end
		local OrCreateAccumulator = getOrCreateAccumulator(p1, p2)
		local Text: string = `{p3}.{p4}`
		
		if not OrCreateAccumulator.actionParams[Text] then
			OrCreateAccumulator.actionParams[Text] = true
			OrCreateAccumulator.hasRecorded = true
		end
	end,
	scheduleFlush = function()
		-- upvalues: Flag (ref), Delay (ref), flushAll (copy)
		if not Flag then
			Flag = true
			task.delay(Delay, function()
				-- upvalues: Flag (upval), flushAll (upval)
				Flag = false
				flushAll()
			end)
			
			return
		end
	end,
	isTypeSamplingEnabled = function()
		-- upvalues: IsRandomValueBelow (ref)
		return IsRandomValueBelow
	end,
	isParamSamplingEnabled = function()
		-- upvalues: IsRandomValueBelow1 (ref)
		return IsRandomValueBelow1
	end,
	_flushAllForTesting = flushAll,
	_resetAllForTesting = function()
		-- upvalues: t (ref), t1 (ref), Flag (ref)
		t = {}
		t1 = {}
		Flag = false
	end,
	_setSamplingForTesting = function(p1, p2)
		-- upvalues: IsRandomValueBelow (ref), IsRandomValueBelow1 (ref)
		IsRandomValueBelow = p1
		IsRandomValueBelow1 = p2
	end,
	_setFlushDelayForTesting = function(p1)
		-- upvalues: Delay (ref)
		Delay = p1
	end
}