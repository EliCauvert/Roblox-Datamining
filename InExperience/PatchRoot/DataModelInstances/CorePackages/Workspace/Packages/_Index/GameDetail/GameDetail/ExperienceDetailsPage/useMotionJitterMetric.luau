local Parent = script:FindFirstAncestor("GameDetail").Parent
local RunService = game:GetService("RunService")
local TelemetryService = game:GetService("TelemetryService")
local ReactModule = require(Parent.React)
local Logger = require(Parent.Loggers).Logger
local ExperienceDetailsMotionJitterHundredthsPercent = game:DefineFastInt("ExperienceDetailsMotionJitterHundredthsPercent", 0)
local config = {
	eventName = "ExperienceDetailsMotionJitterPercent",
	description = "Reverse movement as a percentage of total experience details surface motion",
	backends = { "RobloxTelemetryStat" },
	throttlingPercentage = ExperienceDetailsMotionJitterHundredthsPercent,
	lastUpdated = { 2026, 6, 18 }
}

local function _(p1, p2) --[[ Line: 32 | Named "readPositionY" ]]
	return p1[p2].Y
end

local function logMotionJitter(p1, Surface, p2) --[[ Line: 36 ]]
	-- upvalues: Logger (copy), TelemetryService (copy), config (copy)
	Logger:info("[useMotionJitterMetric] Logging motion jitter")
	
	if p2 == "settled" then
		TelemetryService:LogStat(config, {
			standardizedFields = { "addOSInfo" },
			customFields = { surface = Surface }
		}, p1.jitterPx * 100 / p1.travelPx)
		
		return
	else
		Logger:warning("[useMotionJitterMetric] Should only log motion jitter for reason: settled")
	end
end

return function(p1, Surface, p2, p3) --[[ Line: 52 | Named "useMotionJitterMetric" ]]
	-- upvalues: ReactModule (copy), ExperienceDetailsMotionJitterHundredthsPercent (copy), Logger (copy), logMotionJitter (copy), RunService (copy)
	ReactModule.useEffect(function() --[[ Line: 58 ]]
		-- upvalues: ExperienceDetailsMotionJitterHundredthsPercent (upval), Logger (upval), logMotionJitter (upval), Surface (copy), RunService (upval), p1 (copy), p3 (copy), p2 (copy)
		if ExperienceDetailsMotionJitterHundredthsPercent <= 0 then return end
		local v1 = nil
		local Config = nil
		
		local function _(Text) --[[ Line: 66 | Named "flushMotion" ]]
			-- upvalues: Logger (upval), Config (ref), logMotionJitter (upval), Surface (upval)
			Logger:info("[useMotionJitterMetric] Flushing motion metric for reason: " .. Text)
			
			if Config then
				logMotionJitter(Config, Surface, Text)
				Config = nil
			end
		end
		
		local Connection = nil
		Connection = RunService.RenderStepped:Connect(function() --[[ Line: 75 ]]
			-- upvalues: p1 (upval), Logger (upval), Config (ref), Surface (upval), v1 (ref), p3 (upval), logMotionJitter (upval), Connection (ref), p2 (upval)
			local Current = p1.current
			
			if Current then
				local Y: number = Current[p3].Y
				
				if v1 ~= nil then
					local Value = Y - v1
					v1 = Y
					
					if math.abs(Value) <= 0.5 then
						if Config then
							local Config1 = Config
							Config1.settledFrames += 1
							
							if Config.settledFrames >= 6 then
								Logger:info("[useMotionJitterMetric] Flushing motion metric for reason: settled")
								
								if Config then
									logMotionJitter(Config, Surface, "settled")
									Config = nil
								end
								if Connection then
									Connection:Disconnect()
								end
							end
						end
						return
					else
						if not Config then
							Config = { jitterPx = 0, travelPx = 0, settledFrames = 0 }
						end
						local Config2 = Config
						Config2.travelPx += math.abs(Value)
						Config2.settledFrames = 0
						
						if Value * (if p2 then 1 else -1) < -0.5 then
							Config2.jitterPx += math.abs(Value)
						end
						return
					end
				elseif Y >= 0 then
					v1 = Y
				end
				return
			else
				Logger:info("[useMotionJitterMetric] Flushing motion metric for reason: missingContent")
				
				if Config then
					Logger:info("[useMotionJitterMetric] Logging motion jitter")
					Logger:warning("[useMotionJitterMetric] Should only log motion jitter for reason: settled")
					Config = nil
				end
				v1 = nil
			end
		end)
		
		return function() --[[ Line: 122 ]]
			-- upvalues: Logger (upval), Config (ref), Surface (upval), Connection (ref)
			Logger:info("[useMotionJitterMetric] Flushing motion metric for reason: unmount")
			
			if Config then
				Logger:info("[useMotionJitterMetric] Logging motion jitter")
				Logger:warning("[useMotionJitterMetric] Should only log motion jitter for reason: settled")
				Config = nil
			end
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { p1, Surface, p2, p3 })
end