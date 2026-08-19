local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")

local function _(p0) --[[ line: 17 | named "sanitizeDisplayCount" ]]
	return if type(p0) == "number" and p0 >= 0 then math.floor(p0) else 0
end

local _ = function(p1) --[[ line: 21 | named "getUtcDate" ]]
	return string.match(p1, "^(%d%d%d%d%-%d%d%-%d%d)")
end

local _ = function(p2, p3) --[[ line: 25 | named "isSameUtcDate" ]]
	return p2 ~= nil and string.match(p2, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(p3, "^(%d%d%d%d%-%d%d%-%d%d)")
end

local function createBuildAppStorage(p4, p5) --[[ line: 29 ]]
	local var4 = nil
	local var5 = false
	local var6 = 0
	
	local function readData() --[[ line: 34 ]]
		-- upvalues: p4 (ref), p5 (ref)
		local ok, status = pcall(p4.GetItem, p4, "BuildAppStorageKey")
		
		if not ok or type(status) ~= "string" or status == "" then
			return {}
		end
		local ok_1, status_1 = pcall(p5.JSONDecode, p5, status)
		
		return if ok_1 and type(status_1) == "table" then status_1 else {}
	end
	
	local function _(p6) --[[ line: 48 | named "writeData" ]]
		-- upvalues: p5 (ref), p4 (ref)
		local ok, status = pcall(p5.JSONEncode, p5, p6)
		
		return if ok and type(status) == "string" then pcall(function() --[[ line: 54 ]]
			-- upvalues: p4 (copy), status (ref)
			p4:SetItem("BuildAppStorageKey", status)
			p4:Flush()
		end) else false
	end
	
	return {
		STORAGE_KEY = "BuildAppStorageKey",
		getAgentSpecVersion = function() --[[ line: 61 ]]
			-- upvalues: readData (ref)
			local agentSpecVersion = readData().agentSpecVersion
			
			return if type(agentSpecVersion) == "string" then agentSpecVersion else nil
		end,
		setAgentSpecVersion = function(value) --[[ line: 66 ]]
			-- upvalues: readData (ref), p5 (ref), p4 (ref)
			local var8 = readData()
			var8.agentSpecVersion = value
			local ok, status = pcall(p5.JSONEncode, p5, var8)
			
			return if ok and type(status) == "string" then pcall(function() --[[ line: 54 ]]
				-- upvalues: p4 (copy), status (ref)
				p4:SetItem("BuildAppStorageKey", status)
				p4:Flush()
			end) else false
		end,
		getUnpublishedPlaytestModeTooltipDisplayCount = function() --[[ line: 72 ]]
			-- upvalues: readData (ref), var6 (write)
			local unpublishedPlaytestModeTooltipDisplayCount = readData().unpublishedPlaytestModeTooltipDisplayCount
			
			return math.max(if type(unpublishedPlaytestModeTooltipDisplayCount) == "number" and unpublishedPlaytestModeTooltipDisplayCount >= 0 then math.floor(unpublishedPlaytestModeTooltipDisplayCount) else 0, var6)
		end,
		incrementUnpublishedPlaytestModeTooltipDisplayCount = function() --[[ line: 77 ]]
			-- upvalues: readData (ref), var6 (write), p5 (ref), p4 (ref)
			local var9 = readData()
			local unpublishedPlaytestModeTooltipDisplayCount = var9.unpublishedPlaytestModeTooltipDisplayCount
			unpublishedPlaytestModeTooltipDisplayCount = math.max(if type(unpublishedPlaytestModeTooltipDisplayCount) == "number" and unpublishedPlaytestModeTooltipDisplayCount >= 0 then math.floor(unpublishedPlaytestModeTooltipDisplayCount) else 0, var6) + 1
			var6 = unpublishedPlaytestModeTooltipDisplayCount
			var9.unpublishedPlaytestModeTooltipDisplayCount = unpublishedPlaytestModeTooltipDisplayCount
			local ok, status = pcall(p5.JSONEncode, p5, var9)
			
			return if ok and type(status) == "string" then pcall(function() --[[ line: 54 ]]
				-- upvalues: p4 (copy), status (ref)
				p4:SetItem("BuildAppStorageKey", status)
				p4:Flush()
			end) else false
		end,
		wasPushNotificationsUpsellShownToday = function(p7) --[[ line: 86 ]]
			-- upvalues: var4 (write), readData (ref)
			local var10 = (p7 or DateTime.now()):ToIsoDate()
			
			if var4 ~= nil and string.match(var4, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(var10, "^(%d%d%d%d%-%d%d%-%d%d)") then
				return true
			end
			local pushNotificationsUpsell = readData().pushNotificationsUpsell
			local var11 = false
			
			if type(pushNotificationsUpsell) == "table" then
				local lastShownAt = pushNotificationsUpsell.lastShownAt
				var11 = lastShownAt ~= nil and string.match(lastShownAt, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(var10, "^(%d%d%d%d%-%d%d%-%d%d)")
			end
			return var11
		end,
		markPushNotificationsUpsellShown = function(p8) --[[ line: 97 ]]
			-- upvalues: var4 (write), readData (ref), p5 (ref), p4 (ref)
			local var12 = (p8 or DateTime.now()):ToIsoDate()
			var4 = var12
			local var13 = readData()
			local pushNotificationsUpsell = var13.pushNotificationsUpsell
			local var14 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
			var14.lastShownAt = var12
			var13.pushNotificationsUpsell = var14
			local ok, status = pcall(p5.JSONEncode, p5, var13)
			
			return if ok and type(status) == "string" then pcall(function() --[[ line: 54 ]]
				-- upvalues: p4 (copy), status (ref)
				p4:SetItem("BuildAppStorageKey", status)
				p4:Flush()
			end) else false
		end,
		isPushNotificationsUpsellDismissedPermanently = function() --[[ line: 115 ]]
			-- upvalues: var5 (write), readData (ref)
			if var5 then
				return true
			end
			local pushNotificationsUpsell = readData().pushNotificationsUpsell
			
			return type(pushNotificationsUpsell) == "table" and pushNotificationsUpsell.dismissedPermanently == true
		end,
		markPushNotificationsUpsellDismissedPermanently = function() --[[ line: 124 ]]
			-- upvalues: var5 (write), readData (ref), p5 (ref), p4 (ref)
			var5 = true
			local var15 = readData()
			local pushNotificationsUpsell = var15.pushNotificationsUpsell
			local var16 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
			var16.dismissedPermanently = true
			var15.pushNotificationsUpsell = var16
			local ok, status = pcall(p5.JSONEncode, p5, var15)
			
			return if ok and type(status) == "string" then pcall(function() --[[ line: 54 ]]
				-- upvalues: p4 (copy), status (ref)
				p4:SetItem("BuildAppStorageKey", status)
				p4:Flush()
			end) else false
		end,
		clearSessionCacheForTests = function() --[[ line: 141 ]]
			-- upvalues: var4 (write), var5 (write), var6 (write)
			var4 = nil
			var5 = false
			var6 = 0
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
	isPushNotificationsUpsellDismissedPermanently = var3.isPushNotificationsUpsellDismissedPermanently,
	markPushNotificationsUpsellDismissedPermanently = var3.markPushNotificationsUpsellDismissedPermanently,
	clearSessionCacheForTests = var3.clearSessionCacheForTests,
	createForTests = createBuildAppStorage
}