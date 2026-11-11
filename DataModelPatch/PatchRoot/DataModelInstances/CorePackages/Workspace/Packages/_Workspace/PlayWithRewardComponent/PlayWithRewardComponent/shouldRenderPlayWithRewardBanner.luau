local Players = game:GetService("Players")
local _ = require(script:FindFirstAncestor("PlayWithRewardComponent").Parent.PlayWithRewardState)

return function(p1, p2, p3, p4): boolean
	-- upvalues: Players (copy)
	local Number: number = tonumber(p4 and p4.productId or 0) or 0
	
	return Players.LocalPlayer ~= nil and (p2 ~= "" and (p3 ~= nil and (p3 == p1 and (p4 ~= nil and (p4.adAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable and (p4.experimentVariantData ~= nil and (if p4.experimentVariantData.titleText == "" then p4.experimentVariantData.subtitleText ~= "" and Number ~= 0 else Number ~= 0)))))))
end