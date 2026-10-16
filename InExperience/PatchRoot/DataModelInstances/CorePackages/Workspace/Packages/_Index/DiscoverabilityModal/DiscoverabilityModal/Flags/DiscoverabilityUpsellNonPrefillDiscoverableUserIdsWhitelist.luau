game:DefineFastString("DiscoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelist", "")

return {
	isWhitelistedUserId = function(p1): boolean --[[ Line: 9 ]]
		for i in string.gmatch(game:GetFastString("DiscoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelist"), "[^,]+") do
			if tostring(p1) == i then
				return true
			end
		end
		return false
	end
}