local SocialLuaAnalytics = script:FindFirstAncestor("SocialLuaAnalytics")
local Parent = SocialLuaAnalytics.Parent
local CryoModule = require(Parent.Cryo)
local DashModule = require(Parent.Dash)
local SupportedTelemetryBackendsModule = require(SocialLuaAnalytics.Analytics.Enums.SupportedTelemetryBackends)
local _ = require(SocialLuaAnalytics.Analytics.Enums.Contexts)
local _ = require(script.Parent.Parent.Types)
local TelemetryService = nil

local function _() --[[ Line: 14 | Named "getDefaultTelemetryService" ]]
	-- upvalues: TelemetryService (ref)
	if TelemetryService == nil then
		TelemetryService = game:GetService("TelemetryService")
	end
	return TelemetryService
end

local _ = function(p1, TelemetryPipeline) --[[ Line: 21 ]]
	-- upvalues: CryoModule (copy), DashModule (copy)
	return function(p2, IncrementValue, CustomFields, Ctx) --[[ Line: 22 ]]
		-- upvalues: p1 (copy), CryoModule (upval), TelemetryPipeline (copy), DashModule (upval)
		if p1 then
			local JoinResult = CryoModule.Dictionary.join(p2, (if type(IncrementValue) == "string" or type(IncrementValue) == "number" then { value = IncrementValue } else IncrementValue) or {}, CustomFields or {})
			
			if Ctx then
				JoinResult.ctx = Ctx
			end
			JoinResult.telemetryPipeline = TelemetryPipeline
			p1:info(DashModule.pretty(JoinResult))
		end
	end
end

return function(p1) --[[ Line: 43 ]]
	-- upvalues: CryoModule (copy), DashModule (copy), TelemetryService (ref), SupportedTelemetryBackendsModule (copy)
	return function(Text, p2, p3, p4) --[[ Line: 65 ]]
		-- upvalues: p1 (copy), CryoModule (upval), DashModule (upval), TelemetryService (upval), SupportedTelemetryBackendsModule (upval)
		local Defaults = p1.eventList.defaults
		local Event = p1.eventList[Text]
		local IsShouldUseTelemetryService = p1.shouldUseTelemetryService == true
		local TelemetryService1: string = if IsShouldUseTelemetryService then "TelemetryService" else "LoggingProtocol"
		local LoggerImpl = p1.loggerImpl
		
		local function v16(p5, IncrementValue, CustomFields, Ctx) --[[ Line: 22 ]]
			-- upvalues: LoggerImpl (copy), CryoModule (upval), TelemetryService1 (copy), DashModule (upval)
			if LoggerImpl then
				local JoinResult = CryoModule.Dictionary.join(p5, (if type(IncrementValue) == "string" or type(IncrementValue) == "number" then { value = IncrementValue } else IncrementValue) or {}, CustomFields or {})
				
				if Ctx then
					JoinResult.ctx = Ctx
				end
				JoinResult.telemetryPipeline = TelemetryService1
				LoggerImpl:info(DashModule.pretty(JoinResult))
			end
		end
		local TelemetryServiceImpl = nil
		
		if IsShouldUseTelemetryService then
			TelemetryServiceImpl = p1.telemetryServiceImpl
			
			if not TelemetryServiceImpl then
				if TelemetryService == nil then
					TelemetryService = game:GetService("TelemetryService")
				end
				TelemetryServiceImpl = TelemetryService
			end
		else
			TelemetryServiceImpl = nil
		end
		local CustomFields = nil
		local IncrementValue = nil
		local config = nil
		for _, value in Event.backendsList do
			IncrementValue = value.incrementValue or 1
			config = {
				eventName = if value.overrideName then value.overrideName(p2) else Text,
				backends = { value.type },
				throttlingPercentage = math.clamp(value.throttlingThousandths or (Event.throttlingThousandths or Defaults.throttlingThousandths), 0, 10000),
				lastUpdated = Event.lastUpdated,
				description = Event.description,
				links = Event.links or Defaults.links
			}
			CustomFields = {}
			
			if p1.getInfoForAllEvents then
				CustomFields = CryoModule.Dictionary.join(CustomFields, (p1.getInfoForAllEvents()))
			end
			if value.format then
				assert(value.dynamicCustomFields == nil, "Cannot use dynamicCustomFields with format")
				assert(value.staticCustomFields == nil, "Cannot use staticCustomFields with format")
				CustomFields = value.format(p2, p3 or {})
			else
				if value.dynamicCustomFields and p2 then
					for i, dynamicCustomField in value.dynamicCustomFields do
						if p2[i] then
							CustomFields[i] = dynamicCustomField(p2[i])
						end
					end
				end
				if value.staticCustomFields then
					CustomFields = CryoModule.Dictionary.join(CustomFields, value.staticCustomFields)
				end
			end
			if value.type == SupportedTelemetryBackendsModule.Points then
				p1.telemetryImpl:logRobloxTelemetryEvent(config, value.standardizedFields, CustomFields)
				v16(config, value.standardizedFields, CustomFields)
			elseif value.type == SupportedTelemetryBackendsModule.RobloxTelemetryStat then
				if not p2 or not p2.statValue then
					config.backends = { SupportedTelemetryBackendsModule.RobloxTelemetryCounter }
					config.eventName = Text .. "MissingStatValue"
					
					if IsShouldUseTelemetryService then
						TelemetryServiceImpl:LogCounter(config, {
							standardizedFields = value.standardizedFields,
							customFields = CustomFields
						}, IncrementValue)
					else
						p1.telemetryImpl:logRobloxTelemetryCounter(config, IncrementValue, CustomFields)
					end
					v16(config, IncrementValue, CustomFields)
					break
				end
				if IsShouldUseTelemetryService then
					TelemetryServiceImpl:LogStat(config, {
						standardizedFields = value.standardizedFields,
						customFields = CustomFields
					}, p2.statValue)
				else
					p1.telemetryImpl:logRobloxTelemetryStat(config, p2.statValue, CustomFields)
				end
				v16(config, p2.statValue, CustomFields)
			elseif value.type == SupportedTelemetryBackendsModule.RobloxTelemetryCounter then
				if IsShouldUseTelemetryService then
					TelemetryServiceImpl:LogCounter(config, {
						standardizedFields = value.standardizedFields,
						customFields = CustomFields
					}, IncrementValue)
				else
					p1.telemetryImpl:logRobloxTelemetryCounter(config, IncrementValue, CustomFields)
				end
				v16(config, IncrementValue, CustomFields)
			elseif value.type == SupportedTelemetryBackendsModule.EventIngest then
				if IsShouldUseTelemetryService then
					TelemetryServiceImpl:LogEvent(config, {
						eventContext = p4 or CustomFields.eventContext,
						standardizedFields = value.standardizedFields,
						customFields = CustomFields
					})
				else
					p1.telemetryImpl:logRobloxTelemetryEvent(config, value.standardizedFields, CustomFields, p4 or CustomFields.eventContext)
				end
				v16(config, p2, CustomFields, p4 or CustomFields.eventContext)
			end
		end
	end
end