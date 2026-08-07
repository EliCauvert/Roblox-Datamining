local chromeShared = script:FindFirstAncestor("ChromeShared")
local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local constantsModule = require(chromeShared.Unibar.Constants)
local inGameMenuStateStorageKeyEngineFeature = game:GetEngineFeature("InGameMenuStateStorageKey")
local var6 = nil
local var7 = false
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
	localPlayer = playersService.LocalPlayer
end
local text = "player_" .. tostring(if localPlayer then localPlayer.UserId else 0)

local function initStore() --[[ line: 25 ]]
	-- upvalues: var6 (write), text (ref)
	if var6.LocalPlayer == nil then
		var6.LocalPlayer = {}
	end
	if var6.LocalPlayer[text] == nil then
		var6.LocalPlayer[text] = {}
	end
	if var6.AnyPlayer == nil then
		var6.AnyPlayer = {}
	end
end

local function localPlayerSelector(p0) --[[ line: 37 ]]
	-- upvalues: text (ref)
	return if p0 and p0.LocalPlayer and p0.LocalPlayer[text] then p0.LocalPlayer[text] else p0
end

local function anyPlayerSelector(p1) --[[ line: 44 ]]
	return if p1 and p1.AnyPlayer then p1.AnyPlayer else p1
end

local function loadStore() --[[ line: 51 ]]
	-- upvalues: inGameMenuStateStorageKeyEngineFeature (ref), appStorageService (ref), var7 (write), httpService (ref), var6 (write), initStore (ref)
	if not inGameMenuStateStorageKeyEngineFeature then return end
	local ok, status = pcall(function() --[[ line: 55 ]]
		-- upvalues: appStorageService (copy)
		return appStorageService:GetItem("InGameMenuState")
	end)
	
	if ok then
		var7 = true
		
		if #status > 0 then
			local ok_1, status_1 = pcall(function() --[[ line: 61 ]]
				-- upvalues: httpService (copy), status (ref)
				return httpService:JSONDecode(status)
			end)
			var6 = if ok_1 then status_1 else {}
		else
			var6 = {}
		end
		initStore()
	end
end

local function saveStore() --[[ line: 76 ]]
	-- upvalues: inGameMenuStateStorageKeyEngineFeature (ref), var7 (write), httpService (ref), var6 (write), appStorageService (ref)
	if not inGameMenuStateStorageKeyEngineFeature then return end
	if var7 then
		local ok, status = pcall(function() --[[ line: 81 ]]
			-- upvalues: httpService (copy), var6 (copy)
			return httpService:JSONEncode(var6)
		end)
		
		if ok then
			local ok_1, status_1 = pcall(function() --[[ line: 85 ]]
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

local function deepCopy(p2) --[[ line: 99 ]]
	-- upvalues: deepCopy (ref)
	if type(p2) ~= "table" then
		return p2
	end
	local t = {}
	
	for i, v in pairs(p2) do
		t[i] = deepCopy(v)
	end
	return t
end

local function _(p3, p4, p5) --[[ line: 111 | named "store" ]]
	-- upvalues: var7 (write), loadStore (ref), var6 (write), deepCopy (ref), saveStore (ref)
	if not var7 then
		loadStore()
	end
	if var7 then
		local var16 = p5 and p5(var6) or var6
		local var17 = var16[p3]
		var16[p3] = deepCopy(p4)
		
		if var17 ~= var16[p3] then
			saveStore()
		end
	end
end

local _ = function(p6, p7) --[[ line: 125 | named "load" ]]
	-- upvalues: var7 (write), loadStore (ref), var6 (write), deepCopy (ref)
	if not var7 then
		loadStore()
	end
	if var7 then
		local var18 = p7 and p7(var6) or var6
		
		return if var18 then deepCopy(var18[p6]) else nil
	end
end

return {
	isEnabled = function() --[[ line: 166 ]]
		-- upvalues: inGameMenuStateStorageKeyEngineFeature (ref)
		return inGameMenuStateStorageKeyEngineFeature
	end,
	storeForLocalPlayer = function(p8, p9) --[[ line: 169 ]]
		-- upvalues: localPlayerSelector (ref), var7 (write), loadStore (ref), var6 (write), text (ref), deepCopy (ref), saveStore (ref)
		if not var7 then
			loadStore()
		end
		if var7 then
			local var19, var20
			if localPlayerSelector then
				var19 = var6
				var20 = if var19 and var19.LocalPlayer and var19.LocalPlayer[text] then var19.LocalPlayer[text] else var19
				var20 = var20 or var6
			end
			var19 = var20[p8]
			var20[p8] = deepCopy(p9)
			
			if var19 ~= var20[p8] then
				saveStore()
			end
		end
	end,
	loadForLocalPlayer = function(p10) --[[ line: 172 ]]
		-- upvalues: localPlayerSelector (ref), var7 (write), loadStore (ref), var6 (write), text (ref), deepCopy (ref)
		if not var7 then
			loadStore()
		end
		if var7 then
			local var22
			if localPlayerSelector then
				local var21 = var6
				var22 = if var21 and var21.LocalPlayer and var21.LocalPlayer[text] then var21.LocalPlayer[text] else var21
				var22 = var22 or var6
			end
			return if var22 then deepCopy(var22[p10]) else nil
		end
	end,
	storeForAnyPlayer = function(p11, p12) --[[ line: 176 ]]
		-- upvalues: anyPlayerSelector (ref), var7 (write), loadStore (ref), var6 (write), deepCopy (ref), saveStore (ref)
		if not var7 then
			loadStore()
		end
		if var7 then
			local var23, var24
			if anyPlayerSelector then
				var23 = var6
				var24 = if var23 and var23.AnyPlayer then var23.AnyPlayer else var23
				var24 = var24 or var6
			end
			var23 = var24[p11]
			var24[p11] = deepCopy(p12)
			
			if var23 ~= var24[p11] then
				saveStore()
			end
		end
	end,
	loadForAnyPlayer = function(p13) --[[ line: 179 ]]
		-- upvalues: anyPlayerSelector (ref), var7 (write), loadStore (ref), var6 (write), deepCopy (ref)
		if not var7 then
			loadStore()
		end
		if var7 then
			local var26
			if anyPlayerSelector then
				local var25 = var6
				var26 = if var25 and var25.AnyPlayer then var25.AnyPlayer else var25
				var26 = var26 or var6
			end
			return if var26 then deepCopy(var26[p13]) else nil
		end
	end,
	clearCache = function() --[[ line: 183 ]]
		-- upvalues: var7 (write), var6 (write)
		var7 = false
		var6 = nil
	end,
	getValue = function(p14) --[[ line: 138 ]]
		-- upvalues: localPlayerSelector (ref), var7 (write), loadStore (ref), var6 (write), text (ref), deepCopy (ref)
		if not var7 then
			loadStore()
		end
		if var7 then
			local var28
			if localPlayerSelector then
				local var27 = var6
				var28 = if var27 and var27.LocalPlayer and var27.LocalPlayer[text] then var27.LocalPlayer[text] else var27
				var28 = var28 or var6
			end
			return if var28 then deepCopy(var28[p14]) else nil
		end
	end,
	getUniversesExposedTo = function(p15) --[[ line: 143 ]]
		-- upvalues: localPlayerSelector (ref), var7 (write), loadStore (ref), var6 (write), text (ref), deepCopy (ref)
		local var32
		local var29 = localPlayerSelector
		
		if not var7 then
			loadStore()
		end
		if var7 then
			local var31
			if var29 then
				local var30 = var6
				var31 = if var30 and var30.LocalPlayer and var30.LocalPlayer[text] then var30.LocalPlayer[text] else var30
				var31 = var31 or var6
			end
			var32 = if var31 then deepCopy(var31[p15]) else nil
		end
		return var32 or {}
	end,
	getNumUniversesExposedTo = function(p16) --[[ line: 160 ]]
		-- upvalues: localPlayerSelector (ref), var7 (write), loadStore (ref), var6 (write), text (ref), deepCopy (ref)
		local var35
		if not var7 then
			loadStore()
		end
		if var7 then
			local var34
			if localPlayerSelector then
				local var33 = var6
				var34 = if var33 and var33.LocalPlayer and var33.LocalPlayer[text] then var33.LocalPlayer[text] else var33
				var34 = var34 or var6
			end
			var35 = if var34 then deepCopy(var34[p16]) else nil
		end
		return #(var35 or {})
	end,
	addUniverseToExposureList = function(value, p17) --[[ line: 151 ]]
		-- upvalues: localPlayerSelector (ref), var7 (write), loadStore (ref), var6 (write), text (ref), deepCopy (ref), constantsModule (ref), saveStore (ref)
		local var38
		if not var7 then
			loadStore()
		end
		if var7 then
			local var37
			if localPlayerSelector then
				local var36 = var6
				var37 = if var36 and var36.LocalPlayer and var36.LocalPlayer[text] then var36.LocalPlayer[text] else var36
				var37 = var37 or var6
			end
			var38 = if var37 then deepCopy(var37[value]) else nil
		end
		local var39 = var38 or {}
		
		if not table.find(var39, p17) and #var39 < constantsModule.MAX_NUM_UNIVERSES_SHOWN then
			table.insert(var39, p17)
			local var40 = localPlayerSelector
			
			if not var7 then
				loadStore()
			end
			if var7 then
				local var41, var42
				if var40 then
					var41 = var6
					var42 = if var41 and var41.LocalPlayer and var41.LocalPlayer[text] then var41.LocalPlayer[text] else var41
					var42 = var42 or var6
				end
				var41 = var42[value]
				var42[value] = deepCopy(var39)
				
				if var41 ~= var42[value] then
					saveStore()
				end
			end
		end
	end
}