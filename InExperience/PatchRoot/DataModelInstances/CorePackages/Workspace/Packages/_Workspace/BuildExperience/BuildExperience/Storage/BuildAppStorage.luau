local buildExperience = script:FindFirstAncestor("BuildExperience")
local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local fFlagBuildAdUpsellModule = require(buildExperience.Flags.FFlagBuildAdUpsell)
local fFlagBuildAgentAdCampaignCardModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local createAdCampaignCardStorageModule = require(script.Parent.createAdCampaignCardStorage)

local function _(p1)
	return if type(p1) == "number" and p1 >= 0 then math.floor(p1) else 0
end

local _ = function(p1)
	return if type(p1) == "number" and p1 >= 0 then math.floor(p1) else 0
end

local _ = function(p1)
	return string.match(p1, "^(%d%d%d%d%-%d%d%-%d%d)")
end

local _ = function(p1, p2)
	return p1 ~= nil and string.match(p1, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(p2, "^(%d%d%d%d%-%d%d%-%d%d)")
end

local function makeEmptyAdUpsellScheduler()
	return {
		version = 3,
		nextOrder = 1,
		universes = {},
		anchors = {},
		pendingMilestones = {},
		recentEventIds = {}
	}
end

local function pruneUniverseCap(p1)
	local var1 = 0
	local var2 = nil
	local var3 = 1e999
	
	for i, v in p1.universes do
		var1 += 1
		
		if v.lastTouchedOrder < var3 or v.lastTouchedOrder == var3 and (var2 == nil or i < var2) then
			var2 = i
			var3 = v.lastTouchedOrder
		end
	end
	if var1 > 50 and var2 ~= nil then
		p1.universes[var2] = nil
		local var4 = tonumber(var2)
		
		if var4 ~= nil then
			for i_1 = #p1.anchors, 1, -1 do
				if p1.anchors[i_1].universeId == var4 then
					table.remove(p1.anchors, i_1)
				end
			end
			for i_2 = #p1.pendingMilestones, 1, -1 do
				if p1.pendingMilestones[i_2].universeId == var4 then
					table.remove(p1.pendingMilestones, i_2)
				end
			end
		end
	end
end

local function sanitizeAdUpsellScheduler(p2)
	-- upvalues: makeEmptyAdUpsellScheduler (ref), pruneUniverseCap (ref)
	if type(p2) ~= "table" then
		return makeEmptyAdUpsellScheduler()
	elseif p2.version ~= 3 then
		return makeEmptyAdUpsellScheduler()
	end
	local lastTouchedOrder, v
	local var5 = makeEmptyAdUpsellScheduler()
	local var6 = 0
	local var7 = 0
	
	if type(p2.universes) == "table" then
		for i, v in p2.universes do
			if type(i) == "string" and type(v) == "table" then
				lastTouchedOrder = v.lastTouchedOrder
				local var8 = if type(lastTouchedOrder) == "number" and lastTouchedOrder >= 0 then math.floor(lastTouchedOrder) else 0
				var6 = math.max(var6, var8)
				var5.universes[i] = {
					hasShownUpsell = v.hasShownUpsell == true,
					dismissedPermanently = v.dismissedPermanently == true,
					lastTouchedOrder = var8
				}
				var7 += 1
			end
		end
	end
	if type(p2.anchors) == "table" then
		for i, v in p2.anchors do
			if type(v) == "table" and type(v.id) == "string" and (type(v.universeId) == "number" and type(v.sessionId) == "string") and (type(v.afterMessageKey) == "string" and type(v.order) == "number") then
				local maxValue = math.max(1, math.floor(v.order))
				var6 = math.max(var6, maxValue)
				table.insert(var5.anchors, {
					id = v.id,
					universeId = v.universeId,
					sessionId = v.sessionId,
					afterMessageKey = v.afterMessageKey,
					order = maxValue,
					impressed = v.impressed == true
				})
			end
		end
	end
	if type(p2.pendingMilestones) == "table" then
		for i, v in p2.pendingMilestones do
			if type(v) == "table" and type(v.id) == "string" and type(v.universeId) == "number" and ((v.sessionId == nil or type(v.sessionId) == "string") and type(v.order) == "number") then
				local maxValue = math.max(1, math.floor(v.order))
				var6 = math.max(var6, maxValue)
				table.insert(var5.pendingMilestones, {
					id = v.id,
					universeId = v.universeId,
					sessionId = v.sessionId,
					order = maxValue
				})
			end
		end
	end
	if type(p2.recentEventIds) == "table" then
		for i, v in p2.recentEventIds do
			if type(v) == "string" then
				table.insert(var5.recentEventIds, v)
			end
		end
	end
	for _ = 51, var7 do
		pruneUniverseCap(var5)
	end
	table.sort(var5.anchors, function(p3, p4)
		return p3.order < p4.order
	end)
	local t = {}
	
	for i = #var5.anchors, 1, -1 do
		v = var5.anchors[i]
		local universeId = `{v.universeId}:{v.sessionId}`
		lastTouchedOrder = t[universeId] or 0
		
		if lastTouchedOrder >= 10 then
			table.remove(var5.anchors, i)
		else
			t[universeId] = lastTouchedOrder + 1
		end
	end
	table.sort(var5.pendingMilestones, function(p3, p4)
		return p3.order < p4.order
	end)
	while #var5.anchors > 50 do
		table.remove(var5.anchors, 1)
	end
	while #var5.pendingMilestones > 50 do
		table.remove(var5.pendingMilestones, 1)
	end
	while #var5.recentEventIds > 50 do
		table.remove(var5.recentEventIds, 1)
	end
	local nextOrder = p2.nextOrder
	var5.nextOrder = math.max(if type(nextOrder) == "number" and nextOrder >= 0 then math.floor(nextOrder) else 0, var6 + 1, 1)
	
	return var5
end

local function createBuildAppStorage(p3, p4)
	-- upvalues: createAdCampaignCardStorageModule (ref), fFlagBuildAdUpsellModule (ref), makeEmptyAdUpsellScheduler (ref), sanitizeAdUpsellScheduler (ref), pruneUniverseCap (ref), fFlagBuildAgentAdCampaignCardModule (ref)
	local var9 = nil
	local var10 = false
	local var11 = 0
	local var12 = nil
	local var13 = false
	local var14 = false
	local var15 = 0
	local var16 = nil
	local var17 = false
	local var18 = nil
	
	local function tryReadData()
		-- upvalues: p3 (ref), p4 (ref)
		local ok, status = pcall(p3.GetItem, p3, "BuildAppStorageKey")
		
		if not ok then
			return false, {}
		elseif type(status) ~= "string" or status == "" then
			return true, {}
		end
		local ok_1, status_1 = pcall(p4.JSONDecode, p4, status)
		
		if ok_1 and type(status_1) == "table" then
			return true, status_1
		end
		return true, {}
	end
	
	local function tryReadDataStrict()
		-- upvalues: p3 (ref), p4 (ref)
		local ok, status = pcall(p3.GetItem, p3, "BuildAppStorageKey")
		
		if not ok then
			return false, {}
		elseif type(status) ~= "string" or status == "" then
			return true, {}
		end
		local ok_1, status_1 = pcall(p4.JSONDecode, p4, status)
		
		if ok_1 and type(status_1) == "table" then
			return true, status_1
		end
		return false, {}
	end
	
	local function _()
		-- upvalues: tryReadData (ref)
		local _, var19 = tryReadData()
		
		return var19
	end
	
	local function tryReadDataWithRetry(p5)
		local var19, var20 = p5()
		
		if var19 then
			return true, var20
		end
		return p5()
	end
	
	local function writeData(p5)
		-- upvalues: p4 (ref), p3 (ref)
		local ok, status = pcall(p4.JSONEncode, p4, p5)
		
		return if ok and type(status) == "string" then pcall(function()
			-- upvalues: p3 (copy), status (ref)
			p3:SetItem("BuildAppStorageKey", status)
			p3:Flush()
		end) else false
	end
	
	local _ = function(p5)
		-- upvalues: tryReadData (ref), p4 (ref), p3 (ref)
		local var19, var20
		local var21 = tryReadData
		local var22, var23 = var21()
		
		if var22 then
			var19 = true
			var20 = var23
		else
			local var24, var25 = var21()
			var19 = var24
			var20 = var25
		end
		if not var19 then
			return false
		end
		p5(var20)
		local ok, status = pcall(p4.JSONEncode, p4, var20)
		
		return if ok and type(status) == "string" then pcall(function()
			-- upvalues: p3 (copy), status (ref)
			p3:SetItem("BuildAppStorageKey", status)
			p3:Flush()
		end) else false
	end
	
	local function getAdCampaignCardStorage()
		-- upvalues: var18 (write), createAdCampaignCardStorageModule (copy), tryReadDataWithRetry (ref), tryReadDataStrict (ref), writeData (ref)
		if var18 == nil then
			var18 = createAdCampaignCardStorageModule({
				readData = function()
					-- upvalues: tryReadDataWithRetry (copy), tryReadDataStrict (copy)
					return tryReadDataWithRetry(tryReadDataStrict)
				end,
				writeData = writeData
			})
		end
		return var18
	end
	
	local function getChatDraft(p5)
		-- upvalues: tryReadData (ref)
		local _, var19 = tryReadData()
		local chatDrafts = var19.chatDrafts
		
		if type(chatDrafts) ~= "table" then
			return nil
		end
		local var20 = chatDrafts[p5]
		
		return if type(var20) == "string" and var20 ~= "" then var20 else nil
	end
	
	local function setChatDraft(value, p5)
		-- upvalues: tryReadData (ref), p4 (ref), p3 (ref)
		local var19, var20
		local _ = function(p6)
			-- upvalues: value (ref), p5 (ref)
			local var21 = if type(p6.chatDrafts) == "table" then table.clone(p6.chatDrafts) else {}
			var21[value] = if p5 ~= "" then nil else p5
			p6.chatDrafts = var21
		end
		
		local var21, var22 = tryReadData()
		
		if var21 then
			var19 = true
			var20 = var22
		else
			local var23, var24 = tryReadData()
			var19 = var23
			var20 = var24
		end
		if not var19 then
			return false
		end
		local var25 = if type(var20.chatDrafts) == "table" then table.clone(var20.chatDrafts) else {}
		var25[value] = if p5 ~= "" then nil else p5
		var20.chatDrafts = var25
		local ok, status = pcall(p4.JSONEncode, p4, var20)
		
		return if ok and type(status) == "string" then pcall(function()
			-- upvalues: p3 (copy), status (ref)
			p3:SetItem("BuildAppStorageKey", status)
			p3:Flush()
		end) else false
	end
	
	local function getUnpublishedPlaytestModeTooltipDisplayCount()
		-- upvalues: tryReadData (ref), var11 (write)
		local _, var19 = tryReadData()
		local unpublishedPlaytestModeTooltipDisplayCount = var19.unpublishedPlaytestModeTooltipDisplayCount
		
		return math.max(if type(unpublishedPlaytestModeTooltipDisplayCount) == "number" and unpublishedPlaytestModeTooltipDisplayCount >= 0 then math.floor(unpublishedPlaytestModeTooltipDisplayCount) else 0, var11)
	end
	
	local function incrementUnpublishedPlaytestModeTooltipDisplayCount()
		-- upvalues: fFlagBuildAdUpsellModule (copy), var11 (write), tryReadData (ref), p4 (ref), p3 (ref)
		local status
		if fFlagBuildAdUpsellModule then
			local var19, var20
			local var21 = var11 + 1
			var11 = var21
			
			local _ = function(p5)
				-- upvalues: var21 (ref), var11 (copy)
				local unpublishedPlaytestModeTooltipDisplayCount = p5.unpublishedPlaytestModeTooltipDisplayCount
				unpublishedPlaytestModeTooltipDisplayCount = math.max((if type(unpublishedPlaytestModeTooltipDisplayCount) == "number" and unpublishedPlaytestModeTooltipDisplayCount >= 0 then math.floor(unpublishedPlaytestModeTooltipDisplayCount) else 0) + 1, var21)
				var11 = unpublishedPlaytestModeTooltipDisplayCount
				p5.unpublishedPlaytestModeTooltipDisplayCount = unpublishedPlaytestModeTooltipDisplayCount
			end
			
			local var22, var23 = tryReadData()
			
			if var22 then
				var19 = true
				var20 = var23
			else
				local var24, var25 = tryReadData()
				var19 = var24
				var20 = var25
			end
			if not var19 then
				return false
			end
			local status = var20.unpublishedPlaytestModeTooltipDisplayCount
			status = math.max((if type(status) == "number" and status >= 0 then math.floor(status) else 0) + 1, var21)
			var11 = status
			var20.unpublishedPlaytestModeTooltipDisplayCount = status
			status, status = pcall(p4.JSONEncode, p4, var20)
			
			return if status and type(status) == "string" then pcall(function()
				-- upvalues: p3 (copy), status (ref)
				p3:SetItem("BuildAppStorageKey", status)
				p3:Flush()
			end) else false
		else
			local _, var26 = tryReadData()
			var26 = var26.unpublishedPlaytestModeTooltipDisplayCount
			var26 = math.max(if type(var26) == "number" and var26 >= 0 then math.floor(var26) else 0, var11) + 1
			var11 = var26
			var26.unpublishedPlaytestModeTooltipDisplayCount = var26
			ok, status = pcall(p4.JSONEncode, p4, var26)
			
			return if ok and type(status) == "string" then pcall(function()
				-- upvalues: p3 (copy), status (ref)
				p3:SetItem("BuildAppStorageKey", status)
				p3:Flush()
			end) else false
		end
	end
	
	local function wasPushNotificationsUpsellShownToday(p5)
		-- upvalues: var9 (write), tryReadData (ref)
		local var19 = (p5 or DateTime.now()):ToIsoDate()
		
		if var9 ~= nil and string.match(var9, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(var19, "^(%d%d%d%d%-%d%d%-%d%d)") then
			return true
		end
		local _, var20 = tryReadData()
		local pushNotificationsUpsell = var20.pushNotificationsUpsell
		local var21 = false
		
		if type(pushNotificationsUpsell) == "table" then
			local lastShownAt = pushNotificationsUpsell.lastShownAt
			var21 = lastShownAt ~= nil and string.match(lastShownAt, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(var19, "^(%d%d%d%d%-%d%d%-%d%d)")
		end
		return var21
	end
	
	local function markPushNotificationsUpsellShown(p5)
		-- upvalues: var9 (write), fFlagBuildAdUpsellModule (copy), tryReadData (ref), p4 (ref), p3 (ref)
		local ok
		local var19 = (p5 or DateTime.now()):ToIsoDate()
		var9 = var19
		
		if fFlagBuildAdUpsellModule then
			local var20, var21
			local _ = function(p6)
				-- upvalues: var19 (ref)
				local pushNotificationsUpsell = p6.pushNotificationsUpsell
				local var22 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
				var22.lastShownAt = var19
				p6.pushNotificationsUpsell = var22
			end
			
			local var22, var23 = tryReadData()
			
			if var22 then
				var20 = true
				var21 = var23
			else
				local var24, var25 = tryReadData()
				var20 = var24
				var21 = var25
			end
			if not var20 then
				return false
			end
			local pushNotificationsUpsell = var21.pushNotificationsUpsell
			local var26 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
			var26.lastShownAt = var19
			var21.pushNotificationsUpsell = var26
			ok, status = pcall(p4.JSONEncode, p4, var21)
			
			return if ok and type(status) == "string" then pcall(function()
				-- upvalues: p3 (copy), status (ref)
				p3:SetItem("BuildAppStorageKey", status)
				p3:Flush()
			end) else false
		else
			local _, var27 = tryReadData()
			local pushNotificationsUpsell = var27.pushNotificationsUpsell
			local var28 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
			var28.lastShownAt = var19
			var27.pushNotificationsUpsell = var28
			ok, status = pcall(p4.JSONEncode, p4, var27)
			
			return if ok and type(status) == "string" then pcall(function()
				-- upvalues: p3 (copy), status (ref)
				p3:SetItem("BuildAppStorageKey", status)
				p3:Flush()
			end) else false
		end
	end
	
	local function loadAdUpsell()
		-- upvalues: var12 (write), var13 (write), tryReadDataStrict (ref), makeEmptyAdUpsellScheduler (copy), sanitizeAdUpsellScheduler (copy)
		if var12 ~= nil then
			return true, var12
		elseif var13 then
			return false, nil
		end
		local var19, var20
		local var21 = tryReadDataStrict
		local var22, var23 = var21()
		
		if var22 then
			var19 = true
			var20 = var23
		else
			local var24, var25 = var21()
			var19 = var24
			var20 = var25
		end
		if var19 then
			local adUpsell = var20.adUpsell
			local var26 = if type(adUpsell) == "table" then table.clone(adUpsell) else {}
			var26.dismissedPermanently = var26.dismissedPermanently == true
			var26.scheduler = if var26.dismissedPermanently then makeEmptyAdUpsellScheduler() else sanitizeAdUpsellScheduler(var26.scheduler)
			var12 = var26
			
			return true, var26
		end
		var13 = true
		
		return false, nil
	end
	
	local function retryAdUpsellRead()
		-- upvalues: var13 (write), loadAdUpsell (ref)
		var13 = false
		
		return loadAdUpsell()
	end
	
	local function persistCachedAdUpsell(p5)
		-- upvalues: var12 (write), tryReadData (ref), tryReadDataStrict (ref), p4 (ref), p3 (ref)
		if var12 == nil then
			return false
		end
		local var19, var20
		local var21 = if p5 then tryReadData else tryReadDataStrict
		local var22, var23 = var21()
		
		if var22 then
			var19 = true
			var20 = var23
		else
			local var24, var25 = var21()
			var19 = var24
			var20 = var25
		end
		if not var19 then
			return false
		end
		local adUpsell = var20.adUpsell
		local var26 = if type(adUpsell) == "table" then table.clone(adUpsell) else {}
		var26.dismissedPermanently = var12.dismissedPermanently
		var26.scheduler = var12.scheduler
		var20.adUpsell = var26
		local ok, status = pcall(p4.JSONEncode, p4, var20)
		
		return if ok and type(status) == "string" then pcall(function()
			-- upvalues: p3 (copy), status (ref)
			p3:SetItem("BuildAppStorageKey", status)
			p3:Flush()
		end) else false
	end
	
	local function scheduleAdUpsellWriteRetry(p5)
		-- upvalues: var16 (write), var15 (write), var14 (write), persistCachedAdUpsell (ref), var17 (write), scheduleAdUpsellWriteRetry (ref)
		if var16 == nil and var15 < 3 then
			local function retryWrite()
				-- upvalues: var16 (copy), var14 (copy), var15 (copy), persistCachedAdUpsell (copy), var17 (copy), scheduleAdUpsellWriteRetry (copy)
				var16 = nil
				
				if not var14 or var15 >= 3 then return end
				var15 += 1
				
				if persistCachedAdUpsell(var17) then
					var14 = false
					var15 = 0
					var17 = false
					
					return
				end
				scheduleAdUpsellWriteRetry(true)
			end
			
			var16 = if p5 then task.delay(1, retryWrite) else task.defer(retryWrite)
			
			return
		end
	end
	
	local function persistAdUpsellMutation(p5, p6)
		-- upvalues: var15 (write), var14 (write), var17 (write), scheduleAdUpsellWriteRetry (ref), persistCachedAdUpsell (ref), var16 (write)
		var15 = 0
		
		if p6 then
			var14 = true
			var17 = var17 or p5 == true
			scheduleAdUpsellWriteRetry()
			
			return true
		end
		var15 += 1
		local var19 = persistCachedAdUpsell(p5)
		var14 = not var19
		
		if var14 then
			var17 = var17 or p5 == true
			scheduleAdUpsellWriteRetry()
			
			return var19
		end
		var15 = 0
		var17 = false
		
		if var16 ~= nil then
			task.cancel(var16)
			var16 = nil
		end
		return var19
	end
	
	local _ = function()
		-- upvalues: loadAdUpsell (ref)
		local var19, var20 = loadAdUpsell()
		
		if var19 and var20 ~= nil then
			return true, var20, var20.scheduler
		end
		return false, nil, nil
	end
	
	local _ = function(p5, p6)
		local var19 = tostring(p6)
		local var20 = p5.universes[var19]
		
		if var20 == nil then
			var20 = {
				hasShownUpsell = false,
				dismissedPermanently = false,
				lastTouchedOrder = 0
			}
			p5.universes[var19] = var20
		end
		return var20
	end
	
	local _ = function(p5, p6)
		return table.find(p5.recentEventIds, p6) ~= nil
	end
	
	local function rememberEvent(p5, p6)
		table.insert(p5.recentEventIds, p6)
		while #p5.recentEventIds > 50 do
			table.remove(p5.recentEventIds, 1)
		end
	end
	
	local function pruneAnchorCaps(p7, p8, p9)
		local var19 = 0
		
		for i, v in p7.anchors do
			if v.universeId == p8 and v.sessionId == p9 then
				var19 += 1
			end
		end
		while var19 > 10 do
			for i_1, v_1 in p7.anchors do
				if v_1.universeId == p8 and v_1.sessionId == p9 then
					table.remove(p7.anchors, i_1)
					var19 -= 1
					continue
				end
			end
		end
		while #p7.anchors > 50 do
			table.remove(p7.anchors, 1)
		end
	end
	
	local function addMilestone(p10, p11, p12, p13, p14, p15)
		-- upvalues: pruneAnchorCaps (ref)
		if p13 ~= nil and p14 ~= nil then
			table.insert(p10.anchors, {
				impressed = false,
				id = p11,
				universeId = p12,
				sessionId = p13,
				afterMessageKey = p14,
				order = p15
			})
			pruneAnchorCaps(p10, p12, p13)
			
			return
		end
		table.insert(p10.pendingMilestones, { id = p11, universeId = p12, sessionId = p13, order = p15 })
		while #p10.pendingMilestones > 50 do
			table.remove(p10.pendingMilestones, 1)
		end
	end
	
	local function recordAdUpsellEvent(p16)
		-- upvalues: loadAdUpsell (ref), var14 (write), persistAdUpsellMutation (ref), rememberEvent (ref), pruneUniverseCap (copy), addMilestone (ref)
		local var20, var21, scheduler
		local var22, var23 = loadAdUpsell()
		
		if var22 and var23 ~= nil then
			var20 = true
			var21 = var23
			scheduler = var23.scheduler
		else
			var20 = false
			var21 = nil
			scheduler = nil
		end
		if not var20 or var21 == nil or scheduler == nil then
			return false, false
		end
		var22 = scheduler.universes[tostring(p16.universeId)]
		
		if var21.dismissedPermanently == true or var22 ~= nil and var22.dismissedPermanently then
			return true, false
		elseif not p16.isEligiblePublish then
			return true, false
		elseif var22 ~= nil and var22.hasShownUpsell or table.find(scheduler.recentEventIds, p16.eventId) ~= nil then
			return if var14 then persistAdUpsellMutation() else true, false
		end
		rememberEvent(scheduler, p16.eventId)
		local var24 = tostring(p16.universeId)
		local var25 = scheduler.universes[var24]
		
		if var25 == nil then
			var25 = {
				hasShownUpsell = false,
				dismissedPermanently = false,
				lastTouchedOrder = 0
			}
			scheduler.universes[var24] = var25
		end
		local nextOrder = scheduler.nextOrder
		scheduler.nextOrder += 1
		var25.lastTouchedOrder = nextOrder
		var25.hasShownUpsell = true
		pruneUniverseCap(scheduler)
		addMilestone(scheduler, p16.eventId, p16.universeId, p16.sessionId, p16.afterMessageKey, nextOrder)
		
		return persistAdUpsellMutation(), true
	end
	
	return {
		STORAGE_KEY = "BuildAppStorageKey",
		AD_UPSELL_SCHEDULER_VERSION = 3,
		getAdCampaignCardStorage = if fFlagBuildAgentAdCampaignCardModule then getAdCampaignCardStorage else nil,
		getChatDraft = getChatDraft,
		setChatDraft = setChatDraft,
		getUnpublishedPlaytestModeTooltipDisplayCount = getUnpublishedPlaytestModeTooltipDisplayCount,
		incrementUnpublishedPlaytestModeTooltipDisplayCount = incrementUnpublishedPlaytestModeTooltipDisplayCount,
		wasPushNotificationsUpsellShownToday = wasPushNotificationsUpsellShownToday,
		markPushNotificationsUpsellShown = markPushNotificationsUpsellShown,
		retryAdUpsellRead = retryAdUpsellRead,
		getAdUpsellState = function(p16, p17)
			-- upvalues: loadAdUpsell (ref)
			local var20, var21, scheduler
			local var22, var23 = loadAdUpsell()
			
			if var22 and var23 ~= nil then
				var20 = true
				var21 = var23
				scheduler = var23.scheduler
			else
				var20 = false
				var21 = nil
				scheduler = nil
			end
			if not var20 or var21 == nil or scheduler == nil then
				return {
					isAvailable = false,
					dismissedPermanently = true,
					hasShownUpsell = false,
					pendingMilestoneCount = 0,
					anchors = {}
				}
			end
			var22 = scheduler.universes[tostring(p16)]
			local t = {}
			
			if p17 ~= nil then
				for i, v in scheduler.anchors do
					if v.universeId == p16 and v.sessionId == p17 then
						table.insert(t, table.clone(v))
					end
				end
			end
			local var24 = 0
			
			for i, v in scheduler.pendingMilestones do
				if v.universeId == p16 and (p17 == nil or v.sessionId == nil or v.sessionId == p17) then
					var24 += 1
				end
			end
			return {
				isAvailable = true,
				dismissedPermanently = if var21.dismissedPermanently ~= true then var22 ~= nil and var22.dismissedPermanently else true,
				hasShownUpsell = if var22 ~= nil then false else var22.hasShownUpsell,
				anchors = t,
				pendingMilestoneCount = var24
			}
		end,
		recordAdUpsellCompletedTurn = function(p18)
			-- upvalues: recordAdUpsellEvent (ref)
			return recordAdUpsellEvent(p18)
		end,
		recordAdUpsellPublish = function(p18)
			-- upvalues: recordAdUpsellEvent (ref)
			return recordAdUpsellEvent(p18)
		end,
		attachPendingAdUpsellMilestones = function(p18, p19, p20)
			-- upvalues: loadAdUpsell (ref), pruneAnchorCaps (ref), persistAdUpsellMutation (ref)
			local var25, var26, scheduler
			local var27, var28 = loadAdUpsell()
			
			if var27 and var28 ~= nil then
				var25 = true
				var26 = var28
				scheduler = var28.scheduler
			else
				var25 = false
				var26 = nil
				scheduler = nil
			end
			if not var25 or var26 == nil or scheduler == nil then
				return false
			elseif var26.dismissedPermanently == true then
				return true
			end
			var27 = {}
			local var29 = false
			
			for i, v in scheduler.pendingMilestones do
				if v.universeId == p18 and (v.sessionId == nil or v.sessionId == p19) then
					table.insert(scheduler.anchors, {
						impressed = false,
						id = v.id,
						universeId = p18,
						sessionId = p19,
						afterMessageKey = p20,
						order = v.order
					})
					var29 = true
				else
					table.insert(var27, v)
				end
			end
			if var29 then
				scheduler.pendingMilestones = var27
				table.sort(scheduler.anchors, function(p21, p22)
					return p21.order < p22.order
				end)
				pruneAnchorCaps(scheduler, p18, p19)
				
				return persistAdUpsellMutation()
			end
			return true
		end,
		pruneAdUpsellAnchors = function(p21, p22, p23)
			-- upvalues: loadAdUpsell (ref), persistAdUpsellMutation (ref)
			local var30, var31, scheduler
			local var32, var33 = loadAdUpsell()
			
			if var32 and var33 ~= nil then
				var30 = true
				var31 = var33
				scheduler = var33.scheduler
			else
				var30 = false
				var31 = nil
				scheduler = nil
			end
			if not var30 or scheduler == nil then
				return false, false
			end
			var32 = {}
			local var34 = false
			
			for i, v in scheduler.anchors do
				if v.universeId == p21 and v.sessionId == p22 and not p23[v.afterMessageKey] then
					var34 = true
				else
					table.insert(var32, v)
				end
			end
			if var34 then
				scheduler.anchors = var32
				
				return persistAdUpsellMutation(), true
			end
			return true, false
		end,
		markAdUpsellAnchorImpressed = function(p24, p25, p26)
			-- upvalues: loadAdUpsell (ref), var15 (write), var14 (write), var17 (write), scheduleAdUpsellWriteRetry (ref)
			local var35, var36, scheduler
			local var37, var38 = loadAdUpsell()
			
			if var37 and var38 ~= nil then
				var35 = true
				var36 = var38
				scheduler = var38.scheduler
			else
				var35 = false
				var36 = nil
				scheduler = nil
			end
			if not var35 or var36 == nil or (scheduler == nil or var36.dismissedPermanently == true) then
				return false
			end
			for i, v in scheduler.anchors do
				if v.universeId == p24 and v.sessionId == p25 and v.id == p26 then
					if v.impressed then
						return false
					end
					v.impressed = true
					var15 = 0
					var14 = true
					var17 = var17 or false
					scheduleAdUpsellWriteRetry()
					
					return true
				end
			end
			return false
		end,
		markAdUpsellDismissedPermanently = function(p27)
			-- upvalues: loadAdUpsell (ref), tryReadData (ref), sanitizeAdUpsellScheduler (copy), var12 (write), var13 (write), var15 (write), persistCachedAdUpsell (ref), var14 (write), var17 (write), scheduleAdUpsellWriteRetry (ref), var16 (write)
			local var39, var40 = loadAdUpsell()
			
			if var39 and var40 ~= nil and var40.dismissedPermanently == true then
				return true
			end
			local var41 = false
			
			if not var39 or var40 == nil then
				local var42
				local var43, var44 = tryReadData()
				
				if var43 then
					local _ = true
					var42 = var44
				else
					local var45, var46 = tryReadData()
					local _ = var45
					var42 = var46
				end
				local var47 = if type(var42.adUpsell) == "table" then table.clone(var42.adUpsell) else {}
				var47.dismissedPermanently = var47.dismissedPermanently == true
				var47.scheduler = sanitizeAdUpsellScheduler(var47.scheduler)
				var12 = var47
				var13 = false
				var41 = true
			end
			local scheduler = var12.scheduler
			local var48 = tostring(p27)
			local var49 = scheduler.universes[var48]
			
			if var49 == nil then
				var49 = {
					hasShownUpsell = false,
					dismissedPermanently = false,
					lastTouchedOrder = 0
				}
				scheduler.universes[var48] = var49
			end
			var49.hasShownUpsell = false
			var49.dismissedPermanently = true
			local t = {}
			
			for i, v in scheduler.anchors do
				if v.universeId ~= p27 then
					table.insert(t, v)
				end
			end
			scheduler.anchors = t
			local t_1 = {}
			
			for i_1, v_1 in scheduler.pendingMilestones do
				if v_1.universeId ~= p27 then
					table.insert(t_1, v_1)
				end
			end
			scheduler.pendingMilestones = t_1
			var15 = 0
			var15 += 1
			var14 = not persistCachedAdUpsell(var41)
			
			if var14 then
				var17 = var17 or var41 == true
				scheduleAdUpsellWriteRetry()
			else
				var15 = 0
				var17 = false
				
				if var16 ~= nil then
					task.cancel(var16)
					var16 = nil
				end
			end
			return not var14
		end,
		isPushNotificationsUpsellDismissedPermanently = function()
			-- upvalues: var10 (write), tryReadData (ref)
			if var10 then
				return true
			end
			local _, var50 = tryReadData()
			local pushNotificationsUpsell = var50.pushNotificationsUpsell
			
			return type(pushNotificationsUpsell) == "table" and pushNotificationsUpsell.dismissedPermanently == true
		end,
		markPushNotificationsUpsellDismissedPermanently = function()
			-- upvalues: var10 (write), fFlagBuildAdUpsellModule (copy), tryReadData (ref), p4 (ref), p3 (ref)
			local ok
			var10 = true
			
			if fFlagBuildAdUpsellModule then
				local var50, var51
				local _ = function(p28)
					local pushNotificationsUpsell = p28.pushNotificationsUpsell
					local var52 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
					var52.dismissedPermanently = true
					p28.pushNotificationsUpsell = var52
				end
				
				local var52, var53 = tryReadData()
				
				if var52 then
					var50 = true
					var51 = var53
				else
					local var54, var55 = tryReadData()
					var50 = var54
					var51 = var55
				end
				if not var50 then
					return false
				end
				local pushNotificationsUpsell = var51.pushNotificationsUpsell
				local var56 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
				var56.dismissedPermanently = true
				var51.pushNotificationsUpsell = var56
				ok, status = pcall(p4.JSONEncode, p4, var51)
				
				return if ok and type(status) == "string" then pcall(function()
					-- upvalues: p3 (copy), status (ref)
					p3:SetItem("BuildAppStorageKey", status)
					p3:Flush()
				end) else false
			else
				local _, var57 = tryReadData()
				local pushNotificationsUpsell = var57.pushNotificationsUpsell
				local var58 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
				var58.dismissedPermanently = true
				var57.pushNotificationsUpsell = var58
				ok, status = pcall(p4.JSONEncode, p4, var57)
				
				return if ok and type(status) == "string" then pcall(function()
					-- upvalues: p3 (copy), status (ref)
					p3:SetItem("BuildAppStorageKey", status)
					p3:Flush()
				end) else false
			end
		end,
		clearSessionCacheForTests = function()
			-- upvalues: fFlagBuildAgentAdCampaignCardModule (copy), var18 (write), var9 (write), var10 (write), var11 (write), var12 (write), var13 (write), var14 (write), var15 (write), var16 (write), var17 (write)
			if fFlagBuildAgentAdCampaignCardModule and var18 ~= nil then
				var18.reset()
			end
			var9 = nil
			var10 = false
			var11 = 0
			var12 = nil
			var13 = false
			var14 = false
			var15 = 0
			
			if var16 ~= nil then
				task.cancel(var16)
			end
			var16 = nil
			var17 = false
		end
	}
end

local var50 = createBuildAppStorage(appStorageService, httpService)

return {
	STORAGE_KEY = "BuildAppStorageKey",
	AD_UPSELL_SCHEDULER_VERSION = 3,
	getAdCampaignCardStorage = if fFlagBuildAgentAdCampaignCardModule then var50.getAdCampaignCardStorage else nil,
	getChatDraft = var50.getChatDraft,
	setChatDraft = var50.setChatDraft,
	getUnpublishedPlaytestModeTooltipDisplayCount = var50.getUnpublishedPlaytestModeTooltipDisplayCount,
	incrementUnpublishedPlaytestModeTooltipDisplayCount = var50.incrementUnpublishedPlaytestModeTooltipDisplayCount,
	wasPushNotificationsUpsellShownToday = var50.wasPushNotificationsUpsellShownToday,
	markPushNotificationsUpsellShown = var50.markPushNotificationsUpsellShown,
	retryAdUpsellRead = var50.retryAdUpsellRead,
	getAdUpsellState = var50.getAdUpsellState,
	recordAdUpsellCompletedTurn = var50.recordAdUpsellCompletedTurn,
	recordAdUpsellPublish = var50.recordAdUpsellPublish,
	attachPendingAdUpsellMilestones = var50.attachPendingAdUpsellMilestones,
	pruneAdUpsellAnchors = var50.pruneAdUpsellAnchors,
	markAdUpsellAnchorImpressed = var50.markAdUpsellAnchorImpressed,
	markAdUpsellDismissedPermanently = var50.markAdUpsellDismissedPermanently,
	isPushNotificationsUpsellDismissedPermanently = var50.isPushNotificationsUpsellDismissedPermanently,
	markPushNotificationsUpsellDismissedPermanently = var50.markPushNotificationsUpsellDismissedPermanently,
	clearSessionCacheForTests = var50.clearSessionCacheForTests,
	createForTests = createBuildAppStorage
}