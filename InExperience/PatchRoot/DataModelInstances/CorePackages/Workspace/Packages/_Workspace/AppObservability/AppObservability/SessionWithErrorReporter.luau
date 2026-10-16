local TelemetryService = game:GetService("TelemetryService")
local SessionWithErrorReporterModule = {}
SessionWithErrorReporterModule.__index = SessionWithErrorReporterModule

function SessionWithErrorReporterModule.new(_eventConfig, p1) --[[ Line: 43 ]]
	-- upvalues: SessionWithErrorReporterModule (copy)
	local self = setmetatable({
		_eventConfig = _eventConfig,
		_lastReportedTimestampBySeverity = {},
		_reportingInterval = p1 or 300,
		_lastReportedEventBySeverity = {}
	}, SessionWithErrorReporterModule)
	self._lastReportedTimestampBySeverity.NO_SEVERITY = nil
	self._lastReportedEventBySeverity.NO_SEVERITY = nil
	
	return self
end

function SessionWithErrorReporterModule:getCurrentTimeStamp(): number --[[ Line: 67 ]]
	return os.time()
end

function SessionWithErrorReporterModule:reportEvent(Count, CustomFields, Tag_severity) --[[ Line: 80 ]]
	-- upvalues: TelemetryService (copy)
	local Flag = false
	local CurrentTimeStamp = self:getCurrentTimeStamp()
	local Tag_severity1 = Tag_severity or "NO_SEVERITY"
	local LastReportedTimestampBySeverityEntry = self._lastReportedTimestampBySeverity[Tag_severity1]
	
	if LastReportedTimestampBySeverityEntry == nil or self._reportingInterval <= CurrentTimeStamp - LastReportedTimestampBySeverityEntry then
		Flag = true
	end
	if Flag then
		if Tag_severity ~= nil then
			if CustomFields == nil then
				CustomFields = { tag_severity = Tag_severity }
			elseif type(CustomFields) == "table" then
				CustomFields.tag_severity = Tag_severity
			end
		end
		TelemetryService:LogCounter(self._eventConfig, { customFields = CustomFields }, Count or 1)
		self._lastReportedTimestampBySeverity[Tag_severity1] = CurrentTimeStamp
		self._lastReportedEventBySeverity[Tag_severity1] = { count = Count, customFields = CustomFields }
	end
end

return SessionWithErrorReporterModule