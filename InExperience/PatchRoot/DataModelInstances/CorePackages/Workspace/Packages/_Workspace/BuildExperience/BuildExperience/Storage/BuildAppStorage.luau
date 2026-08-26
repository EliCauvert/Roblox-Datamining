local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")

local function _(p1)
	return if type(p1) == "number" and p1 >= 0 then math.floor(p1) else 0
end

local _ = function(p1)
	return string.match(p1, "^(%d%d%d%d%-%d%d%-%d%d)")
end

local _ = function(p1, p2)
	return p1 ~= nil and string.match(p1, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(p2, "^(%d%d%d%d%-%d%d%-%d%d)")
end

local function createBuildAppStorage(p1, p2)
	local var1 = nil
	local var2 = false
	local var3 = 0
	
	local function readData()
		-- upvalues: p1 (ref), p2 (ref)
		local ok, status = pcall(p1.GetItem, p1, "BuildAppStorageKey")
		
		if not ok or type(status) ~= "string" or status == "" then
			return {}
		end
		local ok_1, status_1 = pcall(p2.JSONDecode, p2, status)
		
		return if ok_1 and type(status_1) == "table" then status_1 else {}
	end
	
	local function _(p3)
		-- upvalues: p2 (ref), p1 (ref)
		local ok, status = pcall(p2.JSONEncode, p2, p3)
		
		return if ok and type(status) == "string" then pcall(function()
			-- upvalues: p1 (copy), status (ref)
			p1:SetItem("BuildAppStorageKey", status)
			p1:Flush()
		end) else false
	end
	
	return {
		STORAGE_KEY = "BuildAppStorageKey",
		getAgentSpecVersion = function()
			-- upvalues: readData (ref)
			local agentSpecVersion = readData().agentSpecVersion
			
			return if type(agentSpecVersion) == "string" then agentSpecVersion else nil
		end,
		setAgentSpecVersion = function(value)
			-- upvalues: readData (ref), p2 (ref), p1 (ref)
			local var4 = readData()
			var4.agentSpecVersion = value
			local ok, status = pcall(p2.JSONEncode, p2, var4)
			
			return if ok and type(status) == "string" then pcall(function()
				-- upvalues: p1 (copy), status (ref)
				p1:SetItem("BuildAppStorageKey", status)
				p1:Flush()
			end) else false
		end,
		getUnpublishedPlaytestModeTooltipDisplayCount = function()
			-- upvalues: readData (ref), var3 (write)
			local unpublishedPlaytestModeTooltipDisplayCount = readData().unpublishedPlaytestModeTooltipDisplayCount
			
			return math.max(if type(unpublishedPlaytestModeTooltipDisplayCount) == "number" and unpublishedPlaytestModeTooltipDisplayCount >= 0 then math.floor(unpublishedPlaytestModeTooltipDisplayCount) else 0, var3)
		end,
		incrementUnpublishedPlaytestModeTooltipDisplayCount = function()
			-- upvalues: readData (ref), var3 (write), p2 (ref), p1 (ref)
			local var4 = readData()
			local unpublishedPlaytestModeTooltipDisplayCount = var4.unpublishedPlaytestModeTooltipDisplayCount
			unpublishedPlaytestModeTooltipDisplayCount = math.max(if type(unpublishedPlaytestModeTooltipDisplayCount) == "number" and unpublishedPlaytestModeTooltipDisplayCount >= 0 then math.floor(unpublishedPlaytestModeTooltipDisplayCount) else 0, var3) + 1
			var3 = unpublishedPlaytestModeTooltipDisplayCount
			var4.unpublishedPlaytestModeTooltipDisplayCount = unpublishedPlaytestModeTooltipDisplayCount
			local ok, status = pcall(p2.JSONEncode, p2, var4)
			
			return if ok and type(status) == "string" then pcall(function()
				-- upvalues: p1 (copy), status (ref)
				p1:SetItem("BuildAppStorageKey", status)
				p1:Flush()
			end) else false
		end,
		wasPushNotificationsUpsellShownToday = function(p3)
			-- upvalues: var1 (write), readData (ref)
			local var4 = (p3 or DateTime.now()):ToIsoDate()
			
			if var1 ~= nil and string.match(var1, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(var4, "^(%d%d%d%d%-%d%d%-%d%d)") then
				return true
			end
			local pushNotificationsUpsell = readData().pushNotificationsUpsell
			local var5 = false
			
			if type(pushNotificationsUpsell) == "table" then
				local lastShownAt = pushNotificationsUpsell.lastShownAt
				var5 = lastShownAt ~= nil and string.match(lastShownAt, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(var4, "^(%d%d%d%d%-%d%d%-%d%d)")
			end
			return var5
		end,
		markPushNotificationsUpsellShown = function(p3)
			-- upvalues: var1 (write), readData (ref), p2 (ref), p1 (ref)
			local var4 = (p3 or DateTime.now()):ToIsoDate()
			var1 = var4
			local var5 = readData()
			local pushNotificationsUpsell = var5.pushNotificationsUpsell
			local var6 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
			var6.lastShownAt = var4
			var5.pushNotificationsUpsell = var6
			local ok, status = pcall(p2.JSONEncode, p2, var5)
			
			return if ok and type(status) == "string" then pcall(function()
				-- upvalues: p1 (copy), status (ref)
				p1:SetItem("BuildAppStorageKey", status)
				p1:Flush()
			end) else false
		end,
		isPushNotificationsUpsellDismissedPermanently = function()
			-- upvalues: var2 (write), readData (ref)
			if var2 then
				return true
			end
			local pushNotificationsUpsell = readData().pushNotificationsUpsell
			
			return type(pushNotificationsUpsell) == "table" and pushNotificationsUpsell.dismissedPermanently == true
		end,
		markPushNotificationsUpsellDismissedPermanently = function()
			-- upvalues: var2 (write), readData (ref), p2 (ref), p1 (ref)
			var2 = true
			local var4 = readData()
			local pushNotificationsUpsell = var4.pushNotificationsUpsell
			local var5 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
			var5.dismissedPermanently = true
			var4.pushNotificationsUpsell = var5
			local ok, status = pcall(p2.JSONEncode, p2, var4)
			
			return if ok and type(status) == "string" then pcall(function()
				-- upvalues: p1 (copy), status (ref)
				p1:SetItem("BuildAppStorageKey", status)
				p1:Flush()
			end) else false
		end,
		clearSessionCacheForTests = function()
			-- upvalues: var1 (write), var2 (write), var3 (write)
			var1 = nil
			var2 = false
			var3 = 0
		end
	}
end

local var1 = createBuildAppStorage(appStorageService, httpService)

return {
	STORAGE_KEY = "BuildAppStorageKey",
	getAgentSpecVersion = var1.getAgentSpecVersion,
	setAgentSpecVersion = var1.setAgentSpecVersion,
	getUnpublishedPlaytestModeTooltipDisplayCount = var1.getUnpublishedPlaytestModeTooltipDisplayCount,
	incrementUnpublishedPlaytestModeTooltipDisplayCount = var1.incrementUnpublishedPlaytestModeTooltipDisplayCount,
	wasPushNotificationsUpsellShownToday = var1.wasPushNotificationsUpsellShownToday,
	markPushNotificationsUpsellShown = var1.markPushNotificationsUpsellShown,
	isPushNotificationsUpsellDismissedPermanently = var1.isPushNotificationsUpsellDismissedPermanently,
	markPushNotificationsUpsellDismissedPermanently = var1.markPushNotificationsUpsellDismissedPermanently,
	clearSessionCacheForTests = var1.clearSessionCacheForTests,
	createForTests = createBuildAppStorage
}