local Parent = script:FindFirstAncestor("InterventionShared").Parent
local LocalizationService = game:GetService("LocalizationService")
local RunService = game:GetService("RunService")
local ReactModule = require(Parent.React)
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local UseStateFunction = ReactModule.useState
local DependencyArrayFunction = require(Parent.RoactUtils).Hooks.dependencyArray
local NewResult = require(Parent.RobloxAppLocales).Localization.new(LocalizationService.RobloxLocaleId)

local function formatCountdown(Largest: number) --[[ Line: 37 ]]
	-- upvalues: NewResult (copy), LocalizationService (copy)
	if Largest <= 0 then
		return nil
	end
	local ScaledCeiled = math.ceil(Largest / 60) * 60
	
	if ScaledCeiled >= 86400 then
		local Ceiled = math.ceil(ScaledCeiled / 86400)
		
		return if Ceiled == 1 then NewResult:Format("Feature.InExperienceIntervention.Label.TimeLeft.Day.Singular") else NewResult:Format("Feature.InExperienceIntervention.Label.TimeLeft.Day.Plural", { number = Ceiled })
	else
		return NewResult:Format("Feature.InExperienceIntervention.Label.TimeLeft.Hours", {
			time = DateTime.fromUnixTimestamp(ScaledCeiled):FormatUniversalTime("HH:mm", LocalizationService.RobloxLocaleId)
		})
	end
end

return function(p1) --[[ Line: 70 | Named "useRestrictionEndDateInfo" ]]
	-- upvalues: UseMemoFunction (copy), LocalizationService (copy), DependencyArrayFunction (copy), UseStateFunction (copy), formatCountdown (copy), UseEffectFunction (copy), RunService (copy)
	local _DateTime = if p1 and p1 ~= "" then DateTime.fromIsoDate(p1) else nil
	local UseMemoResult = UseMemoFunction(function() --[[ Line: 73 ]]
		-- upvalues: _DateTime (copy), LocalizationService (upval)
		return if _DateTime then _DateTime:FormatLocalTime("LLL", LocalizationService.RobloxLocaleId) else nil
	end, DependencyArrayFunction(_DateTime))
	local UseStateResult, UseStateResult2 = UseStateFunction(function() --[[ Line: 77 ]]
		-- upvalues: _DateTime (copy), formatCountdown (upval)
		return if _DateTime == nil then nil else formatCountdown((math.max(_DateTime.UnixTimestamp - DateTime.now().UnixTimestamp, 0)))
	end)
	UseEffectFunction(function() --[[ Line: 86 ]]
		-- upvalues: _DateTime (copy), UseStateResult2 (copy), formatCountdown (upval), RunService (upval)
		if _DateTime == nil then
			UseStateResult2(nil)
			
			return
		end
		local UnixTimestampDelta = _DateTime.UnixTimestamp - DateTime.now().UnixTimestamp
		
		if UnixTimestampDelta <= 0 then
			UseStateResult2(nil)
			
			return
		end
		UseStateResult2(formatCountdown(UnixTimestampDelta))
		local v1 = 0
		local Connection = nil
		Connection = RunService.Heartbeat:Connect(function() --[[ Line: 107 ]]
			-- upvalues: v1 (ref), _DateTime (upval), UseStateResult2 (upval), formatCountdown (upval), Connection (ref)
			local ClockTime = os.clock()
			
			if ClockTime - v1 < 1 then return end
			v1 = ClockTime
			local Largest = math.max(_DateTime.UnixTimestamp - DateTime.now().UnixTimestamp, 0)
			UseStateResult2(formatCountdown(Largest))
			
			if Largest <= 0 and Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end)
		
		return function() --[[ Line: 125 ]]
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end
	end, DependencyArrayFunction(_DateTime, UseStateResult2))
	
	return {
		formattedEndDate = UseMemoResult,
		countdownText = UseStateResult
	}
end