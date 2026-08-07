local socialLuaAnalytics = script:FindFirstAncestor("SocialLuaAnalytics")
local parent = socialLuaAnalytics.Parent
local cryoModule = require(parent.Cryo)
local dashModule = require(parent.Dash)
local supportedTelemetryBackendsModule = require(socialLuaAnalytics.Analytics.Enums.SupportedTelemetryBackends)
local _ = require(socialLuaAnalytics.Analytics.Enums.Contexts)
local _ = require(script.Parent.Parent.Types)
local var4 = nil

local function _() --[[ line: 14 | named "getDefaultTelemetryService" ]]
	-- upvalues: var4 (write)
	if var4 == nil then
		var4 = game:GetService("TelemetryService")
	end
	return var4
end

local _ = function(p0, p1) --[[ line: 21 ]]
	-- upvalues: cryoModule (ref), dashModule (ref)
	return function(p2, p3, p4, p5) --[[ line: 22 ]]
		-- upvalues: p0 (ref), cryoModule (copy), p1 (ref), dashModule (copy)
		if p0 then
			local _ = nil
			local var5 = cryoModule.Dictionary.join(p2, (if type(p3) == "string" or type(p3) == "number" then { value = p3 } else p3) or {}, p4 or {})
			
			if p5 then
				var5.ctx = p5
			end
			var5.telemetryPipeline = p1
			p0:info(dashModule.pretty(var5))
		end
	end
end

return function(p6) --[[ line: 43 ]]
	-- upvalues: cryoModule (ref), dashModule (ref), var4 (write), supportedTelemetryBackendsModule (ref)
	return function(p7, p8, p9, p10) --[[ line: 65 ]]
		-- upvalues: p6 (ref), cryoModule (copy), dashModule (copy), var4 (copy), supportedTelemetryBackendsModule (copy)
		local var10
		local defaults = p6.eventList.defaults
		local var6 = p6.eventList[p7]
		local var7 = p6.shouldUseTelemetryService == true
		local var8 = if var7 then "TelemetryService" else "LoggingProtocol"
		local loggerImpl = p6.loggerImpl
		
		local var9 = function(p11, p12, p13, p14) --[[ line: 22 ]]
			-- upvalues: loggerImpl (ref), cryoModule (copy), var8 (ref), dashModule (copy)
			if loggerImpl then
				local _ = nil
				local var5 = cryoModule.Dictionary.join(p11, (if type(p12) == "string" or type(p12) == "number" then { value = p12 } else p12) or {}, p13 or {})
				
				if p14 then
					var5.ctx = p14
				end
				var5.telemetryPipeline = var8
				loggerImpl:info(dashModule.pretty(var5))
			end
		end
		
		if var7 then
			var10 = p6.telemetryServiceImpl
			
			if not var10 then
				if var4 == nil then
					var4 = game:GetService("TelemetryService")
				end
				var10 = var4
			end
		else
			var10 = nil
		end
		for i, v in var6.backendsList do
			local incrementValue = v.incrementValue or 1
			local t = {
				eventName = if v.overrideName then v.overrideName(p8) else p7,
				backends = { v.type },
				throttlingPercentage = math.clamp(v.throttlingThousandths or (var6.throttlingThousandths or defaults.throttlingThousandths), 0, 10000),
				lastUpdated = var6.lastUpdated,
				description = var6.description,
				links = var6.links or defaults.links
			}
			local t_1 = {}
			
			if p6.getInfoForAllEvents then
				t_1 = cryoModule.Dictionary.join(t_1, p6.getInfoForAllEvents())
			end
			if v.format then
				assert(v.dynamicCustomFields == nil, "Cannot use dynamicCustomFields with format")
				assert(v.staticCustomFields == nil, "Cannot use staticCustomFields with format")
				t_1 = v.format(p8, p9 or {})
			elseif v.dynamicCustomFields and p8 then
				for i_1, v_1 in v.dynamicCustomFields do
					if p8[i_1] then
						t_1[i_1] = v_1(p8[i_1])
					end
				end
			end
			if v.staticCustomFields then
				t_1 = cryoModule.Dictionary.join(t_1, v.staticCustomFields)
			end
			if v.type == supportedTelemetryBackendsModule.Points then
				p6.telemetryImpl:logRobloxTelemetryEvent(t, v.standardizedFields, t_1)
				var9(t, v.standardizedFields, t_1)
			elseif v.type == supportedTelemetryBackendsModule.RobloxTelemetryStat then
				if p8 and p8.statValue then
					if var7 then
						var10:LogStat(t, {
							standardizedFields = v.standardizedFields,
							customFields = t_1
						}, p8.statValue)
					else
						p6.telemetryImpl:logRobloxTelemetryStat(t, p8.statValue, t_1)
					end
					var9(t, p8.statValue, t_1)
				end
				t.backends = { supportedTelemetryBackendsModule.RobloxTelemetryCounter }
				t.eventName = p7 .. "MissingStatValue"
				
				if var7 then
					var10:LogCounter(t, {
						standardizedFields = v.standardizedFields,
						customFields = t_1
					}, incrementValue)
				else
					p6.telemetryImpl:logRobloxTelemetryCounter(t, incrementValue, t_1)
				end
				var9(t, incrementValue, t_1)
				
				return
			elseif v.type == supportedTelemetryBackendsModule.RobloxTelemetryCounter then
				if var7 then
					var10:LogCounter(t, {
						standardizedFields = v.standardizedFields,
						customFields = t_1
					}, incrementValue)
				else
					p6.telemetryImpl:logRobloxTelemetryCounter(t, incrementValue, t_1)
				end
				var9(t, incrementValue, t_1)
			elseif v.type == supportedTelemetryBackendsModule.EventIngest then
				if var7 then
					var10:LogEvent(t, {
						eventContext = p10 or t_1.eventContext,
						standardizedFields = v.standardizedFields,
						customFields = t_1
					})
				else
					p6.telemetryImpl:logRobloxTelemetryEvent(t, v.standardizedFields, t_1, p10 or t_1.eventContext)
				end
				var9(t, p8, t_1, p10 or t_1.eventContext)
			end
		end
	end
end