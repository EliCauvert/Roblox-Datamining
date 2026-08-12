local whatsNew = script:FindFirstAncestor("WhatsNew")
local appCommonLibModule = require(whatsNew.Parent.AppCommonLib)
local _ = require(whatsNew.Types)
local hadUsageBeforeFeatureModule = require(script.Parent.hadUsageBeforeFeature)
local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local var5 = appCommonLibModule.Utils.AppStorageJsonCacheUtils.new(appStorageService)
local t = { grandfathered = nil, onboardingCompletedAt = nil }

local function _(p0, p1) --[[ line: 49 | named "getOrCreateStoredEntry" ]]
	local var13 = p0[p1]
	
	if type(var13) ~= "table" then
		var13 = {}
		p0[p1] = var13
	end
	return var13
end

local function normalizeMeta(p2) --[[ line: 58 ]]
	-- upvalues: t (ref)
	return if type(p2) == "table" then table.clone(p2) else table.clone(t)
end

local function emptyDeviceData() --[[ line: 65 ]]
	-- upvalues: t (ref)
	return { meta = table.clone(t), entries = {} }
end

local _ = function(p3) --[[ line: 72 | named "normalizeDeviceData" ]]
	-- upvalues: t (ref)
	local meta = p3.meta
	p3.meta = if type(meta) == "table" then table.clone(meta) else table.clone(t)
	
	if type(p3.entries) ~= "table" then
		p3.entries = {}
	end
	return p3
end

local function deepClone(p4) --[[ line: 80 ]]
	-- upvalues: deepClone (ref)
	local t = {}
	
	if type(p4) == "table" then
		for i, v in p4 do
			if type(v) == "table" then
				t[i] = deepClone(v)
			else
				t[i] = v
			end
		end
	end
	return t
end

local _ = function() --[[ line: 94 | named "readDeviceData" ]]
	-- upvalues: var5 (ref)
	local whatsNewEntriesCachedJsonForKey = var5:getCachedJsonForKey("WhatsNewEntries")
	
	return if type(whatsNewEntriesCachedJsonForKey) == "table" then whatsNewEntriesCachedJsonForKey else nil
end

local _ = function(p5) --[[ line: 102 | named "cloneStoredDeviceData" ]]
	-- upvalues: deepClone (ref), t (ref)
	local t_1 = { meta = p5.meta, entries = deepClone(p5.entries) }
	local meta = t_1.meta
	t_1.meta = if type(meta) == "table" then table.clone(meta) else table.clone(t)
	
	if type(t_1.entries) ~= "table" then
		t_1.entries = {}
	end
	return t_1
end

local function writeDeviceData(p6) --[[ line: 109 ]]
	-- upvalues: httpService (ref), appStorageService (ref), var5 (ref)
	local ok, status = pcall(function() --[[ line: 110 ]]
		-- upvalues: httpService (copy), p6 (ref)
		return httpService:JSONEncode(p6)
	end)
	
	if not ok or type(status) ~= "string" then
		warn(`WhatsNew EntryStorage: failed to encode storage: {status}`)
		
		return false
	end
	local ok_1, status_1 = pcall(function() --[[ line: 118 ]]
		-- upvalues: appStorageService (copy), status (ref)
		appStorageService:SetItem("WhatsNewEntries", status)
		appStorageService:Flush()
	end)
	
	if ok_1 then
		var5:getCachedJsonForKey("WhatsNewEntries", true)
		
		return true
	end
	warn(`WhatsNew EntryStorage: failed to persist storage: {status_1}`)
	
	return false
end

local _ = function() --[[ line: 131 | named "getDeviceData" ]]
	-- upvalues: var5 (ref), emptyDeviceData (ref), deepClone (ref), t (ref)
	local whatsNewEntriesCachedJsonForKey = var5:getCachedJsonForKey("WhatsNewEntries")
	local var18 = if type(whatsNewEntriesCachedJsonForKey) == "table" then whatsNewEntriesCachedJsonForKey else nil
	
	if var18 == nil then
		return emptyDeviceData()
	end
	local t_1 = { meta = var18.meta, entries = deepClone(var18.entries) }
	local meta = t_1.meta
	t_1.meta = if type(meta) == "table" then table.clone(meta) else table.clone(t)
	
	if type(t_1.entries) ~= "table" then
		t_1.entries = {}
	end
	return t_1
end

local function updateDeviceData(p7) --[[ line: 140 ]]
	-- upvalues: var5 (ref), deepClone (ref), t (ref), emptyDeviceData (ref), writeDeviceData (ref)
	local var22
	local whatsNewEntriesCachedJsonForKey = var5:getCachedJsonForKey("WhatsNewEntries")
	local var21 = if type(whatsNewEntriesCachedJsonForKey) == "table" then whatsNewEntriesCachedJsonForKey else nil
	
	if var21 then
		local t_1 = { meta = var21.meta, entries = deepClone(var21.entries) }
		local meta = t_1.meta
		t_1.meta = if type(meta) == "table" then table.clone(meta) else table.clone(t)
		
		if type(t_1.entries) ~= "table" then
			t_1.entries = {}
		end
		var22 = t_1
	else
		var22 = emptyDeviceData()
	end
	local meta = var22.meta
	var22.meta = if type(meta) == "table" then table.clone(meta) else table.clone(t)
	
	if type(var22.entries) ~= "table" then
		var22.entries = {}
	end
	local var24 = p7(var22)
	
	if var24 == nil then return end
	local meta_1 = var24.meta
	var24.meta = if type(meta_1) == "table" then table.clone(meta_1) else table.clone(t)
	
	if type(var24.entries) ~= "table" then
		var24.entries = {}
	end
	writeDeviceData(var24)
end

local function toSnapshot(p8) --[[ line: 154 ]]
	local t = {}
	
	if type(p8) ~= "table" then
		return t
	end
	for i, v in p8 do
		if type(v) == "table" then
			t[i] = { optOutCount = 0, adopted = false, seen = v.seen }
		end
	end
	return t
end

return {
	STORAGE_KEY = "WhatsNewEntries",
	clearJsonCacheForTests = function() --[[ line: 175 ]]
		-- upvalues: var5 (ref)
		var5._jsonDecodeCache = {}
	end,
	clearForTests = function() --[[ line: 178 ]]
		-- upvalues: writeDeviceData (ref), emptyDeviceData (ref), var5 (ref)
		writeDeviceData(emptyDeviceData())
		var5._jsonDecodeCache = {}
	end,
	getEntries = function() --[[ line: 182 ]]
		-- upvalues: var5 (ref), emptyDeviceData (ref), deepClone (ref), t (ref), toSnapshot (ref)
		local var28
		local whatsNewEntriesCachedJsonForKey = var5:getCachedJsonForKey("WhatsNewEntries")
		local var27 = if type(whatsNewEntriesCachedJsonForKey) == "table" then whatsNewEntriesCachedJsonForKey else nil
		
		if var27 == nil then
			var28 = emptyDeviceData()
		else
			local t_1 = { meta = var27.meta, entries = deepClone(var27.entries) }
			local meta = t_1.meta
			t_1.meta = if type(meta) == "table" then table.clone(meta) else table.clone(t)
			
			if type(t_1.entries) ~= "table" then
				t_1.entries = {}
			end
			var28 = t_1
		end
		return toSnapshot(var28.entries)
	end,
	getMeta = function() --[[ line: 187 ]]
		-- upvalues: var5 (ref), emptyDeviceData (ref), deepClone (ref), t (ref), normalizeMeta (ref)
		local var32
		local whatsNewEntriesCachedJsonForKey = var5:getCachedJsonForKey("WhatsNewEntries")
		local var31 = if type(whatsNewEntriesCachedJsonForKey) == "table" then whatsNewEntriesCachedJsonForKey else nil
		
		if var31 == nil then
			var32 = emptyDeviceData()
		else
			local t_1 = { meta = var31.meta, entries = deepClone(var31.entries) }
			local meta = t_1.meta
			t_1.meta = if type(meta) == "table" then table.clone(meta) else table.clone(t)
			
			if type(t_1.entries) ~= "table" then
				t_1.entries = {}
			end
			var32 = t_1
		end
		return normalizeMeta(var32.meta)
	end,
	setMeta = function(value) --[[ line: 192 ]]
		-- upvalues: updateDeviceData (ref), t (ref)
		updateDeviceData(function(p9) --[[ line: 193 ]]
			-- upvalues: value (ref), t (copy)
			p9.meta = if type(value) == "table" then table.clone(value) else table.clone(t)
			
			return p9
		end)
	end,
	markSeen = function(p10, p11) --[[ line: 199 ]]
		-- upvalues: updateDeviceData (ref)
		updateDeviceData(function(p12) --[[ line: 200 ]]
			-- upvalues: p10 (ref), p11 (ref)
			local entries = p12.entries
			local var34 = entries[p10]
			
			if type(var34) ~= "table" then
				var34 = {}
				entries[p10] = var34
			end
			var34.seen = p11
			
			return p12
		end)
	end,
	runMigration = function(p13) --[[ line: 207 ]]
		-- upvalues: var5 (ref), emptyDeviceData (ref), deepClone (ref), t (ref), hadUsageBeforeFeatureModule (ref), updateDeviceData (ref)
		local var37
		local whatsNewEntriesCachedJsonForKey = var5:getCachedJsonForKey("WhatsNewEntries")
		local var36 = if type(whatsNewEntriesCachedJsonForKey) == "table" then whatsNewEntriesCachedJsonForKey else nil
		
		if var36 == nil then
			var37 = emptyDeviceData()
		else
			local t_1 = { meta = var36.meta, entries = deepClone(var36.entries) }
			local meta = t_1.meta
			t_1.meta = if type(meta) == "table" then table.clone(meta) else table.clone(t)
			
			if type(t_1.entries) ~= "table" then
				t_1.entries = {}
			end
			var37 = t_1
		end
		var37 = var37.meta
		
		if type(var37) == "table" and var37.grandfathered ~= nil then return end
		if hadUsageBeforeFeatureModule() then
			updateDeviceData(function(p14) --[[ line: 217 ]]
				-- upvalues: var37 (ref)
				p14.meta = {
					grandfathered = true,
					onboardingCompletedAt = if var37 then var37.onboardingCompletedAt else nil
				}
				
				return p14
			end)
			
			if p13 and p13.onGrandfathered then
				p13.onGrandfathered()
				
				return
			end
		else
			updateDeviceData(function(p15) --[[ line: 229 ]]
				-- upvalues: var37 (ref)
				p15.meta = {
					grandfathered = false,
					onboardingCompletedAt = if var37 then var37.onboardingCompletedAt else nil
				}
				
				return p15
			end)
		end
	end
}