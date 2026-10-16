local GiftEligibilityModule = {
	Unknown = "Unknown",
	Eligible = "Eligible",
	IneligibleGiftingSystemDisabled = "IneligibleGiftingSystemDisabled",
	IneligibleLegalOrRegulatoryRestrictions = "IneligibleLegalOrRegulatoryRestrictions",
	IneligiblePermanentlyBanned = "IneligiblePermanentlyBanned",
	IneligibleTemporarilySuspended = "IneligibleTemporarilySuspended"
}
local t = {}

for _, value in pairs(GiftEligibilityModule) do
	t[value] = true
end
function GiftEligibilityModule.fromValue(p1) --[[ Line: 23 ]]
	-- upvalues: t (copy)
	return if p1 == nil or not t[p1] then nil else p1
end

return GiftEligibilityModule