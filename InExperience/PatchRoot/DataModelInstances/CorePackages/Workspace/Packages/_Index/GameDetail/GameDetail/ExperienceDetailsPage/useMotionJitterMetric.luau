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

local function _(p0, p1) --[[ line: 32 | named "readPositionY" ]]
	return p0[p1].Y
end

local function logMotionJitter(p2, p3, p4) --[[ line: 36 ]]
	-- upvalues: logger (ref), telemetryService (ref), t (ref)
	logger:info("[useMotionJitterMetric] Logging motion jitter")
	
	if p4 == "settled" then
		telemetryService:LogStat(t, {
			standardizedFields = { "addOSInfo" },
			customFields = { surface = p3 }
		}, p2.jitterPx * 100 / p2.travelPx)
		
		return
	end
	logger:warning("[useMotionJitterMetric] Should only log motion jitter for reason: settled")
end

return function(p5, p6, p7, p8) --[[ line: 52 | named "useMotionJitterMetric" ]]
	-- upvalues: reactModule (ref), experienceDetailsMotionJitterHundredthsPercent (ref), logger (ref), logMotionJitter (ref), runService (ref)
	reactModule.useEffect(function() --[[ line: 58 ]]
		-- upvalues: experienceDetailsMotionJitterHundredthsPercent (copy), logger (copy), logMotionJitter (copy), p6 (ref), runService (copy), p5 (ref), p8 (ref), p7 (ref)
		if experienceDetailsMotionJitterHundredthsPercent <= 0 then
			return
		end
		local var6 = nil
		local var7 = nil
		
		local function _(p9) --[[ line: 66 | named "flushMotion" ]]
			-- upvalues: logger (copy), var7 (write), logMotionJitter (copy), p6 (copy)
			logger:info("[useMotionJitterMetric] Flushing motion metric for reason: " .. p9)
			
			if var7 then
				logMotionJitter(var7, p6, p9)
				var7 = nil
			end
		end
		
		local renderSteppedConnection = nil
		renderSteppedConnection = runService.RenderStepped:Connect(function() --[[ line: 75 ]]
			-- upvalues: p5 (copy), logger (copy), var7 (write), p6 (copy), var6 (write), p8 (copy), logMotionJitter (copy), renderSteppedConnection (write), p7 (copy)
			local current = p5.current
			
			if current then
				local y = current[p8].Y
				
				if var6 == nil then
					if y >= 0 then
						var6 = y
					end
					return
				else
					local var9 = y - var6
					var6 = y
					
					if math.abs(var9) <= 0.5 then
						if var7 then
							var7.settledFrames += 1
							
							if var7.settledFrames >= 6 then
								logger:info("[useMotionJitterMetric] Flushing motion metric for reason: settled")
								
								if var7 then
									logMotionJitter(var7, p6, "settled")
									var7 = nil
								end
								if renderSteppedConnection then
									renderSteppedConnection:Disconnect()
								end
							end
						end
						return
					else
						var7 = var7 or { jitterPx = 0, travelPx = 0, settledFrames = 0 }
						local var10 = var7
						var10.travelPx += math.abs(var9)
						var10.settledFrames = 0
						
						if var9 * (if p7 then 1 else -1) < -0.5 then
							var10.jitterPx += math.abs(var9)
						end
						return
					end
				end
			else
				logger:info("[useMotionJitterMetric] Flushing motion metric for reason: missingContent")
				
				if var7 then
					local _ = p6
					logger:info("[useMotionJitterMetric] Logging motion jitter")
					logger:warning("[useMotionJitterMetric] Should only log motion jitter for reason: settled")
					var7 = nil
				end
				var6 = nil
			end
		end)
		
		return function() --[[ line: 122 ]]
			-- upvalues: logger (copy), var7 (write), p6 (copy), renderSteppedConnection (write)
			logger:info("[useMotionJitterMetric] Flushing motion metric for reason: unmount")
			
			if var7 then
				local _ = p6
				logger:info("[useMotionJitterMetric] Logging motion jitter")
				logger:warning("[useMotionJitterMetric] Should only log motion jitter for reason: settled")
				var7 = nil
			end
			if renderSteppedConnection then
				renderSteppedConnection:Disconnect()
			end
		end
	end, { p5, p6, p7, p8 })
end