local localizationService = game:GetService("LocalizationService")
local runService = game:GetService("RunService")
local reactModule = require(script:FindFirstAncestor("InterventionShared").Parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref), localizationService (ref), runService (ref)
	local var1, var2 = reactModule.useBinding(p2 or "")
	local var3 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), localizationService (copy), var2 (ref), p2 (ref)
		if p1 == nil then
			var2(p2 or "")
			
			return 0
		end
		local _ = nil
		local maxValue = math.max(p1 - DateTime.now().UnixTimestamp, 0)
		var2(if maxValue >= 3600 then DateTime.fromUnixTimestamp(maxValue):FormatUniversalTime("h:mm:ss", localizationService.RobloxLocaleId) else DateTime.fromUnixTimestamp(maxValue):FormatUniversalTime("m:ss", localizationService.RobloxLocaleId))
		
		return maxValue
	end, { p2, p1 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		var3()
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), runService (copy), var3 (ref)
		local heartbeatConnection = nil
		
		if p1 ~= nil then
			local var4 = p1 - DateTime.now().UnixTimestamp
			
			if var4 > 0 then
				local var5 = 0
				heartbeatConnection = runService.Heartbeat:Connect(function()
					-- upvalues: var5 (write), var4 (write), var3 (copy), heartbeatConnection (write)
					local processTime = os.clock()
					
					if processTime - var5 < 1 then return end
					var5 = processTime
					var4 = var3()
					
					if var4 <= 0 and heartbeatConnection then
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
	end, { p1, var3 })
	
	return var1
end