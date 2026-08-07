-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:06 2026 Pacific Standard Time.

return function(p0) --[[ line: 3 ]]
	local t = {}
	t.info = {
		webbundle = p0.fromString("www:bundles/{assetId}"),
		webasset = p0.fromString("www:catalog/{assetId}"),
		webpage = function(p1) --[[ line: 10 ]]
			-- upvalues: t (ref)
			if p1.assetType == "Bundle" then
				return t.info.webbundle(p1)
			elseif p1.assetType == "Asset" then
				return t.info.webasset(p1)
			end
			warn(string.format("%s - unknown assetType of %s", tostring(script.name), tostring(p1.assetType)))
			
			return nil
		end,
		appsflyer = function(p2) --[[ line: 20 ]]
			-- upvalues: p0 (ref), t (ref)
			return p0.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_dp={mobileUrl}&af_web_dp={webUrl}")({
				mobileUrl = p0.fromString("mobilenav:item_details?itemId={assetId}&itemType={assetType}")(p2),
				webUrl = t.info.webpage(p2)
			})
		end
	}
	
	return t
end