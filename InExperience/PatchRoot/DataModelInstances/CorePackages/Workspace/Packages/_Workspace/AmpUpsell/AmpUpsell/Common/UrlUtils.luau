local urlBase = require(script:FindFirstAncestor("AmpUpsell").Parent.UrlBuilder).UrlBase

return {
	buildAmpWizardUrl = function(p0, p1, p2, p3)
		-- upvalues: urlBase (ref)
		local text = urlBase.new("www") .. "/amp-wizard?feature_name=" .. p0 .. "&namespace=" .. p1
		
		if p2 then
			text ..= "&entry_point=" .. p2
		end
		if p3 then
			text ..= "&returnpage=" .. p3
		end
		return text
	end
}