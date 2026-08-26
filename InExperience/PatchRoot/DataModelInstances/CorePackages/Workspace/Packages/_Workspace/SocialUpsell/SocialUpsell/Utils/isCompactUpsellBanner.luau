local _ = require(script:FindFirstAncestor("SocialUpsell").Types)

return function(p1)
	local var1
	if p1.buttons then
		var1 = false
		
		if #p1.buttons < 2 then
			if p1.labelItems then
				var1 = #p1.labelItems == 0 and (not p1.image and (not p1.body and not p1.isDismissable))
			end
		end
		return var1
	end
end