return function(p0) --[[ line: 1 ]]
	return {
		appsflyer = function(p1) --[[ line: 4 ]]
			-- upvalues: p0 (ref)
			return p0.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_dp={mobileUrl}&af_web_dp={webUrl}")({
				mobileUrl = p0.fromString("mobilenav:event_details?eventid={eventId}")(p1),
				webUrl = p0.fromString("www:events/{eventId}")(p1)
			})
		end
	}
end