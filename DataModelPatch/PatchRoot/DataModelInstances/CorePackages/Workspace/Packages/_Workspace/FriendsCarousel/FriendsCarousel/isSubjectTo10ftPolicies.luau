local FriendCarouselHas10ftPolicies = game:DefineFastFlag("FriendCarouselHas10ftPolicies", false)
local GuiService = game:GetService("GuiService")

return function()
	-- upvalues: FriendCarouselHas10ftPolicies (copy), GuiService (copy)
	return if FriendCarouselHas10ftPolicies then GuiService:IsTenFootInterface() else false
end