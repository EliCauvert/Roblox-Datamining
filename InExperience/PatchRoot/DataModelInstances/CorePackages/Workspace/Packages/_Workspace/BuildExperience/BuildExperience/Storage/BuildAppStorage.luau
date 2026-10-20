local BuildExperience = script:FindFirstAncestor("BuildExperience")
local FFlagBuildAdUpsellModule = require(BuildExperience.Flags.FFlagBuildAdUpsell)
local FFlagBuildAdUpsellPinnedModule = require(BuildExperience.Flags.FFlagBuildAdUpsellPinned)
local FFlagBuildAgentAdCampaignCardModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local CreateAdCampaignCardStorageModule = require(script.Parent.createAdCampaignCardStorage)

local function _(Value: number): number
	return if type(Value) == "number" and Value >= 0 then math.floor(Value) else 0
end

local _ = function(Value: number): number
	return if type(Value) == "number" and Value >= 0 then math.floor(Value) else 0
end

local _ = function(Text: string): string
	return string.match(Text, "^(%d%d%d%d%-%d%d%-%d%d)")
end

local _ = function(Text: string, Text1: string): boolean
	return Text ~= nil and string.match(Text, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(Text1, "^(%d%d%d%d%-%d%d%-%d%d)")
end

local function makeEmptyAdUpsellScheduler()
	-- upvalues: FFlagBuildAdUpsellPinnedModule (copy)
	return {
		nextOrder = 1,
		version = if FFlagBuildAdUpsellPinnedModule then 4 else 3,
		universes = {},
		anchors = {},
		pendingMilestones = {},
		recentEventIds = {}
	}
end

local function pruneUniverseCap(EmptyAdUpsellScheduler)
	local Count = 0
	local v1 = nil
	local LastTouchedOrder = 1e999
	
	for i, univers in EmptyAdUpsellScheduler.universes do
		Count += 1
		
		if univers.lastTouchedOrder < LastTouchedOrder or univers.lastTouchedOrder == LastTouchedOrder and (v1 == nil or i < v1) then
			v1 = i
			LastTouchedOrder = univers.lastTouchedOrder
		end
	end
	if Count > 50 and v1 ~= nil then
		EmptyAdUpsellScheduler.universes[v1] = nil
		local Number: number? = tonumber(v1)
		
		if Number ~= nil then
			for i1 = #EmptyAdUpsellScheduler.anchors, 1, -1 do
				if EmptyAdUpsellScheduler.anchors[i1].universeId == Number then
					table.remove(EmptyAdUpsellScheduler.anchors, i1)
				end
			end
			for i2 = #EmptyAdUpsellScheduler.pendingMilestones, 1, -1 do
				if EmptyAdUpsellScheduler.pendingMilestones[i2].universeId == Number then
					table.remove(EmptyAdUpsellScheduler.pendingMilestones, i2)
				end
			end
		end
	end
end

local function sanitizeAdUpsellScheduler(Scheduler)
	-- upvalues: makeEmptyAdUpsellScheduler (copy), pruneUniverseCap (copy)
	if type(Scheduler) ~= "table" then
		return (makeEmptyAdUpsellScheduler())
	end
	if Scheduler.version ~= 4 and Scheduler.version ~= 3 then
		return (makeEmptyAdUpsellScheduler())
	end
	local EmptyAdUpsellScheduler = makeEmptyAdUpsellScheduler()
	local Largest = 0
	local Count = 0
	
	if type(Scheduler.universes) == "table" then
		for i, univers in Scheduler.universes do
			if type(i) == "string" and type(univers) == "table" then
				local LastTouchedOrder: number = univers.lastTouchedOrder
				local Floored: number = if type(LastTouchedOrder) == "number" and LastTouchedOrder >= 0 then math.floor(LastTouchedOrder) else 0
				Largest = math.max(Largest, Floored)
				EmptyAdUpsellScheduler.universes[i] = {
					hasShownUpsell = univers.hasShownUpsell == true,
					dismissedPermanently = univers.dismissedPermanently == true,
					lastTouchedOrder = Floored
				}
				Count += 1
			end
		end
	end
	if type(Scheduler.anchors) == "table" then
		for _, anchor in Scheduler.anchors do
			if type(anchor) == "table" and type(anchor.id) == "string" and type(anchor.universeId) == "number" and type(anchor.sessionId) == "string" and type(anchor.order) == "number" then
				local Largest1 = math.max(1, (math.floor(anchor.order)))
				Largest = math.max(Largest, Largest1)
				table.insert(EmptyAdUpsellScheduler.anchors, {
					id = anchor.id,
					universeId = anchor.universeId,
					sessionId = anchor.sessionId,
					afterMessageKey = if type(anchor.afterMessageKey) == "string" then anchor.afterMessageKey else nil,
					order = Largest1,
					impressed = anchor.impressed == true
				})
			end
		end
	end
	if type(Scheduler.pendingMilestones) == "table" then
		for _, pendingMilestone in Scheduler.pendingMilestones do
			if type(pendingMilestone) == "table" and type(pendingMilestone.id) == "string" and type(pendingMilestone.universeId) == "number" and (pendingMilestone.sessionId == nil or type(pendingMilestone.sessionId) == "string") and type(pendingMilestone.order) == "number" then
				local Largest2 = math.max(1, (math.floor(pendingMilestone.order)))
				Largest = math.max(Largest, Largest2)
				table.insert(EmptyAdUpsellScheduler.pendingMilestones, {
					id = pendingMilestone.id,
					universeId = pendingMilestone.universeId,
					sessionId = pendingMilestone.sessionId,
					order = Largest2
				})
			end
		end
	end
	if type(Scheduler.recentEventIds) == "table" then
		for _, recentEventId in Scheduler.recentEventIds do
			if type(recentEventId) == "string" then
				table.insert(EmptyAdUpsellScheduler.recentEventIds, recentEventId)
			end
		end
	end
	for _ = 51, Count do
		pruneUniverseCap(EmptyAdUpsellScheduler)
	end
	table.sort(EmptyAdUpsellScheduler.anchors, function(A, B): boolean
		return A.order < B.order
	end)
	local t = {}
	
	for i1 = #EmptyAdUpsellScheduler.anchors, 1, -1 do
		local Anchor = EmptyAdUpsellScheduler.anchors[i1]
		local Text: string = `{Anchor.universeId}:{Anchor.sessionId}`
		local v2 = t[Text] or 0
		
		if v2 >= 10 then
			table.remove(EmptyAdUpsellScheduler.anchors, i1)
		else
			t[Text] = v2 + 1
		end
	end
	table.sort(EmptyAdUpsellScheduler.pendingMilestones, function(A, B): boolean
		return A.order < B.order
	end)
	while #EmptyAdUpsellScheduler.anchors > 50 do
		table.remove(EmptyAdUpsellScheduler.anchors, 1)
	end
	while #EmptyAdUpsellScheduler.pendingMilestones > 50 do
		table.remove(EmptyAdUpsellScheduler.pendingMilestones, 1)
	end
	while #EmptyAdUpsellScheduler.recentEventIds > 50 do
		table.remove(EmptyAdUpsellScheduler.recentEventIds, 1)
	end
	local NextOrder: number = Scheduler.nextOrder
	EmptyAdUpsellScheduler.nextOrder = math.max(if type(NextOrder) == "number" and NextOrder >= 0 then math.floor(NextOrder) else 0, Largest + 1, 1)
	
	return EmptyAdUpsellScheduler
end

local function createBuildAppStorage(AppStorageService, HttpService)
	-- upvalues: CreateAdCampaignCardStorageModule (copy), FFlagBuildAdUpsellModule (copy), makeEmptyAdUpsellScheduler (copy), sanitizeAdUpsellScheduler (copy), FFlagBuildAdUpsellPinnedModule (copy), pruneUniverseCap (copy), FFlagBuildAgentAdCampaignCardModule (copy)
	local v3 = nil
	local Flag = false
	local v4 = 0
	local v5 = nil
	local Flag1 = false
	local Inverted = false
	local Count = 0
	local DelayedThread = nil
	local Flag2 = false
	local v6 = nil
	
	local function tryReadData()
		-- upvalues: AppStorageService (copy), HttpService (copy)
		local Success, Result = pcall(AppStorageService.GetItem, AppStorageService, "BuildAppStorageKey")
		
		if not Success then
			return false, {}
		elseif type(Result) ~= "string" or Result == "" then
			return true, {}
		else
			local Success1, Result1 = pcall(HttpService.JSONDecode, HttpService, Result)
			
			if Success1 and type(Result1) == "table" then
				return true, Result1
			else
				return true, {}
			end
		end
	end
	
	local function tryReadDataStrict()
		-- upvalues: AppStorageService (copy), HttpService (copy)
		local Success, Result = pcall(AppStorageService.GetItem, AppStorageService, "BuildAppStorageKey")
		
		if not Success then
			return false, {}
		elseif type(Result) ~= "string" or Result == "" then
			return true, {}
		else
			local Success1, Result1 = pcall(HttpService.JSONDecode, HttpService, Result)
			
			if Success1 and type(Result1) == "table" then
				return true, Result1
			else
				return false, {}
			end
		end
	end
	
	local function _()
		-- upvalues: tryReadData (copy)
		local _, TryReadDataResult2 = tryReadData()
		
		return TryReadDataResult2
	end
	
	local function tryReadDataWithRetry(Callback)
		local CallbackResult, CallbackResult2 = Callback()
		
		if CallbackResult then
			return true, CallbackResult2
		else
			return Callback()
		end
	end
	
	local function writeData(p1)
		-- upvalues: HttpService (copy), AppStorageService (copy)
		local Success, Result = pcall(HttpService.JSONEncode, HttpService, p1)
		
		return if Success and type(Result) == "string" then pcall(function()
			-- upvalues: AppStorageService (upval), Result (copy)
			AppStorageService:SetItem("BuildAppStorageKey", Result)
			AppStorageService:Flush()
		end) else false
	end
	
	local _ = function(Callback: (any) -> ())
		-- upvalues: tryReadData (copy), HttpService (copy), AppStorageService (copy)
		local TryReadDataResult, TryReadDataResult2 = tryReadData()
		local TryReadDataResult1 = nil
		local v7 = nil
		
		if TryReadDataResult then
			v7 = true
			TryReadDataResult1 = TryReadDataResult2
		else
			v7, TryReadDataResult1 = tryReadData()
		end
		if v7 then
			Callback(TryReadDataResult1)
			local Success, Result = pcall(HttpService.JSONEncode, HttpService, TryReadDataResult1)
			
			return if Success and type(Result) == "string" then pcall(function()
				-- upvalues: AppStorageService (upval), Result (copy)
				AppStorageService:SetItem("BuildAppStorageKey", Result)
				AppStorageService:Flush()
			end) else false
		else
			return false
		end
	end
	
	local function getAdCampaignCardStorage()
		-- upvalues: v6 (ref), CreateAdCampaignCardStorageModule (upval), tryReadDataWithRetry (copy), tryReadDataStrict (copy), writeData (copy)
		if v6 == nil then
			v6 = CreateAdCampaignCardStorageModule({
				readData = function()
					-- upvalues: tryReadDataWithRetry (upval), tryReadDataStrict (upval)
					return tryReadDataWithRetry(tryReadDataStrict)
				end,
				writeData = writeData
			})
		end
		return v6
	end
	
	local function loadAdUpsell()
		-- upvalues: v5 (ref), Flag1 (ref), tryReadDataStrict (copy), makeEmptyAdUpsellScheduler (upval), sanitizeAdUpsellScheduler (upval)
		if v5 ~= nil then
			return true, v5
		end
		if Flag1 then
			return false, nil
		end
		local TryReadDataStrictResult, TryReadDataStrictResult2 = tryReadDataStrict()
		local TryReadDataStrictResult1 = nil
		local v7 = nil
		
		if TryReadDataStrictResult then
			v7 = true
			TryReadDataStrictResult1 = TryReadDataStrictResult2
		else
			v7, TryReadDataStrictResult1 = tryReadDataStrict()
		end
		if v7 then
			local AdUpsell = TryReadDataStrictResult1.adUpsell
			local Copy = if type(AdUpsell) == "table" then table.clone(AdUpsell) else {}
			Copy.dismissedPermanently = Copy.dismissedPermanently == true
			Copy.scheduler = if Copy.dismissedPermanently then makeEmptyAdUpsellScheduler() else sanitizeAdUpsellScheduler(Copy.scheduler)
			v5 = Copy
			
			return true, Copy
		else
			Flag1 = true
			
			return false, nil
		end
	end
	
	local function persistCachedAdUpsell(p1)
		-- upvalues: v5 (ref), tryReadData (copy), tryReadDataStrict (copy), HttpService (copy), AppStorageService (copy)
		if v5 == nil then
			return false
		end
		local TryReadData = if p1 then tryReadData else tryReadDataStrict
		local TryReadDataResult, TryReadDataResult2 = TryReadData()
		local v7 = nil
		local TryReadDataResult1 = nil
		
		if TryReadDataResult then
			v7 = true
			TryReadDataResult1 = TryReadDataResult2
		else
			v7, TryReadDataResult1 = TryReadData()
		end
		if v7 then
			local AdUpsell = TryReadDataResult1.adUpsell
			local Copy = if type(AdUpsell) == "table" then table.clone(AdUpsell) else {}
			local v8 = v5
			Copy.dismissedPermanently = v8.dismissedPermanently
			Copy.scheduler = v8.scheduler
			TryReadDataResult1.adUpsell = Copy
			local Success, Result = pcall(HttpService.JSONEncode, HttpService, TryReadDataResult1)
			
			return if Success and type(Result) == "string" then pcall(function()
				-- upvalues: AppStorageService (upval), Result (copy)
				AppStorageService:SetItem("BuildAppStorageKey", Result)
				AppStorageService:Flush()
			end) else false
		else
			return false
		end
	end
	
	local function scheduleAdUpsellWriteRetry(p1)
		-- upvalues: DelayedThread (ref), Count (ref), Inverted (ref), persistCachedAdUpsell (copy), Flag2 (ref), scheduleAdUpsellWriteRetry (copy)
		if DelayedThread == nil and Count < 3 then
			local function retryWrite()
				-- upvalues: DelayedThread (upval), Inverted (upval), Count (upval), persistCachedAdUpsell (upval), Flag2 (upval), scheduleAdUpsellWriteRetry (upval)
				DelayedThread = nil
				
				if not Inverted or Count >= 3 then return end
				Count += 1
				
				if persistCachedAdUpsell(Flag2) then
					Inverted = false
					Count = 0
					Flag2 = false
					
					return
				else
					scheduleAdUpsellWriteRetry(true)
				end
			end
			
			DelayedThread = if p1 then task.delay(1, retryWrite) else task.defer(retryWrite)
			
			return
		end
	end
	
	local function persistAdUpsellMutation(Enabled, p1)
		-- upvalues: Count (ref), Inverted (ref), Flag2 (ref), scheduleAdUpsellWriteRetry (copy), persistCachedAdUpsell (copy), DelayedThread (ref)
		Count = 0
		
		if p1 then
			Inverted = true
			Flag2 = Flag2 or Enabled == true
			scheduleAdUpsellWriteRetry()
			
			return true
		end
		Count += 1
		local PersistCachedAdUpsellResult = persistCachedAdUpsell(Enabled)
		Inverted = not PersistCachedAdUpsellResult
		
		if Inverted then
			Flag2 = Flag2 or Enabled == true
			scheduleAdUpsellWriteRetry()
			
			return PersistCachedAdUpsellResult
		end
		Count = 0
		Flag2 = false
		
		if DelayedThread ~= nil then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		return PersistCachedAdUpsellResult
	end
	
	local _ = function()
		-- upvalues: loadAdUpsell (copy)
		local AdUpsell, AdUpsell2 = loadAdUpsell()
		
		if AdUpsell and AdUpsell2 ~= nil then
			return true, AdUpsell2, AdUpsell2.scheduler
		else
			return false, nil, nil
		end
	end
	
	local _ = function(p1, p2)
		local Text = tostring(p2)
		local Univers = p1.universes[Text]
		
		if Univers == nil then
			Univers = {
				hasShownUpsell = false,
				dismissedPermanently = false,
				lastTouchedOrder = 0
			}
			p1.universes[Text] = Univers
		end
		return Univers
	end
	
	local _ = function(p1, Value): boolean
		return table.find(p1.recentEventIds, Value) ~= nil
	end
	
	local function rememberEvent(Scheduler, EventId)
		table.insert(Scheduler.recentEventIds, EventId)
		while #Scheduler.recentEventIds > 50 do
			table.remove(Scheduler.recentEventIds, 1)
		end
	end
	
	local function pruneAnchorCaps(Scheduler, UniverseId, SessionId)
		local Count = 0
		
		for i, anchor in Scheduler.anchors do
			if anchor.universeId == UniverseId and anchor.sessionId == SessionId then
				Count += 1
			end
		end
		while Count > 10 do
			for i, anchor1 in Scheduler.anchors do
				if anchor1.universeId == UniverseId and anchor1.sessionId == SessionId then
					table.remove(Scheduler.anchors, i)
					Count -= 1
					break
				end
			end
		end
		while #Scheduler.anchors > 50 do
			table.remove(Scheduler.anchors, 1)
		end
	end
	
	local function addMilestone(EmptyAdUpsellScheduler, Id, UniverseId, SessionId, AfterMessageKey, Order)
		-- upvalues: FFlagBuildAdUpsellPinnedModule (upval), pruneAnchorCaps (copy)
		if SessionId ~= nil and (FFlagBuildAdUpsellPinnedModule or AfterMessageKey ~= nil) then
			table.insert(EmptyAdUpsellScheduler.anchors, {
				impressed = false,
				id = Id,
				universeId = UniverseId,
				sessionId = SessionId,
				afterMessageKey = if FFlagBuildAdUpsellPinnedModule then nil else AfterMessageKey,
				order = Order
			})
			pruneAnchorCaps(EmptyAdUpsellScheduler, UniverseId, SessionId)
			
			return
		end
		table.insert(EmptyAdUpsellScheduler.pendingMilestones, {
			id = Id,
			universeId = UniverseId,
			sessionId = SessionId,
			order = Order
		})
		while #EmptyAdUpsellScheduler.pendingMilestones > 50 do
			table.remove(EmptyAdUpsellScheduler.pendingMilestones, 1)
		end
	end
	
	local function recordAdUpsellEvent(p1)
		-- upvalues: loadAdUpsell (copy), Inverted (ref), persistAdUpsellMutation (copy), rememberEvent (copy), pruneUniverseCap (upval), addMilestone (copy)
		local AdUpsell, AdUpsell2 = loadAdUpsell()
		local Flag = nil
		local v7 = nil
		local Scheduler = nil
		
		if AdUpsell and AdUpsell2 ~= nil then
			Flag = true
			v7 = AdUpsell2
			Scheduler = AdUpsell2.scheduler
		else
			Flag = false
			v7 = nil
			Scheduler = nil
		end
		if not Flag or v7 == nil or Scheduler == nil then
			return false, false
		end
		local Univers = Scheduler.universes[tostring(p1.universeId)]
		
		if v7.dismissedPermanently == true or Univers ~= nil and Univers.dismissedPermanently then
			return true, false
		end
		if not p1.isEligiblePublish then
			return true, false
		end
		if Univers ~= nil and Univers.hasShownUpsell or table.find(Scheduler.recentEventIds, p1.eventId) ~= nil then
			return not Inverted or persistAdUpsellMutation(), false
		end
		rememberEvent(Scheduler, p1.eventId)
		local Text = tostring(p1.universeId)
		local Univers1 = Scheduler.universes[Text]
		
		if Univers1 == nil then
			Univers1 = {
				hasShownUpsell = false,
				dismissedPermanently = false,
				lastTouchedOrder = 0
			}
			Scheduler.universes[Text] = Univers1
		end
		local NextOrder = Scheduler.nextOrder
		Scheduler.nextOrder += 1
		Univers1.lastTouchedOrder = NextOrder
		Univers1.hasShownUpsell = true
		pruneUniverseCap(Scheduler)
		addMilestone(Scheduler, p1.eventId, p1.universeId, p1.sessionId, p1.afterMessageKey, NextOrder)
		
		return persistAdUpsellMutation(), true
	end
	
	return {
		STORAGE_KEY = "BuildAppStorageKey",
		AD_UPSELL_SCHEDULER_VERSION = 4,
		getAdCampaignCardStorage = if FFlagBuildAgentAdCampaignCardModule then getAdCampaignCardStorage else nil,
		getChatDraft = function(p1)
			-- upvalues: tryReadData (copy)
			local _, TryReadDataResult2 = tryReadData()
			local ChatDrafts = TryReadDataResult2.chatDrafts
			
			if type(ChatDrafts) == "table" then
				local ChatDraft = ChatDrafts[p1]
				
				return if type(ChatDraft) == "string" and ChatDraft ~= "" then ChatDraft else nil
			else
				return nil
			end
		end,
		setChatDraft = function(Key, p1)
			-- upvalues: tryReadData (copy), HttpService (copy), AppStorageService (copy)
			local function _(p2)
				-- upvalues: Key (copy), p1 (copy)
				local Copy = if type(p2.chatDrafts) == "table" then table.clone(p2.chatDrafts) else {}
				Copy[Key] = if p1 == "" then nil else p1
				p2.chatDrafts = Copy
			end
			
			local TryReadDataResult, TryReadDataResult2 = tryReadData()
			local v7 = nil
			local TryReadDataResult1 = nil
			
			if TryReadDataResult then
				v7 = true
				TryReadDataResult1 = TryReadDataResult2
			else
				v7, TryReadDataResult1 = tryReadData()
			end
			if v7 then
				local Copy = if type(TryReadDataResult1.chatDrafts) == "table" then table.clone(TryReadDataResult1.chatDrafts) else {}
				Copy[Key] = if p1 == "" then nil else p1
				TryReadDataResult1.chatDrafts = Copy
				local Success, Result = pcall(HttpService.JSONEncode, HttpService, TryReadDataResult1)
				
				return if Success and type(Result) == "string" then pcall(function()
					-- upvalues: AppStorageService (upval), Result (copy)
					AppStorageService:SetItem("BuildAppStorageKey", Result)
					AppStorageService:Flush()
				end) else false
			else
				return false
			end
		end,
		getUnpublishedPlaytestModeTooltipDisplayCount = function(): number
			-- upvalues: tryReadData (copy), v4 (ref)
			local _, TryReadDataResult2 = tryReadData()
			local UnpublishedPlaytestModeTooltipDisplayCount: number = TryReadDataResult2.unpublishedPlaytestModeTooltipDisplayCount
			
			return (math.max(if type(UnpublishedPlaytestModeTooltipDisplayCount) == "number" and UnpublishedPlaytestModeTooltipDisplayCount >= 0 then math.floor(UnpublishedPlaytestModeTooltipDisplayCount) else 0, v4))
		end,
		incrementUnpublishedPlaytestModeTooltipDisplayCount = function()
			-- upvalues: FFlagBuildAdUpsellModule (upval), v4 (ref), tryReadData (copy), HttpService (copy), AppStorageService (copy)
			if not FFlagBuildAdUpsellModule then
				local _, TryReadDataResult2_1 = tryReadData()
				local UnpublishedPlaytestModeTooltipDisplayCount: number = TryReadDataResult2_1.unpublishedPlaytestModeTooltipDisplayCount
				local NewLargest = math.max(if type(UnpublishedPlaytestModeTooltipDisplayCount) == "number" and UnpublishedPlaytestModeTooltipDisplayCount >= 0 then math.floor(UnpublishedPlaytestModeTooltipDisplayCount) else 0, v4) + 1
				v4 = NewLargest
				TryReadDataResult2_1.unpublishedPlaytestModeTooltipDisplayCount = NewLargest
				local Success, Result = pcall(HttpService.JSONEncode, HttpService, TryReadDataResult2_1)
				
				return if Success and type(Result) == "string" then pcall(function()
					-- upvalues: AppStorageService (upval), Result (copy)
					AppStorageService:SetItem("BuildAppStorageKey", Result)
					AppStorageService:Flush()
				end) else false
			end
			local v7 = v4 + 1
			v4 = v7
			
			local function _(p1)
				-- upvalues: v7 (copy), v4 (upval)
				local UnpublishedPlaytestModeTooltipDisplayCount: number = p1.unpublishedPlaytestModeTooltipDisplayCount
				local Largest = math.max((if type(UnpublishedPlaytestModeTooltipDisplayCount) == "number" and UnpublishedPlaytestModeTooltipDisplayCount >= 0 then math.floor(UnpublishedPlaytestModeTooltipDisplayCount) else 0) + 1, v7)
				v4 = Largest
				p1.unpublishedPlaytestModeTooltipDisplayCount = Largest
			end
			
			local TryReadDataResult, TryReadDataResult2 = tryReadData()
			local v8 = nil
			local TryReadDataResult1 = nil
			
			if TryReadDataResult then
				v8 = true
				TryReadDataResult1 = TryReadDataResult2
			else
				v8, TryReadDataResult1 = tryReadData()
			end
			if v8 then
				local UnpublishedPlaytestModeTooltipDisplayCount: number = TryReadDataResult1.unpublishedPlaytestModeTooltipDisplayCount
				local Largest = math.max((if type(UnpublishedPlaytestModeTooltipDisplayCount) == "number" and UnpublishedPlaytestModeTooltipDisplayCount >= 0 then math.floor(UnpublishedPlaytestModeTooltipDisplayCount) else 0) + 1, v7)
				v4 = Largest
				TryReadDataResult1.unpublishedPlaytestModeTooltipDisplayCount = Largest
				local Success1, Result1 = pcall(HttpService.JSONEncode, HttpService, TryReadDataResult1)
				
				return if Success1 and type(Result1) == "string" then pcall(function()
					-- upvalues: AppStorageService (upval), Result1 (copy)
					AppStorageService:SetItem("BuildAppStorageKey", Result1)
					AppStorageService:Flush()
				end) else false
			else
				return false
			end
		end,
		wasPushNotificationsUpsellShownToday = function(p1): boolean
			-- upvalues: v3 (ref), tryReadData (copy)
			local IsoDate: string = (p1 or DateTime.now()):ToIsoDate()
			local Text: string = v3
			
			if Text ~= nil and string.match(Text, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(IsoDate, "^(%d%d%d%d%-%d%d%-%d%d)") then
				return true
			end
			local _, TryReadDataResult2 = tryReadData()
			local PushNotificationsUpsell = TryReadDataResult2.pushNotificationsUpsell
			local IsMatchMatch = false
			
			if type(PushNotificationsUpsell) == "table" then
				local LastShownAt: string = PushNotificationsUpsell.lastShownAt
				IsMatchMatch = LastShownAt ~= nil and string.match(LastShownAt, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(IsoDate, "^(%d%d%d%d%-%d%d%-%d%d)")
			end
			return IsMatchMatch
		end,
		markPushNotificationsUpsellShown = function(p1)
			-- upvalues: v3 (ref), FFlagBuildAdUpsellModule (upval), tryReadData (copy), HttpService (copy), AppStorageService (copy)
			local IsoDate = (p1 or DateTime.now()):ToIsoDate()
			v3 = IsoDate
			
			if not FFlagBuildAdUpsellModule then
				local _, TryReadDataResult2_1 = tryReadData()
				local PushNotificationsUpsell = TryReadDataResult2_1.pushNotificationsUpsell
				local Copy = if type(PushNotificationsUpsell) == "table" then table.clone(PushNotificationsUpsell) else {}
				Copy.lastShownAt = IsoDate
				TryReadDataResult2_1.pushNotificationsUpsell = Copy
				local Success, Result = pcall(HttpService.JSONEncode, HttpService, TryReadDataResult2_1)
				
				return if Success and type(Result) == "string" then pcall(function()
					-- upvalues: AppStorageService (upval), Result (copy)
					AppStorageService:SetItem("BuildAppStorageKey", Result)
					AppStorageService:Flush()
				end) else false
			end
			local function _(p2)
				-- upvalues: IsoDate (copy)
				local PushNotificationsUpsell = p2.pushNotificationsUpsell
				local Copy = if type(PushNotificationsUpsell) == "table" then table.clone(PushNotificationsUpsell) else {}
				Copy.lastShownAt = IsoDate
				p2.pushNotificationsUpsell = Copy
			end
			
			local TryReadDataResult, TryReadDataResult2 = tryReadData()
			local v7 = nil
			local TryReadDataResult1 = nil
			
			if TryReadDataResult then
				v7 = true
				TryReadDataResult1 = TryReadDataResult2
			else
				v7, TryReadDataResult1 = tryReadData()
			end
			if v7 then
				local PushNotificationsUpsell = TryReadDataResult1.pushNotificationsUpsell
				local Copy = if type(PushNotificationsUpsell) == "table" then table.clone(PushNotificationsUpsell) else {}
				Copy.lastShownAt = IsoDate
				TryReadDataResult1.pushNotificationsUpsell = Copy
				local Success1, Result1 = pcall(HttpService.JSONEncode, HttpService, TryReadDataResult1)
				
				return if Success1 and type(Result1) == "string" then pcall(function()
					-- upvalues: AppStorageService (upval), Result1 (copy)
					AppStorageService:SetItem("BuildAppStorageKey", Result1)
					AppStorageService:Flush()
				end) else false
			else
				return false
			end
		end,
		retryAdUpsellRead = function()
			-- upvalues: Flag1 (ref), loadAdUpsell (copy)
			Flag1 = false
			
			return (loadAdUpsell())
		end,
		getAdUpsellState = function(UniverseId, SessionId)
			-- upvalues: loadAdUpsell (copy)
			local AdUpsell, AdUpsell2 = loadAdUpsell()
			local Flag = nil
			local v7 = nil
			local Scheduler = nil
			
			if AdUpsell and AdUpsell2 ~= nil then
				Flag = true
				v7 = AdUpsell2
				Scheduler = AdUpsell2.scheduler
			else
				Flag = false
				v7 = nil
				Scheduler = nil
			end
			if not Flag or v7 == nil or Scheduler == nil then
				return {
					isAvailable = false,
					dismissedPermanently = true,
					hasShownUpsell = false,
					pendingMilestoneCount = 0,
					anchors = {}
				}
			end
			local Univers = Scheduler.universes[tostring(UniverseId)]
			local Anchors = {}
			
			if SessionId ~= nil then
				for _, anchor in Scheduler.anchors do
					if anchor.universeId == UniverseId and anchor.sessionId == SessionId then
						table.insert(Anchors, table.clone(anchor))
					end
				end
			end
			local PendingMilestoneCount = 0
			
			for _, pendingMilestone in Scheduler.pendingMilestones do
				if pendingMilestone.universeId == UniverseId and (SessionId == nil or pendingMilestone.sessionId == nil or pendingMilestone.sessionId == SessionId) then
					PendingMilestoneCount += 1
				end
			end
			return {
				isAvailable = true,
				dismissedPermanently = v7.dismissedPermanently == true or Univers ~= nil and Univers.dismissedPermanently,
				hasShownUpsell = Univers ~= nil and Univers.hasShownUpsell,
				anchors = Anchors,
				pendingMilestoneCount = PendingMilestoneCount
			}
		end,
		recordAdUpsellCompletedTurn = function(p1)
			-- upvalues: recordAdUpsellEvent (copy)
			return recordAdUpsellEvent(p1)
		end,
		recordAdUpsellPublish = function(p1)
			-- upvalues: recordAdUpsellEvent (copy)
			return recordAdUpsellEvent(p1)
		end,
		attachPendingAdUpsellMilestones = function(UniverseId, SessionId, p1)
			-- upvalues: loadAdUpsell (copy), FFlagBuildAdUpsellPinnedModule (upval), pruneAnchorCaps (copy), persistAdUpsellMutation (copy)
			local AdUpsell, AdUpsell2 = loadAdUpsell()
			local Flag = nil
			local v8 = nil
			local Scheduler = nil
			
			if AdUpsell and AdUpsell2 ~= nil then
				Flag = true
				v8 = AdUpsell2
				Scheduler = AdUpsell2.scheduler
			else
				Flag = false
				v8 = nil
				Scheduler = nil
			end
			if not Flag or v8 == nil or Scheduler == nil then
				return false
			end
			if v8.dismissedPermanently == true then
				return true
			end
			local PendingMilestones = {}
			local Flag1 = false
			
			for _, pendingMilestone in Scheduler.pendingMilestones do
				if pendingMilestone.universeId == UniverseId and (pendingMilestone.sessionId == nil or pendingMilestone.sessionId == SessionId) and (FFlagBuildAdUpsellPinnedModule or p1 ~= nil) then
					table.insert(Scheduler.anchors, {
						impressed = false,
						id = pendingMilestone.id,
						universeId = UniverseId,
						sessionId = SessionId,
						afterMessageKey = if FFlagBuildAdUpsellPinnedModule then nil else p1,
						order = pendingMilestone.order
					})
					Flag1 = true
				else
					table.insert(PendingMilestones, pendingMilestone)
				end
			end
			if Flag1 then
				Scheduler.pendingMilestones = PendingMilestones
				table.sort(Scheduler.anchors, function(A, B): boolean
					return A.order < B.order
				end)
				pruneAnchorCaps(Scheduler, UniverseId, SessionId)
				
				return (persistAdUpsellMutation())
			else
				return true
			end
		end,
		pruneAdUpsellAnchors = function(UniverseId, SessionId, p2)
			-- upvalues: FFlagBuildAdUpsellPinnedModule (upval), loadAdUpsell (copy), persistAdUpsellMutation (copy)
			if FFlagBuildAdUpsellPinnedModule then
				return true, false
			end
			local AdUpsell, AdUpsell2 = loadAdUpsell()
			local Flag = nil
			local Scheduler = nil
			
			if AdUpsell and AdUpsell2 ~= nil then
				Flag = true
				Scheduler = AdUpsell2.scheduler
			else
				Flag = false
				Scheduler = nil
			end
			if not Flag or Scheduler == nil then
				return false, false
			end
			local Anchors = {}
			local Flag1 = false
			
			for _, anchor in Scheduler.anchors do
				if anchor.universeId == UniverseId and anchor.sessionId == SessionId and (anchor.afterMessageKey == nil or not p2[anchor.afterMessageKey]) then
					Flag1 = true
				else
					table.insert(Anchors, anchor)
				end
			end
			if Flag1 then
				Scheduler.anchors = Anchors
				
				return persistAdUpsellMutation(), true
			else
				return true, false
			end
		end,
		markAdUpsellAnchorImpressed = function(UniverseId, SessionId, Id): boolean
			-- upvalues: loadAdUpsell (copy), Count (ref), Inverted (ref), Flag2 (ref), scheduleAdUpsellWriteRetry (copy)
			local AdUpsell, AdUpsell2 = loadAdUpsell()
			local Flag = nil
			local v9 = nil
			local Scheduler = nil
			
			if AdUpsell and AdUpsell2 ~= nil then
				Flag = true
				v9 = AdUpsell2
				Scheduler = AdUpsell2.scheduler
			else
				Flag = false
				v9 = nil
				Scheduler = nil
			end
			if not Flag or v9 == nil or Scheduler == nil or v9.dismissedPermanently == true then
				return false
			end
			for _, anchor in Scheduler.anchors do
				if anchor.universeId == UniverseId and anchor.sessionId == SessionId and anchor.id == Id then
					if anchor.impressed then
						return false
					else
						anchor.impressed = true
						Count = 0
						Inverted = true
						Flag2 = Flag2 or false
						scheduleAdUpsellWriteRetry()
						
						return true
					end
				end
			end
			return false
		end,
		markAdUpsellDismissedPermanently = function(UniverseId): boolean
			-- upvalues: loadAdUpsell (copy), tryReadData (copy), sanitizeAdUpsellScheduler (upval), v5 (ref), Flag1 (ref), Count (ref), persistCachedAdUpsell (copy), Inverted (ref), Flag2 (ref), scheduleAdUpsellWriteRetry (copy), DelayedThread (ref)
			local AdUpsell, AdUpsell2 = loadAdUpsell()
			
			if AdUpsell and AdUpsell2 ~= nil and AdUpsell2.dismissedPermanently == true then
				return true
			end
			local Flag = false
			
			if not AdUpsell or AdUpsell2 == nil then
				local TryReadDataResult, TryReadDataResult2 = tryReadData()
				local TryReadDataResult1 = nil
				
				if TryReadDataResult then
					TryReadDataResult1 = TryReadDataResult2
				else
					local _
					_, TryReadDataResult1 = tryReadData()
				end
				local Copy = if type(TryReadDataResult1.adUpsell) == "table" then table.clone(TryReadDataResult1.adUpsell) else {}
				Copy.dismissedPermanently = Copy.dismissedPermanently == true
				Copy.scheduler = sanitizeAdUpsellScheduler(Copy.scheduler)
				v5 = Copy
				Flag1 = false
				Flag = true
			end
			local Scheduler = v5.scheduler
			local Text = tostring(UniverseId)
			local Univers = Scheduler.universes[Text]
			
			if Univers == nil then
				Univers = {
					hasShownUpsell = false,
					dismissedPermanently = false,
					lastTouchedOrder = 0
				}
				Scheduler.universes[Text] = Univers
			end
			Univers.hasShownUpsell = false
			Univers.dismissedPermanently = true
			local Anchors = {}
			
			for _, anchor in Scheduler.anchors do
				if anchor.universeId ~= UniverseId then
					table.insert(Anchors, anchor)
				end
			end
			Scheduler.anchors = Anchors
			local PendingMilestones = {}
			
			for _, pendingMilestone in Scheduler.pendingMilestones do
				if pendingMilestone.universeId ~= UniverseId then
					table.insert(PendingMilestones, pendingMilestone)
				end
			end
			Scheduler.pendingMilestones = PendingMilestones
			local Flag3: boolean = Flag
			Count = 0
			Count += 1
			Inverted = not persistCachedAdUpsell(Flag3)
			
			if Inverted then
				Flag2 = Flag2 or Flag3 == true
				scheduleAdUpsellWriteRetry()
			else
				Count = 0
				Flag2 = false
				
				if DelayedThread ~= nil then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
			end
			return not Inverted
		end,
		isPushNotificationsUpsellDismissedPermanently = function(): boolean
			-- upvalues: Flag (ref), tryReadData (copy)
			if Flag then
				return true
			else
				local _, TryReadDataResult2 = tryReadData()
				local PushNotificationsUpsell = TryReadDataResult2.pushNotificationsUpsell
				
				return type(PushNotificationsUpsell) == "table" and PushNotificationsUpsell.dismissedPermanently == true
			end
		end,
		markPushNotificationsUpsellDismissedPermanently = function()
			-- upvalues: Flag (ref), FFlagBuildAdUpsellModule (upval), tryReadData (copy), HttpService (copy), AppStorageService (copy)
			Flag = true
			
			if not FFlagBuildAdUpsellModule then
				local _, TryReadDataResult2_1 = tryReadData()
				local PushNotificationsUpsell = TryReadDataResult2_1.pushNotificationsUpsell
				local Copy = if type(PushNotificationsUpsell) == "table" then table.clone(PushNotificationsUpsell) else {}
				Copy.dismissedPermanently = true
				TryReadDataResult2_1.pushNotificationsUpsell = Copy
				local Success, Result = pcall(HttpService.JSONEncode, HttpService, TryReadDataResult2_1)
				
				return if Success and type(Result) == "string" then pcall(function()
					-- upvalues: AppStorageService (upval), Result (copy)
					AppStorageService:SetItem("BuildAppStorageKey", Result)
					AppStorageService:Flush()
				end) else false
			end
			local function _(p3)
				local PushNotificationsUpsell = p3.pushNotificationsUpsell
				local Copy = if type(PushNotificationsUpsell) == "table" then table.clone(PushNotificationsUpsell) else {}
				Copy.dismissedPermanently = true
				p3.pushNotificationsUpsell = Copy
			end
			
			local TryReadDataResult, TryReadDataResult2 = tryReadData()
			local v10 = nil
			local TryReadDataResult1 = nil
			
			if TryReadDataResult then
				v10 = true
				TryReadDataResult1 = TryReadDataResult2
			else
				v10, TryReadDataResult1 = tryReadData()
			end
			if v10 then
				local PushNotificationsUpsell = TryReadDataResult1.pushNotificationsUpsell
				local Copy = if type(PushNotificationsUpsell) == "table" then table.clone(PushNotificationsUpsell) else {}
				Copy.dismissedPermanently = true
				TryReadDataResult1.pushNotificationsUpsell = Copy
				local Success1, Result1 = pcall(HttpService.JSONEncode, HttpService, TryReadDataResult1)
				
				return if Success1 and type(Result1) == "string" then pcall(function()
					-- upvalues: AppStorageService (upval), Result1 (copy)
					AppStorageService:SetItem("BuildAppStorageKey", Result1)
					AppStorageService:Flush()
				end) else false
			else
				return false
			end
		end,
		clearSessionCacheForTests = function()
			-- upvalues: FFlagBuildAgentAdCampaignCardModule (upval), v6 (ref), v3 (ref), Flag (ref), v4 (ref), v5 (ref), Flag1 (ref), Inverted (ref), Count (ref), DelayedThread (ref), Flag2 (ref)
			if FFlagBuildAgentAdCampaignCardModule and v6 ~= nil then
				v6.reset()
			end
			v3 = nil
			Flag = false
			v4 = 0
			v5 = nil
			Flag1 = false
			Inverted = false
			Count = 0
			
			if DelayedThread ~= nil then
				task.cancel(DelayedThread)
			end
			DelayedThread = nil
			Flag2 = false
		end
	}
end

local BuildAppStorage = createBuildAppStorage(game:GetService("AppStorageService"), (game:GetService("HttpService")))

return {
	STORAGE_KEY = "BuildAppStorageKey",
	AD_UPSELL_SCHEDULER_VERSION = 4,
	getAdCampaignCardStorage = if FFlagBuildAgentAdCampaignCardModule then BuildAppStorage.getAdCampaignCardStorage else nil,
	getChatDraft = BuildAppStorage.getChatDraft,
	setChatDraft = BuildAppStorage.setChatDraft,
	getUnpublishedPlaytestModeTooltipDisplayCount = BuildAppStorage.getUnpublishedPlaytestModeTooltipDisplayCount,
	incrementUnpublishedPlaytestModeTooltipDisplayCount = BuildAppStorage.incrementUnpublishedPlaytestModeTooltipDisplayCount,
	wasPushNotificationsUpsellShownToday = BuildAppStorage.wasPushNotificationsUpsellShownToday,
	markPushNotificationsUpsellShown = BuildAppStorage.markPushNotificationsUpsellShown,
	retryAdUpsellRead = BuildAppStorage.retryAdUpsellRead,
	getAdUpsellState = BuildAppStorage.getAdUpsellState,
	recordAdUpsellCompletedTurn = BuildAppStorage.recordAdUpsellCompletedTurn,
	recordAdUpsellPublish = BuildAppStorage.recordAdUpsellPublish,
	attachPendingAdUpsellMilestones = BuildAppStorage.attachPendingAdUpsellMilestones,
	pruneAdUpsellAnchors = BuildAppStorage.pruneAdUpsellAnchors,
	markAdUpsellAnchorImpressed = BuildAppStorage.markAdUpsellAnchorImpressed,
	markAdUpsellDismissedPermanently = BuildAppStorage.markAdUpsellDismissedPermanently,
	isPushNotificationsUpsellDismissedPermanently = BuildAppStorage.isPushNotificationsUpsellDismissedPermanently,
	markPushNotificationsUpsellDismissedPermanently = BuildAppStorage.markPushNotificationsUpsellDismissedPermanently,
	clearSessionCacheForTests = BuildAppStorage.clearSessionCacheForTests,
	createForTests = createBuildAppStorage
}