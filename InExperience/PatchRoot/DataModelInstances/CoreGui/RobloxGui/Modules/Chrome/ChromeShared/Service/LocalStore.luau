local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ConstantsModule = require(script:FindFirstAncestor("ChromeShared").Unibar.Constants)
local InGameMenuStateStorageKeyEngineFeature = game:GetEngineFeature("InGameMenuStateStorageKey")
local T = nil
local Flag = false
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end
local Text = "player_" .. tostring(if LocalPlayer then LocalPlayer.UserId else 0)

local function initStore() --[[ Line: 25 ]]
	-- upvalues: T (ref), Text (copy)
	if T.LocalPlayer == nil then
		T.LocalPlayer = {}
	end
	if T.LocalPlayer[Text] == nil then
		T.LocalPlayer[Text] = {}
	end
	if T.AnyPlayer == nil then
		T.AnyPlayer = {}
	end
end

local function localPlayerSelector(p1) --[[ Line: 37 ]]
	-- upvalues: Text (copy)
	return if p1 and p1.LocalPlayer and p1.LocalPlayer[Text] then p1.LocalPlayer[Text] else p1
end

local function anyPlayerSelector(p1) --[[ Line: 44 ]]
	return if p1 and p1.AnyPlayer then p1.AnyPlayer else p1
end

local function loadStore() --[[ Line: 51 ]]
	-- upvalues: InGameMenuStateStorageKeyEngineFeature (copy), AppStorageService (copy), Flag (ref), HttpService (copy), T (ref), initStore (copy)
	if not InGameMenuStateStorageKeyEngineFeature then return end
	local Success, Result = pcall(function() --[[ Line: 55 ]]
		-- upvalues: AppStorageService (upval)
		return AppStorageService:GetItem("InGameMenuState")
	end)
	
	if Success then
		Flag = true
		
		if #Result > 0 then
			local Success1, Result1 = pcall(function() --[[ Line: 61 ]]
				-- upvalues: HttpService (upval), Result (copy)
				return HttpService:JSONDecode(Result)
			end)
			T = if Success1 then Result1 else {}
		else
			T = {}
		end
		initStore()
	end
end

local function saveStore() --[[ Line: 76 ]]
	-- upvalues: InGameMenuStateStorageKeyEngineFeature (copy), Flag (ref), HttpService (copy), T (ref), AppStorageService (copy)
	if not InGameMenuStateStorageKeyEngineFeature then return end
	if Flag then
		local Success, Result = pcall(function() --[[ Line: 81 ]]
			-- upvalues: HttpService (upval), T (upval)
			return HttpService:JSONEncode(T)
		end)
		
		if Success then
			local Success1, Result1 = pcall(function() --[[ Line: 85 ]]
				-- upvalues: AppStorageService (upval), Result (copy)
				AppStorageService:SetItem("InGameMenuState", Result)
				AppStorageService:Flush()
			end)
			
			if not Success1 then
				print(Result1)
				error("Failed to write JSON to AppStorageService", 0)
				
				return
			end
		else
			error("Failed to encode JSON", 0)
		end
	end
end

local function deepCopy(List) --[[ Line: 99 ]]
	-- upvalues: deepCopy (copy)
	if type(List) ~= "table" then
		return List
	end
	local t = {}
	
	for i, value in pairs(List) do
		t[i] = deepCopy(value)
	end
	return t
end

local function _(Key, p1, Callback) --[[ Line: 111 | Named "store" ]]
	-- upvalues: Flag (ref), loadStore (copy), T (ref), deepCopy (copy), saveStore (copy)
	if not Flag then
		loadStore()
	end
	if Flag then
		local CallbackResult = Callback and Callback(T) or T
		local CallbackResultEntry = CallbackResult[Key]
		CallbackResult[Key] = deepCopy(p1)
		
		if CallbackResultEntry ~= CallbackResult[Key] then
			saveStore()
		end
	end
end

local _ = function(p1, Callback) --[[ Line: 125 | Named "load" ]]
	-- upvalues: Flag (ref), loadStore (copy), T (ref), deepCopy (copy)
	if not Flag then
		loadStore()
	end
	if Flag then
		local CallbackResult = Callback and Callback(T) or T
		
		if CallbackResult then
			return (deepCopy(CallbackResult[p1]))
		end
	end
	return nil
end

return {
	isEnabled = function() --[[ Line: 166 ]]
		-- upvalues: InGameMenuStateStorageKeyEngineFeature (copy)
		return InGameMenuStateStorageKeyEngineFeature
	end,
	storeForLocalPlayer = function(Key, p1) --[[ Line: 169 ]]
		-- upvalues: localPlayerSelector (copy), Flag (ref), loadStore (copy), T (ref), Text (copy), deepCopy (copy), saveStore (copy)
		if not Flag then
			loadStore()
		end
		if Flag then
			local LocalPlayerEntry = nil
			if localPlayerSelector then
				local T1 = T
				LocalPlayerEntry = (if T1 and T1.LocalPlayer and T1.LocalPlayer[Text] then T1.LocalPlayer[Text] else T1) or T
			else
				LocalPlayerEntry = T
			end
			local LocalPlayerEntry1 = LocalPlayerEntry[Key]
			LocalPlayerEntry[Key] = deepCopy(p1)
			
			if LocalPlayerEntry1 ~= LocalPlayerEntry[Key] then
				saveStore()
			end
		end
	end,
	loadForLocalPlayer = function(p1) --[[ Line: 172 ]]
		-- upvalues: localPlayerSelector (copy), Flag (ref), loadStore (copy), T (ref), Text (copy), deepCopy (copy)
		if not Flag then
			loadStore()
		end
		if Flag then
			local LocalPlayerEntry = nil
			if localPlayerSelector then
				local T1 = T
				LocalPlayerEntry = (if T1 and T1.LocalPlayer and T1.LocalPlayer[Text] then T1.LocalPlayer[Text] else T1) or T
			else
				LocalPlayerEntry = T
			end
			if LocalPlayerEntry then
				return (deepCopy(LocalPlayerEntry[p1]))
			end
		end
		return nil
	end,
	storeForAnyPlayer = function(Key, p1) --[[ Line: 176 ]]
		-- upvalues: anyPlayerSelector (copy), Flag (ref), loadStore (copy), T (ref), deepCopy (copy), saveStore (copy)
		if not Flag then
			loadStore()
		end
		if Flag then
			local AnyPlayer = nil
			if anyPlayerSelector then
				local T1 = T
				AnyPlayer = (if T1 and T1.AnyPlayer then T1.AnyPlayer else T1) or T
			else
				AnyPlayer = T
			end
			local AnyPlayerEntry = AnyPlayer[Key]
			AnyPlayer[Key] = deepCopy(p1)
			
			if AnyPlayerEntry ~= AnyPlayer[Key] then
				saveStore()
			end
		end
	end,
	loadForAnyPlayer = function(p1) --[[ Line: 179 ]]
		-- upvalues: anyPlayerSelector (copy), Flag (ref), loadStore (copy), T (ref), deepCopy (copy)
		if not Flag then
			loadStore()
		end
		if Flag then
			local AnyPlayer = nil
			if anyPlayerSelector then
				local T1 = T
				AnyPlayer = (if T1 and T1.AnyPlayer then T1.AnyPlayer else T1) or T
			else
				AnyPlayer = T
			end
			if AnyPlayer then
				return (deepCopy(AnyPlayer[p1]))
			end
		end
		return nil
	end,
	clearCache = function() --[[ Line: 183 ]]
		-- upvalues: Flag (ref), T (ref)
		Flag = false
		T = nil
	end,
	getValue = function(p1) --[[ Line: 138 ]]
		-- upvalues: localPlayerSelector (copy), Flag (ref), loadStore (copy), T (ref), Text (copy), deepCopy (copy)
		if not Flag then
			loadStore()
		end
		if Flag then
			local LocalPlayerEntry = nil
			if localPlayerSelector then
				local T1 = T
				LocalPlayerEntry = (if T1 and T1.LocalPlayer and T1.LocalPlayer[Text] then T1.LocalPlayer[Text] else T1) or T
			else
				LocalPlayerEntry = T
			end
			if LocalPlayerEntry then
				return (deepCopy(LocalPlayerEntry[p1]))
			end
		end
		return nil
	end,
	getUniversesExposedTo = function(p1) --[[ Line: 143 ]]
		-- upvalues: localPlayerSelector (copy), Flag (ref), loadStore (copy), T (ref), Text (copy), deepCopy (copy)
		local v1 = nil
		if not Flag then
			loadStore()
		end
		repeat
			if Flag then
				local LocalPlayerEntry = nil
				if localPlayerSelector then
					local T1 = T
					LocalPlayerEntry = (if T1 and T1.LocalPlayer and T1.LocalPlayer[Text] then T1.LocalPlayer[Text] else T1) or T
				else
					LocalPlayerEntry = T
				end
				if LocalPlayerEntry then
					v1 = deepCopy(LocalPlayerEntry[p1])
					break
				end
			end
			v1 = nil
		until true
		return if v1 then v1 else {}
	end,
	getNumUniversesExposedTo = function(p1): number --[[ Line: 160 ]]
		-- upvalues: localPlayerSelector (copy), Flag (ref), loadStore (copy), T (ref), Text (copy), deepCopy (copy)
		local v1 = nil
		if not Flag then
			loadStore()
		end
		repeat
			if Flag then
				local LocalPlayerEntry = nil
				if localPlayerSelector then
					local T1 = T
					LocalPlayerEntry = (if T1 and T1.LocalPlayer and T1.LocalPlayer[Text] then T1.LocalPlayer[Text] else T1) or T
				else
					LocalPlayerEntry = T
				end
				if LocalPlayerEntry then
					v1 = deepCopy(LocalPlayerEntry[p1])
					break
				end
			end
			v1 = nil
		until true
		return #(if v1 then v1 else {})
	end,
	addUniverseToExposureList = function(Key, Value) --[[ Line: 151 ]]
		-- upvalues: localPlayerSelector (copy), Flag (ref), loadStore (copy), T (ref), Text (copy), deepCopy (copy), ConstantsModule (copy), saveStore (copy)
		local v1 = nil
		if not Flag then
			loadStore()
		end
		repeat
			if Flag then
				local LocalPlayerEntry = nil
				if localPlayerSelector then
					local T1 = T
					LocalPlayerEntry = (if T1 and T1.LocalPlayer and T1.LocalPlayer[Text] then T1.LocalPlayer[Text] else T1) or T
				else
					LocalPlayerEntry = T
				end
				if LocalPlayerEntry then
					v1 = deepCopy(LocalPlayerEntry[Key])
					break
				end
			end
			v1 = nil
		until true
		local T2 = if v1 then v1 else {}
		
		if not table.find(T2, Value) and #T2 < ConstantsModule.MAX_NUM_UNIVERSES_SHOWN then
			table.insert(T2, Value)
			
			if not Flag then
				loadStore()
			end
			if Flag then
				local LocalPlayerEntry = nil
				if localPlayerSelector then
					local T3 = T
					LocalPlayerEntry = (if T3 and T3.LocalPlayer and T3.LocalPlayer[Text] then T3.LocalPlayer[Text] else T3) or T
				else
					LocalPlayerEntry = T
				end
				local LocalPlayerEntry1 = LocalPlayerEntry[Key]
				LocalPlayerEntry[Key] = deepCopy(T2)
				
				if LocalPlayerEntry1 ~= LocalPlayerEntry[Key] then
					saveStore()
				end
			end
		end
	end
}