local parent = script:FindFirstAncestor("InterventionShared").Parent
local localizationService = game:GetService("LocalizationService")
local runService = game:GetService("RunService")
local localization = require(parent.RobloxAppLocales).Localization
local reactModule = require(parent.React)
local fFlagAppChatReactiveFeatureRestrictions = require(parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local var1 = if fFlagAppChatReactiveFeatureRestrictions then localization.new(localizationService.RobloxLocaleId) else nil

return function(p1, p2)
	-- upvalues: reactModule (ref), fFlagAppChatReactiveFeatureRestrictions (ref), var1 (ref), localizationService (ref), runService (ref)
	local var2, var3 = reactModule.useBinding(p2 or "")
	local var4 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), fFlagAppChatReactiveFeatureRestrictions (copy), var1 (copy), localizationService (copy), var3 (ref), p2 (ref)
		if p1 == nil then
			var3(p2 or "")
			
			return 0
		end
		local var5
		local _ = nil
		local maxValue = math.max(p1 - DateTime.now().UnixTimestamp, 0)
		
		if fFlagAppChatReactiveFeatureRestrictions and var1 ~= nil and maxValue >= 86400 then
			local ceiled = math.ceil(maxValue / 86400)
			var5 = if ceiled == 1 then var1:Format("Feature.InExperienceIntervention.Label.TimeLeft.Day.Singular") else var1:Format("Feature.InExperienceIntervention.Label.TimeLeft.Day.Plural", { number = ceiled })
		else
			var5 = if maxValue >= 3600 then DateTime.fromUnixTimestamp(maxValue):FormatUniversalTime(if fFlagAppChatReactiveFeatureRestrictions then "HH:mm:ss" else "h:mm:ss", localizationService.RobloxLocaleId) else DateTime.fromUnixTimestamp(maxValue):FormatUniversalTime("m:ss", localizationService.RobloxLocaleId)
		end
		var3(var5)
		
		return maxValue
	end, { p2, p1 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref)
		var4()
	end, { var4 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), runService (copy), var4 (ref)
		local heartbeatConnection = nil
		
		if p1 ~= nil then
			local var5 = p1 - DateTime.now().UnixTimestamp
			
			if var5 > 0 then
				local var6 = 0
				heartbeatConnection = runService.Heartbeat:Connect(function()
					-- upvalues: var6 (write), var5 (write), var4 (copy), heartbeatConnection (write)
					local processTime = os.clock()
					
					if processTime - var6 < 1 then return end
					var6 = processTime
					var5 = var4()
					
					if var5 <= 0 and heartbeatConnection then
						heartbeatConnection:Disconnect()
						heartbeatConnection = nil
					end
				end)
			end
		end
		return function()
			-- upvalues: heartbeatConnection (write)
			if heartbeatConnection ~= nil then
				heartbeatConnection:Disconnect()
				heartbeatConnection = nil
			end
		end
	end, { p1, var4 })
	
	return var2
end