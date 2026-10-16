local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("PlayWithRewardComponent").Parent
local TModule = require(Parent.t)
local FFlagPlayWithRewardCoachmarkOverlayFix = require(Parent.SharedFlags).FFlagPlayWithRewardCoachmarkOverlayFix
local PlayWithRewardCoachmarkWindowResets = game:DefineFastFlag("PlayWithRewardCoachmarkWindowResets", false)
local PlayWithRewardCoachmarkMaxImpressions = game:DefineFastInt("PlayWithRewardCoachmarkMaxImpressions", 3)
local PlayWithRewardCoachmarkMaxImpressions2 = game:DefineFastInt("PlayWithRewardCoachmarkMaxImpressions2", 3)
local PlayWithRewardCoachmarkStorageKeyEngineFeature = game:GetEngineFeature("PlayWithRewardCoachmarkStorageKey")
local ScaledPlayWithRewardCoachmarkWindowDays = game:DefineFastInt("PlayWithRewardCoachmarkWindowDays", 30) * 86400
local InterfaceResult = TModule.interface({
	windowStartTime = TModule.number,
	impressionCount = TModule.number,
	isDismissed = TModule.boolean
})

local function _() --[[ Line: 49 | Named "getDefaultState" ]]
	return {
		windowStartTime = 0,
		impressionCount = 0,
		isDismissed = false
	}
end

local _ = function(p1) --[[ Line: 57 | Named "parseState" ]]
	-- upvalues: InterfaceResult (copy)
	return if InterfaceResult(p1) then p1 else {
		windowStartTime = 0,
		impressionCount = 0,
		isDismissed = false
	}
end

local function readStateLookup() --[[ Line: 66 ]]
	-- upvalues: PlayWithRewardCoachmarkStorageKeyEngineFeature (copy), AppStorageService (copy), HttpService (copy)
	if not PlayWithRewardCoachmarkStorageKeyEngineFeature then
		return nil
	end
	local Success, Result = pcall(function() --[[ Line: 71 ]]
		-- upvalues: AppStorageService (upval)
		return AppStorageService:GetItem("PlayWithRewardCoachmark")
	end)
	
	if not Success or type(Result) ~= "string" then
		return nil
	elseif Result == "" then
		return {}
	else
		local Success1, Result1 = pcall(function() --[[ Line: 82 ]]
			-- upvalues: HttpService (upval), Result (copy)
			return HttpService:JSONDecode(Result)
		end)
		
		return if Success1 and type(Result1) == "table" then Result1 else {}
	end
end

local function writeStateLookup(Input) --[[ Line: 92 ]]
	-- upvalues: HttpService (copy), AppStorageService (copy)
	local Success, Result = pcall(function() --[[ Line: 93 ]]
		-- upvalues: HttpService (upval), Input (copy)
		return HttpService:JSONEncode(Input)
	end)
	
	return if Success and type(Result) == "string" then pcall(function() --[[ Line: 100 ]]
		-- upvalues: AppStorageService (upval), Result (copy)
		AppStorageService:SetItem("PlayWithRewardCoachmark", Result)
		AppStorageService:Flush()
	end) else false
end

local _ = function(p1, Callback) --[[ Line: 107 | Named "mutateStateLookup" ]]
	-- upvalues: readStateLookup (copy), InterfaceResult (copy), writeStateLookup (copy)
	local StateLookup = readStateLookup()
	
	if StateLookup == nil then
		return false
	end
	local Text = tostring(p1)
	local State = StateLookup[Text]
	local CallbackResult = Callback(if InterfaceResult(State) then State else {
		windowStartTime = 0,
		impressionCount = 0,
		isDismissed = false
	})
	
	if CallbackResult == nil then
		return false
	else
		StateLookup[Text] = CallbackResult
		
		return (writeStateLookup(StateLookup))
	end
end

local _ = function(p1, p2): boolean --[[ Line: 126 | Named "hasWindowExpired" ]]
	-- upvalues: ScaledPlayWithRewardCoachmarkWindowDays (copy)
	return p1.windowStartTime > 0 and ScaledPlayWithRewardCoachmarkWindowDays <= p2 - p1.windowStartTime
end

return {
	consumeImpressionIfEligible = function(p1) --[[ Line: 132 ]]
		-- upvalues: FFlagPlayWithRewardCoachmarkOverlayFix (copy), PlayWithRewardCoachmarkMaxImpressions2 (copy), PlayWithRewardCoachmarkMaxImpressions (copy), PlayWithRewardCoachmarkStorageKeyEngineFeature (copy), ScaledPlayWithRewardCoachmarkWindowDays (copy), PlayWithRewardCoachmarkWindowResets (copy), readStateLookup (copy), InterfaceResult (copy), writeStateLookup (copy)
		local PlayWithRewardCoachmarkMaxImpressions1 = if FFlagPlayWithRewardCoachmarkOverlayFix then PlayWithRewardCoachmarkMaxImpressions2 else PlayWithRewardCoachmarkMaxImpressions
		
		if not PlayWithRewardCoachmarkStorageKeyEngineFeature or PlayWithRewardCoachmarkMaxImpressions1 <= 0 or ScaledPlayWithRewardCoachmarkWindowDays <= 0 then
			return false
		end
		local Timestamp = os.time()
		local config = {
			impressionCount = 1,
			isDismissed = false,
			windowStartTime = Timestamp
		}
		
		local function _(DefaultState) --[[ Line: 148 ]]
			-- upvalues: config (copy), Timestamp (copy), ScaledPlayWithRewardCoachmarkWindowDays (upval), PlayWithRewardCoachmarkWindowResets (upval), PlayWithRewardCoachmarkMaxImpressions1 (copy)
			if DefaultState.windowStartTime == 0 then
				return config
			elseif DefaultState.windowStartTime > 0 and Timestamp - DefaultState.windowStartTime >= ScaledPlayWithRewardCoachmarkWindowDays then
				return if PlayWithRewardCoachmarkWindowResets then config else nil
			elseif DefaultState.isDismissed or PlayWithRewardCoachmarkMaxImpressions1 <= DefaultState.impressionCount then
				return nil
			else
				DefaultState.impressionCount += 1
				
				return DefaultState
			end
		end
		
		local StateLookup = readStateLookup()
		
		if StateLookup == nil then
			return false
		end
		local Text = tostring(p1)
		local State = StateLookup[Text]
		local State1 = if InterfaceResult(State) then State else {
			windowStartTime = 0,
			impressionCount = 0,
			isDismissed = false
		}
		local config1 = nil
		
		if State1.windowStartTime == 0 then
			config1 = config
		elseif State1.windowStartTime > 0 and Timestamp - State1.windowStartTime >= ScaledPlayWithRewardCoachmarkWindowDays then
			config1 = if PlayWithRewardCoachmarkWindowResets then config else nil
		elseif State1.isDismissed or PlayWithRewardCoachmarkMaxImpressions1 <= State1.impressionCount then
			config1 = nil
		else
			State1.impressionCount += 1
			config1 = State1
		end
		if config1 == nil then
			return false
		else
			StateLookup[Text] = config1
			
			return (writeStateLookup(StateLookup))
		end
	end,
	dismissCurrentWindow = function(p1) --[[ Line: 166 ]]
		-- upvalues: readStateLookup (copy), InterfaceResult (copy), writeStateLookup (copy)
		local function _(DefaultState) --[[ Line: 167 ]]
			if DefaultState.windowStartTime == 0 or DefaultState.isDismissed then
				return nil
			else
				DefaultState.isDismissed = true
				
				return DefaultState
			end
		end
		
		local StateLookup = readStateLookup()
		
		if StateLookup == nil then return end
		local Text = tostring(p1)
		local State = StateLookup[Text]
		local State1 = if InterfaceResult(State) then State else {
			windowStartTime = 0,
			impressionCount = 0,
			isDismissed = false
		}
		local v1 = nil
		
		if State1.windowStartTime == 0 or State1.isDismissed then
			v1 = nil
		else
			State1.isDismissed = true
			v1 = State1
		end
		if v1 ~= nil then
			StateLookup[Text] = v1
			local _ = writeStateLookup(StateLookup)
			
			return
		end
	end
}