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
				lastTouchedOrder = var5.universes
				local t = { hasShownUpsell = v.hasShownUpsell == true }
				local completedTurnsSinceUpsell = v.completedTurnsSinceUpsell
				t.completedTurnsSinceUpsell = if type(completedTurnsSinceUpsell) == "number" and completedTurnsSinceUpsell >= 0 then math.floor(completedTurnsSinceUpsell) else 0
				completedTurnsSinceUpsell = v.eligiblePublishesSinceUpsell
				t.eligiblePublishesSinceUpsell = if type(completedTurnsSinceUpsell) == "number" and completedTurnsSinceUpsell >= 0 then math.floor(completedTurnsSinceUpsell) else 0
				t.lastTouchedOrder = var8
				lastTouchedOrder[i] = t
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
	local var11 = false
	local var12 = 0
	local var13 = nil
	local var14 = false
	local var15 = false
	local var16 = 0
	local var17 = nil
	local var18 = false
	local var19 = nil
	
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
		local _, var20 = tryReadData()
		
		return var20
	end
	
	local function tryReadDataWithRetry(p5)
		local var20, var21 = p5()
		
		if var20 then
			return true, var21
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
		local var20, var21
		local var22 = tryReadData
		local var23, var24 = var22()
		
		if var23 then
			var20 = true
			var21 = var24
		else
			local var25, var26 = var22()
			var20 = var25
			var21 = var26
		end
		if not var20 then
			return false
		end
		p5(var21)
		local ok, status = pcall(p4.JSONEncode, p4, var21)
		
		return if ok and type(status) == "string" then pcall(function()
			-- upvalues: p3 (copy), status (ref)
			p3:SetItem("BuildAppStorageKey", status)
			p3:Flush()
		end) else false
	end
	
	local function getAdCampaignCardStorage()
		-- upvalues: var19 (write), createAdCampaignCardStorageModule (copy), tryReadDataWithRetry (ref), tryReadDataStrict (ref), writeData (ref)
		if var19 == nil then
			var19 = createAdCampaignCardStorageModule({
				readData = function()
					-- upvalues: tryReadDataWithRetry (copy), tryReadDataStrict (copy)
					return tryReadDataWithRetry(tryReadDataStrict)
				end,
				writeData = writeData
			})
		end
		return var19
	end
	
	local function getChatDraft(p5)
		-- upvalues: tryReadData (ref)
		local _, var20 = tryReadData()
		local chatDrafts = var20.chatDrafts
		
		if type(chatDrafts) ~= "table" then
			return nil
		end
		local var21 = chatDrafts[p5]
		
		return if type(var21) == "string" and var21 ~= "" then var21 else nil
	end
	
	local function setChatDraft(value, p5)
		-- upvalues: tryReadData (ref), p4 (ref), p3 (ref)
		local var20, var21
		local _ = function(p6)
			-- upvalues: value (ref), p5 (ref)
			local var22 = if type(p6.chatDrafts) == "table" then table.clone(p6.chatDrafts) else {}
			var22[value] = if p5 ~= "" then nil else p5
			p6.chatDrafts = var22
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
		local var26 = if type(var21.chatDrafts) == "table" then table.clone(var21.chatDrafts) else {}
		var26[value] = if p5 ~= "" then nil else p5
		var21.chatDrafts = var26
		local ok, status = pcall(p4.JSONEncode, p4, var21)
		
		return if ok and type(status) == "string" then pcall(function()
			-- upvalues: p3 (copy), status (ref)
			p3:SetItem("BuildAppStorageKey", status)
			p3:Flush()
		end) else false
	end
	
	local function getUnpublishedPlaytestModeTooltipDisplayCount()
		-- upvalues: tryReadData (ref), var12 (write)
		local _, var20 = tryReadData()
		local unpublishedPlaytestModeTooltipDisplayCount = var20.unpublishedPlaytestModeTooltipDisplayCount
		
		return math.max(if type(unpublishedPlaytestModeTooltipDisplayCount) == "number" and unpublishedPlaytestModeTooltipDisplayCount >= 0 then math.floor(unpublishedPlaytestModeTooltipDisplayCount) else 0, var12)
	end
	
	local function incrementUnpublishedPlaytestModeTooltipDisplayCount()
		-- upvalues: fFlagBuildAdUpsellModule (copy), var12 (write), tryReadData (ref), p4 (ref), p3 (ref)
		local status
		if fFlagBuildAdUpsellModule then
			local var20, var21
			local var22 = var12 + 1
			var12 = var22
			
			local _ = function(p5)
				-- upvalues: var22 (ref), var12 (copy)
				local unpublishedPlaytestModeTooltipDisplayCount = p5.unpublishedPlaytestModeTooltipDisplayCount
				unpublishedPlaytestModeTooltipDisplayCount = math.max((if type(unpublishedPlaytestModeTooltipDisplayCount) == "number" and unpublishedPlaytestModeTooltipDisplayCount >= 0 then math.floor(unpublishedPlaytestModeTooltipDisplayCount) else 0) + 1, var22)
				var12 = unpublishedPlaytestModeTooltipDisplayCount
				p5.unpublishedPlaytestModeTooltipDisplayCount = unpublishedPlaytestModeTooltipDisplayCount
			end
			
			local var23, var24 = tryReadData()
			
			if var23 then
				var20 = true
				var21 = var24
			else
				local var25, var26 = tryReadData()
				var20 = var25
				var21 = var26
			end
			if not var20 then
				return false
			end
			local status = var21.unpublishedPlaytestModeTooltipDisplayCount
			status = math.max((if type(status) == "number" and status >= 0 then math.floor(status) else 0) + 1, var22)
			var12 = status
			var21.unpublishedPlaytestModeTooltipDisplayCount = status
			status, status = pcall(p4.JSONEncode, p4, var21)
			
			return if status and type(status) == "string" then pcall(function()
				-- upvalues: p3 (copy), status (ref)
				p3:SetItem("BuildAppStorageKey", status)
				p3:Flush()
			end) else false
		else
			local _, var27 = tryReadData()
			var27 = var27.unpublishedPlaytestModeTooltipDisplayCount
			var27 = math.max(if type(var27) == "number" and var27 >= 0 then math.floor(var27) else 0, var12) + 1
			var12 = var27
			var27.unpublishedPlaytestModeTooltipDisplayCount = var27
			ok, status = pcall(p4.JSONEncode, p4, var27)
			
			return if ok and type(status) == "string" then pcall(function()
				-- upvalues: p3 (copy), status (ref)
				p3:SetItem("BuildAppStorageKey", status)
				p3:Flush()
			end) else false
		end
	end
	
	local function wasPushNotificationsUpsellShownToday(p5)
		-- upvalues: var9 (write), tryReadData (ref)
		local var20 = (p5 or DateTime.now()):ToIsoDate()
		
		if var9 ~= nil and string.match(var9, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(var20, "^(%d%d%d%d%-%d%d%-%d%d)") then
			return true
		end
		local _, var21 = tryReadData()
		local pushNotificationsUpsell = var21.pushNotificationsUpsell
		local var22 = false
		
		if type(pushNotificationsUpsell) == "table" then
			local lastShownAt = pushNotificationsUpsell.lastShownAt
			var22 = lastShownAt ~= nil and string.match(lastShownAt, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(var20, "^(%d%d%d%d%-%d%d%-%d%d)")
		end
		return var22
	end
	
	local function markPushNotificationsUpsellShown(p5)
		-- upvalues: var9 (write), fFlagBuildAdUpsellModule (copy), tryReadData (ref), p4 (ref), p3 (ref)
		local ok
		local var20 = (p5 or DateTime.now()):ToIsoDate()
		var9 = var20
		
		if fFlagBuildAdUpsellModule then
			local var21, var22
			local _ = function(p6)
				-- upvalues: var20 (ref)
				local pushNotificationsUpsell = p6.pushNotificationsUpsell
				local var23 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
				var23.lastShownAt = var20
				p6.pushNotificationsUpsell = var23
			end
			
			local var23, var24 = tryReadData()
			
			if var23 then
				var21 = true
				var22 = var24
			else
				local var25, var26 = tryReadData()
				var21 = var25
				var22 = var26
			end
			if not var21 then
				return false
			end
			local pushNotificationsUpsell = var22.pushNotificationsUpsell
			local var27 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
			var27.lastShownAt = var20
			var22.pushNotificationsUpsell = var27
			ok, status = pcall(p4.JSONEncode, p4, var22)
			
			return if ok and type(status) == "string" then pcall(function()
				-- upvalues: p3 (copy), status (ref)
				p3:SetItem("BuildAppStorageKey", status)
				p3:Flush()
			end) else false
		else
			local _, var28 = tryReadData()
			local pushNotificationsUpsell = var28.pushNotificationsUpsell
			local var29 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
			var29.lastShownAt = var20
			var28.pushNotificationsUpsell = var29
			ok, status = pcall(p4.JSONEncode, p4, var28)
			
			return if ok and type(status) == "string" then pcall(function()
				-- upvalues: p3 (copy), status (ref)
				p3:SetItem("BuildAppStorageKey", status)
				p3:Flush()
			end) else false
		end
	end
	
	local function loadAdUpsell()
		-- upvalues: var13 (write), var14 (write), tryReadDataStrict (ref), makeEmptyAdUpsellScheduler (copy), sanitizeAdUpsellScheduler (copy)
		if var13 ~= nil then
			return true, var13
		elseif var14 then
			return false, nil
		end
		local var20, var21
		local var22 = tryReadDataStrict
		local var23, var24 = var22()
		
		if var23 then
			var20 = true
			var21 = var24
		else
			local var25, var26 = var22()
			var20 = var25
			var21 = var26
		end
		if var20 then
			local adUpsell = var21.adUpsell
			local var27 = if type(adUpsell) == "table" then table.clone(adUpsell) else {}
			var27.dismissedPermanently = var27.dismissedPermanently == true
			var27.scheduler = if var27.dismissedPermanently then makeEmptyAdUpsellScheduler() else sanitizeAdUpsellScheduler(var27.scheduler)
			var13 = var27
			
			return true, var27
		end
		var14 = true
		
		return false, nil
	end
	
	local function retryAdUpsellRead()
		-- upvalues: var14 (write), loadAdUpsell (ref)
		var14 = false
		
		return loadAdUpsell()
	end
	
	local function persistCachedAdUpsell(p5)
		-- upvalues: var13 (write), tryReadData (ref), tryReadDataStrict (ref), p4 (ref), p3 (ref)
		if var13 == nil then
			return false
		end
		local var20, var21
		local var22 = if p5 then tryReadData else tryReadDataStrict
		local var23, var24 = var22()
		
		if var23 then
			var20 = true
			var21 = var24
		else
			local var25, var26 = var22()
			var20 = var25
			var21 = var26
		end
		if not var20 then
			return false
		end
		local adUpsell = var21.adUpsell
		local var27 = if type(adUpsell) == "table" then table.clone(adUpsell) else {}
		var27.dismissedPermanently = var13.dismissedPermanently
		var27.scheduler = var13.scheduler
		var21.adUpsell = var27
		local ok, status = pcall(p4.JSONEncode, p4, var21)
		
		return if ok and type(status) == "string" then pcall(function()
			-- upvalues: p3 (copy), status (ref)
			p3:SetItem("BuildAppStorageKey", status)
			p3:Flush()
		end) else false
	end
	
	local function scheduleAdUpsellWriteRetry(p5)
		-- upvalues: var17 (write), var16 (write), var15 (write), persistCachedAdUpsell (ref), var18 (write), scheduleAdUpsellWriteRetry (ref)
		if var17 == nil and var16 < 3 then
			local function retryWrite()
				-- upvalues: var17 (copy), var15 (copy), var16 (copy), persistCachedAdUpsell (copy), var18 (copy), scheduleAdUpsellWriteRetry (copy)
				var17 = nil
				
				if not var15 or var16 >= 3 then return end
				var16 += 1
				
				if persistCachedAdUpsell(var18) then
					var15 = false
					var16 = 0
					var18 = false
					
					return
				end
				scheduleAdUpsellWriteRetry(true)
			end
			
			var17 = if p5 then task.delay(1, retryWrite) else task.defer(retryWrite)
			
			return
		end
	end
	
	local function persistAdUpsellMutation(p5, p6)
		-- upvalues: var16 (write), var15 (write), var18 (write), scheduleAdUpsellWriteRetry (ref), persistCachedAdUpsell (ref), var17 (write)
		var16 = 0
		
		if p6 then
			var15 = true
			var18 = var18 or p5 == true
			scheduleAdUpsellWriteRetry()
			
			return true
		end
		var16 += 1
		local var20 = persistCachedAdUpsell(p5)
		var15 = not var20
		
		if var15 then
			var18 = var18 or p5 == true
			scheduleAdUpsellWriteRetry()
			
			return var20
		end
		var16 = 0
		var18 = false
		
		if var17 ~= nil then
			task.cancel(var17)
			var17 = nil
		end
		return var20
	end
	
	local _ = function()
		-- upvalues: loadAdUpsell (ref)
		local var20, var21 = loadAdUpsell()
		
		if var20 and var21 ~= nil then
			return true, var21, var21.scheduler
		end
		return false, nil, nil
	end
	
	local _ = function(p5, p6)
		local var20 = tostring(p6)
		local var21 = p5.universes[var20]
		
		if var21 == nil then
			var21 = {
				hasShownUpsell = false,
				completedTurnsSinceUpsell = 0,
				eligiblePublishesSinceUpsell = 0,
				lastTouchedOrder = 0
			}
			p5.universes[var20] = var21
		end
		return var21
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
		local var20 = 0
		
		for i, v in p7.anchors do
			if v.universeId == p8 and v.sessionId == p9 then
				var20 += 1
			end
		end
		while var20 > 10 do
			for i_1, v_1 in p7.anchors do
				if v_1.universeId == p8 and v_1.sessionId == p9 then
					table.remove(p7.anchors, i_1)
					var20 -= 1
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
	
	local _ = function(p16, p17, p18)
		return if p16.hasShownUpsell then (if p17 ~= 0 then p17 <= p16.completedTurnsSinceUpsell else true) and (if p18 ~= 0 then p18 <= p16.eligiblePublishesSinceUpsell + 1 else true) else true
	end
	
	local function recordAdUpsellEvent(p16, p17)
		-- upvalues: loadAdUpsell (ref), var11 (write), var15 (write), persistAdUpsellMutation (ref), rememberEvent (ref), pruneUniverseCap (copy), addMilestone (ref)
		local var21, var22, scheduler
		local var23, var24 = loadAdUpsell()
		
		if var23 and var24 ~= nil then
			var21 = true
			var22 = var24
			scheduler = var24.scheduler
		else
			var21 = false
			var22 = nil
			scheduler = nil
		end
		if not var21 or var22 == nil or scheduler == nil then
			return false, false
		elseif var22.dismissedPermanently == true or var11 then
			return true, false
		elseif table.find(scheduler.recentEventIds, p16.eventId) ~= nil then
			return if var15 then persistAdUpsellMutation() else true, false
		end
		rememberEvent(scheduler, p16.eventId)
		var23 = scheduler.universes[tostring(p16.universeId)]
		local var25 = var23 or {
			hasShownUpsell = false,
			completedTurnsSinceUpsell = 0,
			eligiblePublishesSinceUpsell = 0,
			lastTouchedOrder = 0
		}
		local hasShownUpsell = var25.hasShownUpsell
		local isEligiblePublish = p16.isEligiblePublish
		
		if isEligiblePublish then
			local maxValue = math.max(0, math.floor(p16.completedTurnGap))
			local maxValue_1 = math.max(0, math.floor(p16.publishInterval))
			isEligiblePublish = if var25.hasShownUpsell then (if maxValue ~= 0 then maxValue <= var25.completedTurnsSinceUpsell else true) and (if maxValue_1 ~= 0 then maxValue_1 <= var25.eligiblePublishesSinceUpsell + 1 else true) else true
		end
		if not hasShownUpsell and not isEligiblePublish then
			return true, false
		end
		local var26 = var23
		
		if not var26 then
			local var27 = tostring(p16.universeId)
			local var28 = scheduler.universes[var27]
			
			if var28 == nil then
				var28 = {
					hasShownUpsell = false,
					completedTurnsSinceUpsell = 0,
					eligiblePublishesSinceUpsell = 0,
					lastTouchedOrder = 0
				}
				scheduler.universes[var27] = var28
			end
			var26 = var28
		end
		local nextOrder = scheduler.nextOrder
		scheduler.nextOrder += 1
		var26.lastTouchedOrder = nextOrder
		pruneUniverseCap(scheduler)
		
		if p16.isEligiblePublish then
			var26.eligiblePublishesSinceUpsell += 1
		end
		if isEligiblePublish then
			var26.hasShownUpsell = true
			var26.completedTurnsSinceUpsell = 0
			var26.eligiblePublishesSinceUpsell = 0
			addMilestone(scheduler, p16.eventId, p16.universeId, p16.sessionId, p16.afterMessageKey, nextOrder)
		elseif p17 then
			var26.completedTurnsSinceUpsell += 1
		end
		return persistAdUpsellMutation(nil, p17 and not isEligiblePublish), true
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
			-- upvalues: loadAdUpsell (ref), var11 (write)
			local var21, var22, scheduler
			local var23, var24 = loadAdUpsell()
			
			if var23 and var24 ~= nil then
				var21 = true
				var22 = var24
				scheduler = var24.scheduler
			else
				var21 = false
				var22 = nil
				scheduler = nil
			end
			if not var21 or var22 == nil or scheduler == nil then
				return {
					isAvailable = false,
					dismissedPermanently = true,
					hasShownUpsell = false,
					completedTurnsSinceUpsell = 0,
					eligiblePublishesSinceUpsell = 0,
					pendingMilestoneCount = 0,
					anchors = {}
				}
			end
			var23 = scheduler.universes[tostring(p16)]
			local t = {}
			
			if p17 ~= nil then
				for i, v in scheduler.anchors do
					if v.universeId == p16 and v.sessionId == p17 then
						table.insert(t, table.clone(v))
					end
				end
			end
			local var25 = 0
			
			for i, v in scheduler.pendingMilestones do
				if v.universeId == p16 and (p17 == nil or v.sessionId == nil or v.sessionId == p17) then
					var25 += 1
				end
			end
			return {
				isAvailable = true,
				dismissedPermanently = if var22.dismissedPermanently ~= true then var11 else true,
				hasShownUpsell = if var23 ~= nil then false else var23.hasShownUpsell,
				completedTurnsSinceUpsell = if var23 ~= nil then 0 else var23.completedTurnsSinceUpsell,
				eligiblePublishesSinceUpsell = if var23 ~= nil then 0 else var23.eligiblePublishesSinceUpsell,
				anchors = t,
				pendingMilestoneCount = var25
			}
		end,
		recordAdUpsellCompletedTurn = function(p18)
			-- upvalues: recordAdUpsellEvent (ref)
			return recordAdUpsellEvent(p18, true)
		end,
		recordAdUpsellPublish = function(p18)
			-- upvalues: recordAdUpsellEvent (ref)
			return recordAdUpsellEvent(p18, false)
		end,
		attachPendingAdUpsellMilestones = function(p18, p19, p20)
			-- upvalues: loadAdUpsell (ref), pruneAnchorCaps (ref), persistAdUpsellMutation (ref)
			local var26, var27, scheduler
			local var28, var29 = loadAdUpsell()
			
			if var28 and var29 ~= nil then
				var26 = true
				var27 = var29
				scheduler = var29.scheduler
			else
				var26 = false
				var27 = nil
				scheduler = nil
			end
			if not var26 or var27 == nil or scheduler == nil then
				return false
			elseif var27.dismissedPermanently == true then
				return true
			end
			var28 = {}
			local var30 = false
			
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
					var30 = true
				else
					table.insert(var28, v)
				end
			end
			if var30 then
				scheduler.pendingMilestones = var28
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
			local var31, var32, scheduler
			local var33, var34 = loadAdUpsell()
			
			if var33 and var34 ~= nil then
				var31 = true
				var32 = var34
				scheduler = var34.scheduler
			else
				var31 = false
				var32 = nil
				scheduler = nil
			end
			if not var31 or scheduler == nil then
				return false, false
			end
			var33 = {}
			local var35 = false
			
			for i, v in scheduler.anchors do
				if v.universeId == p21 and v.sessionId == p22 and not p23[v.afterMessageKey] then
					var35 = true
				else
					table.insert(var33, v)
				end
			end
			if var35 then
				scheduler.anchors = var33
				
				return persistAdUpsellMutation(), true
			end
			return true, false
		end,
		markAdUpsellAnchorImpressed = function(p24, p25, p26)
			-- upvalues: loadAdUpsell (ref), var16 (write), var15 (write), var18 (write), scheduleAdUpsellWriteRetry (ref)
			local var36, var37, scheduler
			local var38, var39 = loadAdUpsell()
			
			if var38 and var39 ~= nil then
				var36 = true
				var37 = var39
				scheduler = var39.scheduler
			else
				var36 = false
				var37 = nil
				scheduler = nil
			end
			if not var36 or var37 == nil or (scheduler == nil or var37.dismissedPermanently == true) then
				return false
			end
			for i, v in scheduler.anchors do
				if v.universeId == p24 and v.sessionId == p25 and v.id == p26 then
					if v.impressed then
						return false
					end
					v.impressed = true
					var16 = 0
					var15 = true
					var18 = var18 or false
					scheduleAdUpsellWriteRetry()
					
					return true
				end
			end
			return false
		end,
		markAdUpsellDismissedPermanently = function()
			-- upvalues: var11 (write), var13 (write), tryReadData (ref), var14 (write), makeEmptyAdUpsellScheduler (copy), var16 (write), persistCachedAdUpsell (ref), var15 (write), var18 (write), scheduleAdUpsellWriteRetry (ref), var17 (write)
			var11 = true
			
			if var13 == nil then
				local var40
				local var41, var42 = tryReadData()
				
				if var41 then
					local _ = true
					var40 = var42
				else
					local var43, var44 = tryReadData()
					local _ = var43
					var40 = var44
				end
				local adUpsell = var40.adUpsell
				var13 = if type(adUpsell) == "table" then table.clone(adUpsell) else {}
			end
			var14 = false
			local var45 = var13
			var45.dismissedPermanently = true
			var45.scheduler = makeEmptyAdUpsellScheduler()
			var16 = 0
			var16 += 1
			var15 = not persistCachedAdUpsell(true)
			
			if var15 then
				var18 = var18 or true
				scheduleAdUpsellWriteRetry()
			else
				var16 = 0
				var18 = false
				
				if var17 ~= nil then
					task.cancel(var17)
					var17 = nil
				end
			end
			return not var15
		end,
		isPushNotificationsUpsellDismissedPermanently = function()
			-- upvalues: var10 (write), tryReadData (ref)
			if var10 then
				return true
			end
			local _, var40 = tryReadData()
			local pushNotificationsUpsell = var40.pushNotificationsUpsell
			
			return type(pushNotificationsUpsell) == "table" and pushNotificationsUpsell.dismissedPermanently == true
		end,
		markPushNotificationsUpsellDismissedPermanently = function()
			-- upvalues: var10 (write), fFlagBuildAdUpsellModule (copy), tryReadData (ref), p4 (ref), p3 (ref)
			local ok
			var10 = true
			
			if fFlagBuildAdUpsellModule then
				local var40, var41
				local _ = function(p27)
					local pushNotificationsUpsell = p27.pushNotificationsUpsell
					local var42 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
					var42.dismissedPermanently = true
					p27.pushNotificationsUpsell = var42
				end
				
				local var42, var43 = tryReadData()
				
				if var42 then
					var40 = true
					var41 = var43
				else
					local var44, var45 = tryReadData()
					var40 = var44
					var41 = var45
				end
				if not var40 then
					return false
				end
				local pushNotificationsUpsell = var41.pushNotificationsUpsell
				local var46 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
				var46.dismissedPermanently = true
				var41.pushNotificationsUpsell = var46
				ok, status = pcall(p4.JSONEncode, p4, var41)
				
				return if ok and type(status) == "string" then pcall(function()
					-- upvalues: p3 (copy), status (ref)
					p3:SetItem("BuildAppStorageKey", status)
					p3:Flush()
				end) else false
			else
				local _, var47 = tryReadData()
				local pushNotificationsUpsell = var47.pushNotificationsUpsell
				local var48 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
				var48.dismissedPermanently = true
				var47.pushNotificationsUpsell = var48
				ok, status = pcall(p4.JSONEncode, p4, var47)
				
				return if ok and type(status) == "string" then pcall(function()
					-- upvalues: p3 (copy), status (ref)
					p3:SetItem("BuildAppStorageKey", status)
					p3:Flush()
				end) else false
			end
		end,
		clearSessionCacheForTests = function()
			-- upvalues: fFlagBuildAgentAdCampaignCardModule (copy), var19 (write), var9 (write), var10 (write), var11 (write), var12 (write), var13 (write), var14 (write), var15 (write), var16 (write), var17 (write), var18 (write)
			if fFlagBuildAgentAdCampaignCardModule and var19 ~= nil then
				var19.reset()
			end
			var9 = nil
			var10 = false
			var11 = false
			var12 = 0
			var13 = nil
			var14 = false
			var15 = false
			var16 = 0
			
			if var17 ~= nil then
				task.cancel(var17)
			end
			var17 = nil
			var18 = false
		end
	}
end

local var36 = createBuildAppStorage(appStorageService, httpService)

return {
	STORAGE_KEY = "BuildAppStorageKey",
	AD_UPSELL_SCHEDULER_VERSION = 3,
	getAdCampaignCardStorage = if fFlagBuildAgentAdCampaignCardModule then var36.getAdCampaignCardStorage else nil,
	getChatDraft = var36.getChatDraft,
	setChatDraft = var36.setChatDraft,
	getUnpublishedPlaytestModeTooltipDisplayCount = var36.getUnpublishedPlaytestModeTooltipDisplayCount,
	incrementUnpublishedPlaytestModeTooltipDisplayCount = var36.incrementUnpublishedPlaytestModeTooltipDisplayCount,
	wasPushNotificationsUpsellShownToday = var36.wasPushNotificationsUpsellShownToday,
	markPushNotificationsUpsellShown = var36.markPushNotificationsUpsellShown,
	retryAdUpsellRead = var36.retryAdUpsellRead,
	getAdUpsellState = var36.getAdUpsellState,
	recordAdUpsellCompletedTurn = var36.recordAdUpsellCompletedTurn,
	recordAdUpsellPublish = var36.recordAdUpsellPublish,
	attachPendingAdUpsellMilestones = var36.attachPendingAdUpsellMilestones,
	pruneAdUpsellAnchors = var36.pruneAdUpsellAnchors,
	markAdUpsellAnchorImpressed = var36.markAdUpsellAnchorImpressed,
	markAdUpsellDismissedPermanently = var36.markAdUpsellDismissedPermanently,
	isPushNotificationsUpsellDismissedPermanently = var36.isPushNotificationsUpsellDismissedPermanently,
	markPushNotificationsUpsellDismissedPermanently = var36.markPushNotificationsUpsellDismissedPermanently,
	clearSessionCacheForTests = var36.clearSessionCacheForTests,
	createForTests = createBuildAppStorage
}