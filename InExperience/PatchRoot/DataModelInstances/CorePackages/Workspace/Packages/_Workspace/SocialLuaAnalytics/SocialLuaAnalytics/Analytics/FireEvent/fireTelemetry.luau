local socialLuaAnalytics = script:FindFirstAncestor("SocialLuaAnalytics")
local parent = socialLuaAnalytics.Parent
local cryoModule = require(parent.Cryo)
local dashModule = require(parent.Dash)
local supportedTelemetryBackendsModule = require(socialLuaAnalytics.Analytics.Enums.SupportedTelemetryBackends)
local _ = require(socialLuaAnalytics.Analytics.Enums.Contexts)
local _ = require(script.Parent.Parent.Types)
local var1 = nil

local function _()
	-- upvalues: var1 (write)
	if var1 == nil then
		var1 = game:GetService("TelemetryService")
	end
	return var1
end

local _ = function(p1, p2)
	-- upvalues: cryoModule (ref), dashModule (ref)
	return function(p3, p4, p5, p6)
		-- upvalues: p1 (ref), cryoModule (copy), p2 (ref), dashModule (copy)
		if p1 then
			local _ = nil
			local var2 = cryoModule.Dictionary.join(p3, (if type(p4) == "string" or type(p4) == "number" then { value = p4 } else p4) or {}, p5 or {})
			
			if p6 then
				var2.ctx = p6
			end
			var2.telemetryPipeline = p2
			p1:info(dashModule.pretty(var2))
		end
	end
end

return function(p1)
	-- upvalues: cryoModule (ref), dashModule (ref), var1 (write), supportedTelemetryBackendsModule (ref)
	return function(p2, p3, p4, p5)
		-- upvalues: p1 (ref), cryoModule (copy), dashModule (copy), var1 (copy), supportedTelemetryBackendsModule (copy)
		local var2
		local defaults = p1.eventList.defaults
		local var3 = p1.eventList[p2]
		local var4 = p1.shouldUseTelemetryService == true
		local var5 = if var4 then "TelemetryService" else "LoggingProtocol"
		local loggerImpl = p1.loggerImpl
		
		local var6 = function(p6, p7, p8, p9)
			-- upvalues: loggerImpl (ref), cryoModule (copy), var5 (ref), dashModule (copy)
			if loggerImpl then
				local _ = nil
				local var7 = cryoModule.Dictionary.join(p6, (if type(p7) == "string" or type(p7) == "number" then { value = p7 } else p7) or {}, p8 or {})
				
				if p9 then
					var7.ctx = p9
				end
				var7.telemetryPipeline = var5
				loggerImpl:info(dashModule.pretty(var7))
			end
		end
		
		if var4 then
			var2 = p1.telemetryServiceImpl
			
			if not var2 then
				if var1 == nil then
					var1 = game:GetService("TelemetryService")
				end
				var2 = var1
			end
		else
			var2 = nil
		end
		for i, v in var3.backendsList do
			local incrementValue = v.incrementValue or 1
			local t = {
				eventName = if v.overrideName then v.overrideName(p3) else p2,
				backends = { v.type },
				throttlingPercentage = math.clamp(v.throttlingThousandths or (var3.throttlingThousandths or defaults.throttlingThousandths), 0, 10000),
				lastUpdated = var3.lastUpdated,
				description = var3.description,
				links = var3.links or defaults.links
			}
			local t_1 = {}
			
			if p1.getInfoForAllEvents then
				t_1 = cryoModule.Dictionary.join(t_1, p1.getInfoForAllEvents())
			end
			if v.format then
				assert(v.dynamicCustomFields == nil, "Cannot use dynamicCustomFields with format")
				assert(v.staticCustomFields == nil, "Cannot use staticCustomFields with format")
				t_1 = v.format(p3, p4 or {})
			elseif v.dynamicCustomFields and p3 then
				for i_1, v_1 in v.dynamicCustomFields do
					if p3[i_1] then
						t_1[i_1] = v_1(p3[i_1])
					end
				end
			end
			if v.staticCustomFields then
				t_1 = cryoModule.Dictionary.join(t_1, v.staticCustomFields)
			end
			if v.type == supportedTelemetryBackendsModule.Points then
				p1.telemetryImpl:logRobloxTelemetryEvent(t, v.standardizedFields, t_1)
				var6(t, v.standardizedFields, t_1)
			elseif v.type == supportedTelemetryBackendsModule.RobloxTelemetryStat then
				if p3 and p3.statValue then
					if var4 then
						var2:LogStat(t, {
							standardizedFields = v.standardizedFields,
							customFields = t_1
						}, p3.statValue)
					else
						p1.telemetryImpl:logRobloxTelemetryStat(t, p3.statValue, t_1)
					end
					var6(t, p3.statValue, t_1)
				end
				t.backends = { supportedTelemetryBackendsModule.RobloxTelemetryCounter }
				t.eventName = p2 .. "MissingStatValue"
				
				if var4 then
					var2:LogCounter(t, {
						standardizedFields = v.standardizedFields,
						customFields = t_1
					}, incrementValue)
				else
					p1.telemetryImpl:logRobloxTelemetryCounter(t, incrementValue, t_1)
				end
				var6(t, incrementValue, t_1)
				
				return
			elseif v.type == supportedTelemetryBackendsModule.RobloxTelemetryCounter then
				if var4 then
					var2:LogCounter(t, {
						standardizedFields = v.standardizedFields,
						customFields = t_1
					}, incrementValue)
				else
					p1.telemetryImpl:logRobloxTelemetryCounter(t, incrementValue, t_1)
				end
				var6(t, incrementValue, t_1)
			elseif v.type == supportedTelemetryBackendsModule.EventIngest then
				if var4 then
					var2:LogEvent(t, {
						eventContext = p5 or t_1.eventContext,
						standardizedFields = v.standardizedFields,
						customFields = t_1
					})
				else
					p1.telemetryImpl:logRobloxTelemetryEvent(t, v.standardizedFields, t_1, p5 or t_1.eventContext)
				end
				var6(t, p3, t_1, p5 or t_1.eventContext)
			end
		end
	end
end