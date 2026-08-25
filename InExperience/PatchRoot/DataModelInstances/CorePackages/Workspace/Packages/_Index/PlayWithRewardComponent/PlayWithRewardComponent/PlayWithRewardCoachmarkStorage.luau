local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("PlayWithRewardComponent").Parent
local tModule = require(parent.t)
local fFlagPlayWithRewardCoachmarkOverlayFix = require(parent.SharedFlags).FFlagPlayWithRewardCoachmarkOverlayFix
local playWithRewardCoachmarkWindowResets = game:DefineFastFlag("PlayWithRewardCoachmarkWindowResets", false)
local playWithRewardCoachmarkMaxImpressions = game:DefineFastInt("PlayWithRewardCoachmarkMaxImpressions", 3)
local playWithRewardCoachmarkMaxImpressions2 = game:DefineFastInt("PlayWithRewardCoachmarkMaxImpressions2", 3)
local playWithRewardCoachmarkStorageKeyEngineFeature = game:GetEngineFeature("PlayWithRewardCoachmarkStorageKey")
local var7 = game:DefineFastInt("PlayWithRewardCoachmarkWindowDays", 30) * 86400
local var8 = tModule.interface({
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

local _ = function(p0)
	-- upvalues: var8 (ref)
	return if var8(p0) then p0 else {
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

local _ = function(p2, p3)
	-- upvalues: readStateLookup (ref), var8 (ref), writeStateLookup (ref)
	local var11 = readStateLookup()
	
	if var11 == nil then
		return false
	end
	local var12 = tostring(p2)
	local var13 = var11[var12]
	local var14 = p3(if not var8(var13) then {
		windowStartTime = 0,
		impressionCount = 0,
		isDismissed = false
	} else var13)
	
	if var14 == nil then
		return false
	end
	var11[var12] = var14
	
	return writeStateLookup(var11)
end

local _ = function(p4, p5)
	-- upvalues: var7 (ref)
	return p4.windowStartTime > 0 and var7 <= p5 - p4.windowStartTime
end

return {
	consumeImpressionIfEligible = function(p6)
		-- upvalues: fFlagPlayWithRewardCoachmarkOverlayFix (ref), playWithRewardCoachmarkMaxImpressions2 (ref), playWithRewardCoachmarkMaxImpressions (ref), playWithRewardCoachmarkStorageKeyEngineFeature (ref), var7 (ref), playWithRewardCoachmarkWindowResets (ref), readStateLookup (ref), var8 (ref), writeStateLookup (ref)
		local var15 = if fFlagPlayWithRewardCoachmarkOverlayFix then playWithRewardCoachmarkMaxImpressions2 else playWithRewardCoachmarkMaxImpressions
		
		if not playWithRewardCoachmarkStorageKeyEngineFeature or var15 <= 0 or var7 <= 0 then
			return false
		end
		local timestamp = os.time()
		local t = {
			impressionCount = 1,
			isDismissed = false,
			windowStartTime = timestamp
		}
		
		local _ = function(p7)
			-- upvalues: t (ref), timestamp (ref), var7 (copy), playWithRewardCoachmarkWindowResets (copy), var15 (ref)
			if p7.windowStartTime == 0 then
				return t
			elseif p7.windowStartTime > 0 and var7 <= timestamp - p7.windowStartTime then
				return if playWithRewardCoachmarkWindowResets then t else nil
			elseif p7.isDismissed or var15 <= p7.impressionCount then
				return nil
			end
			p7.impressionCount += 1
			
			return p7
		end
		
		local var18 = readStateLookup()
		
		if var18 == nil then
			return false
		end
		local var22
		local var19 = tostring(p6)
		local var20 = var18[var19]
		local var21 = if not var8(var20) then {
			windowStartTime = 0,
			impressionCount = 0,
			isDismissed = false
		} else var20
		
		if var21.windowStartTime == 0 then
			var22 = t
		elseif var21.windowStartTime > 0 and var7 <= timestamp - var21.windowStartTime then
			var22 = if playWithRewardCoachmarkWindowResets then t else nil
		elseif var21.isDismissed or var15 <= var21.impressionCount then
			var22 = nil
		else
			var21.impressionCount += 1
			var22 = var21
		end
		if var22 == nil then
			return false
		end
		var18[var19] = var22
		
		return writeStateLookup(var18)
	end,
	dismissCurrentWindow = function(p8)
		-- upvalues: readStateLookup (ref), var8 (ref), writeStateLookup (ref)
		local _ = function(p9)
			if p9.windowStartTime == 0 or p9.isDismissed then
				return nil
			end
			p9.isDismissed = true
			
			return p9
		end
		
		local var23 = readStateLookup()
		
		if var23 == nil then return end
		local var27
		local var24 = tostring(p8)
		local var25 = var23[var24]
		local var26 = if not var8(var25) then {
			windowStartTime = 0,
			impressionCount = 0,
			isDismissed = false
		} else var25
		
		if var26.windowStartTime == 0 or var26.isDismissed then
			var27 = nil
		else
			var26.isDismissed = true
			var27 = var26
		end
		if var27 == nil then
			return
		end
		var23[var24] = var27
		var26 = writeStateLookup(var23)
	end
}