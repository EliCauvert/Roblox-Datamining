local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("PlayWithRewardComponent").Parent
local tModule = require(parent.t)
local fFlagPlayWithRewardCoachmarkOverlayFix = require(parent.SharedFlags).FFlagPlayWithRewardCoachmarkOverlayFix
local playWithRewardCoachmarkWindowResets = game:DefineFastFlag("PlayWithRewardCoachmarkWindowResets", false)
local playWithRewardCoachmarkMaxImpressions = game:DefineFastInt("PlayWithRewardCoachmarkMaxImpressions", 3)
local playWithRewardCoachmarkMaxImpressions2 = game:DefineFastInt("PlayWithRewardCoachmarkMaxImpressions2", 3)
local playWithRewardCoachmarkStorageKeyEngineFeature = game:GetEngineFeature("PlayWithRewardCoachmarkStorageKey")
local var1 = game:DefineFastInt("PlayWithRewardCoachmarkWindowDays", 30) * 86400
local var2 = tModule.interface({
	windowStartTime = tModule.number,
	impressionCount = tModule.number,
	isDismissed = tModule.boolean
})

local function _()
	return {
		windowStartTime = 0,
		impressionCount = 0,
		isDismissed = false
	}
end

local _ = function(p1)
	-- upvalues: var2 (ref)
	return if var2(p1) then p1 else {
		windowStartTime = 0,
		impressionCount = 0,
		isDismissed = false
	}
end

local function readStateLookup()
	-- upvalues: playWithRewardCoachmarkStorageKeyEngineFeature (ref), appStorageService (ref), httpService (ref)
	if not playWithRewardCoachmarkStorageKeyEngineFeature then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: appStorageService (copy)
		return appStorageService:GetItem("PlayWithRewardCoachmark")
	end)
	
	if not ok or type(status) ~= "string" then
		return nil
	elseif status == "" then
		return {}
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 and type(status_1) == "table" then status_1 else {}
end

local function writeStateLookup(p1)
	-- upvalues: httpService (ref), appStorageService (ref)
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p1 (ref)
		return httpService:JSONEncode(p1)
	end)
	
	return if ok and type(status) == "string" then pcall(function()
		-- upvalues: appStorageService (copy), status (ref)
		appStorageService:SetItem("PlayWithRewardCoachmark", status)
		appStorageService:Flush()
	end) else false
end

local _ = function(p1, p2)
	-- upvalues: readStateLookup (ref), var2 (ref), writeStateLookup (ref)
	local var3 = readStateLookup()
	
	if var3 == nil then
		return false
	end
	local var4 = tostring(p1)
	local var5 = var3[var4]
	local var6 = p2(if not var2(var5) then {
		windowStartTime = 0,
		impressionCount = 0,
		isDismissed = false
	} else var5)
	
	if var6 == nil then
		return false
	end
	var3[var4] = var6
	
	return writeStateLookup(var3)
end

local _ = function(p1, p2)
	-- upvalues: var1 (ref)
	return p1.windowStartTime > 0 and var1 <= p2 - p1.windowStartTime
end

return {
	consumeImpressionIfEligible = function(p1)
		-- upvalues: fFlagPlayWithRewardCoachmarkOverlayFix (ref), playWithRewardCoachmarkMaxImpressions2 (ref), playWithRewardCoachmarkMaxImpressions (ref), playWithRewardCoachmarkStorageKeyEngineFeature (ref), var1 (ref), playWithRewardCoachmarkWindowResets (ref), readStateLookup (ref), var2 (ref), writeStateLookup (ref)
		local var3 = if fFlagPlayWithRewardCoachmarkOverlayFix then playWithRewardCoachmarkMaxImpressions2 else playWithRewardCoachmarkMaxImpressions
		
		if not playWithRewardCoachmarkStorageKeyEngineFeature or var3 <= 0 or var1 <= 0 then
			return false
		end
		local timestamp = os.time()
		local t = {
			impressionCount = 1,
			isDismissed = false,
			windowStartTime = timestamp
		}
		
		local _ = function(p2)
			-- upvalues: t (ref), timestamp (ref), var1 (copy), playWithRewardCoachmarkWindowResets (copy), var3 (ref)
			if p2.windowStartTime == 0 then
				return t
			elseif p2.windowStartTime > 0 and var1 <= timestamp - p2.windowStartTime then
				return if playWithRewardCoachmarkWindowResets then t else nil
			elseif p2.isDismissed or var3 <= p2.impressionCount then
				return nil
			end
			p2.impressionCount += 1
			
			return p2
		end
		
		local var4 = readStateLookup()
		
		if var4 == nil then
			return false
		end
		local var5
		local var6 = tostring(p1)
		local var7 = var4[var6]
		local var8 = if not var2(var7) then {
			windowStartTime = 0,
			impressionCount = 0,
			isDismissed = false
		} else var7
		
		if var8.windowStartTime == 0 then
			var5 = t
		elseif var8.windowStartTime > 0 and var1 <= timestamp - var8.windowStartTime then
			var5 = if playWithRewardCoachmarkWindowResets then t else nil
		elseif var8.isDismissed or var3 <= var8.impressionCount then
			var5 = nil
		else
			var8.impressionCount += 1
			var5 = var8
		end
		if var5 == nil then
			return false
		end
		var4[var6] = var5
		
		return writeStateLookup(var4)
	end,
	dismissCurrentWindow = function(p1)
		-- upvalues: readStateLookup (ref), var2 (ref), writeStateLookup (ref)
		local _ = function(p2)
			if p2.windowStartTime == 0 or p2.isDismissed then
				return nil
			end
			p2.isDismissed = true
			
			return p2
		end
		
		local var3 = readStateLookup()
		
		if var3 == nil then return end
		local var4
		local var5 = tostring(p1)
		local var6 = var3[var5]
		local var7 = if not var2(var6) then {
			windowStartTime = 0,
			impressionCount = 0,
			isDismissed = false
		} else var6
		
		if var7.windowStartTime == 0 or var7.isDismissed then
			var4 = nil
		else
			var7.isDismissed = true
			var4 = var7
		end
		if var4 == nil then
			return
		end
		var3[var5] = var4
		var7 = writeStateLookup(var3)
	end
}