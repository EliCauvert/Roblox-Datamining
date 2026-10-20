local _ = require(script:FindFirstAncestor("SocialUpsell").Types)

return function(p1): boolean
	return if p1.buttons then #p1.buttons < 2 and (if p1.labelItems then #p1.labelItems == 0 and (not p1.image and (not p1.body and not p1.isDismissable)) else not p1.image and (not p1.body and not p1.isDismissable)) elseif p1.labelItems then #p1.labelItems == 0 and (not p1.image and (not p1.body and not p1.isDismissable)) else not p1.image and (not p1.body and not p1.isDismissable)
end