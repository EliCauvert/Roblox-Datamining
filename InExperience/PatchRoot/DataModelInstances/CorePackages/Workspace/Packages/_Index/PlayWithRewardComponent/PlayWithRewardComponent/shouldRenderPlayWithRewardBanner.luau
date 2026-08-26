local playersService = game:GetService("Players")
local _ = require(script:FindFirstAncestor("PlayWithRewardComponent").Parent.PlayWithRewardState)

return function(p1, p2, p3, p4)
	-- upvalues: playersService (ref)
	return playersService.LocalPlayer ~= nil and (p2 ~= "" and (p3 ~= nil and (p3 == p1 and (p4 ~= nil and (p4.adAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable and (p4.experimentVariantData ~= nil and (if p4.experimentVariantData.titleText == "" then false else (tonumber(if p4 then p4.productId else 0) or 0) ~= 0)))))))
end