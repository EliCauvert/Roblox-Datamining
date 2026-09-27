local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local marketplaceUnifiedAction = require(script.Parent.Parent.UnifiedEventLogEnums).MarketplaceUnifiedAction
local sendAXCounterV2Module = require(script.Parent.Parent.sendAXCounterV2)
local unifiedLoggingSurface = require(parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local isRunningInStudio = require(parent.AppCommonLib).isRunningInStudio
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fIntAXUnifiedEventCounterFlushSeconds = avatarExperienceFlagsModule.FIntAXUnifiedEventCounterFlushSeconds
local fIntAXUnifiedEventCounterImpressionFlushSeconds = avatarExperienceFlagsModule.FIntAXUnifiedEventCounterImpressionFlushSeconds
local fIntAXUnifiedEventCounterMaxKeys = avatarExperienceFlagsModule.FIntAXUnifiedEventCounterMaxKeys
local fIntAXUnifiedEventCounterIdleSeconds = avatarExperienceFlagsModule.FIntAXUnifiedEventCounterIdleSeconds
local fFlagAXUnifiedEventCounterDebugLogs = avatarExperienceFlagsModule.FFlagAXUnifiedEventCounterDebugLogs
local t = {
	[marketplaceUnifiedAction.PURCHASE_ATTEMPT] = true,
	[marketplaceUnifiedAction.PURCHASE_SUCCESS] = true
}
local t_1 = {
	[marketplaceUnifiedAction.ITEM_IMPRESSION] = true,
	[marketplaceUnifiedAction.WIDGET_IMPRESSION] = true,
	[marketplaceUnifiedAction.UI_ELEMENT_IMPRESSION] = true,
	[marketplaceUnifiedAction.WIDGET_LOADED] = true
}
local t_2 = {}

local function newWindow(p1, p2, p3)
	return {
		keyCount = 0,
		pendingFlush = nil,
		recordCount = 0,
		armedAtCount = 0,
		waitedSeconds = 0,
		label = p1,
		maxSeconds = p2,
		buckets = {},
		tracksPhase = p3
	}
end

local var1 = newWindow("short", fIntAXUnifiedEventCounterFlushSeconds, false)
local var2 = newWindow("long", fIntAXUnifiedEventCounterImpressionFlushSeconds, true)
local var3 = nil
local t_3 = {}

local function invertEnum(p1)
	local t = {}
	
	for i, v in p1 do
		t[tostring(v)] = tostring(i)
	end
	return t
end

local var4 = invertEnum(marketplaceUnifiedAction)
local var5 = invertEnum(unifiedLoggingSurface)

local function _(p2)
	return if p2 == nil or p2 == "" then "Unknown" else tostring(p2)
end

local function toElementNameDimension(p2)
	local var6 = if p2 == nil or p2 == "" then "Unknown" else tostring(p2)
	while true do
		local replaced = string.gsub(var6, "[_:%-]%d+$", "")
		if replaced ~= var6 and replaced ~= "" then
			var6 = replaced
			continue
		end
		return var6
	end
end

local _ = function(p3, p4)
	if p3 == nil or p3 == "" then
		return "Unknown"
	end
	local var7 = tostring(p3)
	
	return p4[var7] or var7
end

local _ = function()
	-- upvalues: fFlagAXUnifiedEventCounterDebugLogs (ref), isRunningInStudio (ref)
	return fFlagAXUnifiedEventCounterDebugLogs and isRunningInStudio()
end

local function describe(p3)
	return string.format("action=%s surface=%s page=%s element=%s filterPass=%s", p3.action, p3.surface, p3.navigationPage, p3.elementName or "-", p3.filterPass or "-")
end

local function bucketKey(p3)
	return table.concat({
		p3.action,
		p3.surface,
		p3.navigationPage,
		p3.elementName or "",
		p3.filterPass or ""
	}, "|")
end

local _ = function(p3)
	-- upvalues: t_3 (write)
	return if t_3[p3] then "Continued" else "Initial"
end

local _ = function(p3)
	-- upvalues: t_3 (write)
	local var7 = if t_3[p3] then "Continued" else "Initial"
	t_3[p3] = true
	
	return var7
end

local function emit(p3, p4, p5)
	-- upvalues: fFlagAXUnifiedEventCounterDebugLogs (ref), isRunningInStudio (ref), describe (ref), sendAXCounterV2Module (ref)
	local t = {
		action = p3.action,
		surface = p3.surface,
		navigationPage = p3.navigationPage
	}
	
	if p3.elementName ~= nil then
		t.elementName = p3.elementName
	end
	if p3.filterPass ~= nil then
		t.filterPass = p3.filterPass
	end
	if p5 ~= nil then
		t.phase = p5
	end
	if fFlagAXUnifiedEventCounterDebugLogs and isRunningInStudio() then
		print(string.format("%s SEND increment=%d phase=%s %s", "[AXUnifiedEventCounters]", p4, p5 or "-", describe(p3)))
	end
	sendAXCounterV2Module("AXUnifiedEventSent", t, p4)
end

local function flushWindow(p3)
	-- upvalues: fFlagAXUnifiedEventCounterDebugLogs (ref), isRunningInStudio (ref), emit (ref), t_3 (write)
	if p3.pendingFlush ~= nil then
		task.cancel(p3.pendingFlush)
		p3.pendingFlush = nil
	end
	local buckets = p3.buckets
	local keyCount = p3.keyCount
	p3.buckets = {}
	p3.keyCount = 0
	p3.waitedSeconds = 0
	
	if fFlagAXUnifiedEventCounterDebugLogs and isRunningInStudio() and keyCount > 0 then
		print(string.format("%s FLUSH %s %d key(s)", "[AXUnifiedEventCounters]", p3.label, keyCount))
	end
	for i, v in buckets do
		local var7
		local var8 = emit
		local dimensions = v.dimensions
		local count = v.count
		
		if p3.tracksPhase then
			local var9 = if t_3[i] then "Continued" else "Initial"
			t_3[i] = true
			var7 = var9
		else
			var7 = nil
		end
		var8(dimensions, count, var7)
	end
end

function t_2.flush()
	-- upvalues: flushWindow (ref), var1 (ref), var2 (ref)
	flushWindow(var1)
	flushWindow(var2)
end

local function scheduleFlush(p4)
	-- upvalues: fIntAXUnifiedEventCounterIdleSeconds (ref), fFlagAXUnifiedEventCounterDebugLogs (ref), isRunningInStudio (ref), flushWindow (ref), scheduleFlush (ref)
	if p4.pendingFlush ~= nil then return end
	local maxValue = math.max(fIntAXUnifiedEventCounterIdleSeconds, 1)
	
	if fFlagAXUnifiedEventCounterDebugLogs and isRunningInStudio() and p4.waitedSeconds == 0 then
		print(string.format("%s SCHEDULE %s idle=%ds max=%ds", "[AXUnifiedEventCounters]", p4.label, maxValue, p4.maxSeconds))
	end
	p4.armedAtCount = p4.recordCount
	p4.pendingFlush = task.delay(maxValue, function()
		-- upvalues: p4 (ref), maxValue (ref), fFlagAXUnifiedEventCounterDebugLogs (copy), isRunningInStudio (copy), flushWindow (copy), scheduleFlush (copy)
		p4.pendingFlush = nil
		p4.waitedSeconds += maxValue
		local var10 = p4.recordCount == p4.armedAtCount
		
		if not var10 and p4.maxSeconds > p4.waitedSeconds then
			scheduleFlush(p4)
			
			return
		elseif fFlagAXUnifiedEventCounterDebugLogs and isRunningInStudio() then
			print(string.format("%s CLOSE %s after %ds (%s)", "[AXUnifiedEventCounters]", p4.label, p4.waitedSeconds, if var10 then "idle" else "max"))
		end
		flushWindow(p4)
	end)
end

function t_2.record(p4, p5)
	-- upvalues: var3 (write), t_3 (write), var4 (ref), var5 (ref), marketplaceUnifiedAction (ref), toElementNameDimension (ref), t (ref), emit (ref), t_1 (ref), var2 (ref), var1 (ref), bucketKey (ref), fFlagAXUnifiedEventCounterDebugLogs (ref), isRunningInStudio (ref), describe (ref), fIntAXUnifiedEventCounterMaxKeys (ref), flushWindow (ref), scheduleFlush (ref)
	local action = p4.action
	
	if action == nil then return end
	local navigationOpaquePage = p4.navigationOpaquePage or p4.navigationPage
	
	if navigationOpaquePage ~= nil and navigationOpaquePage ~= var3 then
		var3 = navigationOpaquePage
		t_3 = {}
	end
	local var10
	local t_2 = {}
	
	if action == nil then
		var10 = "Unknown"
	else
		local var11 = if action ~= "" then tostring(action) else nil
		var10 = action ~= "" and (var4[var11] or var11)
	end
	local var12
	t_2.action = var10
	local surface = p4.surface
	local var13 = var5
	
	if surface == nil then
		var12 = "Unknown"
	else
		local var14 = if surface ~= "" then tostring(surface) else nil
		var12 = surface ~= "" and (var13[var14] or var14)
	end
	t_2.surface = var12
	local navigationPage = p4.navigationPage
	t_2.navigationPage = if navigationPage == nil or navigationPage == "" then "Unknown" else tostring(navigationPage)
	t_2.elementName = if action == marketplaceUnifiedAction.UI_ELEMENT_CLICK then toElementNameDimension(p4.elementName) else nil
	t_2.filterPass = if p5 ~= nil then nil else tostring(p5)
	
	if t[action] then
		emit(t_2, 1)
		
		return
	end
	local var15 = if t_1[action] then var2 else var1
	var15.recordCount += 1
	navigationPage = bucketKey(t_2)
	local var16 = var15.buckets[navigationPage]
	
	if var16 == nil then
		var15.buckets[navigationPage] = { count = 1, dimensions = t_2 }
		var15.keyCount += 1
		
		if fFlagAXUnifiedEventCounterDebugLogs and isRunningInStudio() then
			print(string.format("%s OPEN %s bucket (%d open) phase=%s %s", "[AXUnifiedEventCounters]", var15.label, var15.keyCount, if var15.tracksPhase then if t_3[navigationPage] then "Continued" else "Initial" else "-", describe(t_2)))
		end
	else
		var16.count += 1
	end
	if fIntAXUnifiedEventCounterMaxKeys <= var15.keyCount then
		flushWindow(var15)
		
		return
	end
	scheduleFlush(var15)
end

return t_2