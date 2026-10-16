local LocalizationService = game:GetService("LocalizationService")
local TimeZoneModule = require(script.Parent.TimeZone)
local DateTimeModule = {}

function DateTimeModule.new(p1, p2, p3, p4, p5, p6, p7) --[[ Line: 27 ]]
	-- upvalues: DateTimeModule (copy)
	local config = {
		dateTime = DateTime.fromUniversalTime(p1 or 1970, p2 or 1, p3 or 1, p4 or 0, p5 or 0, p6 or 0, p7 or 0)
	}
	setmetatable(config, DateTimeModule)
	
	return config
end

function DateTimeModule.now() --[[ Line: 45 ]]
	-- upvalues: DateTimeModule (copy)
	local config = { dateTime = DateTime.now() }
	setmetatable(config, DateTimeModule)
	
	return config
end

function DateTimeModule.fromUnixTimestamp(p1: number) --[[ Line: 58 ]]
	-- upvalues: DateTimeModule (copy)
	assert(type(p1) == "number", "Invalid argument #1 to fromUnixTimestamp, expected number.")
	local config = { dateTime = DateTime.fromUnixTimestampMillis(p1 * 1000) }
	setmetatable(config, DateTimeModule)
	
	return config
end

function DateTimeModule.fromIsoDate(p1) --[[ Line: 74 ]]
	-- upvalues: DateTimeModule (copy)
	assert(type(p1) == "string", "Invalid argument #1 to DateTime.fromIsoDate, expected string.")
	local config = { dateTime = DateTime.fromIsoDate(p1) }
	setmetatable(config, DateTimeModule)
	
	return config
end

function DateTimeModule:Format(p1, p2, p3) --[[ Line: 91 ]]
	-- upvalues: TimeZoneModule (copy), LocalizationService (copy)
	assert(type(p1) == "string", "Invalid argument #1 to Format, expected string.")
	local P11 = p2 or TimeZoneModule.Current
	local P12 = p3 or LocalizationService.RobloxLocaleId
	
	if P11 == TimeZoneModule.UTC then
		return self.dateTime:FormatUniversalTime(p1, P12)
	elseif P11 == TimeZoneModule.Current then
		return self.dateTime:FormatLocalTime(p1, P12)
	else
		error(("Invalid TimeZone \"%s\""):format((tostring(P11))), 2)
	end
end

function DateTimeModule:GetValues(p1) --[[ Line: 114 ]]
	-- upvalues: TimeZoneModule (copy)
	local P14 = p1 or TimeZoneModule.Current
	
	if P14 == TimeZoneModule.UTC then
		return self.dateTime:ToUniversalTime()
	elseif P14 == TimeZoneModule.Current then
		return self.dateTime:ToLocalTime()
	else
		error(("Invalid TimeZone \"%s\""):format((tostring(P14))), 2)
	end
end

function DateTimeModule.GetUnixTimestamp(p1) --[[ Line: 129 ]]
	return if p1.dateTime:ToUniversalTime().Millisecond > 0 then p1.dateTime.UnixTimestamp + p1.dateTime.UnixTimestampMillis % 1000 / 1000 else p1.dateTime.UnixTimestamp
end

function DateTimeModule:GetIsoDate() --[[ Line: 143 ]]
	return self.dateTime:ToIsoDate()
end

function DateTimeModule:GetLongRelativeTime(_, p1, p2) --[[ Line: 151 ]]
	return self:Format("lll", p1, p2)
end

function DateTimeModule:GetShortRelativeTime(_, p1, p2) --[[ Line: 160 ]]
	-- upvalues: TimeZoneModule (copy)
	return self:Format("ll", p1 or TimeZoneModule.Current, p2)
end

DateTimeModule.__index = DateTimeModule

return DateTimeModule