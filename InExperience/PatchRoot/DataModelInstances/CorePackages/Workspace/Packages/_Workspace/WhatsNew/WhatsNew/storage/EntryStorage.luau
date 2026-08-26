local whatsNew = script:FindFirstAncestor("WhatsNew")
local appCommonLibModule = require(whatsNew.Parent.AppCommonLib)
local _ = require(whatsNew.Types)
local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local var1 = appCommonLibModule.Utils.AppStorageJsonCacheUtils.new(appStorageService)

local function _(p1, p2)
	local var2 = p1[p2]
	
	if type(var2) ~= "table" then
		var2 = {}
		p1[p2] = var2
	end
	return var2
end

local _ = function()
	return { entries = {} }
end

local _ = function(p1)
	if type(p1.entries) ~= "table" then
		p1.entries = {}
	end
	return p1
end

local function deepClone(p1)
	-- upvalues: deepClone (ref)
	local t = {}
	
	if type(p1) == "table" then
		for i, v in p1 do
			if type(v) == "table" then
				t[i] = deepClone(v)
			else
				t[i] = v
			end
		end
	end
	return t
end

local _ = function()
	-- upvalues: var1 (ref)
	local whatsNewEntriesCachedJsonForKey = var1:getCachedJsonForKey("WhatsNewEntries")
	
	return if type(whatsNewEntriesCachedJsonForKey) == "table" then whatsNewEntriesCachedJsonForKey else nil
end

local _ = function(p2)
	-- upvalues: deepClone (ref)
	local t = { entries = deepClone(p2.entries) }
	
	if type(t.entries) ~= "table" then
		t.entries = {}
	end
	return t
end

local function writeDeviceData(p2)
	-- upvalues: httpService (ref), appStorageService (ref), var1 (ref)
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p2 (ref)
		return httpService:JSONEncode(p2)
	end)
	
	if not ok or type(status) ~= "string" then
		warn(`WhatsNew EntryStorage: failed to encode storage: {status}`)
		
		return false
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: appStorageService (copy), status (ref)
		appStorageService:SetItem("WhatsNewEntries", status)
		appStorageService:Flush()
	end)
	
	if ok_1 then
		var1:getCachedJsonForKey("WhatsNewEntries", true)
		
		return true
	end
	warn(`WhatsNew EntryStorage: failed to persist storage: {status_1}`)
	
	return false
end

local _ = function()
	-- upvalues: var1 (ref), deepClone (ref)
	local whatsNewEntriesCachedJsonForKey = var1:getCachedJsonForKey("WhatsNewEntries")
	local var2 = if type(whatsNewEntriesCachedJsonForKey) == "table" then whatsNewEntriesCachedJsonForKey else nil
	
	if var2 == nil then
		return { entries = {} }
	end
	local t = { entries = deepClone(var2.entries) }
	
	if type(t.entries) ~= "table" then
		t.entries = {}
	end
	return t
end

local function updateDeviceData(p2)
	-- upvalues: var1 (ref), deepClone (ref), writeDeviceData (ref)
	local t
	local whatsNewEntriesCachedJsonForKey = var1:getCachedJsonForKey("WhatsNewEntries")
	local var2 = if type(whatsNewEntriesCachedJsonForKey) == "table" then whatsNewEntriesCachedJsonForKey else nil
	
	if var2 then
		local t_1 = { entries = deepClone(var2.entries) }
		
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
	local var3 = p2(t)
	
	if var3 == nil then return end
	if type(var3.entries) ~= "table" then
		var3.entries = {}
	end
	writeDeviceData(var3)
end

local function toSnapshot(p2)
	local t = {}
	
	if type(p2) ~= "table" then
		return t
	end
	for i, v in p2 do
		if type(v) == "table" then
			t[i] = { optOutCount = 0, adopted = false, seen = v.seen }
		end
	end
	return t
end

return {
	STORAGE_KEY = "WhatsNewEntries",
	clearJsonCacheForTests = function()
		-- upvalues: var1 (ref)
		var1._jsonDecodeCache = {}
	end,
	clearForTests = function()
		-- upvalues: writeDeviceData (ref), var1 (ref)
		writeDeviceData({ entries = {} })
		var1._jsonDecodeCache = {}
	end,
	getEntries = function()
		-- upvalues: var1 (ref), deepClone (ref), toSnapshot (ref)
		local t
		local whatsNewEntriesCachedJsonForKey = var1:getCachedJsonForKey("WhatsNewEntries")
		local var2 = if type(whatsNewEntriesCachedJsonForKey) == "table" then whatsNewEntriesCachedJsonForKey else nil
		
		if var2 == nil then
			t = { entries = {} }
		else
			local t_1 = { entries = deepClone(var2.entries) }
			
			if type(t_1.entries) ~= "table" then
				t_1.entries = {}
			end
			t = t_1
		end
		return toSnapshot(t.entries)
	end,
	markSeen = function(p3, p4)
		-- upvalues: updateDeviceData (ref)
		updateDeviceData(function(p5)
			-- upvalues: p3 (ref), p4 (ref)
			local entries = p5.entries
			local var2 = entries[p3]
			
			if type(var2) ~= "table" then
				var2 = {}
				entries[p3] = var2
			end
			var2.seen = p4
			
			return p5
		end)
	end
}