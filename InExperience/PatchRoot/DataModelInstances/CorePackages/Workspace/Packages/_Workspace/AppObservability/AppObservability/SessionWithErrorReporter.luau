local telemetryService = game:GetService("TelemetryService")
local t = {}
t.__index = t

function t.new(p0, p1)
	-- upvalues: t (ref)
	local tbl = setmetatable({
		_eventConfig = p0,
		_lastReportedTimestampBySeverity = {},
		_reportingInterval = p1 or 300,
		_lastReportedEventBySeverity = {}
	}, t)
	tbl._lastReportedTimestampBySeverity.NO_SEVERITY = nil
	tbl._lastReportedEventBySeverity.NO_SEVERITY = nil
	
	return tbl
end

function t.getCurrentTimeStamp(_)
	return os.time()
end

function t:reportEvent(p2, p3, p4)
	-- upvalues: telemetryService (ref)
	local var3 = false
	local currentTimeStamp = self:getCurrentTimeStamp()
	p4 = p4 or "NO_SEVERITY"
	local var6 = self._lastReportedTimestampBySeverity[p4]
	
	if var6 == nil or self._reportingInterval <= currentTimeStamp - var6 then
		var3 = true
	end
	if var3 then
		if p4 ~= nil then
			if p3 == nil then
				p3 = { tag_severity = p4 }
			elseif type(p3) == "table" then
				p3.tag_severity = p4
			end
		end
		telemetryService:LogCounter(self._eventConfig, { customFields = p3 }, p2 or 1)
		self._lastReportedTimestampBySeverity[p4] = currentTimeStamp
		self._lastReportedEventBySeverity[p4] = { count = p2, customFields = p3 }
	end
end

return t