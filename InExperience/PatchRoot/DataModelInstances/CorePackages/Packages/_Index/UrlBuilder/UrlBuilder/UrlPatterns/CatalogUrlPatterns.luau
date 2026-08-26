return function(p1)
	local t = {}
	t.info = {
		webbundle = p1.fromString("www:bundles/{assetId}"),
		webasset = p1.fromString("www:catalog/{assetId}"),
		webpage = function(p2)
			-- upvalues: t (ref)
			if p2.assetType == "Bundle" then
				return t.info.webbundle(p2)
			elseif p2.assetType == "Asset" then
				return t.info.webasset(p2)
			end
			warn(string.format("%s - unknown assetType of %s", tostring(script.name), tostring(p2.assetType)))
			
			return nil
		end,
		appsflyer = function(p2)
			-- upvalues: p1 (ref), t (ref)
			return p1.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_dp={mobileUrl}&af_web_dp={webUrl}")({
				mobileUrl = p1.fromString("mobilenav:item_details?itemId={assetId}&itemType={assetType}")(p2),
				webUrl = t.info.webpage(p2)
			})
		end
	}
	
	return t
end