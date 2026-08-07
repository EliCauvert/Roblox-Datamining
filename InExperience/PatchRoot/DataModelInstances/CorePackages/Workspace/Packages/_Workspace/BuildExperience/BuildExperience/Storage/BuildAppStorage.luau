local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")

local function _(p0) --[[ line: 14 | named "getUtcDate" ]]
	return string.match(p0, "^(%d%d%d%d%-%d%d%-%d%d)")
end

local _ = function(p1, p2) --[[ line: 18 | named "isSameUtcDate" ]]
	return p1 ~= nil and string.match(p1, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(p2, "^(%d%d%d%d%-%d%d%-%d%d)")
end

local function createBuildAppStorage(p3, p4) --[[ line: 22 ]]
	local var4 = nil
	
	local function readData() --[[ line: 25 ]]
		-- upvalues: p3 (ref), p4 (ref)
		local ok, status = pcall(p3.GetItem, p3, "BuildAppStorageKey")
		
		if not ok or type(status) ~= "string" or status == "" then
			return {}
		end
		local ok_1, status_1 = pcall(p4.JSONDecode, p4, status)
		
		return if ok_1 and type(status_1) == "table" then status_1 else {}
	end
	
	local function _(p5) --[[ line: 39 | named "writeData" ]]
		-- upvalues: p4 (ref), p3 (ref)
		local ok, status = pcall(p4.JSONEncode, p4, p5)
		
		return if ok and type(status) == "string" then pcall(function() --[[ line: 45 ]]
			-- upvalues: p3 (copy), status (ref)
			p3:SetItem("BuildAppStorageKey", status)
			p3:Flush()
		end) else false
	end
	
	return {
		STORAGE_KEY = "BuildAppStorageKey",
		wasPushNotificationsUpsellShownToday = function(p6) --[[ line: 52 ]]
			-- upvalues: var4 (write), readData (ref)
			local var6 = (p6 or DateTime.now()):ToIsoDate()
			
			if var4 ~= nil and string.match(var4, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(var6, "^(%d%d%d%d%-%d%d%-%d%d)") then
				return true
			end
			local pushNotificationsUpsell = readData().pushNotificationsUpsell
			local var7 = false
			
			if type(pushNotificationsUpsell) == "table" then
				local lastShownAt = pushNotificationsUpsell.lastShownAt
				var7 = lastShownAt ~= nil and string.match(lastShownAt, "^(%d%d%d%d%-%d%d%-%d%d)") == string.match(var6, "^(%d%d%d%d%-%d%d%-%d%d)")
			end
			return var7
		end,
		markPushNotificationsUpsellShown = function(p7) --[[ line: 63 ]]
			-- upvalues: var4 (write), readData (ref), p4 (ref), p3 (ref)
			local var8 = (p7 or DateTime.now()):ToIsoDate()
			var4 = var8
			local var9 = readData()
			local pushNotificationsUpsell = var9.pushNotificationsUpsell
			local var10 = if type(pushNotificationsUpsell) == "table" then table.clone(pushNotificationsUpsell) else {}
			var10.lastShownAt = var8
			var9.pushNotificationsUpsell = var10
			local ok, status = pcall(p4.JSONEncode, p4, var9)
			
			return if ok and type(status) == "string" then pcall(function() --[[ line: 45 ]]
				-- upvalues: p3 (copy), status (ref)
				p3:SetItem("BuildAppStorageKey", status)
				p3:Flush()
			end) else false
		end,
		clearSessionCacheForTests = function() --[[ line: 81 ]]
			-- upvalues: var4 (write)
			var4 = nil
		end
	}
end

local var3 = createBuildAppStorage(appStorageService, httpService)

return {
	STORAGE_KEY = "BuildAppStorageKey",
	wasPushNotificationsUpsellShownToday = var3.wasPushNotificationsUpsellShownToday,
	markPushNotificationsUpsellShown = var3.markPushNotificationsUpsellShown,
	clearSessionCacheForTests = var3.clearSessionCacheForTests,
	createForTests = createBuildAppStorage
}