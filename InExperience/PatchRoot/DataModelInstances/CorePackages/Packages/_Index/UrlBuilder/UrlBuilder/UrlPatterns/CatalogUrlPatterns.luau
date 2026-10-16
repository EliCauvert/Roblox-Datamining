return function(p1) --[[ Line: 3 ]]
	local t = {}
	t.info = {
		webbundle = p1.fromString("www:bundles/{assetId}"),
		webasset = p1.fromString("www:catalog/{assetId}"),
		webpage = function(p2) --[[ Line: 10 ]]
			-- upvalues: t (copy)
			if p2.assetType == "Bundle" then
				return t.info.webbundle(p2)
			elseif p2.assetType == "Asset" then
				return t.info.webasset(p2)
			else
				warn(string.format("%s - unknown assetType of %s", tostring(script.name), (tostring(p2.assetType))))
				
				return nil
			end
		end,
		appsflyer = function(p2) --[[ Line: 20 ]]
			-- upvalues: p1 (copy), t (copy)
			return p1.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_dp={mobileUrl}&af_web_dp={webUrl}")({
				mobileUrl = p1.fromString("mobilenav:item_details?itemId={assetId}&itemType={assetType}")(p2),
				webUrl = t.info.webpage(p2)
			})
		end
	}
	
	return t
end