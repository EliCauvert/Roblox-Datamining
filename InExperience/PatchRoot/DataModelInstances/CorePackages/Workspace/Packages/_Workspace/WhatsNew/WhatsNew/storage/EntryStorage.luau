local whatsNew = script:FindFirstAncestor("WhatsNew")
local appCommonLibModule = require(whatsNew.Parent.AppCommonLib)
local _ = require(whatsNew.Types)
local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local var4 = appCommonLibModule.Utils.AppStorageJsonCacheUtils.new(appStorageService)

local function _(p0, p1) --[[ line: 34 | named "getOrCreateStoredEntry" ]]
	local var9 = p0[p1]
	
	if type(var9) ~= "table" then
		var9 = {}
		p0[p1] = var9
	end
	return var9
end

local _ = function() --[[ line: 43 | named "emptyDeviceData" ]]
	return { entries = {} }
end

local _ = function(p2) --[[ line: 49 | named "normalizeDeviceData" ]]
	if type(p2.entries) ~= "table" then
		p2.entries = {}
	end
	return p2
end

local function deepClone(p3) --[[ line: 56 ]]
	-- upvalues: deepClone (ref)
	local t = {}
	
	if type(p3) == "table" then
		for i, v in p3 do
			if type(v) == "table" then
				t[i] = deepClone(v)
			else
				t[i] = v
			end
		end
	end
	return t
end

local _ = function() --[[ line: 70 | named "readDeviceData" ]]
	-- upvalues: var4 (ref)
	local whatsNewEntriesCachedJsonForKey = var4:getCachedJsonForKey("WhatsNewEntries")
	
	return if type(whatsNewEntriesCachedJsonForKey) == "table" then whatsNewEntriesCachedJsonForKey else nil
end

local _ = function(p4) --[[ line: 78 | named "cloneStoredDeviceData" ]]
	-- upvalues: deepClone (ref)
	local t = { entries = deepClone(p4.entries) }
	
	if type(t.entries) ~= "table" then
		t.entries = {}
	end
	return t
end

local function writeDeviceData(p5) --[[ line: 84 ]]
	-- upvalues: httpService (ref), appStorageService (ref), var4 (ref)
	local ok, status = pcall(function() --[[ line: 85 ]]
		-- upvalues: httpService (copy), p5 (ref)
		return httpService:JSONEncode(p5)
	end)
	
	if not ok or type(status) ~= "string" then
		warn(`WhatsNew EntryStorage: failed to encode storage: {status}`)
		
		return false
	end
	local ok_1, status_1 = pcall(function() --[[ line: 93 ]]
		-- upvalues: appStorageService (copy), status (ref)
		appStorageService:SetItem("WhatsNewEntries", status)
		appStorageService:Flush()
	end)
	
	if ok_1 then
		var4:getCachedJsonForKey("WhatsNewEntries", true)
		
		return true
	end
	warn(`WhatsNew EntryStorage: failed to persist storage: {status_1}`)
	
	return false
end

local _ = function() --[[ line: 106 | named "getDeviceData" ]]
	-- upvalues: var4 (ref), deepClone (ref)
	local whatsNewEntriesCachedJsonForKey = var4:getCachedJsonForKey("WhatsNewEntries")
	local var14 = if type(whatsNewEntriesCachedJsonForKey) == "table" then whatsNewEntriesCachedJsonForKey else nil
	
	if var14 == nil then
		return { entries = {} }
	end
	local t = { entries = deepClone(var14.entries) }
	
	if type(t.entries) ~= "table" then
		t.entries = {}
	end
	return t
end

local function updateDeviceData(p6) --[[ line: 115 ]]
	-- upvalues: var4 (ref), deepClone (ref), writeDeviceData (ref)
	local t
	local whatsNewEntriesCachedJsonForKey = var4:getCachedJsonForKey("WhatsNewEntries")
	local var17 = if type(whatsNewEntriesCachedJsonForKey) == "table" then whatsNewEntriesCachedJsonForKey else nil
	
	if var17 then
		local t_1 = { entries = deepClone(var17.entries) }
		
		if type(t_1.entries) ~= "table" then
			t_1.entries = {}
		end
		t = t_1
	else
		t = { entries = {} }
	end
	if type(t.entries) ~= "table" then
		t.entries = {}
	end
	local var20 = p6(t)
	
	if var20 == nil then return end
	if type(var20.entries) ~= "table" then
		var20.entries = {}
	end
	writeDeviceData(var20)
end

local function toSnapshot(p7) --[[ line: 129 ]]
	local t = {}
	
	if type(p7) ~= "table" then
		return t
	end
	for i, v in p7 do
		if type(v) == "table" then
			t[i] = { optOutCount = 0, adopted = false, seen = v.seen }
		end
	end
	return t
end

return {
	STORAGE_KEY = "WhatsNewEntries",
	clearJsonCacheForTests = function() --[[ line: 150 ]]
		-- upvalues: var4 (ref)
		var4._jsonDecodeCache = {}
	end,
	clearForTests = function() --[[ line: 153 ]]
		-- upvalues: writeDeviceData (ref), var4 (ref)
		writeDeviceData({ entries = {} })
		var4._jsonDecodeCache = {}
	end,
	getEntries = function() --[[ line: 157 ]]
		-- upvalues: var4 (ref), deepClone (ref), toSnapshot (ref)
		local t
		local whatsNewEntriesCachedJsonForKey = var4:getCachedJsonForKey("WhatsNewEntries")
		local var23 = if type(whatsNewEntriesCachedJsonForKey) == "table" then whatsNewEntriesCachedJsonForKey else nil
		
		if var23 == nil then
			t = { entries = {} }
		else
			local t_1 = { entries = deepClone(var23.entries) }
			
			if type(t_1.entries) ~= "table" then
				t_1.entries = {}
			end
			t = t_1
		end
		return toSnapshot(t.entries)
	end,
	markSeen = function(p8, p9) --[[ line: 162 ]]
		-- upvalues: updateDeviceData (ref)
		updateDeviceData(function(p10) --[[ line: 163 ]]
			-- upvalues: p8 (ref), p9 (ref)
			local entries = p10.entries
			local var26 = entries[p8]
			
			if type(var26) ~= "table" then
				var26 = {}
				entries[p8] = var26
			end
			var26.seen = p9
			
			return p10
		end)
	end
}