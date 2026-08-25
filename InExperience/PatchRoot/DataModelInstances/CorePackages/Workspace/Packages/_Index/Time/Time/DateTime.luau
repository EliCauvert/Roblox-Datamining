local localizationService = game:GetService("LocalizationService")
local timeZoneModule = require(script.Parent.TimeZone)
local t = {}

function t.new(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: t (ref)
	local t_1 = {
		dateTime = DateTime.fromUniversalTime(p0 or 1970, p1 or 1, p2 or 1, p3 or 0, p4 or 0, p5 or 0, p6 or 0)
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t.now()
	-- upvalues: t (ref)
	local t_1 = { dateTime = DateTime.now() }
	setmetatable(t_1, t)
	
	return t_1
end

function t.fromUnixTimestamp(p7)
	-- upvalues: t (ref)
	assert(type(p7) == "number", "Invalid argument #1 to fromUnixTimestamp, expected number.")
	local t_1 = { dateTime = DateTime.fromUnixTimestampMillis(p7 * 1000) }
	setmetatable(t_1, t)
	
	return t_1
end

function t.fromIsoDate(p8)
	-- upvalues: t (ref)
	assert(type(p8) == "string", "Invalid argument #1 to DateTime.fromIsoDate, expected string.")
	local t_1 = { dateTime = DateTime.fromIsoDate(p8) }
	setmetatable(t_1, t)
	
	return t_1
end

function t:Format(p9, p10, p11)
	-- upvalues: timeZoneModule (ref), localizationService (ref)
	assert(type(p9) == "string", "Invalid argument #1 to Format, expected string.")
	p10 = p10 or timeZoneModule.Current
	p11 = p11 or localizationService.RobloxLocaleId
	
	if p10 == timeZoneModule.UTC then
		return self.dateTime:FormatUniversalTime(p9, p11)
	elseif p10 == timeZoneModule.Current then
		return self.dateTime:FormatLocalTime(p9, p11)
	end
	error(("Invalid TimeZone \"%s\""):format(tostring(p10)), 2)
end

function t:GetValues(p12)
	-- upvalues: timeZoneModule (ref)
	p12 = p12 or timeZoneModule.Current
	
	if p12 == timeZoneModule.UTC then
		return self.dateTime:ToUniversalTime()
	elseif p12 == timeZoneModule.Current then
		return self.dateTime:ToLocalTime()
	end
	error(("Invalid TimeZone \"%s\""):format(tostring(p12)), 2)
end

function t:GetUnixTimestamp()
	return if self.dateTime:ToUniversalTime().Millisecond > 0 then self.dateTime.UnixTimestamp + self.dateTime.UnixTimestampMillis % 1000 / 1000 else self.dateTime.UnixTimestamp
end

function t:GetIsoDate()
	return self.dateTime:ToIsoDate()
end

function t:GetLongRelativeTime(_, p13, p14)
	return self:Format("lll", p13, p14)
end

function t:GetShortRelativeTime(_, p15, p16)
	-- upvalues: timeZoneModule (ref)
	return self:Format("ll", p15 or timeZoneModule.Current, p16)
end

t.__index = t

return t