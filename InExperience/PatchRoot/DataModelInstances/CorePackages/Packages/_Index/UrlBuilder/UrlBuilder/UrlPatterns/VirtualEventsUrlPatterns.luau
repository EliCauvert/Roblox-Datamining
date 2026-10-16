return function(p1) --[[ Line: 1 ]]
	return {
		appsflyer = function(p2) --[[ Line: 4 ]]
			-- upvalues: p1 (copy)
			return p1.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_dp={mobileUrl}&af_web_dp={webUrl}")({
				mobileUrl = p1.fromString("mobilenav:event_details?eventid={eventId}")(p2),
				webUrl = p1.fromString("www:events/{eventId}")(p2)
			})
		end
	}
end