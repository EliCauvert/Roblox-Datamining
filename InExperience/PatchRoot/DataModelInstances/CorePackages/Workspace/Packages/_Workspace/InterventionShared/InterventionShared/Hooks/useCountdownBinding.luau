local localizationService = game:GetService("LocalizationService")
local runService = game:GetService("RunService")
local reactModule = require(script:FindFirstAncestor("InterventionShared").Parent.React)

return function(p0, p1)
	-- upvalues: reactModule (ref), localizationService (ref), runService (ref)
	local var3, var4 = reactModule.useBinding(p1 or "")
	local var5 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), localizationService (copy), var4 (ref), p1 (ref)
		if p0 == nil then
			var4(p1 or "")
			
			return 0
		end
		local _ = nil
		local maxValue = math.max(p0 - DateTime.now().UnixTimestamp, 0)
		var4(if maxValue >= 3600 then DateTime.fromUnixTimestamp(maxValue):FormatUniversalTime("h:mm:ss", localizationService.RobloxLocaleId) else DateTime.fromUnixTimestamp(maxValue):FormatUniversalTime("m:ss", localizationService.RobloxLocaleId))
		
		return maxValue
	end, { p1, p0 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref)
		var5()
	end, { var5 })
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), runService (copy), var5 (ref)
		local heartbeatConnection = nil
		
		if p0 ~= nil then
			local var8 = p0 - DateTime.now().UnixTimestamp
			
			if var8 > 0 then
				local var9 = 0
				heartbeatConnection = runService.Heartbeat:Connect(function()
					-- upvalues: var9 (write), var8 (write), var5 (copy), heartbeatConnection (write)
					local processTime = os.clock()
					
					if processTime - var9 < 1 then return end
					var9 = processTime
					var8 = var5()
					
					if var8 <= 0 and heartbeatConnection then
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
	end, { p0, var5 })
	
	return var3
end