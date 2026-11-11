local _ = require(script:FindFirstAncestor("NotApprovedPage").Common.Types)

return function(p1, p2)
	for _, badUtterance in p1.badUtterances do
		local LabelTranslationKey = badUtterance.labelTranslationKey
		
		if LabelTranslationKey then
			p2[LabelTranslationKey] = "Feature.NotApproved." .. LabelTranslationKey
		end
	end
end