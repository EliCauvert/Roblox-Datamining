local analytics = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon).Analytics
local t = {
	GalleryOpened = "gallery_opened",
	EducationShown = "education_shown",
	PermissionDenied = "permission_denied",
	ReadError = "read_error",
	GalleryUnavailable = "gallery_unavailable",
	RequestInFlight = "request_in_flight"
}

return {
	Outcome = t,
	resolveGalleryOutcome = function(p1, p2, p3)
		-- upvalues: t (ref)
		return if p1 then if p2 == 0 then t.EducationShown else t.GalleryOpened elseif p3 == t.PermissionDenied then t.PermissionDenied else t.ReadError
	end,
	log = function(p1, p2)
		-- upvalues: analytics (ref)
		local t = { entryOutcome = p1 }
		
		if p2 ~= nil then
			t.creationSessionId = p2
		end
		analytics.fireAnalyticsEvent(analytics.EventNames.MomentCreationEntryResolved, t)
	end
}