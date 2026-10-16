local Parent = script:FindFirstAncestor("InterventionShared").Parent
local LocalizationService = game:GetService("LocalizationService")
local RunService = game:GetService("RunService")
local Localization = require(Parent.RobloxAppLocales).Localization
local ReactModule = require(Parent.React)
local FFlagAppChatReactiveFeatureRestrictions = require(Parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local NewLocalization = if FFlagAppChatReactiveFeatureRestrictions then Localization.new(LocalizationService.RobloxLocaleId) else nil

return function(p1, p2) --[[ Line: 24 | Named "useCountdownBinding" ]]
	-- upvalues: ReactModule (copy), FFlagAppChatReactiveFeatureRestrictions (copy), NewLocalization (copy), LocalizationService (copy), RunService (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(p2 or "")
	local UseResult = ReactModule.useCallback(function(): number --[[ Line: 26 ]]
		-- upvalues: p1 (copy), FFlagAppChatReactiveFeatureRestrictions (upval), NewLocalization (upval), LocalizationService (upval), UseBindingResult2 (copy), p2 (copy)
		if p1 == nil then
			UseBindingResult2(p2 or "")
			
			return 0
		end
		local Largest = math.max(p1 - DateTime.now().UnixTimestamp, 0)
		local FormatUniversalTimeResult = nil
		
		if FFlagAppChatReactiveFeatureRestrictions and NewLocalization ~= nil and Largest >= 86400 then
			local Ceiled = math.ceil(Largest / 86400)
			FormatUniversalTimeResult = if Ceiled == 1 then NewLocalization:Format("Feature.InExperienceIntervention.Label.TimeLeft.Day.Singular") else NewLocalization:Format("Feature.InExperienceIntervention.Label.TimeLeft.Day.Plural", { number = Ceiled })
		else
			FormatUniversalTimeResult = if Largest >= 3600 then DateTime.fromUnixTimestamp(Largest):FormatUniversalTime(if FFlagAppChatReactiveFeatureRestrictions then "HH:mm:ss" else "h:mm:ss", LocalizationService.RobloxLocaleId) else DateTime.fromUnixTimestamp(Largest):FormatUniversalTime("m:ss", LocalizationService.RobloxLocaleId)
		end
		UseBindingResult2(FormatUniversalTimeResult)
		
		return Largest
	end, { p2, p1 })
	ReactModule.useEffect(function() --[[ Line: 63 ]]
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult })
	ReactModule.useEffect(function() --[[ Line: 68 ]]
		-- upvalues: p1 (copy), RunService (upval), UseResult (copy)
		local Connection = nil
		
		if p1 ~= nil then
			local v1 = p1 - DateTime.now().UnixTimestamp
			
			if v1 > 0 then
				local v2 = 0
				Connection = RunService.Heartbeat:Connect(function() --[[ Line: 77 ]]
					-- upvalues: v2 (ref), v1 (ref), UseResult (upval), Connection (ref)
					local ClockTime = os.clock()
					
					if ClockTime - v2 < 1 then return end
					v2 = ClockTime
					v1 = UseResult()
					
					if v1 <= 0 and Connection then
						Connection:Disconnect()
						Connection = nil
					end
				end)
			end
		end
		return function() --[[ Line: 91 ]]
			-- upvalues: Connection (ref)
			if Connection ~= nil then
				Connection:Disconnect()
				Connection = nil
			end
		end
	end, { p1, UseResult })
	
	return UseBindingResult
end