local parent = script:FindFirstAncestor("GameDetail").Parent
local runService = game:GetService("RunService")
local telemetryService = game:GetService("TelemetryService")
local reactModule = require(parent.React)
local logger = require(parent.Loggers).Logger
local experienceDetailsMotionJitterHundredthsPercent = game:DefineFastInt("ExperienceDetailsMotionJitterHundredthsPercent", 0)
local t = {
	eventName = "ExperienceDetailsMotionJitterPercent",
	description = "Reverse movement as a percentage of total experience details surface motion",
	backends = { "RobloxTelemetryStat" },
	throttlingPercentage = experienceDetailsMotionJitterHundredthsPercent,
	lastUpdated = { 2026, 6, 18 }
}

local function _(p1, p2)
	return p1[p2].Y
end

local function logMotionJitter(p1, p2, p3)
	-- upvalues: logger (ref), telemetryService (ref), t (ref)
	logger:info("[useMotionJitterMetric] Logging motion jitter")
	
	if p3 == "settled" then
		telemetryService:LogStat(t, {
			standardizedFields = { "addOSInfo" },
			customFields = { surface = p2 }
		}, p1.jitterPx * 100 / p1.travelPx)
		
		return
	end
	logger:warning("[useMotionJitterMetric] Should only log motion jitter for reason: settled")
end

return function(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), experienceDetailsMotionJitterHundredthsPercent (ref), logger (ref), logMotionJitter (ref), runService (ref)
	reactModule.useEffect(function()
		-- upvalues: experienceDetailsMotionJitterHundredthsPercent (copy), logger (copy), logMotionJitter (copy), p2 (ref), runService (copy), p1 (ref), p4 (ref), p3 (ref)
		if experienceDetailsMotionJitterHundredthsPercent <= 0 then
			return
		end
		local var1 = nil
		local var2 = nil
		
		local function _(p5)
			-- upvalues: logger (copy), var2 (write), logMotionJitter (copy), p2 (copy)
			logger:info("[useMotionJitterMetric] Flushing motion metric for reason: " .. p9)
			
			if var2 then
				logMotionJitter(var2, p2, p5)
				var2 = nil
			end
		end
		
		local renderSteppedConnection = nil
		renderSteppedConnection = runService.RenderStepped:Connect(function()
			-- upvalues: p1 (copy), logger (copy), var2 (write), p2 (copy), var1 (write), p4 (copy), logMotionJitter (copy), renderSteppedConnection (write), p3 (copy)
			local current = p1.current
			
			if current then
				local y = current[p4].Y
				
				if var1 == nil then
					if y >= 0 then
						var1 = y
					end
					return
				else
					local var3 = y - var1
					var1 = y
					
					if math.abs(var3) <= 0.5 then
						if var2 then
							var2.settledFrames += 1
							
							if var2.settledFrames >= 6 then
								logger:info("[useMotionJitterMetric] Flushing motion metric for reason: settled")
								
								if var2 then
									logMotionJitter(var2, p2, "settled")
									var2 = nil
								end
								if renderSteppedConnection then
									renderSteppedConnection:Disconnect()
								end
							end
						end
						return
					else
						var2 = var2 or { jitterPx = 0, travelPx = 0, settledFrames = 0 }
						local var4 = var2
						var4.travelPx += math.abs(var3)
						var4.settledFrames = 0
						
						if var3 * (if p3 then 1 else -1) < -0.5 then
							var4.jitterPx += math.abs(var3)
						end
						return
					end
				end
			else
				logger:info("[useMotionJitterMetric] Flushing motion metric for reason: missingContent")
				
				if var2 then
					local _ = p2
					logger:info("[useMotionJitterMetric] Logging motion jitter")
					logger:warning("[useMotionJitterMetric] Should only log motion jitter for reason: settled")
					var2 = nil
				end
				var1 = nil
			end
		end)
		
		return function()
			-- upvalues: logger (copy), var2 (write), p2 (copy), renderSteppedConnection (write)
			logger:info("[useMotionJitterMetric] Flushing motion metric for reason: unmount")
			
			if var2 then
				local _ = p2
				logger:info("[useMotionJitterMetric] Logging motion jitter")
				logger:warning("[useMotionJitterMetric] Should only log motion jitter for reason: settled")
				var2 = nil
			end
			if renderSteppedConnection then
				renderSteppedConnection:Disconnect()
			end
		end
	end, { p1, p2, p3, p4 })
end