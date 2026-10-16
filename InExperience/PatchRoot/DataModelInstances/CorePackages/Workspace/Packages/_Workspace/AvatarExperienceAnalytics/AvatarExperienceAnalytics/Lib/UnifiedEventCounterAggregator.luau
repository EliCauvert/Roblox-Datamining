local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local MarketplaceUnifiedAction = require(script.Parent.Parent.UnifiedEventLogEnums).MarketplaceUnifiedAction
local SendAXCounterV2Module = require(script.Parent.Parent.sendAXCounterV2)
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local IsRunningInStudioFunction = require(Parent.AppCommonLib).isRunningInStudio
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FIntAXUnifiedEventCounterImpressionFlushSeconds = AvatarExperienceFlagsModule.FIntAXUnifiedEventCounterImpressionFlushSeconds
local FIntAXUnifiedEventCounterMaxKeys = AvatarExperienceFlagsModule.FIntAXUnifiedEventCounterMaxKeys
local FIntAXUnifiedEventCounterIdleSeconds = AvatarExperienceFlagsModule.FIntAXUnifiedEventCounterIdleSeconds
local FFlagAXUnifiedEventCounterDebugLogs = AvatarExperienceFlagsModule.FFlagAXUnifiedEventCounterDebugLogs
local config = {
	[MarketplaceUnifiedAction.PURCHASE_ATTEMPT] = true,
	[MarketplaceUnifiedAction.PURCHASE_SUCCESS] = true
}
local config1 = {
	[MarketplaceUnifiedAction.ITEM_IMPRESSION] = true,
	[MarketplaceUnifiedAction.WIDGET_IMPRESSION] = true,
	[MarketplaceUnifiedAction.UI_ELEMENT_IMPRESSION] = true,
	[MarketplaceUnifiedAction.WIDGET_LOADED] = true
}

local function newWindow(Label, MaxSeconds, TracksPhase) --[[ Line: 91 ]]
	return {
		keyCount = 0,
		pendingFlush = nil,
		recordCount = 0,
		armedAtCount = 0,
		waitedSeconds = 0,
		label = Label,
		maxSeconds = MaxSeconds,
		buckets = {},
		tracksPhase = TracksPhase
	}
end

local Short = newWindow("short", AvatarExperienceFlagsModule.FIntAXUnifiedEventCounterFlushSeconds, false)
local Long = newWindow("long", FIntAXUnifiedEventCounterImpressionFlushSeconds, true)
local NavigationOpaquePage = nil
local t = {}

local function invertEnum(MarketplaceUnifiedAction) --[[ Line: 118 ]]
	local t = {}
	
	for i, value in MarketplaceUnifiedAction do
		t[tostring(value)] = tostring(i)
	end
	return t
end

local InvertEnumResult = invertEnum(MarketplaceUnifiedAction)
local InvertEnumResult1 = invertEnum(UnifiedLoggingSurface)

local function _(p1): string --[[ Line: 132 | Named "toDimensionString" ]]
	return if p1 == nil or p1 == "" then "Unknown" else tostring(p1)
end

local function toElementNameDimension(ElementName): string --[[ Line: 143 ]]
	local Unknown: string = if ElementName == nil or ElementName == "" then "Unknown" else tostring(ElementName)
	while true do
		local Replaced = string.gsub(Unknown, "[_:%-]%d+$", "")
		if Replaced == Unknown or Replaced == "" then
			break
		end
		Unknown = Replaced
	end
	return Unknown
end

local _ = function(p1, p2) --[[ Line: 156 | Named "toEnumName" ]]
	if p1 == nil or p1 == "" then
		return "Unknown"
	else
		local Text = tostring(p1)
		
		return p2[Text] or Text
	end
end

local _ = function() --[[ Line: 164 | Named "debugEnabled" ]]
	-- upvalues: FFlagAXUnifiedEventCounterDebugLogs (copy), IsRunningInStudioFunction (copy)
	return FFlagAXUnifiedEventCounterDebugLogs and IsRunningInStudioFunction()
end

local function describe(Dimensions): string --[[ Line: 169 ]]
	return string.format("action=%s surface=%s page=%s element=%s filterPass=%s", Dimensions.action, Dimensions.surface, Dimensions.navigationPage, Dimensions.elementName or "-", Dimensions.filterPass or "-")
end

local function bucketKey(Dimensions): string --[[ Line: 182 ]]
	return table.concat({
		Dimensions.action,
		Dimensions.surface,
		Dimensions.navigationPage,
		Dimensions.elementName or "",
		Dimensions.filterPass or ""
	}, "|")
end

local _ = function(p1): string --[[ Line: 193 | Named "peekPhase" ]]
	-- upvalues: t (ref)
	return if t[p1] then "Continued" else "Initial"
end

local _ = function(Key): string --[[ Line: 199 | Named "takePhase" ]]
	-- upvalues: t (ref)
	t[Key] = true
	
	return if t[Key] then "Continued" else "Initial"
end

local function emit(Dimensions, Count, Phase) --[[ Line: 207 ]]
	-- upvalues: FFlagAXUnifiedEventCounterDebugLogs (copy), IsRunningInStudioFunction (copy), describe (copy), SendAXCounterV2Module (copy)
	local config = {
		action = Dimensions.action,
		surface = Dimensions.surface,
		navigationPage = Dimensions.navigationPage
	}
	
	if Dimensions.elementName ~= nil then
		config.elementName = Dimensions.elementName
	end
	if Dimensions.filterPass ~= nil then
		config.filterPass = Dimensions.filterPass
	end
	if Phase ~= nil then
		config.phase = Phase
	end
	if FFlagAXUnifiedEventCounterDebugLogs and IsRunningInStudioFunction() then
		print(string.format("%s SEND increment=%d phase=%s %s", "[AXUnifiedEventCounters]", Count, Phase or "-", describe(Dimensions)))
	end
	SendAXCounterV2Module("AXUnifiedEventSent", config, Count)
end

local function flushWindow(Window) --[[ Line: 235 ]]
	-- upvalues: FFlagAXUnifiedEventCounterDebugLogs (copy), IsRunningInStudioFunction (copy), emit (copy), t (ref)
	if Window.pendingFlush ~= nil then
		task.cancel(Window.pendingFlush)
		Window.pendingFlush = nil
	end
	local Buckets = Window.buckets
	local KeyCount: number = Window.keyCount
	Window.buckets = {}
	Window.keyCount = 0
	Window.waitedSeconds = 0
	
	if FFlagAXUnifiedEventCounterDebugLogs and IsRunningInStudioFunction() and KeyCount > 0 then
		print(string.format("%s FLUSH %s %d key(s)", "[AXUnifiedEventCounters]", Window.label, KeyCount))
	end
	for i, bucket in Buckets do
		local Dimensions = bucket.dimensions
		local Count = bucket.count
		local Continued = nil
		
		if Window.tracksPhase then
			t[i] = true
			Continued = if t[i] then "Continued" else "Initial"
		else
			Continued = nil
		end
		emit(Dimensions, Count, Continued)
	end
end

local function scheduleFlush(Window) --[[ Line: 265 ]]
	-- upvalues: FIntAXUnifiedEventCounterIdleSeconds (copy), FFlagAXUnifiedEventCounterDebugLogs (copy), IsRunningInStudioFunction (copy), flushWindow (copy), scheduleFlush (copy)
	if Window.pendingFlush ~= nil then return end
	local Largest = math.max(FIntAXUnifiedEventCounterIdleSeconds, 1)
	
	if FFlagAXUnifiedEventCounterDebugLogs and IsRunningInStudioFunction() and Window.waitedSeconds == 0 then
		print(string.format("%s SCHEDULE %s idle=%ds max=%ds", "[AXUnifiedEventCounters]", Window.label, Largest, Window.maxSeconds))
	end
	Window.armedAtCount = Window.recordCount
	Window.pendingFlush = task.delay(Largest, function() --[[ Line: 279 ]]
		-- upvalues: Window (copy), Largest (copy), FFlagAXUnifiedEventCounterDebugLogs (upval), IsRunningInStudioFunction (upval), flushWindow (upval), scheduleFlush (upval)
		Window.pendingFlush = nil
		Window.waitedSeconds += Largest
		local IsRecordCountMatch = Window.recordCount == Window.armedAtCount
		
		if not IsRecordCountMatch and Window.maxSeconds > Window.waitedSeconds then
			scheduleFlush(Window)
			
			return
		end
		if FFlagAXUnifiedEventCounterDebugLogs and IsRunningInStudioFunction() then
			print(string.format("%s CLOSE %s after %ds (%s)", "[AXUnifiedEventCounters]", Window.label, Window.waitedSeconds, if IsRecordCountMatch then "idle" else "max"))
		end
		flushWindow(Window)
	end)
end

return {
	flush = function() --[[ Line: 257 ]]
		-- upvalues: flushWindow (copy), Short (copy), Long (copy)
		flushWindow(Short)
		flushWindow(Long)
	end,
	record = function(Dimensions, p1) --[[ Line: 307 ]]
		-- upvalues: NavigationOpaquePage (ref), t (ref), InvertEnumResult (copy), InvertEnumResult1 (copy), MarketplaceUnifiedAction (copy), toElementNameDimension (copy), config (copy), emit (copy), config1 (copy), Long (copy), Short (copy), bucketKey (copy), FFlagAXUnifiedEventCounterDebugLogs (copy), IsRunningInStudioFunction (copy), describe (copy), FIntAXUnifiedEventCounterMaxKeys (copy), flushWindow (copy), scheduleFlush (copy)
		local Action = Dimensions.action
		
		if Action == nil then return end
		local NavigationOpaquePage1 = Dimensions.navigationOpaquePage or Dimensions.navigationPage
		
		if NavigationOpaquePage1 ~= nil and NavigationOpaquePage1 ~= NavigationOpaquePage then
			NavigationOpaquePage = NavigationOpaquePage1
			t = {}
		end
		local Dimensions1 = {}
		local Action1 = nil
		
		if Action == nil or Action == "" then
			Action1 = "Unknown"
		else
			local Text = tostring(Action)
			Action1 = InvertEnumResult[Text] or Text
		end
		Dimensions1.action = Action1
		local Surface = Dimensions.surface
		local Surface1 = nil
		
		if Surface == nil or Surface == "" then
			Surface1 = "Unknown"
		else
			local Text = tostring(Surface)
			Surface1 = InvertEnumResult1[Text] or Text
		end
		Dimensions1.surface = Surface1
		local NavigationPage = Dimensions.navigationPage
		Dimensions1.navigationPage = if NavigationPage == nil or NavigationPage == "" then "Unknown" else tostring(NavigationPage)
		Dimensions1.elementName = if Action == MarketplaceUnifiedAction.UI_ELEMENT_CLICK then toElementNameDimension(Dimensions.elementName) else nil
		Dimensions1.filterPass = if p1 == nil then nil else tostring(p1)
		
		if config[Action] then
			emit(Dimensions1, 1)
			
			return
		end
		local Long1 = if config1[Action] then Long else Short
		Long1.recordCount += 1
		local BucketKeyResult = bucketKey(Dimensions1)
		local Bucket = Long1.buckets[BucketKeyResult]
		
		if Bucket == nil then
			Long1.buckets[BucketKeyResult] = { count = 1, dimensions = Dimensions1 }
			Long1.keyCount += 1
			
			if FFlagAXUnifiedEventCounterDebugLogs and IsRunningInStudioFunction() then
				print(string.format("%s OPEN %s bucket (%d open) phase=%s %s", "[AXUnifiedEventCounters]", Long1.label, Long1.keyCount, if Long1.tracksPhase then if t[BucketKeyResult] then "Continued" else "Initial" else "-", describe(Dimensions1)))
			end
		else
			Bucket.count += 1
		end
		if FIntAXUnifiedEventCounterMaxKeys <= Long1.keyCount then
			flushWindow(Long1)
			
			return
		else
			scheduleFlush(Long1)
		end
	end
}