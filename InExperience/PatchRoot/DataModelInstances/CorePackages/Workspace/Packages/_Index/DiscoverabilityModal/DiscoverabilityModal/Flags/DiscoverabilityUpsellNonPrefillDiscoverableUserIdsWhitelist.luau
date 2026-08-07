game:DefineFastString("DiscoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelist", "")

return {
	isWhitelistedUserId = function(p0) --[[ line: 9 ]]
		for i in string.gmatch(game:GetFastString("DiscoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelist"), "[^,]+") do
			if tostring(p0) == i then
				return true
			end
		end
		return false
	end
}