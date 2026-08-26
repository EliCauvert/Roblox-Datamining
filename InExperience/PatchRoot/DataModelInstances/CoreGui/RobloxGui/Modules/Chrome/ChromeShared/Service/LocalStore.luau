local chromeShared = script:FindFirstAncestor("ChromeShared")
local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local constantsModule = require(chromeShared.Unibar.Constants)
local inGameMenuStateStorageKeyEngineFeature = game:GetEngineFeature("InGameMenuStateStorageKey")
local var1 = nil
local var2 = false
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
	localPlayer = playersService.LocalPlayer
end
local text = "player_" .. tostring(if localPlayer then localPlayer.UserId else 0)

local function initStore()
	-- upvalues: var1 (write), text (ref)
	if var1.LocalPlayer == nil then
		var1.LocalPlayer = {}
	end
	if var1.LocalPlayer[text] == nil then
		var1.LocalPlayer[text] = {}
	end
	if var1.AnyPlayer == nil then
		var1.AnyPlayer = {}
	end
end

local function localPlayerSelector(p1)
	-- upvalues: text (ref)
	return if p1 and p1.LocalPlayer and p1.LocalPlayer[text] then p1.LocalPlayer[text] else p1
end

local function anyPlayerSelector(p1)
	return if p1 and p1.AnyPlayer then p1.AnyPlayer else p1
end

local function loadStore()
	-- upvalues: inGameMenuStateStorageKeyEngineFeature (ref), appStorageService (ref), var2 (write), httpService (ref), var1 (write), initStore (ref)
	if not inGameMenuStateStorageKeyEngineFeature then return end
	local ok, status = pcall(function()
		-- upvalues: appStorageService (copy)
		return appStorageService:GetItem("InGameMenuState")
	end)
	
	if ok then
		var2 = true
		
		if #status > 0 then
			local ok_1, status_1 = pcall(function()
				-- upvalues: httpService (copy), status (ref)
				return httpService:JSONDecode(status)
			end)
			var1 = if ok_1 then status_1 else {}
		else
			var1 = {}
		end
		initStore()
	end
end

local function saveStore()
	-- upvalues: inGameMenuStateStorageKeyEngineFeature (ref), var2 (write), httpService (ref), var1 (write), appStorageService (ref)
	if not inGameMenuStateStorageKeyEngineFeature then return end
	if var2 then
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), var1 (copy)
			return httpService:JSONEncode(var1)
		end)
		
		if ok then
			local ok_1, status_1 = pcall(function()
				-- upvalues: appStorageService (copy), status (ref)
				appStorageService:SetItem("InGameMenuState", status)
				appStorageService:Flush()
			end)
			
			if ok_1 then
				return
			else
				print(status_1)
				error("Failed to write JSON to AppStorageService", 0)
				
				return
			end
		else
			error("Failed to encode JSON", 0)
		end
	end
end

local function deepCopy(p1)
	-- upvalues: deepCopy (ref)
	if type(p1) ~= "table" then
		return p1
	end
	local t = {}
	
	for i, v in pairs(p1) do
		t[i] = deepCopy(v)
	end
	return t
end

local function _(p2, p3, p4)
	-- upvalues: var2 (write), loadStore (ref), var1 (write), deepCopy (ref), saveStore (ref)
	if not var2 then
		loadStore()
	end
	if var2 then
		local var3 = p4 and p4(var1) or var1
		local var4 = var3[p2]
		var3[p2] = deepCopy(p3)
		
		if var4 ~= var3[p2] then
			saveStore()
		end
	end
end

local _ = function(p2, p3)
	-- upvalues: var2 (write), loadStore (ref), var1 (write), deepCopy (ref)
	if not var2 then
		loadStore()
	end
	if var2 then
		local var3 = p3 and p3(var1) or var1
		
		return if var3 then deepCopy(var3[p2]) else nil
	end
end

return {
	isEnabled = function()
		-- upvalues: inGameMenuStateStorageKeyEngineFeature (ref)
		return inGameMenuStateStorageKeyEngineFeature
	end,
	storeForLocalPlayer = function(p2, p3)
		-- upvalues: localPlayerSelector (ref), var2 (write), loadStore (ref), var1 (write), text (ref), deepCopy (ref), saveStore (ref)
		if not var2 then
			loadStore()
		end
		if var2 then
			local var3, var4
			if localPlayerSelector then
				var3 = var1
				var4 = if var3 and var3.LocalPlayer and var3.LocalPlayer[text] then var3.LocalPlayer[text] else var3
				var4 = var4 or var1
			end
			var3 = var4[p2]
			var4[p2] = deepCopy(p3)
			
			if var3 ~= var4[p2] then
				saveStore()
			end
		end
	end,
	loadForLocalPlayer = function(p2)
		-- upvalues: localPlayerSelector (ref), var2 (write), loadStore (ref), var1 (write), text (ref), deepCopy (ref)
		if not var2 then
			loadStore()
		end
		if var2 then
			local var3
			if localPlayerSelector then
				local var4 = var1
				var3 = if var4 and var4.LocalPlayer and var4.LocalPlayer[text] then var4.LocalPlayer[text] else var4
				var3 = var3 or var1
			end
			return if var3 then deepCopy(var3[p2]) else nil
		end
	end,
	storeForAnyPlayer = function(p2, p3)
		-- upvalues: anyPlayerSelector (ref), var2 (write), loadStore (ref), var1 (write), deepCopy (ref), saveStore (ref)
		if not var2 then
			loadStore()
		end
		if var2 then
			local var3, var4
			if anyPlayerSelector then
				var3 = var1
				var4 = if var3 and var3.AnyPlayer then var3.AnyPlayer else var3
				var4 = var4 or var1
			end
			var3 = var4[p2]
			var4[p2] = deepCopy(p3)
			
			if var3 ~= var4[p2] then
				saveStore()
			end
		end
	end,
	loadForAnyPlayer = function(p2)
		-- upvalues: anyPlayerSelector (ref), var2 (write), loadStore (ref), var1 (write), deepCopy (ref)
		if not var2 then
			loadStore()
		end
		if var2 then
			local var3
			if anyPlayerSelector then
				local var4 = var1
				var3 = if var4 and var4.AnyPlayer then var4.AnyPlayer else var4
				var3 = var3 or var1
			end
			return if var3 then deepCopy(var3[p2]) else nil
		end
	end,
	clearCache = function()
		-- upvalues: var2 (write), var1 (write)
		var2 = false
		var1 = nil
	end,
	getValue = function(p2)
		-- upvalues: localPlayerSelector (ref), var2 (write), loadStore (ref), var1 (write), text (ref), deepCopy (ref)
		if not var2 then
			loadStore()
		end
		if var2 then
			local var3
			if localPlayerSelector then
				local var4 = var1
				var3 = if var4 and var4.LocalPlayer and var4.LocalPlayer[text] then var4.LocalPlayer[text] else var4
				var3 = var3 or var1
			end
			return if var3 then deepCopy(var3[p2]) else nil
		end
	end,
	getUniversesExposedTo = function(p2)
		-- upvalues: localPlayerSelector (ref), var2 (write), loadStore (ref), var1 (write), text (ref), deepCopy (ref)
		local var3
		local var4 = localPlayerSelector
		
		if not var2 then
			loadStore()
		end
		if var2 then
			local var5
			if var4 then
				local var6 = var1
				var5 = if var6 and var6.LocalPlayer and var6.LocalPlayer[text] then var6.LocalPlayer[text] else var6
				var5 = var5 or var1
			end
			var3 = if var5 then deepCopy(var5[p2]) else nil
		end
		return var3 or {}
	end,
	getNumUniversesExposedTo = function(p2)
		-- upvalues: localPlayerSelector (ref), var2 (write), loadStore (ref), var1 (write), text (ref), deepCopy (ref)
		local var3
		if not var2 then
			loadStore()
		end
		if var2 then
			local var4
			if localPlayerSelector then
				local var5 = var1
				var4 = if var5 and var5.LocalPlayer and var5.LocalPlayer[text] then var5.LocalPlayer[text] else var5
				var4 = var4 or var1
			end
			var3 = if var4 then deepCopy(var4[p2]) else nil
		end
		return #(var3 or {})
	end,
	addUniverseToExposureList = function(value, p2)
		-- upvalues: localPlayerSelector (ref), var2 (write), loadStore (ref), var1 (write), text (ref), deepCopy (ref), constantsModule (ref), saveStore (ref)
		local var3
		if not var2 then
			loadStore()
		end
		if var2 then
			local var4
			if localPlayerSelector then
				local var5 = var1
				var4 = if var5 and var5.LocalPlayer and var5.LocalPlayer[text] then var5.LocalPlayer[text] else var5
				var4 = var4 or var1
			end
			var3 = if var4 then deepCopy(var4[value]) else nil
		end
		local var6 = var3 or {}
		
		if not table.find(var6, p2) and #var6 < constantsModule.MAX_NUM_UNIVERSES_SHOWN then
			table.insert(var6, p2)
			local var7 = localPlayerSelector
			
			if not var2 then
				loadStore()
			end
			if var2 then
				local var8, var9
				if var7 then
					var8 = var1
					var9 = if var8 and var8.LocalPlayer and var8.LocalPlayer[text] then var8.LocalPlayer[text] else var8
					var9 = var9 or var1
				end
				var8 = var9[value]
				var9[value] = deepCopy(var6)
				
				if var8 ~= var9[value] then
					saveStore()
				end
			end
		end
	end
}