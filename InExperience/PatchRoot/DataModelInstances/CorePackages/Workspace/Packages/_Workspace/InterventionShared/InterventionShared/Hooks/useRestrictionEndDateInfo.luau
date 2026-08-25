local parent = script:FindFirstAncestor("InterventionShared").Parent
local localizationService = game:GetService("LocalizationService")
local runService = game:GetService("RunService")
local reactModule = require(parent.React)
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local useState = reactModule.useState
local dependencyArray = require(parent.RoactUtils).Hooks.dependencyArray
local var3 = require(parent.RobloxAppLocales).Localization.new(localizationService.RobloxLocaleId)

local function formatCountdown(p0)
	-- upvalues: var3 (ref), localizationService (ref)
	if p0 <= 0 then
		return nil
	end
	local var5 = math.ceil(p0 / 60) * 60
	
	if var5 < 86400 then
		return var3:Format("Feature.InExperienceIntervention.Label.TimeLeft.Hours", {
			time = DateTime.fromUnixTimestamp(var5):FormatUniversalTime("HH:mm", localizationService.RobloxLocaleId)
		})
	end
	local ceiled = math.ceil(var5 / 86400)
	
	return if ceiled == 1 then var3:Format("Feature.InExperienceIntervention.Label.TimeLeft.Day.Singular") else var3:Format("Feature.InExperienceIntervention.Label.TimeLeft.Day.Plural", { number = ceiled })
end

return function(p1)
	-- upvalues: useMemo (ref), localizationService (ref), dependencyArray (ref), useState (ref), formatCountdown (ref), useEffect (ref), runService (ref)
	local var7 = if p1 and p1 ~= "" then DateTime.fromIsoDate(p1) else nil
	local var8 = useMemo(function()
		-- upvalues: var7 (ref), localizationService (copy)
		return if var7 then var7:FormatLocalTime("LLL", localizationService.RobloxLocaleId) else nil
	end, dependencyArray(var7))
	local var9, var10 = useState(function()
		-- upvalues: var7 (ref), formatCountdown (copy)
		return if var7 == nil then nil else formatCountdown(math.max(var7.UnixTimestamp - DateTime.now().UnixTimestamp, 0))
	end)
	useEffect(function()
		-- upvalues: var7 (ref), var10 (ref), formatCountdown (copy), runService (copy)
		if var7 == nil then
			var10(nil)
			
			return
		end
		local var11 = var7.UnixTimestamp - DateTime.now().UnixTimestamp
		
		if var11 <= 0 then
			var10(nil)
			
			return
		end
		var10(formatCountdown(var11))
		local var12 = 0
		local heartbeatConnection = nil
		heartbeatConnection = runService.Heartbeat:Connect(function()
			-- upvalues: var12 (write), var7 (copy), var10 (copy), formatCountdown (copy), heartbeatConnection (write)
			local processTime = os.clock()
			
			if processTime - var12 < 1 then return end
			var12 = processTime
			local maxValue = math.max(var7.UnixTimestamp - DateTime.now().UnixTimestamp, 0)
			var10(formatCountdown(maxValue))
			
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
	end, dependencyArray(var7, var10))
	
	return { formattedEndDate = var8, countdownText = var9 }
end