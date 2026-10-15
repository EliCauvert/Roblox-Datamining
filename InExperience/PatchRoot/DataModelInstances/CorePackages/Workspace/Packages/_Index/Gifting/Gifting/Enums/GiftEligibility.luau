local t = {
	Unknown = "Unknown",
	Eligible = "Eligible",
	IneligibleGiftingSystemDisabled = "IneligibleGiftingSystemDisabled",
	IneligibleLegalOrRegulatoryRestrictions = "IneligibleLegalOrRegulatoryRestrictions",
	IneligiblePermanentlyBanned = "IneligiblePermanentlyBanned",
	IneligibleTemporarilySuspended = "IneligibleTemporarilySuspended"
}
local t_1 = {}

for i, v in pairs(t) do
	t_1[v] = true
end
function t.fromValue(p1)
	-- upvalues: t_1 (ref)
	return if p1 == nil or not t_1[p1] then nil else p1
end

return t