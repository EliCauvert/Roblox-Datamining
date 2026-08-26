local telemetryService = game:GetService("TelemetryService")
local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: t (ref)
	local tbl = setmetatable({
		_eventConfig = p1,
		_lastReportedTimestampBySeverity = {},
		_reportingInterval = p2 or 300,
		_lastReportedEventBySeverity = {}
	}, t)
	tbl._lastReportedTimestampBySeverity.NO_SEVERITY = nil
	tbl._lastReportedEventBySeverity.NO_SEVERITY = nil
	
	return tbl
end

function t.getCurrentTimeStamp(_)
	return os.time()
end

function t:reportEvent(p1, p2, p3)
	-- upvalues: telemetryService (ref)
	local var1 = false
	local currentTimeStamp = self:getCurrentTimeStamp()
	p3 = p3 or "NO_SEVERITY"
	local var2 = self._lastReportedTimestampBySeverity[p3]
	
	if var2 == nil or self._reportingInterval <= currentTimeStamp - var2 then
		var1 = true
	end
	if var1 then
		if p3 ~= nil then
			if p2 == nil then
				p2 = { tag_severity = p3 }
			elseif type(p2) == "table" then
				p2.tag_severity = p3
			end
		end
		telemetryService:LogCounter(self._eventConfig, { customFields = p2 }, p1 or 1)
		self._lastReportedTimestampBySeverity[p3] = currentTimeStamp
		self._lastReportedEventBySeverity[p3] = { count = p1, customFields = p2 }
	end
end

return t