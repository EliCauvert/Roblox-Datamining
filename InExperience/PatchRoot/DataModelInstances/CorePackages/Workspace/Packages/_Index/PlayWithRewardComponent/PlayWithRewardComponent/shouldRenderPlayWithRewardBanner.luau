local playersService = game:GetService("Players")
local _ = require(script:FindFirstAncestor("PlayWithRewardComponent").Parent.PlayWithRewardState)

return function(p0, p1, p2, p3)
	-- upvalues: playersService (ref)
	return playersService.LocalPlayer ~= nil and (p1 ~= "" and (p2 ~= nil and (p2 == p0 and (p3 ~= nil and (p3.adAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable and (p3.experimentVariantData ~= nil and (if p3.experimentVariantData.titleText == "" then false else (tonumber(if p3 then p3.productId else 0) or 0) ~= 0)))))))
end