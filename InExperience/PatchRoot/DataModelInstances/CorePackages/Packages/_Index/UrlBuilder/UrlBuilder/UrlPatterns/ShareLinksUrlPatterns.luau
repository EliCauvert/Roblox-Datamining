return function(p1)
	return {
		appsflyer = function(p2, p3)
			-- upvalues: p1 (ref)
			local t = { linkId = p2, linkType = p3 }
			
			return p1.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_dp={mobileUrl}&af_web_dp={webUrl}")({
				mobileUrl = p1.fromString("mobilenav:share_links?code={linkId}&type={linkType}")(t),
				webUrl = p1.fromString("www:share-links?code={linkId}&type={linkType}")(t)
			})
		end,
		shortUrl = function(p2)
			-- upvalues: p1 (ref)
			return p1.fromString("www:share?code={linkId}&type={type}&stamp={stamp|}")(p2)
		end
	}
end