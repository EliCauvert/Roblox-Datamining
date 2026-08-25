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

function t.new(p0, p1, p2)
	-- upvalues: t (ref)
	assert(p2, "Base context needs to be provided to ReportAbuseAnalytics")
	local t_1 = { _eventStreamImpl = p0, _diagImpl = p1, _context = p2 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:reportFormSubmitted(p3, p4, p5)
	-- upvalues: t (ref), cryoModule (ref)
	local text = self._context .. "_" .. t.DiagCounters.SuccessfulSubmissionTime
	local text_1 = self._context .. "_" .. t.DiagCounters.SubmittedMethodOfAbuse .. "_" .. p4
	local var6 = cryoModule.Dictionary.join(p5 or {}, { timeToComplete = p3, methodOfAbuse = p4 })
	self._diagImpl:reportStats(text, p3)
	self._diagImpl:reportCounter(text_1, 1)
	self._eventStreamImpl:sendEventDeferred(self._context, t.ActionNames.FormSubmitted, var6)
end

function t:reportFormAbandoned(p6, p7)
	-- upvalues: t (ref), cryoModule (ref)
	local var7 = cryoModule.Dictionary.join(p7 or {}, { timeToExit = p6 })
	self._diagImpl:reportStats(self._context .. "_" .. t.DiagCounters.AbandonedSubmissionTime, p6)
	self._eventStreamImpl:sendEventDeferred(self._context, t.ActionNames.FormAbandoned, var7)
end

function t:reportAnalyticsFieldChanged(p8)
	-- upvalues: t (ref)
	self._eventStreamImpl:sendEventDeferred(self._context, t.ActionNames.FieldChanged, p8 or {})
end

function t:reportButtonClick(p9)
	-- upvalues: t (ref)
	self._eventStreamImpl:sendEventDeferred(self._context, t.ActionNames.ButtonActivated, p9 or {})
end

function t:reportInGameAbuseReportInteraction(p10)
	-- upvalues: t (ref)
	local abandonedSubmissionTime = t.DiagCounters.AbandonedSubmissionTime
	
	if p10.interactionType == 1 then
		abandonedSubmissionTime = t.DiagCounters.SuccessfulSubmissionTime
		self._diagImpl:reportCounter(self._context .. "_" .. t.DiagCounters.SubmittedMethodOfAbuse .. "_" .. p10.inferredTypeofabuseSelection, 1)
	end
	self._diagImpl:reportStats(self._context .. "_" .. abandonedSubmissionTime, p10.timeSpentMs)
	self._eventStreamImpl:sendEventDeferred(self._context, t.ActionNames.InGameAbuseReport, p10)
end

function t:reportEventAndIncrement(p11, p12)
	self._diagImpl:reportCounter(self._context .. "_" .. p11, 1)
	self._eventStreamImpl:sendEventDeferred(self._context, p11, p12 or {})
end

function t.startAbuseReportSession(_, p13)
	-- upvalues: sessionService (ref), t (ref)
	if not sessionService:SessionExists(t.SessionConstants.StructuralIdentifier.AbuseReport) then
		sessionService:SetSession(t.SessionConstants.StructuralIdentifier.Level1, t.SessionConstants.StructuralIdentifier.AbuseReport, t.SessionConstants.StructuralIdentifier.AbuseReport)
	end
	if not sessionService:GetMetadata(t.SessionConstants.StructuralIdentifier.AbuseReport, t.SessionConstants.Metadata.EntryPoint) then
		sessionService:SetMetadata(t.SessionConstants.StructuralIdentifier.AbuseReport, t.SessionConstants.Metadata.EntryPoint, p13)
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