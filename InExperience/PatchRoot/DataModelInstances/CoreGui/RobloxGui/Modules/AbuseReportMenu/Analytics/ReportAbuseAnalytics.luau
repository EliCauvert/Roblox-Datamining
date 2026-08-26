local sessionService = game:GetService("SessionService")
local cryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local t = {}
t.__index = t
t.MenuContexts = {
	LegacyMenu = game:DefineFastString("ReportAnalyticsLegacyMenuContext", "ReportAbuseLegacyMenu"),
	LegacySentPage = game:DefineFastString("ReportAnalyticsLegacySentPageContext", "ReportAbuseLegacySentPage"),
	NewMenu = game:DefineFastString("ReportAnalyticsNewMenuContext", "ReportAbuseNewMenu")
}
t.DiagCounters = {
	SuccessfulSubmissionTime = game:DefineFastString("ReportAnalyticsSuccessfulSubmissionTimeStat", "SuccessfulSubmissionTime"),
	AbandonedSubmissionTime = game:DefineFastString("ReportAnalyticsAbandonedSubmissionTimeStat", "AbandonedSubmissionTime"),
	SubmittedMethodOfAbuse = game:DefineFastString("ReportAnalyticsSubmittedMethodOfAbuseStat", "SubmittedMethodOfAbuse")
}
t.ActionNames = {
	FieldChanged = game:DefineFastString("ReportAnalyticsFieldChanged", "FieldChanged"),
	FormSubmitted = game:DefineFastString("ReportAnalyticsFormSubmitted", "FormSubmitted"),
	FormAbandoned = game:DefineFastString("ReportAnalyticsFormAbandoned", "FormAbandoned"),
	ButtonActivated = game:DefineFastString("ReportAnalyticsButtonActivated", "ButtonActivated"),
	InGameAbuseReport = game:DefineFastString("ReportAnalyticsInGameAbuseReport", "InGameAbuseReport")
}
t.SessionConstants = {
	StructuralIdentifier = { Level1 = "level1", AbuseReport = "AbuseReport" },
	Metadata = {
		EntryPoint = "entryPoint",
		DeleteOnGameLeave = "_deleteOnGameLeave"
	}
}
local _ = { SUBMIT = 1, ABANDON = 2 }

function t.new(p1, p2, p3)
	-- upvalues: t (ref)
	assert(p3, "Base context needs to be provided to ReportAbuseAnalytics")
	local t_1 = { _eventStreamImpl = p1, _diagImpl = p2, _context = p3 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:reportFormSubmitted(p1, p2, p3)
	-- upvalues: t (ref), cryoModule (ref)
	local text = self._context .. "_" .. t.DiagCounters.SuccessfulSubmissionTime
	local text_1 = self._context .. "_" .. t.DiagCounters.SubmittedMethodOfAbuse .. "_" .. p4
	local var1 = cryoModule.Dictionary.join(p3 or {}, { timeToComplete = p1, methodOfAbuse = p2 })
	self._diagImpl:reportStats(text, p1)
	self._diagImpl:reportCounter(text_1, 1)
	self._eventStreamImpl:sendEventDeferred(self._context, t.ActionNames.FormSubmitted, var1)
end

function t:reportFormAbandoned(p1, p2)
	-- upvalues: t (ref), cryoModule (ref)
	local var1 = cryoModule.Dictionary.join(p2 or {}, { timeToExit = p1 })
	self._diagImpl:reportStats(self._context .. "_" .. t.DiagCounters.AbandonedSubmissionTime, p1)
	self._eventStreamImpl:sendEventDeferred(self._context, t.ActionNames.FormAbandoned, var1)
end

function t:reportAnalyticsFieldChanged(p1)
	-- upvalues: t (ref)
	self._eventStreamImpl:sendEventDeferred(self._context, t.ActionNames.FieldChanged, p1 or {})
end

function t:reportButtonClick(p1)
	-- upvalues: t (ref)
	self._eventStreamImpl:sendEventDeferred(self._context, t.ActionNames.ButtonActivated, p1 or {})
end

function t:reportInGameAbuseReportInteraction(p1)
	-- upvalues: t (ref)
	local abandonedSubmissionTime = t.DiagCounters.AbandonedSubmissionTime
	
	if p1.interactionType == 1 then
		abandonedSubmissionTime = t.DiagCounters.SuccessfulSubmissionTime
		self._diagImpl:reportCounter(self._context .. "_" .. t.DiagCounters.SubmittedMethodOfAbuse .. "_" .. p10.inferredTypeofabuseSelection, 1)
	end
	self._diagImpl:reportStats(self._context .. "_" .. abandonedSubmissionTime, p1.timeSpentMs)
	self._eventStreamImpl:sendEventDeferred(self._context, t.ActionNames.InGameAbuseReport, p1)
end

function t:reportEventAndIncrement(p1, p2)
	self._diagImpl:reportCounter(self._context .. "_" .. p11, 1)
	self._eventStreamImpl:sendEventDeferred(self._context, p1, p2 or {})
end

function t.startAbuseReportSession(_, p1)
	-- upvalues: sessionService (ref), t (ref)
	if not sessionService:SessionExists(t.SessionConstants.StructuralIdentifier.AbuseReport) then
		sessionService:SetSession(t.SessionConstants.StructuralIdentifier.Level1, t.SessionConstants.StructuralIdentifier.AbuseReport, t.SessionConstants.StructuralIdentifier.AbuseReport)
	end
	if not sessionService:GetMetadata(t.SessionConstants.StructuralIdentifier.AbuseReport, t.SessionConstants.Metadata.EntryPoint) then
		sessionService:SetMetadata(t.SessionConstants.StructuralIdentifier.AbuseReport, t.SessionConstants.Metadata.EntryPoint, p1)
	end
	sessionService:SetMetadata(t.SessionConstants.StructuralIdentifier.AbuseReport, t.SessionConstants.Metadata.DeleteOnGameLeave, "True")
end

function t.getAbuseReportSessionEntryPoint(_)
	-- upvalues: sessionService (ref), t (ref)
	return if sessionService:SessionExists(t.SessionConstants.StructuralIdentifier.AbuseReport) then sessionService:GetMetadata(t.SessionConstants.StructuralIdentifier.AbuseReport, t.SessionConstants.Metadata.EntryPoint) else ""
end

function t.endAbuseReportSession(_)
	-- upvalues: sessionService (ref), t (ref)
	if sessionService:SessionExists(t.SessionConstants.StructuralIdentifier.AbuseReport) then
		sessionService:RemoveSession(t.SessionConstants.StructuralIdentifier.AbuseReport)
	end
end

return t