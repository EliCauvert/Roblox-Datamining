local MomentsCommonModule = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon)
local FFlagMomentsCreationGalleryExitAnalytics = MomentsCommonModule.Flags.FFlagMomentsCreationGalleryExitAnalytics
local Analytics = MomentsCommonModule.Analytics
local Outcome = {
	GalleryOpened = "gallery_opened",
	EducationShown = "education_shown",
	PermissionDenied = "permission_denied",
	ReadError = "read_error",
	GalleryUnavailable = "gallery_unavailable",
	RequestInFlight = "request_in_flight"
}

return {
	Outcome = Outcome,
	resolveGalleryOutcome = function(p1, p2, PermissionDenied)
		-- upvalues: Outcome (copy)
		return if p1 then if p2 == 0 then Outcome.EducationShown else Outcome.GalleryOpened elseif PermissionDenied == Outcome.PermissionDenied then Outcome.PermissionDenied else Outcome.ReadError
	end,
	log = function(EntryOutcome, CreationSessionId, p1)
		-- upvalues: FFlagMomentsCreationGalleryExitAnalytics (copy), Analytics (copy)
		local config = { entryOutcome = EntryOutcome }
		
		if CreationSessionId ~= nil then
			config.creationSessionId = CreationSessionId
		end
		if FFlagMomentsCreationGalleryExitAnalytics and p1 ~= nil then
			config.eligibleCaptureCount = tostring(p1.eligible)
			config.totalCaptureCount = tostring(p1.total)
		end
		Analytics.fireAnalyticsEvent(Analytics.EventNames.MomentCreationEntryResolved, config)
	end
}