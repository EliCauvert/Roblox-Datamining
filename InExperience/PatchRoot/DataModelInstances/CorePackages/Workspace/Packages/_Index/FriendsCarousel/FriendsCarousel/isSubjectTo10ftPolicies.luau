local friendCarouselHas10ftPolicies = game:DefineFastFlag("FriendCarouselHas10ftPolicies", false)
local guiService = game:GetService("GuiService")

return function()
	-- upvalues: friendCarouselHas10ftPolicies (ref), guiService (ref)
	return if friendCarouselHas10ftPolicies then guiService:IsTenFootInterface() else false
end