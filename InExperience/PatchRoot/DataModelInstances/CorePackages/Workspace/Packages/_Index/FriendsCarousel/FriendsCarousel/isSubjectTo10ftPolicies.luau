local friendCarouselHas10ftPolicies = game:DefineFastFlag("FriendCarouselHas10ftPolicies", false)
local guiService = game:GetService("GuiService")

return function() --[[ line: 4 ]]
	-- upvalues: friendCarouselHas10ftPolicies (ref), guiService (ref)
	return if friendCarouselHas10ftPolicies then guiService:IsTenFootInterface() else false
end