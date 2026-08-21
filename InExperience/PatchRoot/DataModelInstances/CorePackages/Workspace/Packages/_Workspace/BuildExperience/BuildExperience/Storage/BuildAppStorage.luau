local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")

local function _(p0) --[[ line: 16 | named "sanitizeDisplayCount" ]]
	return if type(p0) == "number" and p0 >= 0 then math.floor(p0) else 0
end

local _ = function(p1) --[[ line: 20 | named "getUtcDate" ]]
	return string.match(p1, "^(%d%d%d%d%-%d%d%-%d%d)")
end

local _ = function(p2, p3) --[[ line: 24 | named "isSameUtcDate" ]]
	return p2 ~= nil and string.match(p2, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(p3, "^(%d%d%d%d%-%d%d%-%d%d)")
end

local function createBuildAppStorage(p4, p5) --[[ line: 28 ]]
	local var4 = nil
	local var5 = 0
	
	local function readData() --[[ line: 32 ]]
		-- upvalues: p4 (ref), p5 (ref)
		local ok, status = pcall(p4.GetItem, p4, "BuildAppStorageKey")
		
		if not ok or type(status) ~= "string" or status == "" then
			return {}
		end
		local ok_1, status_1 = pcall(p5.JSONDecode, p5, status)
		
		return if ok_1 and type(status_1) == "table" then status_1 else {}
	end
	
	local function _(p6) --[[ line: 46 | named "writeData" ]]
		-- upvalues: p5 (ref), p4 (ref)
		local ok, status = pcall(p5.JSONEncode, p5, p6)
		
		return if ok and type(status) == "string" then pcall(function() --[[ line: 52 ]]
			-- upvalues: p4 (copy), status (ref)
			p4:SetItem("BuildAppStorageKey", status)
			p4:Flush()
		end) else false
	end
	
	return {
		STORAGE_KEY = "BuildAppStorageKey",
		getAgentSpecVersion = function() --[[ line: 59 ]]
			-- upvalues: readData (ref)
			local agentSpecVersion = readData().agentSpecVersion
			
			return if type(agentSpecVersion) == "string" then agentSpecVersion else nil
		end,
		setAgentSpecVersion = function(value) --[[ line: 64 ]]
			-- upvalues: readData (ref), p5 (ref), p4 (ref)
			local var7 = readData()
			var7.agentSpecVersion = value
			local ok, status = pcall(p5.JSONEncode, p5, var7)
			
			return if ok and type(status) == "string" then pcall(function() --[[ line: 52 ]]
				-- upvalues: p4 (copy), status (ref)
				p4:SetItem("BuildAppStorageKey", status)
				p4:Flush()
			end) else false
		end,
		getUnpublishedPlaytestModeTooltipDisplayCount = function() --[[ line: 70 ]]
			-- upvalues: readData (ref), var5 (write)
			local unpublishedPlaytestModeTooltipDisplayCount = readData().unpublishedPlaytestModeTooltipDisplayCount
			
			return math.max(if type(unpublishedPlaytestModeTooltipDisplayCount) == "number" and unpublishedPlaytestModeTooltipDisplayCount >= 0 then math.floor(unpublishedPlaytestModeTooltipDisplayCount) else 0, var5)
		end,
		incrementUnpublishedPlaytestModeTooltipDisplayCount = function() --[[ line: 75 ]]
			-- upvalues: readData (ref), var5 (write), p5 (ref), p4 (ref)
			local var8 = readData()
			local unpublishedPlaytestModeTooltipDisplayCount = var8.unpublishedPlaytestModeTooltipDisplayCount
			unpublishedPlaytestModeTooltipDisplayCount = math.max(if type(unpublishedPlaytestModeTooltipDisplayCount) == "number" and unpublishedPlaytestModeTooltipDisplayCount >= 0 then math.floor(unpublishedPlaytestModeTooltipDisplayCount) else 0, var5) + 1
			var5 = unpublishedPlaytestModeTooltipDisplayCount
			var8.unpublishedPlaytestModeTooltipDisplayCount = unpublishedPlaytestModeTooltipDisplayCount
			local ok, status = pcall(p5.JSONEncode, p5, var8)
			
			return if ok and type(status) == "string" then pcall(function() --[[ line: 52 ]]
				-- upvalues: p4 (copy), status (ref)
				p4:SetItem("BuildAppStorageKey", status)
				p4:Flush()
			end) else false
		end,
		wasPushNotificationsUpsellShownToday = function(p7) --[[ line: 84 ]]
			-- upvalues: var4 (write), readData (ref)
			local var9 = (p7 or DateTime.now()):ToIsoDate()
			
			if var4 ~= nil and string.match(var4, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(var9, "^(%d%d%d%d%-%d%d%-%d%d)") then
				return true
			end
			local pushNotificationsUpsell = readData().pushNotificationsUpsell
			local var10 = false
			
			if type(pushNotificationsUpsell) == "table" then
				local lastShownAt = pushNotificationsUpsell.lastShownAt
				var10 = lastShownAt ~= nil and string.match(lastShownAt, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(var9, "^(%d%d%d%d%-%d%d%-%d%d)")
			end
			return var10
		end,
		markPushNotificationsUpsellShown = function(p8) --[[ line: 95 ]]
			-- upvalues: var4 (write), readData (ref), p5 (ref), p4 (ref)
			local var11 = (p8 or DateTime.now()):ToIsoDate()
			var4 = var11
			local var12 = readData()
			local pushNotificationsUpsell = var12.pushNotificationsUpsell
			local var13 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
			var13.lastShownAt = var11
			var12.pushNotificationsUpsell = var13
			local ok, status = pcall(p5.JSONEncode, p5, var12)
			
			return if ok and type(status) == "string" then pcall(function() --[[ line: 52 ]]
				-- upvalues: p4 (copy), status (ref)
				p4:SetItem("BuildAppStorageKey", status)
				p4:Flush()
			end) else false
		end,
		clearSessionCacheForTests = function() --[[ line: 113 ]]
			-- upvalues: var4 (write), var5 (write)
			var4 = nil
			var5 = 0
		end
	}
end

local var3 = createBuildAppStorage(appStorageService, httpService)

return {
	STORAGE_KEY = "BuildAppStorageKey",
	getAgentSpecVersion = var3.getAgentSpecVersion,
	setAgentSpecVersion = var3.setAgentSpecVersion,
	getUnpublishedPlaytestModeTooltipDisplayCount = var3.getUnpublishedPlaytestModeTooltipDisplayCount,
	incrementUnpublishedPlaytestModeTooltipDisplayCount = var3.incrementUnpublishedPlaytestModeTooltipDisplayCount,
	wasPushNotificationsUpsellShownToday = var3.wasPushNotificationsUpsellShownToday,
	markPushNotificationsUpsellShown = var3.markPushNotificationsUpsellShown,
	clearSessionCacheForTests = var3.clearSessionCacheForTests,
	createForTests = createBuildAppStorage
}