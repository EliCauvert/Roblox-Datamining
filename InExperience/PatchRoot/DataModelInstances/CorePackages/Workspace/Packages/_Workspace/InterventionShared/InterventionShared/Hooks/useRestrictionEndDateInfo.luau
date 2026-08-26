local parent = script:FindFirstAncestor("InterventionShared").Parent
local localizationService = game:GetService("LocalizationService")
local runService = game:GetService("RunService")
local reactModule = require(parent.React)
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local useState = reactModule.useState
local dependencyArray = require(parent.RoactUtils).Hooks.dependencyArray
local var1 = require(parent.RobloxAppLocales).Localization.new(localizationService.RobloxLocaleId)

local function formatCountdown(p1)
	-- upvalues: var1 (ref), localizationService (ref)
	if p1 <= 0 then
		return nil
	end
	local var2 = math.ceil(p1 / 60) * 60
	
	if var2 < 86400 then
		return var1:Format("Feature.InExperienceIntervention.Label.TimeLeft.Hours", {
			time = DateTime.fromUnixTimestamp(var2):FormatUniversalTime("HH:mm", localizationService.RobloxLocaleId)
		})
	end
	local ceiled = math.ceil(var2 / 86400)
	
	return if ceiled == 1 then var1:Format("Feature.InExperienceIntervention.Label.TimeLeft.Day.Singular") else var1:Format("Feature.InExperienceIntervention.Label.TimeLeft.Day.Plural", { number = ceiled })
end

return function(p1)
	-- upvalues: useMemo (ref), localizationService (ref), dependencyArray (ref), useState (ref), formatCountdown (ref), useEffect (ref), runService (ref)
	local var2 = if p1 and p1 ~= "" then DateTime.fromIsoDate(p1) else nil
	local var3 = useMemo(function()
		-- upvalues: var2 (ref), localizationService (copy)
		return if var2 then var2:FormatLocalTime("LLL", localizationService.RobloxLocaleId) else nil
	end, dependencyArray(var2))
	local var4, var5 = useState(function()
		-- upvalues: var2 (ref), formatCountdown (copy)
		return if var2 == nil then nil else formatCountdown(math.max(var2.UnixTimestamp - DateTime.now().UnixTimestamp, 0))
	end)
	useEffect(function()
		-- upvalues: var2 (ref), var5 (ref), formatCountdown (copy), runService (copy)
		if var2 == nil then
			var5(nil)
			
			return
		end
		local var6 = var2.UnixTimestamp - DateTime.now().UnixTimestamp
		
		if var6 <= 0 then
			var5(nil)
			
			return
		end
		var5(formatCountdown(var6))
		local var7 = 0
		local heartbeatConnection = nil
		heartbeatConnection = runService.Heartbeat:Connect(function()
			-- upvalues: var7 (write), var2 (copy), var5 (copy), formatCountdown (copy), heartbeatConnection (write)
			local processTime = os.clock()
			
			if processTime - var7 < 1 then return end
			var7 = processTime
			local maxValue = math.max(var2.UnixTimestamp - DateTime.now().UnixTimestamp, 0)
			var5(formatCountdown(maxValue))
			
			if maxValue <= 0 and heartbeatConnection then
				heartbeatConnection:Disconnect()
				heartbeatConnection = nil
			end
		end)
		
		return function()
			-- upvalues: heartbeatConnection (write)
			if heartbeatConnection then
				heartbeatConnection:Disconnect()
				heartbeatConnection = nil
			end
		end
	end, dependencyArray(var2, var5))
	
	return { formattedEndDate = var3, countdownText = var4 }
end