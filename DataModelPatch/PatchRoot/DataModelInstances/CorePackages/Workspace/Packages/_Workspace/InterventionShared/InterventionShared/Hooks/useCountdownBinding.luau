local LocalizationService = game:GetService("LocalizationService")
local RunService = game:GetService("RunService")
local ReactModule = require(script:FindFirstAncestor("InterventionShared").Parent.React)

return function(p1, p2)
	-- upvalues: ReactModule (copy), LocalizationService (copy), RunService (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(p2 or "")
	local UseResult = ReactModule.useCallback(function(): number
		-- upvalues: p1 (copy), LocalizationService (upval), UseBindingResult2 (copy), p2 (copy)
		if p1 == nil then
			UseBindingResult2(p2 or "")
			
			return 0
		else
			local Largest = math.max(p1 - DateTime.now().UnixTimestamp, 0)
			UseBindingResult2(if Largest >= 3600 then DateTime.fromUnixTimestamp(Largest):FormatUniversalTime("h:mm:ss", LocalizationService.RobloxLocaleId) else DateTime.fromUnixTimestamp(Largest):FormatUniversalTime("m:ss", LocalizationService.RobloxLocaleId))
			
			return Largest
		end
	end, { p2, p1 })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), RunService (upval), UseResult (copy)
		local Connection = nil
		
		if p1 ~= nil then
			local v1 = p1 - DateTime.now().UnixTimestamp
			
			if v1 > 0 then
				local v2 = 0
				Connection = RunService.Heartbeat:Connect(function()
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
		return function()
			-- upvalues: Connection (ref)
			if Connection ~= nil then
				Connection:Disconnect()
				Connection = nil
			end
		end
	end, { p1, UseResult })
	
	return UseBindingResult
end