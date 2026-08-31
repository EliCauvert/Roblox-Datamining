local buildExperience = script:FindFirstAncestor("BuildExperience")
local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local fFlagBuildAdUpsellModule = require(buildExperience.Flags.FFlagBuildAdUpsell)

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
	-- upvalues: fFlagBuildAdUpsellModule (ref), makeEmptyAdUpsellScheduler (ref), sanitizeAdUpsellScheduler (ref), pruneUniverseCap (ref)
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
	
	local _ = function(p5)
		local var19, var20 = p5()
		
		if var19 then
			return true, var20
		end
		return p5()
	end
	
	local _ = function(p5)
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
	
	local function getAgentSpecVersion()
		-- upvalues: tryReadData (ref)
		local _, var19 = tryReadData()
		local agentSpecVersion = var19.agentSpecVersion
		
		return if type(agentSpecVersion) == "string" then agentSpecVersion else nil
	end
	
	local function setAgentSpecVersion(value)
		-- upvalues: fFlagBuildAdUpsellModule (copy), tryReadData (ref), p4 (ref), p3 (ref)
		if fFlagBuildAdUpsellModule then
			local var19, var20
			local var21 = function(p5)
				-- upvalues: value (ref)
				p5.agentSpecVersion = value
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
			var20.agentSpecVersion = value
			local ok, status = pcall(p4.JSONEncode, p4, var20)
			
			return if ok and type(status) == "string" then pcall(function()
				-- upvalues: p3 (copy), status (ref)
				p3:SetItem("BuildAppStorageKey", status)
				p3:Flush()
			end) else false
		else
			local var21, ok = tryReadData()
			ok.agentSpecVersion = value
			ok, status = pcall(p4.JSONEncode, p4, ok)
			
			return if ok and type(status) == "string" then pcall(function()
				-- upvalues: p3 (copy), status (ref)
				p3:SetItem("BuildAppStorageKey", status)
				p3:Flush()
			end) else false
		end
	end
	
	local function getUnpublishedPlaytestModeTooltipDisplayCount()
		-- upvalues: tryReadData (ref), var12 (write)
		local _, var19 = tryReadData()
		local unpublishedPlaytestModeTooltipDisplayCount = var19.unpublishedPlaytestModeTooltipDisplayCount
		
		return math.max(if type(unpublishedPlaytestModeTooltipDisplayCount) == "number" and unpublishedPlaytestModeTooltipDisplayCount >= 0 then math.floor(unpublishedPlaytestModeTooltipDisplayCount) else 0, var12)
	end
	
	local function incrementUnpublishedPlaytestModeTooltipDisplayCount()
		-- upvalues: fFlagBuildAdUpsellModule (copy), var12 (write), tryReadData (ref), p4 (ref), p3 (ref)
		local status
		if fFlagBuildAdUpsellModule then
			local var19, var20
			local var21 = var12 + 1
			var12 = var21
			
			local _ = function(p5)
				-- upvalues: var21 (ref), var12 (copy)
				local unpublishedPlaytestModeTooltipDisplayCount = p5.unpublishedPlaytestModeTooltipDisplayCount
				unpublishedPlaytestModeTooltipDisplayCount = math.max((if type(unpublishedPlaytestModeTooltipDisplayCount) == "number" and unpublishedPlaytestModeTooltipDisplayCount >= 0 then math.floor(unpublishedPlaytestModeTooltipDisplayCount) else 0) + 1, var21)
				var12 = unpublishedPlaytestModeTooltipDisplayCount
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
			var12 = status
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
			var26 = math.max(if type(var26) == "number" and var26 >= 0 then math.floor(var26) else 0, var12) + 1
			var12 = var26
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
		-- upvalues: var13 (write), var14 (write), tryReadDataStrict (ref), makeEmptyAdUpsellScheduler (copy), sanitizeAdUpsellScheduler (copy)
		if var13 ~= nil then
			return true, var13
		elseif var14 then
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
			var13 = var26
			
			return true, var26
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
		var26.dismissedPermanently = var13.dismissedPermanently
		var26.scheduler = var13.scheduler
		var20.adUpsell = var26
		local ok, status = pcall(p4.JSONEncode, p4, var20)
		
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
		local var19 = persistCachedAdUpsell(p5)
		var15 = not var19
		
		if var15 then
			var18 = var18 or p5 == true
			scheduleAdUpsellWriteRetry()
			
			return var19
		end
		var16 = 0
		var18 = false
		
		if var17 ~= nil then
			task.cancel(var17)
			var17 = nil
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
				completedTurnsSinceUpsell = 0,
				eligiblePublishesSinceUpsell = 0,
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
	
	local _ = function(p16, p17, p18)
		return if p16.hasShownUpsell then (if p17 ~= 0 then p17 <= p16.completedTurnsSinceUpsell else true) and (if p18 ~= 0 then p18 <= p16.eligiblePublishesSinceUpsell + 1 else true) else true
	end
	
	local function recordAdUpsellEvent(p16, p17)
		-- upvalues: loadAdUpsell (ref), var11 (write), var15 (write), persistAdUpsellMutation (ref), rememberEvent (ref), pruneUniverseCap (copy), addMilestone (ref)
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
		elseif var21.dismissedPermanently == true or var11 then
			return true, false
		elseif table.find(scheduler.recentEventIds, p16.eventId) ~= nil then
			return if var15 then persistAdUpsellMutation() else true, false
		end
		rememberEvent(scheduler, p16.eventId)
		var22 = scheduler.universes[tostring(p16.universeId)]
		local var24 = var22 or {
			hasShownUpsell = false,
			completedTurnsSinceUpsell = 0,
			eligiblePublishesSinceUpsell = 0,
			lastTouchedOrder = 0
		}
		local hasShownUpsell = var24.hasShownUpsell
		local isEligiblePublish = p16.isEligiblePublish
		
		if isEligiblePublish then
			local maxValue = math.max(0, math.floor(p16.completedTurnGap))
			local maxValue_1 = math.max(0, math.floor(p16.publishInterval))
			isEligiblePublish = if var24.hasShownUpsell then (if maxValue ~= 0 then maxValue <= var24.completedTurnsSinceUpsell else true) and (if maxValue_1 ~= 0 then maxValue_1 <= var24.eligiblePublishesSinceUpsell + 1 else true) else true
		end
		if not hasShownUpsell and not isEligiblePublish then
			return true, false
		end
		local var25 = var22
		
		if not var25 then
			local var26 = tostring(p16.universeId)
			local var27 = scheduler.universes[var26]
			
			if var27 == nil then
				var27 = {
					hasShownUpsell = false,
					completedTurnsSinceUpsell = 0,
					eligiblePublishesSinceUpsell = 0,
					lastTouchedOrder = 0
				}
				scheduler.universes[var26] = var27
			end
			var25 = var27
		end
		local nextOrder = scheduler.nextOrder
		scheduler.nextOrder += 1
		var25.lastTouchedOrder = nextOrder
		pruneUniverseCap(scheduler)
		
		if p16.isEligiblePublish then
			var25.eligiblePublishesSinceUpsell += 1
		end
		if isEligiblePublish then
			var25.hasShownUpsell = true
			var25.completedTurnsSinceUpsell = 0
			var25.eligiblePublishesSinceUpsell = 0
			addMilestone(scheduler, p16.eventId, p16.universeId, p16.sessionId, p16.afterMessageKey, nextOrder)
		elseif p17 then
			var25.completedTurnsSinceUpsell += 1
		end
		return persistAdUpsellMutation(nil, p17 and not isEligiblePublish), true
	end
	
	return {
		STORAGE_KEY = "BuildAppStorageKey",
		AD_UPSELL_SCHEDULER_VERSION = 3,
		getAgentSpecVersion = getAgentSpecVersion,
		setAgentSpecVersion = setAgentSpecVersion,
		getUnpublishedPlaytestModeTooltipDisplayCount = getUnpublishedPlaytestModeTooltipDisplayCount,
		incrementUnpublishedPlaytestModeTooltipDisplayCount = incrementUnpublishedPlaytestModeTooltipDisplayCount,
		wasPushNotificationsUpsellShownToday = wasPushNotificationsUpsellShownToday,
		markPushNotificationsUpsellShown = markPushNotificationsUpsellShown,
		retryAdUpsellRead = retryAdUpsellRead,
		getAdUpsellState = function(p16, p17)
			-- upvalues: loadAdUpsell (ref), var11 (write)
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
					completedTurnsSinceUpsell = 0,
					eligiblePublishesSinceUpsell = 0,
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
				dismissedPermanently = if var21.dismissedPermanently ~= true then var11 else true,
				hasShownUpsell = if var22 ~= nil then false else var22.hasShownUpsell,
				completedTurnsSinceUpsell = if var22 ~= nil then 0 else var22.completedTurnsSinceUpsell,
				eligiblePublishesSinceUpsell = if var22 ~= nil then 0 else var22.eligiblePublishesSinceUpsell,
				anchors = t,
				pendingMilestoneCount = var24
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
			-- upvalues: loadAdUpsell (ref), var16 (write), var15 (write), var18 (write), scheduleAdUpsellWriteRetry (ref)
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
				local var39
				local var40, var41 = tryReadData()
				
				if var40 then
					local _ = true
					var39 = var41
				else
					local var42, var43 = tryReadData()
					local _ = var42
					var39 = var43
				end
				local adUpsell = var39.adUpsell
				var13 = if type(adUpsell) == "table" then table.clone(adUpsell) else {}
			end
			var14 = false
			local var44 = var13
			var44.dismissedPermanently = true
			var44.scheduler = makeEmptyAdUpsellScheduler()
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
			local _, var39 = tryReadData()
			local pushNotificationsUpsell = var39.pushNotificationsUpsell
			
			return type(pushNotificationsUpsell) == "table" and pushNotificationsUpsell.dismissedPermanently == true
		end,
		markPushNotificationsUpsellDismissedPermanently = function()
			-- upvalues: var10 (write), fFlagBuildAdUpsellModule (copy), tryReadData (ref), p4 (ref), p3 (ref)
			local ok
			var10 = true
			
			if fFlagBuildAdUpsellModule then
				local var39, var40
				local _ = function(p27)
					local pushNotificationsUpsell = p27.pushNotificationsUpsell
					local var41 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
					var41.dismissedPermanently = true
					p27.pushNotificationsUpsell = var41
				end
				
				local var41, var42 = tryReadData()
				
				if var41 then
					var39 = true
					var40 = var42
				else
					local var43, var44 = tryReadData()
					var39 = var43
					var40 = var44
				end
				if not var39 then
					return false
				end
				local pushNotificationsUpsell = var40.pushNotificationsUpsell
				local var45 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
				var45.dismissedPermanently = true
				var40.pushNotificationsUpsell = var45
				ok, status = pcall(p4.JSONEncode, p4, var40)
				
				return if ok and type(status) == "string" then pcall(function()
					-- upvalues: p3 (copy), status (ref)
					p3:SetItem("BuildAppStorageKey", status)
					p3:Flush()
				end) else false
			else
				local _, var46 = tryReadData()
				local pushNotificationsUpsell = var46.pushNotificationsUpsell
				local var47 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
				var47.dismissedPermanently = true
				var46.pushNotificationsUpsell = var47
				ok, status = pcall(p4.JSONEncode, p4, var46)
				
				return if ok and type(status) == "string" then pcall(function()
					-- upvalues: p3 (copy), status (ref)
					p3:SetItem("BuildAppStorageKey", status)
					p3:Flush()
				end) else false
			end
		end,
		clearSessionCacheForTests = function()
			-- upvalues: var9 (write), var10 (write), var11 (write), var12 (write), var13 (write), var14 (write), var15 (write), var16 (write), var17 (write), var18 (write)
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

local var35 = createBuildAppStorage(appStorageService, httpService)

return {
	STORAGE_KEY = "BuildAppStorageKey",
	AD_UPSELL_SCHEDULER_VERSION = 3,
	getAgentSpecVersion = var35.getAgentSpecVersion,
	setAgentSpecVersion = var35.setAgentSpecVersion,
	getUnpublishedPlaytestModeTooltipDisplayCount = var35.getUnpublishedPlaytestModeTooltipDisplayCount,
	incrementUnpublishedPlaytestModeTooltipDisplayCount = var35.incrementUnpublishedPlaytestModeTooltipDisplayCount,
	wasPushNotificationsUpsellShownToday = var35.wasPushNotificationsUpsellShownToday,
	markPushNotificationsUpsellShown = var35.markPushNotificationsUpsellShown,
	retryAdUpsellRead = var35.retryAdUpsellRead,
	getAdUpsellState = var35.getAdUpsellState,
	recordAdUpsellCompletedTurn = var35.recordAdUpsellCompletedTurn,
	recordAdUpsellPublish = var35.recordAdUpsellPublish,
	attachPendingAdUpsellMilestones = var35.attachPendingAdUpsellMilestones,
	pruneAdUpsellAnchors = var35.pruneAdUpsellAnchors,
	markAdUpsellAnchorImpressed = var35.markAdUpsellAnchorImpressed,
	markAdUpsellDismissedPermanently = var35.markAdUpsellDismissedPermanently,
	isPushNotificationsUpsellDismissedPermanently = var35.isPushNotificationsUpsellDismissedPermanently,
	markPushNotificationsUpsellDismissedPermanently = var35.markPushNotificationsUpsellDismissedPermanently,
	clearSessionCacheForTests = var35.clearSessionCacheForTests,
	createForTests = createBuildAppStorage
}