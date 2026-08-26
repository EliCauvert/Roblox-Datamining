local localizationService = game:GetService("LocalizationService")
local timeZoneModule = require(script.Parent.TimeZone)
local t = {}

function t.new(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: t (ref)
	local t_1 = {
		dateTime = DateTime.fromUniversalTime(p1 or 1970, p2 or 1, p3 or 1, p4 or 0, p5 or 0, p6 or 0, p7 or 0)
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

function t.fromUnixTimestamp(p1)
	-- upvalues: t (ref)
	assert(type(p1) == "number", "Invalid argument #1 to fromUnixTimestamp, expected number.")
	local t_1 = { dateTime = DateTime.fromUnixTimestampMillis(p1 * 1000) }
	setmetatable(t_1, t)
	
	return t_1
end

function t.fromIsoDate(p1)
	-- upvalues: t (ref)
	assert(type(p1) == "string", "Invalid argument #1 to DateTime.fromIsoDate, expected string.")
	local t_1 = { dateTime = DateTime.fromIsoDate(p1) }
	setmetatable(t_1, t)
	
	return t_1
end

function t:Format(p1, p2, p3)
	-- upvalues: timeZoneModule (ref), localizationService (ref)
	assert(type(p1) == "string", "Invalid argument #1 to Format, expected string.")
	p2 = p2 or timeZoneModule.Current
	p3 = p3 or localizationService.RobloxLocaleId
	
	if p2 == timeZoneModule.UTC then
		return self.dateTime:FormatUniversalTime(p1, p3)
	elseif p2 == timeZoneModule.Current then
		return self.dateTime:FormatLocalTime(p1, p3)
	end
	error(("Invalid TimeZone \"%s\""):format(tostring(p2)), 2)
end

function t:GetValues(p1)
	-- upvalues: timeZoneModule (ref)
	p1 = p1 or timeZoneModule.Current
	
	if p1 == timeZoneModule.UTC then
		return self.dateTime:ToUniversalTime()
	elseif p1 == timeZoneModule.Current then
		return self.dateTime:ToLocalTime()
	end
	error(("Invalid TimeZone \"%s\""):format(tostring(p1)), 2)
end

function t:GetUnixTimestamp()
	return if self.dateTime:ToUniversalTime().Millisecond > 0 then self.dateTime.UnixTimestamp + self.dateTime.UnixTimestampMillis % 1000 / 1000 else self.dateTime.UnixTimestamp
end

function t:GetIsoDate()
	return self.dateTime:ToIsoDate()
end

function t:GetLongRelativeTime(_, p1, p2)
	return self:Format("lll", p1, p2)
end

function t:GetShortRelativeTime(_, p1, p2)
	-- upvalues: timeZoneModule (ref)
	return self:Format("ll", p1 or timeZoneModule.Current, p2)
end

t.__index = t

return t