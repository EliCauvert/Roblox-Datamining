return function(p0) --[[ line: 7 ]]
	return {
		appsflyer = function(p1, p2) --[[ line: 10 ]]
			-- upvalues: p0 (ref)
			local t = { linkId = p1, linkType = p2 }
			
			return p0.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_dp={mobileUrl}&af_web_dp={webUrl}")({
				mobileUrl = p0.fromString("mobilenav:share_links?code={linkId}&type={linkType}")(t),
				webUrl = p0.fromString("www:share-links?code={linkId}&type={linkType}")(t)
			})
		end,
		shortUrl = function(p3) --[[ line: 25 ]]
			-- upvalues: p0 (ref)
			return p0.fromString("www:share?code={linkId}&type={type}&stamp={stamp|}")(p3)
		end
	}
end