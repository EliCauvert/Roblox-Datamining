local UrlBase = require(script:FindFirstAncestor("AmpUpsell").Parent.UrlBuilder).UrlBase

return {
	buildAmpWizardUrl = function(Text, Text1, Text2, Text3): string
		-- upvalues: UrlBase (copy)
		local Text4 = UrlBase.new("www") .. "/amp-wizard?feature_name=" .. Text .. "&namespace=" .. Text1
		
		if Text2 then
			Text4 ..= "&entry_point=" .. Text2
		end
		if Text3 then
			Text4 ..= "&returnpage=" .. Text3
		end
		return Text4
	end
}