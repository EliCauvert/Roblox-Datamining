return function(p1) --[[ Line: 7 ]]
	return {
		appsflyer = function(LinkId, LinkType) --[[ Line: 10 ]]
			-- upvalues: p1 (copy)
			local config = { linkId = LinkId, linkType = LinkType }
			
			return p1.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_dp={mobileUrl}&af_web_dp={webUrl}")({
				mobileUrl = p1.fromString("mobilenav:share_links?code={linkId}&type={linkType}")(config),
				webUrl = p1.fromString("www:share-links?code={linkId}&type={linkType}")(config)
			})
		end,
		shortUrl = function(p2) --[[ Line: 25 ]]
			-- upvalues: p1 (copy)
			return p1.fromString("www:share?code={linkId}&type={type}&stamp={stamp|}")(p2)
		end
	}
end