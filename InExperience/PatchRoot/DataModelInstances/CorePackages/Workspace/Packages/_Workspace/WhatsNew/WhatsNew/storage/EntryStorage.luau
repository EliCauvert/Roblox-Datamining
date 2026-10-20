local WhatsNew = script:FindFirstAncestor("WhatsNew")
local _ = require(WhatsNew.Types)
local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local NewResult = require(WhatsNew.Parent.AppCommonLib).Utils.AppStorageJsonCacheUtils.new(AppStorageService)

local function _(p1, Key)
	local v1 = p1[Key]
	
	if type(v1) ~= "table" then
		v1 = {}
		p1[Key] = v1
	end
	return v1
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

local function deepClone(Entries)
	-- upvalues: deepClone (copy)
	local t = {}
	
	if type(Entries) == "table" then
		for i, entry in Entries do
			if type(entry) == "table" then
				t[i] = deepClone(entry)
			else
				t[i] = entry
			end
		end
	end
	return t
end

local _ = function()
	-- upvalues: NewResult (copy)
	local WhatsNewEntriesCachedJsonForKey = NewResult:getCachedJsonForKey("WhatsNewEntries")
	
	return if type(WhatsNewEntriesCachedJsonForKey) == "table" then WhatsNewEntriesCachedJsonForKey else nil
end

local _ = function(p1)
	-- upvalues: deepClone (copy)
	local config = { entries = deepClone(p1.entries) }
	
	if type(config.entries) ~= "table" then
		config.entries = {}
	end
	return config
end

local function writeDeviceData(Input): boolean
	-- upvalues: HttpService (copy), AppStorageService (copy), NewResult (copy)
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), Input (copy)
		return HttpService:JSONEncode(Input)
	end)
	
	if not Success or type(Result) ~= "string" then
		warn(`WhatsNew EntryStorage: failed to encode storage: {Result}`)
		
		return false
	end
	local Success1, Result1 = pcall(function()
		-- upvalues: AppStorageService (upval), Result (copy)
		AppStorageService:SetItem("WhatsNewEntries", Result)
		AppStorageService:Flush()
	end)
	
	if Success1 then
		NewResult:getCachedJsonForKey("WhatsNewEntries", true)
		
		return true
	else
		warn(`WhatsNew EntryStorage: failed to persist storage: {Result1}`)
		
		return false
	end
end

local _ = function()
	-- upvalues: NewResult (copy), deepClone (copy)
	local WhatsNewEntriesCachedJsonForKey = NewResult:getCachedJsonForKey("WhatsNewEntries")
	local WhatsNewEntriesCachedJsonForKey1 = if type(WhatsNewEntriesCachedJsonForKey) == "table" then WhatsNewEntriesCachedJsonForKey else nil
	
	if WhatsNewEntriesCachedJsonForKey1 == nil then
		return { entries = {} }
	end
	local config = {
		entries = deepClone(WhatsNewEntriesCachedJsonForKey1.entries)
	}
	
	if type(config.entries) ~= "table" then
		config.entries = {}
	end
	return config
end

local function updateDeviceData(Callback)
	-- upvalues: NewResult (copy), deepClone (copy), writeDeviceData (copy)
	local WhatsNewEntriesCachedJsonForKey = NewResult:getCachedJsonForKey("WhatsNewEntries")
	local WhatsNewEntriesCachedJsonForKey1 = if type(WhatsNewEntriesCachedJsonForKey) == "table" then WhatsNewEntriesCachedJsonForKey else nil
	local config1 = nil
	
	if WhatsNewEntriesCachedJsonForKey1 then
		local config = {
			entries = deepClone(WhatsNewEntriesCachedJsonForKey1.entries)
		}
		
		if type(config.entries) ~= "table" then
			config.entries = {}
		end
		config1 = config
	else
		config1 = { entries = {} }
	end
	if type(config1.entries) ~= "table" then
		config1.entries = {}
	end
	local CallbackResult = Callback(config1)
	
	if CallbackResult == nil then return end
	if type(CallbackResult.entries) ~= "table" then
		CallbackResult.entries = {}
	end
	writeDeviceData(CallbackResult)
end

local function toSnapshot(Entries)
	local t = {}
	
	if type(Entries) ~= "table" then
		return t
	end
	for i, entry in Entries do
		if type(entry) == "table" then
			t[i] = { optOutCount = 0, adopted = false, seen = entry.seen }
		end
	end
	return t
end

return {
	STORAGE_KEY = "WhatsNewEntries",
	clearJsonCacheForTests = function()
		-- upvalues: NewResult (copy)
		NewResult._jsonDecodeCache = {}
	end,
	clearForTests = function()
		-- upvalues: writeDeviceData (copy), NewResult (copy)
		writeDeviceData({ entries = {} })
		NewResult._jsonDecodeCache = {}
	end,
	getEntries = function()
		-- upvalues: NewResult (copy), deepClone (copy), toSnapshot (copy)
		local WhatsNewEntriesCachedJsonForKey = NewResult:getCachedJsonForKey("WhatsNewEntries")
		local WhatsNewEntriesCachedJsonForKey1 = if type(WhatsNewEntriesCachedJsonForKey) == "table" then WhatsNewEntriesCachedJsonForKey else nil
		local config = nil
		
		if WhatsNewEntriesCachedJsonForKey1 == nil then
			config = { entries = {} }
		else
			local config1 = {
				entries = deepClone(WhatsNewEntriesCachedJsonForKey1.entries)
			}
			
			if type(config1.entries) ~= "table" then
				config1.entries = {}
			end
			config = config1
		end
		return (toSnapshot(config.entries))
	end,
	markSeen = function(p1, Seen)
		-- upvalues: updateDeviceData (copy)
		updateDeviceData(function(p2)
			-- upvalues: p1 (copy), Seen (copy)
			local Entries = p2.entries
			local Entry = Entries[p1]
			
			if type(Entry) ~= "table" then
				Entry = {}
				Entries[p1] = Entry
			end
			Entry.seen = Seen
			
			return p2
		end)
	end
}