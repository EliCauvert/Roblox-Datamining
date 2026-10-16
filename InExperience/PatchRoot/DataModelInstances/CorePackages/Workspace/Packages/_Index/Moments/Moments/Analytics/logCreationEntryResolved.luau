local Analytics = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon).Analytics
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
	resolveGalleryOutcome = function(p1, p2, PermissionDenied) --[[ Line: 56 ]]
		-- upvalues: Outcome (copy)
		return if p1 then if p2 == 0 then Outcome.EducationShown else Outcome.GalleryOpened elseif PermissionDenied == Outcome.PermissionDenied then Outcome.PermissionDenied else Outcome.ReadError
	end,
	log = function(EntryOutcome, CreationSessionId) --[[ Line: 63 ]]
		-- upvalues: Analytics (copy)
		local config = { entryOutcome = EntryOutcome }
		
		if CreationSessionId ~= nil then
			config.creationSessionId = CreationSessionId
		end
		Analytics.fireAnalyticsEvent(Analytics.EventNames.MomentCreationEntryResolved, config)
	end
}