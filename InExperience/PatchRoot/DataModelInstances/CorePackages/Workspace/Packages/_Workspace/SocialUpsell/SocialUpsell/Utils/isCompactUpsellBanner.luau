local _ = require(script:FindFirstAncestor("SocialUpsell").Types)

return function(p0)
	local var0
	if p0.buttons then
		var0 = false
		
		if #p0.buttons < 2 then
			if p0.labelItems then
				var0 = #p0.labelItems == 0 and (not p0.image and (not p0.body and not p0.isDismissable))
			end
		end
		return var0
	end
end