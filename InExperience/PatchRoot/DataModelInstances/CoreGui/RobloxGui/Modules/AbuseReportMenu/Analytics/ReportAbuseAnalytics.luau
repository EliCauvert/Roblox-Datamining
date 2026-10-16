local SessionService = game:GetService("SessionService")
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local ReportAbuseAnalyticsModule = {}
ReportAbuseAnalyticsModule.__index = ReportAbuseAnalyticsModule
ReportAbuseAnalyticsModule.MenuContexts = {
	LegacyMenu = game:DefineFastString("ReportAnalyticsLegacyMenuContext", "ReportAbuseLegacyMenu"),
	LegacySentPage = game:DefineFastString("ReportAnalyticsLegacySentPageContext", "ReportAbuseLegacySentPage"),
	NewMenu = game:DefineFastString("ReportAnalyticsNewMenuContext", "ReportAbuseNewMenu")
}
ReportAbuseAnalyticsModule.DiagCounters = {
	SuccessfulSubmissionTime = game:DefineFastString("ReportAnalyticsSuccessfulSubmissionTimeStat", "SuccessfulSubmissionTime"),
	AbandonedSubmissionTime = game:DefineFastString("ReportAnalyticsAbandonedSubmissionTimeStat", "AbandonedSubmissionTime"),
	SubmittedMethodOfAbuse = game:DefineFastString("ReportAnalyticsSubmittedMethodOfAbuseStat", "SubmittedMethodOfAbuse")
}
ReportAbuseAnalyticsModule.ActionNames = {
	FieldChanged = game:DefineFastString("ReportAnalyticsFieldChanged", "FieldChanged"),
	FormSubmitted = game:DefineFastString("ReportAnalyticsFormSubmitted", "FormSubmitted"),
	FormAbandoned = game:DefineFastString("ReportAnalyticsFormAbandoned", "FormAbandoned"),
	ButtonActivated = game:DefineFastString("ReportAnalyticsButtonActivated", "ButtonActivated"),
	InGameAbuseReport = game:DefineFastString("ReportAnalyticsInGameAbuseReport", "InGameAbuseReport")
}
ReportAbuseAnalyticsModule.SessionConstants = {
	StructuralIdentifier = { Level1 = "level1", AbuseReport = "AbuseReport" },
	Metadata = {
		EntryPoint = "entryPoint",
		DeleteOnGameLeave = "_deleteOnGameLeave"
	}
}

function ReportAbuseAnalyticsModule.new(_eventStreamImpl, _diagImpl, _context) --[[ Line: 57 ]]
	-- upvalues: ReportAbuseAnalyticsModule (copy)
	assert(_context, "Base context needs to be provided to ReportAbuseAnalytics")
	local config = {
		_eventStreamImpl = _eventStreamImpl,
		_diagImpl = _diagImpl,
		_context = _context
	}
	setmetatable(config, ReportAbuseAnalyticsModule)
	
	return config
end

function ReportAbuseAnalyticsModule:reportFormSubmitted(TimeToComplete, MethodOfAbuse, p1) --[[ Line: 70 ]]
	-- upvalues: ReportAbuseAnalyticsModule (copy), CryoModule (copy)
	local Text = self._context .. "_" .. ReportAbuseAnalyticsModule.DiagCounters.SubmittedMethodOfAbuse .. "_" .. MethodOfAbuse
	local JoinResult = CryoModule.Dictionary.join(p1 or {}, {
		timeToComplete = TimeToComplete,
		methodOfAbuse = MethodOfAbuse
	})
	self._diagImpl:reportStats(self._context .. "_" .. ReportAbuseAnalyticsModule.DiagCounters.SuccessfulSubmissionTime, TimeToComplete)
	self._diagImpl:reportCounter(Text, 1)
	self._eventStreamImpl:sendEventDeferred(self._context, ReportAbuseAnalyticsModule.ActionNames.FormSubmitted, JoinResult)
end

function ReportAbuseAnalyticsModule:reportFormAbandoned(TimeToExit, p1) --[[ Line: 93 ]]
	-- upvalues: ReportAbuseAnalyticsModule (copy), CryoModule (copy)
	local JoinResult = CryoModule.Dictionary.join(p1 or {}, { timeToExit = TimeToExit })
	self._diagImpl:reportStats(self._context .. "_" .. ReportAbuseAnalyticsModule.DiagCounters.AbandonedSubmissionTime, TimeToExit)
	self._eventStreamImpl:sendEventDeferred(self._context, ReportAbuseAnalyticsModule.ActionNames.FormAbandoned, JoinResult)
end

function ReportAbuseAnalyticsModule:reportAnalyticsFieldChanged(p1) --[[ Line: 108 ]]
	-- upvalues: ReportAbuseAnalyticsModule (copy)
	self._eventStreamImpl:sendEventDeferred(self._context, ReportAbuseAnalyticsModule.ActionNames.FieldChanged, p1 or {})
end

function ReportAbuseAnalyticsModule:reportButtonClick(p1) --[[ Line: 116 ]]
	-- upvalues: ReportAbuseAnalyticsModule (copy)
	self._eventStreamImpl:sendEventDeferred(self._context, ReportAbuseAnalyticsModule.ActionNames.ButtonActivated, p1 or {})
end

function ReportAbuseAnalyticsModule:reportInGameAbuseReportInteraction(p1) --[[ Line: 129 ]]
	-- upvalues: ReportAbuseAnalyticsModule (copy)
	local AbandonedSubmissionTime = ReportAbuseAnalyticsModule.DiagCounters.AbandonedSubmissionTime
	
	if p1.interactionType == 1 then
		AbandonedSubmissionTime = ReportAbuseAnalyticsModule.DiagCounters.SuccessfulSubmissionTime
		self._diagImpl:reportCounter(self._context .. "_" .. ReportAbuseAnalyticsModule.DiagCounters.SubmittedMethodOfAbuse .. "_" .. p1.inferredTypeofabuseSelection, 1)
	end
	self._diagImpl:reportStats(self._context .. "_" .. AbandonedSubmissionTime, p1.timeSpentMs)
	self._eventStreamImpl:sendEventDeferred(self._context, ReportAbuseAnalyticsModule.ActionNames.InGameAbuseReport, p1)
end

function ReportAbuseAnalyticsModule:reportEventAndIncrement(Text, p1) --[[ Line: 150 ]]
	self._diagImpl:reportCounter(self._context .. "_" .. Text, 1)
	self._eventStreamImpl:sendEventDeferred(self._context, Text, p1 or {})
end

function ReportAbuseAnalyticsModule:startAbuseReportSession(Value) --[[ Line: 156 ]]
	-- upvalues: SessionService (copy), ReportAbuseAnalyticsModule (copy)
	if not SessionService:SessionExists(ReportAbuseAnalyticsModule.SessionConstants.StructuralIdentifier.AbuseReport) then
		SessionService:SetSession(ReportAbuseAnalyticsModule.SessionConstants.StructuralIdentifier.Level1, ReportAbuseAnalyticsModule.SessionConstants.StructuralIdentifier.AbuseReport, ReportAbuseAnalyticsModule.SessionConstants.StructuralIdentifier.AbuseReport)
	end
	if not SessionService:GetMetadata(ReportAbuseAnalyticsModule.SessionConstants.StructuralIdentifier.AbuseReport, ReportAbuseAnalyticsModule.SessionConstants.Metadata.EntryPoint) then
		SessionService:SetMetadata(ReportAbuseAnalyticsModule.SessionConstants.StructuralIdentifier.AbuseReport, ReportAbuseAnalyticsModule.SessionConstants.Metadata.EntryPoint, Value)
	end
	SessionService:SetMetadata(ReportAbuseAnalyticsModule.SessionConstants.StructuralIdentifier.AbuseReport, ReportAbuseAnalyticsModule.SessionConstants.Metadata.DeleteOnGameLeave, "True")
end

function ReportAbuseAnalyticsModule:getAbuseReportSessionEntryPoint() --[[ Line: 188 ]]
	-- upvalues: SessionService (copy), ReportAbuseAnalyticsModule (copy)
	return if SessionService:SessionExists(ReportAbuseAnalyticsModule.SessionConstants.StructuralIdentifier.AbuseReport) then SessionService:GetMetadata(ReportAbuseAnalyticsModule.SessionConstants.StructuralIdentifier.AbuseReport, ReportAbuseAnalyticsModule.SessionConstants.Metadata.EntryPoint) else ""
end

function ReportAbuseAnalyticsModule:endAbuseReportSession() --[[ Line: 202 ]]
	-- upvalues: SessionService (copy), ReportAbuseAnalyticsModule (copy)
	if SessionService:SessionExists(ReportAbuseAnalyticsModule.SessionConstants.StructuralIdentifier.AbuseReport) then
		SessionService:RemoveSession(ReportAbuseAnalyticsModule.SessionConstants.StructuralIdentifier.AbuseReport)
	end
end

return ReportAbuseAnalyticsModule